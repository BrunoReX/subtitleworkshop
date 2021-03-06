program sample4;

uses
  ifpscomp,
  ifps3,
  ifpii_std,
  ifpii_controls,
  ifpii_stdctrls,
  ifpii_forms,
  ifpiir_std,
  ifpiir_controls,
  ifpiir_stdctrls,
  ifpiir_forms,
  forms

  ;

function ScriptOnUses(Sender: TIFPSPascalCompiler; const Name: string): Boolean;
{ the OnUses callback function is called for each "uses" in the script. 
  It's always called with the parameter 'SYSTEM' at the top of the script. 
  For example: uses ii1, ii2;   
  This will call this function 3 times. First with 'SYSTEM' then 'II1' and then 'II2'.
}
begin
  if Name = 'SYSTEM' then
  begin
    SIRegister_Std(Sender);
    { This will register the declarations of these classes:
      TObject, TPersisent, TComponent. This can be found
      in the ifpii_std.pas unit. }

    SIRegister_Controls(Sender);
    { This will register the declarations of these classes:
      TControl, TWinControl, TFont, TStrings, TStringList, TCanvas, TGraphicControl. This can be found
      in the ifpii_controls.pas unit. }

    SIRegister_Forms(Sender);
    { This will register: TScrollingWinControl, TCustomForm, TForm and TApplication. ifpii_forms.pas unit. }

    SIRegister_stdctrls(Sender);
     { This will register: TButtonContol, TButton, TCustomCheckbox, TCheckBox, TCustomEdit, TEdit, TCustomMemo, TMemo,
      TCustomLabel and TLabel. Can be found in the ifpii_stdctrls.pas unit. }

    Result := True;
  end else
    Result := False;
end;

procedure ExecuteScript(const Script: string);
var
  Compiler: TIFPSPascalCompiler;
  { TIFPSPascalCompiler is the compiler part of the scriptengine. This will 
    translate a Pascal script into a compiled for the executer understands. } 
  Exec: TIFPSExec;
   { TIFPSExec is the executer part of the scriptengine. It uses the output of
    the compiler to run a script. }
  Data: string;
  CI: TIFPSRuntimeClassImporter; // Can be found in the ifpiclassruntime.pas unit.
begin
  Compiler := TIFPSPascalCompiler.Create; // create an instance of the compiler.
  Compiler.OnUses := ScriptOnUses; // assign the OnUses event.
  if not Compiler.Compile(Script) then  // Compile the Pascal script into bytecode.
  begin
    Compiler.Free;
     // You could raise an exception here.
    Exit;
  end;

  Compiler.GetOutput(Data); // Save the output of the compiler in the string Data.
  Compiler.Free; // After compiling the script, there is no need for the compiler anymore.

  CI := TIFPSRuntimeClassImporter.Create;
  { Create an instance of the runtime class importer.}
  
  RIRegister_Std(CI);  // ifpiir_std.pas unit.
  RIRegister_stdctrls(CI);  // ifpiir_stdctrls.pas unit.
  RIRegister_Controls(CI); // ifpiir_controls.pas unit.
  RIRegister_Forms(CI);  // ifpiir_forms.pas unit.

  Exec := TIFPSExec.Create;  // Create an instance of the executer.

  RegisterClassLibraryRuntime(Exec, CI);
  // Assign the runtime class importer to the executer.
  
  { The functions registered at compile time also need to be registered at runtime. These
    functions can be found in the ifps3lib_stdr.pas unit. }
  if not  Exec.LoadData(Data) then // Load the data from the Data string.
  begin
    { For some reason the script could not be loaded. This is usually the case when a
      library that has been used at compile time isn't registered at runtime. }
    Exec.Free;
     // You could raise an exception here.
    Exit;
  end;

  Exec.RunScript; // Run the script.
  Exec.Free; // Free the executer.
  CI.Free;  // Free the runtime class importer.
end;



const
  Script =
    'var f: TForm; i: Longint; begin f := TForm.CreateNew(f,0); f.Show; for i := 0 to 1000000 do; f.Hide; f.free;  end.';

begin
  ExecuteScript(Script);
end.

// Swap subtitles. Original by Bedazzle.
// Swaps two selected subtitles - both time and text. If translation is loaded, 
// translation subtitles are swapped too.

program SwapSubs;

// -----------------------------------------------------------------------------

uses
  windows;


type
  TShowForm = procedure;
  TShowFormModal = function :integer;

var
  DLLHandle: THandle;
  ShowForm : TShowForm;
  ShowFormModal : TShowFormModal;




begin
  DLLHandle := LoadLibrary('Project1dll.dll');
  if DLLHandle <> 0 then
  begin
    @ShowForm := GetProcAddress(DLLHandle, 'ShowDllForm');
    @ShowFormModal := GetProcAddress(DLLHandle, 'ShowDllFormModal');
  end;

  ShowFormModal;
//  ShowForm;

  FreeLibrary(DLLHandle);
end.
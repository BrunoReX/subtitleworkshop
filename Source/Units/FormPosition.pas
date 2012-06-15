unit FormPosition;

interface

uses IniFiles, Graphics, Windows, Forms;

const
  //-----------------------------
  KEYLEFT       = 'Left';
  KEYTOP        = 'Top';
  KEYWIDTH      = 'Width';
  KEYHEIGHT     = 'Height';
  KEYMAXIMIZED  = 'Maximized';
  //-----------------------------

type
  TFormPosition = class
  private
    IniName : String;
    TargetForm : TForm;
    IniSect    : String;
  public
    constructor Create(Form : TForm; IniFname, IniSection : String; DefLeft, DefTop, DefWidth, DefHeight : Integer);
    destructor Destroy; override;
    procedure LoadPosition();
    procedure SavePosition();
  end;

implementation

{ TFormPosition }

constructor TFormPosition.Create(Form : TForm; IniFname, IniSection : String; DefLeft, DefTop, DefWidth, DefHeight : Integer);
begin
  IniName := IniFname;
  TargetForm  := Form;
  IniSect     := IniSection;

  with TargetForm do
  begin
    Position    := poDesigned;
    Left        := DefLeft;
    Top         := DefTop;
    Width       := DefWidth;
    Height      := DefHeight;
    WindowState := wsNormal;
  end;

  LoadPosition;
end;


destructor TFormPosition.Destroy;
begin
  SavePosition;
  inherited;
end;


procedure TFormPosition.LoadPosition;
var
  Ini : TIniFile;
begin
  Ini := TIniFile.Create(IniName);
  try
    with TargetForm do
    begin
      Left     := Ini.ReadInteger(IniSect, KEYLEFT, Left);
      Top      := Ini.ReadInteger(IniSect, KEYTOP, Top);
      Width    := Ini.ReadInteger(IniSect, KEYWIDTH, Width);
      Height   := Ini.ReadInteger(IniSect, KEYHEIGHT, Height);

      if Ini.ReadBool(IniSect, KEYMAXIMIZED, True) then
        WindowState := wsMaximized else
        WindowState := wsNormal;
    end;

  finally
    Ini.Free;
  end;
end;

procedure TFormPosition.SavePosition;
var
  Ini : TIniFile;
begin
  Ini := TIniFile.Create(IniName);
  try
    with TargetForm do
    begin
      Ini.WriteInteger(IniSect, KEYLEFT, Left);
      Ini.WriteInteger(IniSect, KEYTOP, Top);
      Ini.WriteInteger(IniSect, KEYWIDTH, Width);
      Ini.WriteInteger(IniSect, KEYHEIGHT, Height);

      if WindowState = wsMaximized then
        Ini.WriteBool(IniSect, KEYMAXIMIZED, True) else
        Ini.WriteBool(IniSect, KEYMAXIMIZED, False);
    end;
  finally
    Ini.Free;
  end;
end;

end.

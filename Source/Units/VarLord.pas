unit VarLord;

interface

uses IniFiles, Graphics, Windows;

const
  //-----------------------------
  SECGENERAL      = 'General';
  KEYCPSRANGE1    = 'CPS range 1';
  KEYCPSRANGE2    = 'CPS range 2';
  KEYCPSRANGE3    = 'CPS range 3';
  KEYCPSCOLOR1    = 'CPS color 1';
  KEYCPSCOLOR2    = 'CPS color 2';
  KEYCPSCOLOR3    = 'CPS color 3';
  KEYCPSCOLOR4    = 'CPS color 4';
  //-----------------------------
  SECPROGRAMLOOK    = 'Program look';
  KEYSHOWCOLORBAR   = 'Show color bar';
  KEYSUBTITLEABSENT = 'Subtitle absent';
  KEYSUBTITLEOK     = 'Subtitle OK';
  KEYVOLUME         = 'Volume';
  //-----------------------------
  SECADVANCED = 'Advanced';
  KEYTWOLINESIFLONGERTHAN = 'Two lines if longer than';
  KEYTOGGLEBREAKPOINT     = 'Toggle breakpoint';
  KEYBREAKLINEAFTER       = 'Break line after';
  KEYMAXLINELENGTH        = 'Maximum line length';
  KEYSHIFTTIME            = 'Shift time';
  KEYNEWSUBDURATION       = 'New subtitle duration';
  KEYGAPBETWEENSUBS       = 'Gap between subtitles';
  //-----------------------------
  SECLANGUAGE = 'Language';
  KEYLANGUAGE = 'Language';
  //-----------------------------
  SECSETTINGS = 'Settings';
  KEYDOUBLECLICKONBOX = 'Double click on box';
  //-----------------------------
type
  TVarLord = class
  private
    IniFileName : String;
    FShowColorBar      : Boolean;
    //
    FCPSrange1         : Byte;    // ranges for coloring different CPS
    FCPSrange2         : Byte;
    FCPSrange3         : Byte;
    //
    FCPScolor1         : TColor;  // colors for different CPS
    FCPScolor2         : TColor;
    FCPScolor3         : TColor;
    FCPScolor4         : TColor;
    //
    function GetShowColorBar: Boolean;
    procedure SetShowColorBar(const Value: Boolean);
    //
    function GetCPSRange1: Byte;
    function GetCPSRange2: Byte;
    function GetCPSRange3: Byte;
    procedure SetCPSRange1(const Value: Byte);
    procedure SetCPSRange2(const Value: Byte);
    procedure SetCPSRange3(const Value: Byte);
    //
    function GetCPSColor1: TColor;
    function GetCPSColor2: TColor;
    function GetCPSColor3: TColor;
    function GetCPSColor4: TColor;
    procedure SetCPSColor1(const Value: TColor);
    procedure SetCPSColor2(const Value: TColor);
    procedure SetCPSColor3(const Value: TColor);
    procedure SetCPSColor4(const Value: TColor);
  public
    SubtitleAbsent    : TColor;
    SubtitleOK        : TColor;
    Volume            : Integer;
    UILanguage        : String;
    DblClickBox       : Integer; // Double click on Text/Translation box
    // ----------//
    // Advanced  //
    // ----------//
    TwoLinesIfLongerThan : Integer;
    ToggleBreakPoint     : Boolean;
    BreakLineAfter       : Integer;
    MaxLineLength        : Integer;
    ShiftTime            : Integer;
    NewSubDuration       : Integer;
    GapBetweenSubs       : Integer;

    constructor Create(IniFName: String);
    destructor Destroy; override;
    procedure LoadVars();
    procedure SaveVars();
    //
    property ShowColorBar: Boolean read GetShowColorBar write SetShowColorBar;
    property CPSrange1: Byte read GetCPSrange1 write SetCPSrange1;
    property CPSrange2: Byte read GetCPSrange2 write SetCPSrange2;
    property CPSrange3: Byte read GetCPSrange3 write SetCPSrange3;
    property CPScolor1: TColor read GetCPScolor1 write SetCPScolor1;
    property CPScolor2: TColor read GetCPScolor2 write SetCPScolor2;
    property CPScolor3: TColor read GetCPScolor3 write SetCPScolor3;
    property CPScolor4: TColor read GetCPScolor4 write SetCPScolor4;
    //
  end;

implementation

{ TVarLord }

constructor TVarLord.Create(IniFName: String);
begin
  IniFileName := IniFName;
  LoadVars;
end;


destructor TVarLord.Destroy;
begin
  SaveVars;
  inherited;
end;

function TVarLord.GetCPSColor1: TColor;
begin
  Result := FCPSColor1;
end;

function TVarLord.GetCPSColor2: TColor;
begin
  Result := FCPSColor2;
end;

function TVarLord.GetCPSColor3: TColor;
begin
  Result := FCPSColor3;
end;

function TVarLord.GetCPSColor4: TColor;
begin
  Result := FCPSColor4;
end;

function TVarLord.GetCPSRange1: Byte;
begin
  Result := FCPSRange1;
end;

function TVarLord.GetCPSRange2: Byte;
begin
  Result := FCPSRange2;
end;

function TVarLord.GetCPSRange3: Byte;
begin
  Result := FCPSRange3;
end;

function TVarLord.GetShowColorBar: Boolean;
begin
  Result := FShowColorBar;
end;

procedure TVarLord.LoadVars;
var
  Ini : TIniFile;
begin
  Ini := TIniFile.Create(IniFileName);
  try
    UILanguage     := Ini.ReadString(SECLANGUAGE, KEYLANGUAGE, 'English');

    FShowColorBar  := Ini.ReadBool(SECPROGRAMLOOK, KEYSHOWCOLORBAR, False);
    SubtitleAbsent := Ini.ReadInteger(SECPROGRAMLOOK, KEYSUBTITLEABSENT, clBlack);
    SubtitleOK     := Ini.ReadInteger(SECPROGRAMLOOK, KEYSUBTITLEOK, clBlue);
    Volume         := Ini.ReadInteger(SECPROGRAMLOOK, KEYVOLUME, 0);

    FCPSrange1 := Ini.ReadInteger(SECGENERAL, KEYCPSRANGE1, 8);
    FCPSrange2 := Ini.ReadInteger(SECGENERAL, KEYCPSRANGE2, 18);
    FCPSrange3 := Ini.ReadInteger(SECGENERAL, KEYCPSRANGE3, 24);

    FCPScolor1 := Ini.ReadInteger(SECGENERAL, KEYCPSCOLOR1, RGB(0, 0, 255));
    FCPScolor2 := Ini.ReadInteger(SECGENERAL, KEYCPSCOLOR2, RGB(0, 0, 0));
    FCPScolor3 := Ini.ReadInteger(SECGENERAL, KEYCPSCOLOR3, RGB(255, 140, 0));
    FCPScolor4 := Ini.ReadInteger(SECGENERAL, KEYCPSCOLOR4, RGB(255, 0, 0));

    // ------------ //
    //   Advanced   //
    // ------------ //
    TwoLinesIfLongerThan := Ini.ReadInteger(SECADVANCED, KEYTWOLINESIFLONGERTHAN, 40);
    ToggleBreakPoint     := Ini.ReadBool(SECADVANCED, KEYTOGGLEBREAKPOINT, False);
    BreakLineAfter       := Ini.ReadInteger(SECADVANCED, KEYBREAKLINEAFTER, 40);
    MaxLineLength        := Ini.ReadInteger(SECADVANCED, KEYMAXLINELENGTH, 45);
    ShiftTime            := Ini.ReadInteger(SECADVANCED, KEYSHIFTTIME, 100);
    NewSubDuration       := Ini.ReadInteger(SECADVANCED, KEYNEWSUBDURATION, 1500);
    GapBetweenSubs       := Ini.ReadInteger(SECADVANCED, KEYGAPBETWEENSUBS, 300);

    // ------------ //
    //   Settings   //
    // ------------ //
    DblClickBox := Ini.ReadInteger(SECSETTINGS, KEYDOUBLECLICKONBOX, 0);

  finally
    Ini.Free;
  end;
end;

procedure TVarLord.SaveVars;
var
  Ini : TIniFile;
begin
  Ini := TIniFile.Create(IniFileName);
  try
    Ini.WriteString(SECLANGUAGE, KEYLANGUAGE, UILanguage);

    Ini.WriteBool(SECPROGRAMLOOK, KEYSHOWCOLORBAR, FShowColorBar);
    Ini.WriteInteger(SECPROGRAMLOOK, KEYSUBTITLEABSENT, SubtitleAbsent);
    Ini.WriteInteger(SECPROGRAMLOOK, KEYSUBTITLEOK, SubtitleOK);
    Ini.WriteInteger(SECPROGRAMLOOK, KEYVOLUME, Volume);

    Ini.WriteInteger(SECGENERAL, KEYCPSRANGE1, FCPSRange1);
    Ini.WriteInteger(SECGENERAL, KEYCPSRANGE2, FCPSRange2);
    Ini.WriteInteger(SECGENERAL, KEYCPSRANGE3, FCPSRange3);

    Ini.WriteInteger(SECGENERAL, KEYCPSCOLOR1, FCPSColor1);
    Ini.WriteInteger(SECGENERAL, KEYCPSCOLOR2, FCPSColor2);
    Ini.WriteInteger(SECGENERAL, KEYCPSCOLOR3, FCPSColor3);
    Ini.WriteInteger(SECGENERAL, KEYCPSCOLOR4, FCPSColor4);

    Ini.WriteInteger(SECADVANCED, KEYTWOLINESIFLONGERTHAN, TwoLinesIfLongerThan);
    Ini.WriteBool(SECADVANCED, KEYTOGGLEBREAKPOINT, ToggleBreakPoint);
    Ini.WriteInteger(SECADVANCED, KEYBREAKLINEAFTER, BreakLineAfter);
    Ini.WriteInteger(SECADVANCED, KEYMAXLINELENGTH, MaxLineLength);
    Ini.WriteInteger(SECADVANCED, KEYSHIFTTIME, ShiftTime);
    Ini.WriteInteger(SECADVANCED, KEYNEWSUBDURATION, NewSubDuration);
    Ini.WriteInteger(SECADVANCED, KEYGAPBETWEENSUBS, GapBetweenSubs);

    Ini.WriteInteger(SECSETTINGS, KEYDOUBLECLICKONBOX, DblClickBox);

  finally
    Ini.Free;
  end;
end;

procedure TVarLord.SetCPSColor1(const Value: TColor);
begin
  FCPSColor1 := Value;
end;

procedure TVarLord.SetCPSColor2(const Value: TColor);
begin
  FCPSColor2 := Value;
end;

procedure TVarLord.SetCPSColor3(const Value: TColor);
begin
  FCPSColor3 := Value;
end;

procedure TVarLord.SetCPSColor4(const Value: TColor);
begin
  FCPSColor4 := Value;
end;

procedure TVarLord.SetCPSRange1(const Value: Byte);
begin
  FCPSRange1 := Value;
end;

procedure TVarLord.SetCPSRange2(const Value: Byte);
begin
  FCPSRange2 := Value;
end;

procedure TVarLord.SetCPSRange3(const Value: Byte);
begin
  FCPSRange3 := Value;
end;

procedure TVarLord.SetShowColorBar(const Value: Boolean);
begin
  FShowColorBar := Value;
end;

end.

unit formMultipleStreams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles;

type
  TfrmMultipleStreams = class(TForm)
    lblStreams1: TLabel;
    lblStreams2: TLabel;
    cmbStreams: TComboBox;
    btnOK: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SetLanguage;
  public
    { Public declarations }
  end;

var
  frmMultipleStreams: TfrmMultipleStreams;

implementation

uses formMain;

{$R *.dfm}

procedure TfrmMultipleStreams.btnOKClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMultipleStreams.SetLanguage;
var
  LF: TIniFile;
begin
  LF := TIniFile.Create(frmMain.ActualLangFile);
  try
    with LF do
    begin
      lblStreams1.Caption := ReadString('Audio streams','01','Multiple audio streams detected.');
      lblStreams2.Caption := ReadString('Audio streams','02','Please choose audio to work with.');
      btnOK.Caption       := ReadString('Audio streams','03','OK');
    end;
  finally
    LF.Free;
  end;

  Font := frmMain.Font;
  lblStreams1.Font.Style := frmMain.Font.Style + [fsBold];
  lblStreams2.Font.Style := frmMain.Font.Style + [fsBold];
  btnOK.Font.Style := frmMain.Font.Style + [fsBold];
end;

procedure TfrmMultipleStreams.FormCreate(Sender: TObject);
begin
  SetLanguage;
end;

end.

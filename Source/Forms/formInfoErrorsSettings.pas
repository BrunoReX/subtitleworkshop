unit formInfoErrorsSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, CheckLst, ExtCtrls, IniFiles, General,
  InfoErrorsFunctions, ShellAPI, RZNEdit;

type
  TfrmInfoErrorsSettings = class(TForm)
    pgeCtrl: TPageControl;
    pgeCheckFor: TTabSheet;
    pgeFix: TTabSheet;
    chkCheckEmptySubtitles: TCheckBox;
    chkCheckOverlapping: TCheckBox;
    chkCheckBadValues: TCheckBox;
    chkCheckHearingImpaired: TCheckBox;
    chkCheckTextBeforeColon: TCheckBox;
    chkCheckOnlyIfCapitalLetters: TCheckBox;
    chkCheckUnnecessaryDots: TCheckBox;
    chkCheckOverTwoLines: TCheckBox;
    chkCheckProhibitedChars: TCheckBox;
    chkCheckRepeatedChars: TCheckBox;
    chkCheckOCRErrors: TCheckBox;
    chkCheckRepeatedSubs: TCheckBox;
    chkCheckUnnecessarySpaces: TCheckBox;
    pgeUnnecessarySpaces: TTabSheet;
    lstSpacesToCheck: TCheckListBox;
    lblCheckFor: TLabel;
    lstSpacesToFix: TCheckListBox;
    lblFix: TLabel;
    chkFixEmptySubtitles: TCheckBox;
    chkFixOverlapping: TCheckBox;
    chkFixBadValues: TCheckBox;
    chkFixHearingImpaired: TCheckBox;
    chkFixTextBeforeColon: TCheckBox;
    chkFixOnlyIfCapitalLetters: TCheckBox;
    chkFixUnnecessaryDots: TCheckBox;
    chkFixOverTwoLines: TCheckBox;
    chkFixProhibitedChars: TCheckBox;
    chkFixRepeatedChars: TCheckBox;
    chkFixRepeatedSubs: TCheckBox;
    chkFixOCRErrors: TCheckBox;
    chkFixUnnecessarySpaces: TCheckBox;
    btnOk: TButton;
    btnCancel: TButton;
    pgeGeneral: TTabSheet;
    chkMarkErrorsInList: TCheckBox;
    chkBold: TCheckBox;
    chkItalic: TCheckBox;
    chkUnderline: TCheckBox;
    dlgSetColor: TColorDialog;
    chkMarkOnLoad: TCheckBox;
    chkFixOnLoad: TCheckBox;
    dlgLoad: TOpenDialog;
    btnEdit: TButton;
    pgeAdvanced: TTabSheet;
    edtRepeatableChars: TLabeledEdit;
    edtProhibitedChars: TLabeledEdit;
    edtToleranceRepeatedSubs: TLabeledEdit;
    udToleranceRepeatedSubs: TUpDown;
    lblMilliseconds: TLabel;
    edtSpaceAfterChars: TLabeledEdit;
    edtSpaceBeforeChars: TLabeledEdit;
    chkCheckSpaceAfterCustomChars: TCheckBox;
    chkCheckSpaceBeforeCustomChars: TCheckBox;
    chkFixSpaceAfterCustomChars: TCheckBox;
    chkFixSpaceBeforeCustomChars: TCheckBox;
    edtTooLongDuration: TLabeledEdit;
    udTooLongDur: TUpDown;
    edtTooShortDuration: TLabeledEdit;
    udTooShortDur: TUpDown;
    lblMilliseconds2: TLabel;
    lblMilliseconds3: TLabel;
    chkCheckTooLongDur: TCheckBox;
    chkCheckTooShortDur: TCheckBox;
    edtTooLongLine: TLabeledEdit;
    udTooLongLine: TUpDown;
    lblCharacters: TLabel;
    chkCheckTooLongLines: TCheckBox;
    chkFixOneUnitOverlap: TCheckBox;
    lblOCRDefFile: TLabel;
    cmbOCRFiles: TComboBox;
    chkShowConfInMainForm: TCheckBox;
    bvlSep1: TBevel;
    chkCheckLinesWithoutLetters: TCheckBox;
    bvlSep2: TBevel;
    bvlSep3: TBevel;
    chkFixLinesWithoutLetters: TCheckBox;
    bvlSep4: TBevel;
    bvlSep5: TBevel;
    chkCheckOpnDlgInSubsWithOneLine: TCheckBox;
    chkFixOpnDlgInSubsWithOneLine: TCheckBox;
    pnlErrorColor: TPanel;
    edtTooSmallCPS: TRealEdit;
    edtTooBigCPS: TRealEdit;
    lblTooSmallCPS: TLabel;
    lblTooBigCPS: TLabel;
    chkTooSmallCPS: TCheckBox;
    chkTooBigCPS: TCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure SetColorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkCheckTextBeforeColonClick(Sender: TObject);
    procedure chkFixTextBeforeColonClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    procedure SetLanguage;
  public
    { Public declarations }
  end;

var
  frmInfoErrorsSettings: TfrmInfoErrorsSettings;

implementation

uses formMain;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmInfoErrorsSettings.SetLanguage;
var
  LF: TIniFile;
begin
  LF := TIniFile.Create(frmMain.ActualLangFile);
  try
    With LF do
    begin
      Caption                      := ReadString('Information and errors Settings', '01', 'Settings');
      pgeGeneral.Caption           := ReadString('Information and errors Settings', '02', 'General');
      pgeAdvanced.Caption          := ReadString('Information and errors Settings', '03', 'Advanced');
      pgeCheckFor.Caption          := ReadString('Information and errors Settings', '04', 'Check for');
      pgeFix.Caption               := ReadString('Information and errors Settings', '05', 'Fix');
      pgeUnnecessarySpaces.Caption := ReadString('Information and errors Settings', '06', 'Unnecessary spaces');

      // ---------------------- //
      //      General page      //
      // ---------------------- //
      chkShowConfInMainForm.Caption := ReadString('Information and errors Settings', '07', 'Show confirmations in main form on fix');
      chkMarkErrorsInList.Caption   := ReadString('Information and errors Settings', '08', 'Mark errors in main form''s list');
      pnlErrorColor.Hint            := ReadString('Information and errors Settings', '09', 'Set color...');
      chkBold.Caption               := ReadString('Information and errors Settings', '10', 'Bold');
      chkItalic.Caption             := ReadString('Information and errors Settings', '11', 'Italic');
      chkUnderline.Caption          := ReadString('Information and errors Settings', '12', 'Underline');
      chkMarkOnLoad.Caption         := ReadString('Information and errors Settings', '13', 'Mark errors on load subtitle');
      chkFixOnLoad.Caption          := ReadString('Information and errors Settings', '14', 'Fix errors on load subtitle');
      chkFixOneUnitOverlap.Caption  := ReadString('Information and errors Settings', '15', 'Fix one unit overlap at load');
      lblOCRDefFile.Caption         := ReadString('Information and errors Settings', '16', 'OCR Script:');
      btnEdit.Caption               := ReadString('Information and errors Settings', '17', '&Edit');

      // ---------------------- //
      //      Advanced page     //
      // ---------------------- //
      edtRepeatableChars.EditLabel.Caption       := ReadString('Information and errors Settings', '18', 'Repeatable characters:');
      edtProhibitedChars.EditLabel.Caption       := ReadString('Information and errors Settings', '19', 'Prohibited characters:');
      edtToleranceRepeatedSubs.EditLabel.Caption := ReadString('Information and errors Settings', '20', 'Tolerance for repeated subtitles:');
      lblMilliseconds.Caption                    := ReadString('Information and errors Settings', '21', 'milliseconds.');
      edtSpaceAfterChars.EditLabel.Caption       := ReadString('Information and errors Settings', '22', 'Space after characters:');
      edtSpaceBeforeChars.EditLabel.Caption      := ReadString('Information and errors Settings', '23', 'Space before characters:');
      edtTooLongDuration.EditLabel.Caption       := ReadString('Information and errors Settings', '24', 'Too long duration:');
      edtTooShortDuration.EditLabel.Caption      := ReadString('Information and errors Settings', '25', 'Too short duration:');
      edtTooLongLine.EditLabel.Caption           := ReadString('Information and errors Settings', '26', 'Too long line:');
      lblCharacters.Caption                      := ReadString('Information and errors Settings', '27', 'characters.');
      lblMilliseconds2.Caption                   := lblMilliseconds.Caption;
      lblMilliseconds3.Caption                   := lblMilliseconds.Caption;
      lblTooSmallCPS.Caption                     := ReadString('Information and errors Settings', '57', 'CPS smaller than:');
      lblTooBigCPS.Caption                       := ReadString('Information and errors Settings', '58', 'CPS bigger than:');


      // ---------------------- //
      //        Check for       //
      // ---------------------- //
      chkCheckLinesWithoutLetters.Caption     := ReadString('Information and errors Settings', '28', 'Lines without letters');
      chkCheckEmptySubtitles.Caption          := ReadString('Information and errors Settings', '29', 'Empty subtitles');
      // ---
      chkCheckOverlapping.Caption             := ReadString('Information and errors Settings', '30', 'Overlapping subtitles');
      chkCheckBadValues.Caption               := ReadString('Information and errors Settings', '31', 'Bad values');
      chkCheckTooLongDur.Caption              := ReadString('Information and errors Settings', '32', 'Too long durations');
      chkCheckTooShortDur.Caption             := ReadString('Information and errors Settings', '33', 'Too short durations');
      chkCheckTooLongLines.Caption            := ReadString('Information and errors Settings', '34', 'Too long lines');
      chkCheckOverTwoLines.Caption            := ReadString('Information and errors Settings', '35', 'Subtitles over two lines');
      // ---
      chkCheckHearingImpaired.Caption         := ReadString('Information and errors Settings', '36', 'Hearing impaired subtitles');
      chkCheckTextBeforeColon.Caption         := ReadString('Information and errors Settings', '37', 'Text before colon (":")');
      chkCheckOnlyIfCapitalLetters.Caption    := ReadString('Information and errors Settings', '38', 'Only if text is in capital letters');
      chkCheckUnnecessaryDots.Caption         := ReadString('Information and errors Settings', '39', 'Unnecessary dots');
      chkCheckProhibitedChars.Caption         := ReadString('Information and errors Settings', '40', 'Prohibited characters');
      chkCheckRepeatedChars.Caption           := ReadString('Information and errors Settings', '41', 'Repeated characters');
      chkCheckRepeatedSubs.Caption            := ReadString('Information and errors Settings', '42', 'Repeated subtitles');
      chkCheckOCRErrors.Caption               := ReadString('Information and errors Settings', '43', 'OCR Errors');
      // ---
      chkCheckOpnDlgInSubsWithOneLine.Caption := ReadString('Information and errors Settings', '44', '"- " in subtitles with one line');
      chkCheckSpaceAfterCustomChars.Caption   := ReadString('Information and errors Settings', '45', 'Spaces after custom characters');
      chkCheckSpaceBeforeCustomChars.Caption  := ReadString('Information and errors Settings', '46', 'Spaces before custom characters');
      chkCheckUnnecessarySpaces.Caption       := ReadString('Information and errors Settings', '47', 'Unnecessary spaces');
      chkTooSmallCPS.Caption                  := ReadString('Information and errors Settings', '59', 'Too small CPS');
      chkTooBigCPS.Caption                    := ReadString('Information and errors Settings', '60', 'Too big CPS');


      // ---------------------- //
      //           Fix          //
      // ---------------------- //
      chkFixLinesWithoutLetters.Caption     := chkCheckLinesWithoutLetters.Caption;
      chkFixEmptySubtitles.Caption          := chkCheckEmptySubtitles.Caption;
      // ---
      chkFixOverlapping.Caption             := chkCheckOverlapping.Caption;
      chkFixBadValues.Caption               := chkCheckBadValues.Caption;
      chkFixOverTwoLines.Caption            := chkCheckOverTwoLines.Caption;
      // ---
      chkFixHearingImpaired.Caption         := chkCheckHearingImpaired.Caption;
      chkFixTextBeforeColon.Caption         := chkCheckTextBeforeColon.Caption;
      chkFixOnlyIfCapitalLetters.Caption    := chkCheckOnlyIfCapitalLetters.Caption;
      chkFixUnnecessaryDots.Caption         := chkCheckUnnecessaryDots.Caption;
      chkFixProhibitedChars.Caption         := chkCheckProhibitedChars.Caption;
      chkFixRepeatedChars.Caption           := chkCheckRepeatedChars.Caption;
      chkFixRepeatedSubs.Caption            := chkCheckRepeatedSubs.Caption;
      chkFixOCRErrors.Caption               := chkCheckOCRErrors.Caption;
      // ---
      chkFixOpnDlgInSubsWithOneLine.Caption := chkCheckOpnDlgInSubsWithOneLine.Caption;
      chkFixSpaceAfterCustomChars.Caption   := chkCheckSpaceAfterCustomChars.Caption;
      chkFixSpaceBeforeCustomChars.Caption  := chkCheckSpaceBeforeCustomChars.Caption;
      chkFixUnnecessarySpaces.Caption       := chkCheckUnnecessarySpaces.Caption;

      // ---------------------- //
      //   Unnecessary spaces   //
      // ---------------------- //
      lblCheckFor.Caption := ReadString('Information and errors Settings', '48', 'Check for:');
      lblFix.Caption      := ReadString('Information and errors Settings', '49', 'Fix:');
      lstSpacesToCheck.Clear;
      lstSpacesToFix.Clear;
      lstSpacesToCheck.Items.Add(ReadString('Information and errors Settings', '50', 'Enters and spaces at the beginning and end'));
      lstSpacesToCheck.Items.Add(ReadString('Information and errors Settings', '51', 'Spaces between enters (left and right)'));
      lstSpacesToCheck.Items.Add(ReadString('Information and errors Settings', '52', 'Double spaces and enters'));
      lstSpacesToCheck.Items.Add(ReadString('Information and errors Settings', '53', 'Spaces in front of punctuation marks'));
      lstSpacesToCheck.Items.Add(ReadString('Information and errors Settings', '54', 'Space after "¿" and "¡"'));
      lstSpacesToCheck.Items.Add(ReadString('Information and errors Settings', '55', 'Space before "?" and "!"'));
      lstSpacesToCheck.Items.Add(ReadString('Information and errors Settings', '56', 'Spaces between numbers'));
      lstSpacesToFix.Items := lstSpacesToCheck.Items;

      btnOk.Caption      := BTN_OK;
      btnCancel.Caption  := BTN_CANCEL;

      // ------------------ //
      //      Set font      //
      // ------------------ //
      btnOk.ParentFont := True;
      Font             := frmMain.Font;
      btnOk.Font.Style := frmMain.Font.Style + [fsBold];
    end;
  finally
    LF.Free;
  end
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrorsSettings.FormCreate(Sender: TObject);
var
  Ini : TIniFile;
  i   : Integer;
begin
  pgeCtrl.ActivePageIndex := 0;
  SetLanguage;
  Ini := TIniFile.Create(IniRoot);
  try
    if frmMain.mnuOCRScripts.Count > 0 then
    begin
      cmbOCRFiles.Clear;
      // Add OCR Scripts
      for i := 2 to frmMain.mnuOCRScripts.Count-1 do
      begin
        cmbOCRFiles.Items.Add(frmMain.mnuOCRScripts.Items[i].Caption);
        if frmMain.mnuOCRScripts.Items[i].Checked then
          cmbOCRFiles.ItemIndex := i;
      end;
      cmbOCRFiles.ItemIndex := frmMain.cmbOCRScripts.ItemIndex;
    end else
    begin
      lblOCRDefFile.Visible := False;
      cmbOCRFiles.Visible   := False;
      btnEdit.Visible       := False;
    end;
    if (cmbOCRFiles.Items.Count >= 1) and (cmbOCRFiles.ItemIndex = -1) then
      cmbOCRFiles.ItemIndex := 0;

    // ------------ //
    // General page //                                           
    // ------------ //
    chkShowConfInMainForm.Checked := Ini.ReadBool('Information and Errors', 'Show confirmations in main form on fix', False);
    chkMarkErrorsInList.Checked   := Ini.ReadBool('Information and Errors', 'Mark errors in main form''s list', True);
    pnlErrorColor.Color           := Ini.ReadInteger('Information and Errors', 'Mark with color', clRed);
    chkBold.Checked               := Ini.ReadBool('Information and Errors', 'Bold', True);
    chkItalic.Checked             := Ini.ReadBool('Information and Errors', 'Italic', False);
    chkUnderline.Checked          := Ini.ReadBool('Information and Errors', 'Underline', False);
    chkMarkOnLoad.Checked         := Ini.ReadBool('Information and Errors', 'Mark errors on load subtitle', False);
    chkFixOnLoad.Checked          := Ini.ReadBool('Information and Errors', 'Fix errors on load subtitle', False);
    chkFixOneUnitOverlap.Checked  := Ini.ReadBool('Information and Errors', 'Fix one unit overlap at load', False);

    // ------------- //
    // Advanced page //
    // ------------- //
    edtRepeatableChars.Text          := Ini.ReadString('Information and Errors', 'Repeatable chars', '-¡!¿?";\/_[]=');
    edtProhibitedChars.Text          := Ini.ReadString('Information and Errors', 'Prohibited chars', '@#*');
    udToleranceRepeatedSubs.Position := Ini.ReadInteger('Information and Errors', 'Tolerance for repeated subtitles', 100);
    edtSpaceAfterChars.Text          := Ini.ReadString('Information and Errors', 'Space after characters', '-');
    edtSpaceBeforeChars.Text         := Ini.ReadString('Information and Errors', 'Space before characters', '');
    udTooLongDur.Position            := Ini.ReadInteger('Information and Errors', 'Too long duration', 6000);
    udTooShortDur.Position           := Ini.ReadInteger('Information and Errors', 'Too short duration', 700);
    udTooLongLine.Position           := Ini.ReadInteger('Information and Errors', 'Too long line', 45);
    edtTooSmallCPS.Value             := Ini.ReadFloat('Information and Errors', 'Too small CPS', 8.0);
    edtTooBigCPS.Value               := Ini.ReadFloat('Information and Errors', 'Too big CPS', 24.0);

    with ErrorsToCheck do
    begin
      // ------------------- //
      // Errors to check for //
      // ------------------- //
      chkCheckLinesWithoutLetters.Checked     := eLinesWithoutLetters;
      chkCheckEmptySubtitles.Checked          := eEmptySubtitle;
      chkCheckOverlapping.Checked             := eOverlapping;
      chkCheckBadValues.Checked               := eBadValues;
      chkCheckOverTwoLines.Checked            := eOverTwoLines;
      chkCheckHearingImpaired.Checked         := eHearingImpaired;
      chkCheckTextBeforeColon.Checked         := eTextBeforeColon;
      chkCheckOnlyIfCapitalLetters.Checked    := eOnlyIfCapitalLetters;
      chkCheckUnnecessaryDots.Checked         := eUnnecessaryDots;
      chkCheckProhibitedChars.Checked         := eProhibitedCharacter;
      chkCheckRepeatedChars.Checked           := eRepeatedCharacter;
      chkCheckRepeatedSubs.Checked            := eRepeatedSubtitle;
      chkCheckOCRErrors.Checked               := eOCRErrors;
      chkCheckOpnDlgInSubsWithOneLine.Checked := eOpnDlgSubsOneLine;
      chkCheckSpaceAfterCustomChars.Checked   := eSpaceAfterCustChars;
      chkCheckSpaceBeforeCustomChars.Checked  := eSpaceBeforeCustChars;
      chkCheckUnnecessarySpaces.Checked       := eUnnecessarySpaces;

      chkCheckTooLongDur.Checked              := eTooLongDurations;
      chkCheckTooShortDur.Checked             := eTooShortDurations;
      chkCheckTooLongLines.Checked            := eTooLongLines;
      chkTooSmallCPS.Checked                  := eTooSmallCPS;
      chkTooBigCPS.Checked                    := eTooBigCPS;

      // --------------------------- //
      // Unnecessary spaces to check //
      // --------------------------- //
      lstSpacesToCheck.Checked[0] := EntersAndSpacesBeginningEnd in eWhatUnnecessarySpaces;
      lstSpacesToCheck.Checked[1] := SpacesBetweenEnters in eWhatUnnecessarySpaces;
      lstSpacesToCheck.Checked[2] := DoubleSpacesAndEnters in eWhatUnnecessarySpaces;
      lstSpacesToCheck.Checked[3] := SpacesFrontPunctuation in eWhatUnnecessarySpaces;
      lstSpacesToCheck.Checked[4] := SpacesAfterQuestionAndExclamation in eWhatUnnecessarySpaces;
      lstSpacesToCheck.Checked[5] := SpacesBeforeQuestionAndExclamation in eWhatUnnecessarySpaces;
      lstSpacesToCheck.Checked[6] := SpacesBetweenNumbers in eWhatUnnecessarySpaces;
    end;

    with ErrorsToFix do
    begin
      // ------------- //
      // Errors to fix //
      // ------------- //
      chkFixLinesWithoutLetters.Checked     := eLinesWithoutLetters;
      chkFixEmptySubtitles.Checked          := eEmptySubtitle;
      chkFixOverlapping.Checked             := eOverlapping;
      chkFixBadValues.Checked               := eBadValues;
      chkFixOverTwoLines.Checked            := eOverTwoLines;
      chkFixHearingImpaired.Checked         := eHearingImpaired;
      chkFixTextBeforeColon.Checked         := eTextBeforeColon;
      chkFixOnlyIfCapitalLetters.Checked    := eOnlyIfCapitalLetters;
      chkFixUnnecessaryDots.Checked         := eUnnecessaryDots;
      chkFixProhibitedChars.Checked         := eProhibitedCharacter;
      chkFixRepeatedChars.Checked           := eRepeatedCharacter;
      chkFixRepeatedSubs.Checked            := eRepeatedSubtitle;
      chkFixOCRErrors.Checked               := eOCRErrors;
      chkFixOpnDlgInSubsWithOneLine.Checked := eOpnDlgSubsOneLine;
      chkFixSpaceAfterCustomChars.Checked   := eSpaceAfterCustChars;
      chkFixSpaceBeforeCustomChars.Checked  := eSpaceBeforeCustChars;
      chkFixUnnecessarySpaces.Checked       := eUnnecessarySpaces;

      // ------------------------- //
      // Unnecessary spaces to fix //
      // ------------------------- //
      lstSpacesToFix.Checked[0] := EntersAndSpacesBeginningEnd in eWhatUnnecessarySpaces;
      lstSpacesToFix.Checked[1] := SpacesBetweenEnters in eWhatUnnecessarySpaces;
      lstSpacesToFix.Checked[2] := DoubleSpacesAndEnters in eWhatUnnecessarySpaces;
      lstSpacesToFix.Checked[3] := SpacesFrontPunctuation in eWhatUnnecessarySpaces;
      lstSpacesToFix.Checked[4] := SpacesAfterQuestionAndExclamation in eWhatUnnecessarySpaces;
      lstSpacesToFix.Checked[5] := SpacesBeforeQuestionAndExclamation in eWhatUnnecessarySpaces;
      lstSpacesToFix.Checked[6] := SpacesBetweenNumbers in eWhatUnnecessarySpaces;
    end;

    chkCheckTextBeforeColonClick(Sender);
    chkFixTextBeforeColonClick(Sender);
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrorsSettings.btnOkClick(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    // ------------ //
    // General page //
    // ------------ //
    Ini.WriteBool('Information and Errors', 'Show confirmations in main form on fix', chkShowConfInMainForm.Checked);
    Ini.WriteBool('Information and Errors', 'Mark errors in main form''s list', chkMarkErrorsInList.Checked);
    Ini.WriteInteger('Information and Errors', 'Mark with color', pnlErrorColor.Color);
    Ini.WriteBool('Information and Errors', 'Bold', chkBold.Checked);
    Ini.WriteBool('Information and Errors', 'Italic', chkItalic.Checked);
    Ini.WriteBool('Information and Errors', 'Underline', chkUnderline.Checked);
    Ini.WriteBool('Information and Errors', 'Mark errors on load subtitle', chkMarkOnLoad.Checked);
    Ini.WriteBool('Information and Errors', 'Fix errors on load subtitle', chkFixOnLoad.Checked);
    Ini.WriteBool('Information and Errors', 'Fix one unit overlap at load', chkFixOneUnitOverlap.Checked);
    ShowConfMainForm  := chkShowConfInMainForm.Checked;
    MarkErrorsInList  := chkMarkErrorsInList.Checked;
//    MarkWithColor     := dlgSetColor.Color;
    MarkWithColor     := pnlErrorColor.Color;
    MarkBold          := chkBold.Checked;
    MarkItalic        := chkItalic.Checked;
    MarkUnderline     := chkUnderline.Checked;
    MarkOnLoad        := chkMarkOnLoad.Checked;
    FixOnLoad         := chkFixOnLoad.Checked;
    FixOneUnitOverlap := chkFixOneUnitOverlap.Checked;
    if cmbOCRFiles.Items.Count > 0 then
    begin
      OCRDefFile        := ExtractFilePath(Application.ExeName) + 'OCRScripts\' + cmbOCRFiles.Items[cmbOCRFiles.ItemIndex] + ID_OCREXT;
      Ini.WriteString('Information and Errors', 'OCR Definitions file', OCRDefFile);
      frmMain.mnuOCRScripts.Items[cmbOCRFiles.ItemIndex].Checked := True;
      frmMain.cmbOCRScripts.ItemIndex := cmbOCRFiles.ItemIndex;
    end;

    // ------------- //
    // Advanced page //
    // ------------- //
    Ini.WriteString('Information and Errors', 'Repeatable chars', edtRepeatableChars.Text);
    Ini.WriteString('Information and Errors', 'Prohibited chars', edtProhibitedChars.Text);
    Ini.WriteInteger('Information and Errors', 'Tolerance for repeated subtitles', udToleranceRepeatedSubs.Position);
    Ini.WriteString('Information and Errors', 'Space after characters', edtSpaceAfterChars.Text);
    Ini.WriteString('Information and Errors', 'Space before characters', edtSpaceBeforeChars.Text);
    Ini.WriteInteger('Information and Errors', 'Too long duration', udTooLongDur.Position);
    Ini.WriteInteger('Information and Errors', 'Too short duration', udTooShortDur.Position);
    Ini.WriteInteger('Information and Errors', 'Too long line', udTooLongLine.Position);
    Ini.WriteFloat('Information and Errors', 'Too small CPS', edtTooSmallCPS.Value);
    Ini.WriteFloat('Information and Errors', 'Too big CPS', edtTooBigCPS.Value);
    RepeatableChars      := edtRepeatableChars.Text;
    ProhibitedChars      := edtProhibitedChars.Text;
    ToleranceForRepeated := udToleranceRepeatedSubs.Position;
    SpaceAfterChars      := edtSpaceAfterChars.Text;
    SpaceBeforeChars     := edtSpaceBeforeChars.Text;
    TooLongDuration      := udTooLongDur.Position;
    TooShortDuration     := udTooShortDur.Position;
    TooLongLine          := udTooLongLine.Position;
    TooSmallCPS          := edtTooSmallCPS.Value;
    TooBigCPS            := edtTooBigCPS.Value;

    with ErrorsToCheck do
    begin
      // ------------------- //
      // Errors to check for //
      // ------------------- //
      eLinesWithoutLetters  := chkCheckLinesWithoutLetters.Checked;
      eEmptySubtitle        := chkCheckEmptySubtitles.Checked;
      eOverlapping          := chkCheckOverlapping.Checked;
      eBadValues            := chkCheckBadValues.Checked;
      eOverTwoLines         := chkCheckOverTwoLines.Checked;
      eHearingImpaired      := chkCheckHearingImpaired.Checked;
      eTextBeforeColon      := chkCheckTextBeforeColon.Checked;
      eOnlyIfCapitalLetters := chkCheckOnlyIfCapitalLetters.Checked;
      eUnnecessaryDots      := chkCheckUnnecessaryDots.Checked;
      eProhibitedCharacter  := chkCheckProhibitedChars.Checked;
      eRepeatedCharacter    := chkCheckRepeatedChars.Checked;
      eRepeatedSubtitle     := chkCheckRepeatedSubs.Checked;
      eOCRErrors            := chkCheckOCRErrors.Checked;
      eOpnDlgSubsOneLine    := chkCheckOpnDlgInSubsWithOneLine.Checked;
      eSpaceAfterCustChars  := chkCheckSpaceAfterCustomChars.Checked;
      eSpaceBeforeCustChars := chkCheckSpaceBeforeCustomChars.Checked;
      eUnnecessarySpaces    := chkCheckUnnecessarySpaces.Checked;

      eTooLongDurations     := chkCheckTooLongDur.Checked;
      eTooShortDurations    := chkCheckTooShortDur.Checked;
      eTooLongLines         := chkCheckTooLongLines.Checked;
      eTooSmallCPS          := chkTooSmallCPS.Checked;
      eTooBigCPS            := chkTooBigCPS.Checked;

      // --------------------------- //
      // Unnecessary spaces to check //
      // --------------------------- //
      eWhatUnnecessarySpaces := [];
      if lstSpacesToCheck.Checked[0] then eWhatUnnecessarySpaces := eWhatUnnecessarySpaces + [EntersAndSpacesBeginningEnd];
      if lstSpacesToCheck.Checked[1] then eWhatUnnecessarySpaces := eWhatUnnecessarySpaces + [SpacesBetweenEnters];
      if lstSpacesToCheck.Checked[2] then eWhatUnnecessarySpaces := eWhatUnnecessarySpaces + [DoubleSpacesAndEnters];
      if lstSpacesToCheck.Checked[3] then eWhatUnnecessarySpaces := eWhatUnnecessarySpaces + [SpacesFrontPunctuation];
      if lstSpacesToCheck.Checked[4] then eWhatUnnecessarySpaces := eWhatUnnecessarySpaces + [SpacesAfterQuestionAndExclamation];
      if lstSpacesToCheck.Checked[5] then eWhatUnnecessarySpaces := eWhatUnnecessarySpaces + [SpacesBeforeQuestionAndExclamation];
      if lstSpacesToCheck.Checked[6] then eWhatUnnecessarySpaces := eWhatUnnecessarySpaces + [SpacesBetweenNumbers];
    end;
    ErrorsToCheck.SaveVars;

    with ErrorsToFix do
    begin
      // ------------- //
      // Errors to fix //
      // ------------- //
      eLinesWithoutLetters  := chkFixLinesWithoutLetters.Checked;
      eEmptySubtitle        := chkFixEmptySubtitles.Checked;
      eOverlapping          := chkFixOverlapping.Checked;
      eBadValues            := chkFixBadValues.Checked;
      eOverTwoLines         := chkFixOverTwoLines.Checked;
      eHearingImpaired      := chkFixHearingImpaired.Checked;
      eTextBeforeColon      := chkFixTextBeforeColon.Checked;
      eOnlyIfCapitalLetters := chkFixOnlyIfCapitalLetters.Checked;
      eUnnecessaryDots      := chkFixUnnecessaryDots.Checked;
      eProhibitedCharacter  := chkFixProhibitedChars.Checked;
      eRepeatedCharacter    := chkFixRepeatedChars.Checked;
      eRepeatedSubtitle     := chkFixRepeatedSubs.Checked;
      eOCRErrors            := chkFixOCRErrors.Checked;
      eOpnDlgSubsOneLine    := chkFixOpnDlgInSubsWithOneLine.Checked;
      eSpaceAfterCustChars  := chkFixSpaceAfterCustomChars.Checked;
      eSpaceBeforeCustChars := chkFixSpaceBeforeCustomChars.Checked;
      eUnnecessarySpaces    := chkFixUnnecessarySpaces.Checked;

      // ------------------------- //
      // Unnecessary spaces to fix //
      // ------------------------- //
      eWhatUnnecessarySpaces := [];
      if lstSpacesToFix.Checked[0] then eWhatUnnecessarySpaces := eWhatUnnecessarySpaces + [EntersAndSpacesBeginningEnd];
      if lstSpacesToFix.Checked[1] then eWhatUnnecessarySpaces := eWhatUnnecessarySpaces + [SpacesBetweenEnters];
      if lstSpacesToFix.Checked[2] then eWhatUnnecessarySpaces := eWhatUnnecessarySpaces + [DoubleSpacesAndEnters];
      if lstSpacesToFix.Checked[3] then eWhatUnnecessarySpaces := eWhatUnnecessarySpaces + [SpacesFrontPunctuation];
      if lstSpacesToFix.Checked[4] then eWhatUnnecessarySpaces := eWhatUnnecessarySpaces + [SpacesAfterQuestionAndExclamation];
      if lstSpacesToFix.Checked[5] then eWhatUnnecessarySpaces := eWhatUnnecessarySpaces + [SpacesBeforeQuestionAndExclamation];
      if lstSpacesToFix.Checked[6] then eWhatUnnecessarySpaces := eWhatUnnecessarySpaces + [SpacesBetweenNumbers];
    end;
    ErrorsToFix.SaveVars;

  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrorsSettings.SetColorClick(Sender: TObject);
begin
  dlgSetColor.Color := pnlErrorColor.Color;
  if dlgSetColor.Execute then
    pnlErrorColor.Color := dlgSetColor.Color;
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrorsSettings.chkCheckTextBeforeColonClick(Sender: TObject);
begin
  chkCheckOnlyIfCapitalLetters.Enabled := chkCheckTextBeforeColon.Checked;
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrorsSettings.chkFixTextBeforeColonClick(Sender: TObject);
begin
  chkFixOnlyIfCapitalLetters.Enabled := chkFixTextBeforeColon.Checked;
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrorsSettings.btnEditClick(Sender: TObject);
  function GetWindowsDirectory: String;
  var 
     pcWindowsDirectory : PChar;
     dwWDSize           : DWORD;
  begin 
    dwWDSize := MAX_PATH + 1;
    GetMem(pcWindowsDirectory, dwWDSize);
    try
      if Windows.GetWindowsDirectory(pcWindowsDirectory, dwWDSize) <> 0 then
        Result := pcWindowsDirectory;
    finally
      FreeMem(pcWindowsDirectory);
    end;
    if Result[Length(Result)] <> '\' then
      Result := Result + '\';
  end;
var
  WinDir  : String;
  OCRFile : String;
begin
  OCRFile := ExtractFilePath(Application.ExeName) + 'OCRScripts\' + cmbOCRFiles.Items[cmbOCRFiles.ItemIndex] + ID_OCREXT;
  if FileExists(OCRFile) then
  begin
    WinDir := GetWindowsDirectory;
    if FileExists(WinDir + 'notepad.exe') then
      ShellExecute(Handle, 'open', PChar(WinDir + 'notepad.exe'), PChar(OCRFile), '', SW_SHOWMAXIMIZED);
  end;
end;

// -----------------------------------------------------------------------------

end.

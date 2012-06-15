// ShiftToTime. Made by Bedazzle.

program ShiftToTime;

// -----------------------------------------------------------------------------

var
  Form      : TForm;
  pPanel    : TPanel;
  btnShift  : TButton;
  btnCancel : TButton;
  lbLabel   : TLabel;
  edEdit    : TEdit;

// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------

function TimeIsValid(t: string): boolean;
begin
  if ((copy(t, 1,1)  >= '0') and (copy(t, 1,1) <=  '9')) then
  if ((copy(t, 2,1)  >= '0') and (copy(t, 2,1) <=  '9')) then
  if (copy(t,  3,1)  =  ':') then
  if ((copy(t, 4,1)  >= '0') and (copy(t, 4,1) <=  '5')) then
  if ((copy(t, 5,1)  >= '0') and (copy(t, 5,1) <=  '9')) then
  if (copy(t,  6,1)  =  ':') then
  if ((copy(t, 7,1)  >= '0') and (copy(t, 7,1) <=  '5')) then
  if ((copy(t, 8,1)  >= '0') and (copy(t, 8,1) <=  '9')) then
  if (copy(t,  9,1)  =  ',') then
  if ((copy(t, 10,1) >= '0') and (copy(t, 10,1) <= '9')) then
  if ((copy(t, 11,1) >= '0') and (copy(t, 11,1) <= '9')) then
  if ((copy(t, 12,1) >= '0') and (copy(t, 12,1) <= '9')) then
     result := TRUE
  else
     result := FALSE;
end;

// -----------------------------------------------------------------------------

function TimeToInt(t: string): integer;
begin
  result := StrToInt(copy(t, 1, 2)) * 1000 * 60 * 60 +
            StrToInt(copy(t, 4, 2)) * 1000 * 60 +
            StrToInt(copy(t, 7, 2)) * 1000 +
            StrToInt(copy(t, 10, 3));
end;

// -----------------------------------------------------------------------------

procedure btnShiftClick(Sender: TObject);
var flag  : boolean;
    disp  : integer;
    i     : integer;
    n     : integer;
    init  : integer;
    final : integer;
begin
  flag := FALSE;

  if (TimeIsValid(edEdit.Text) = FALSE) then
  begin
     MsgBox('Invalid time!'+ ''#13''#10 + 'Must be in 00:00:00,000 format!', '&Ok', '', '', $20);
     Form.ModalResult := 0;
  end
  else
  begin
     disp := TimeToInt(edEdit.Text);

     n := GetSubtitleCount;

     for i := 0 to n-1 do
     begin
        if ((flag = FALSE) and (IsSubtitleSelected(i) = TRUE)) then
        begin
           flag  := TRUE;
           init  := GetSubtitleInitialTime(i);   
           final := GetSubtitleFinalTime(i);
           disp  := disp - init;
        end;

        if (flag = TRUE) then
        begin
           init  := GetSubtitleInitialTime(i);   
           final := GetSubtitleFinalTime(i);
           SetSubtitleInitialTime(i, init+disp);
           SetSubtitleFinalTime(i, final+disp);
        end;
     end;

     if (flag = FALSE) then
        MsgBox('You must select subtitle for shift!', '&Ok', '', '', $20);
  end;

end;

// -----------------------------------------------------------------------------
//
// main code
//
// -----------------------------------------------------------------------------
begin
  Form := TForm.Create(Application);
  try
    Form.Font.Name   := 'MS Sans Serif';
    Form.Font.Height := 8;
    Form.Caption     := 'Shift to time';
    Form.BorderStyle := bsDialog;
    Form.BorderIcons := [];
    Form.Position    := poScreenCenter;
    Form.Width       := 180;
    Form.Height      := 112;

    pPanel        := TPanel.Create(Application);
    pPanel.Left   := 4;
    pPanel.Top    := 4;
    pPanel.Height := 41;
    pPanel.Width  := 165;
    pPanel.Parent := Form;

    lbLabel         := TLabel.Create(Application);
    lbLabel.Parent  := pPanel;
    lbLabel.Left    := 8;
    lbLabel.Top     := 12;
    lbLabel.Width   := 165;
    lbLabel.Height  := 41;
    lbLabel.Caption := 'Desired time';

    edEdit        := TEdit.Create(Application);
    edEdit.Parent := pPanel;
    edEdit.Left   := 80;
    edEdit.Top    := 12;
    edEdit.Width  := 77;
    edEdit.Height := 21;
    edEdit.Text   := '00:00:00,000';

    btnShift             := TButton.Create(Application);
    btnShift.Parent      := Form;
    btnShift.Default     := True;
    btnShift.Caption     := '&Shift';
    btnShift.ModalResult := mrOk;
    btnShift.OnClick     := @btnShiftClick;
    btnShift.Top         := 56;
    btnShift.Left        := 8;
    btnShift.Width       := 75;
    btnShift.Height      := 25;
    btnShift.Font.Style  := btnShift.Font.Style + [fsBold];

    btnCancel             := TButton.Create(Application);
    btnCancel.Parent      := Form;
    btnCancel.Caption     := '&Cancel';
    btnCancel.ModalResult := mrCancel;
    btnCancel.Top         := 56;
    btnCancel.Left        := 88;
    btnCancel.Width       := 75;
    btnCancel.Height      := 25;

    Form.ShowModal;

  finally
    btnCancel.Free;
    btnShift.Free;
    edEdit.Free;
    lbLabel.Free;
    pPanel.Free;
    Form.Free;
  end;
end.

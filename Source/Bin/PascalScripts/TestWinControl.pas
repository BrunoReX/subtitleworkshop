program test;
var 
	Form:TForm;
	s : string;
begin
//	Form:=TForm(Application.MainForm);
//	TWinControl(Form.Components[48]).SetFocus;
//	GoToLineNumber(GetSubtitleCount);
	s := GetSWVersion + ' : ' + GetAPIVersion;
	MsgBox(s, 'OK', '', '', 0);
end.
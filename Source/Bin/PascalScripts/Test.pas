program test;
var 
  Form: TForm;
  i : Integer;
begin
  Form := TForm(Application.MainForm);

  for i := 0 to 1000 do
    if Form.Components[i].Name =  'lstSubtitles' then
    begin
	  TWinControl(Form.Components[i]).SetFocus;
      break;
    end;
end.
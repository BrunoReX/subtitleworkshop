// Test StrUtils unit. Made by Bedazzle.

program TestStrUtils;

// ---------------------------------------------

uses StrUtils;


var
  n, i: Integer;
  txt: String;

  chartoadd: string;

begin
  n := GetSubtitleCount;

  for i := 0 to n-1 do
  begin
     txt := GetSubtitleText(i);

     txt := txt + DupeString(' test', 3);

     SetSubtitleText(i, txt);
  end;
end.

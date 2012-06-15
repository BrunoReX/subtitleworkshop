// Remove dots from start of line. Made by Bedazzle 2006.02.13.

program RemoveDots;

// ---------------------------------------------

var
  n: Integer;
  i: Integer;

  txt: String;

begin
  n := GetSubtitleCount;

  for i := 0 to n-1 do
  begin
     txt := GetSubtitleText(i);

     if copy(txt, 1, 3) = '...' then txt := copy(txt, 4, length(txt)-3);

     SetSubtitleText(i, txt);
  end;
end.

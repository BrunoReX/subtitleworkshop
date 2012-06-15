// Remove style tags. Made by Bedazzle 2007.01.08.
// Fast implementation, use with care!

program RemoveStyleTags;

// ---------------------------------------------

var
  n: Integer;
  i: Integer;

  p1: Integer;
  p2: Integer;

  txt: String;

begin
  n := GetSubtitleCount;

  for i := 0 to n-1 do
  begin
     txt := GetSubtitleText(i);

     p1 := pos('<', txt);
     p2 := pos('>', txt);

     while ((p1>0) and (p2>0)) do
     begin
       txt := copy(txt, 1, p1-1) + copy(txt, p2+1, length(txt)-p2);

       p1 := pos('<', txt);
       p2 := pos('>', txt);
     end;


     SetSubtitleText(i, txt);
  end;
end.

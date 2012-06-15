// Add spaces to begin and end of each line. Made by Bedazzle.

program AddSpaces;

// ---------------------------------------------

const
  toadd = ' ';	// can be replaced by any desired character or string


var
  n, i, p, l: Integer;
  txt, t1, t2: String;

  chartoadd: string;

begin
  n := GetSubtitleCount;

  for i := 0 to n-1 do
  begin
     t1 := '';
     t2 := GetSubtitleText(i);

     p := pos(''#13''#10, t2);

     while (p>0) do
     begin
        l := length(t2);
        t1 := t1 + copy(t2, 1, p-1) + toadd + ''#13''#10 + toadd;
        t2 := copy(t2, p+2, l-p-2);

        p := pos(''#13''#10, t2);
     end;

     txt := toadd + t1 + t2 + toadd;

     SetSubtitleText(i, txt);
  end;
end.

// Copy text to translation. Made by Bedazzle.

program CopyToTransa;

// ---------------------------------------------

var
  n: Integer;
  i: Integer;

  txt: String;

begin
  n := GetSubtitleCount;

  for i := 0 to n-1 do
  begin
     if (IsSubtitleSelected(i) = true) then
     begin
        txt := GetSubtitleText(i);
        SetSubtitleTrans(i, txt);
     end;
  end;
end.

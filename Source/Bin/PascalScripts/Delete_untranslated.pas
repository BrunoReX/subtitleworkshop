// Delete untranslated lines from both original and translation.
// Made by Bedazzle.

program DeleteUntranslated;

// ---------------------------------------------

var
  n: Integer;
  i: Integer;

  txt: String;
  txt2: String;

begin
  if ((IsOriginalLoaded) and (IsTranslatedLoaded)) then
  begin
    n := GetSubtitleCount;

    for i := n-1 downto 0 do
    begin
       txt := GetSubtitleText(i);
       txt2 := GetSubtitleTrans(i);
       if txt = txt2 then DeleteSubtitle(i);
    end;
  end;
end.

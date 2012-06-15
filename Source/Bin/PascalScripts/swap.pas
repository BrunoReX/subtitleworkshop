// Swap subtitles. Original by Bedazzle.
// Swaps two selected subtitles - both time and text. If translation is loaded, 
// translation subtitles are swapped too.

program SwapSubs;

// -----------------------------------------------------------------------------

var
 n: Integer;
 i: Integer;


procedure SwapIt(s: Integer);
var time1, time2: Integer;
    txt: String;
begin
  if ((IsOriginalLoaded) and (s>=0) and (s< GetSubtitleCount-1)) then
  begin
    time1 := GetSubtitleInitialTime(s);
    time2 := GetSubtitleFinalTime(s);
    txt   := GetSubtitleText(s);

    SetSubtitleInitialTime(s, GetSubtitleInitialTime(s+1));
    SetSubtitleFinalTime(s, GetSubtitleFinalTime(s+1));
    SetSubtitleText(s, GetSubtitleText(s+1));

    SetSubtitleInitialTime(s+1, time1);
    SetSubtitleFinalTime(s+1, time2);
    SetSubtitleText(s+1, txt);

    if (IsTranslatedloaded) then
    begin
      txt   := GetSubtitleTrans(s);
      SetSubtitleTrans(s, GetSubtitleTrans(s+1));
      SetSubtitleTrans(s+1, txt);
    end
  end;
end;


begin
  if (not IsOriginalLoaded) then
    exit;

  n := GetSubtitleCount-1;

  for i := 0 to n-1 do
  begin
    if (IsSubtitleSelected(i) = true) then
    begin
      SwapIt(i);
      break;
    end;
  end;
end.
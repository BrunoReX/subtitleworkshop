// Fill empty subtitles with maximum number of characters. Made by Malmoth 2007.03.22. Debugged by Tengo.
// modified by supafly 2007.10.11
// Debugged by Bedazzle 2007.10.11

program FillEmptyLines;

// -----------------------------------------------------------------------------

var
  n: Integer;
  i: Integer;
  j: Integer;
  t: String;

begin
  n := GetSubtitleCount;

  for i := 0 to n - 1 do
  begin
    j := GetSubtitleFinalTime(i)-GetSubtitleInitialTime(i);

    if j < 720 then t:= 'too short'
    else if j > 5000 then t := 'too long'
    else t := IntToStr(j / 55) + ' characters';


    if Length(GetSubtitleText(i)) < 1 then
      SetSubtitleText(i, t);

  end;
end.

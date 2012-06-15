// Insert copyright. Made by Bedazzle.

program Copyright;

// ---------------------------------------------

var
  n: Integer;
  final: Integer;

  txt: String;

begin
  if IsOriginalLoaded = False then EnableWorkArea;

  n := GetSubtitleCount;

  final := GetSubtitleFinalTime(n-1);

  txt := 'русские субтитры';

  txt := txt + ''#13''#10 + 'http://subtitry.ru';

  InsertSubtitle(n, final+5000, final+10000, txt, txt);
end.

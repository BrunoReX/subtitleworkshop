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

  txt := 'Checked with Subtitle Workshop';

  txt := txt + ''#13''#10 + FormatDateTime('dd.mm.yyyy', now);

  InsertSubtitle(n, final+5000, final+10000, txt, txt);
  GoToLineNumber(1116);
end.

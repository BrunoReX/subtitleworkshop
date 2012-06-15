// Get filenames. Made by Bedazzle.

program Filenames;

// ---------------------------------------------

var
  n: Integer;
  final: Integer;

  txt: String;

begin
  if IsOriginalLoaded = False then EnableWorkArea;

  n := GetSubtitleCount;

  final := GetSubtitleFinalTime(n-1);

  txt := GetOrgFilename;
  txt := txt + ''#13''#10 + GetTransFilename;
  txt := txt + ''#13''#10 + GetMovieFilename;
  txt := txt + ''#13''#10 + GetOrgFilepath;
  txt := txt + ''#13''#10 + GetTransFilepath;
  txt := txt + ''#13''#10 + GetMovieFilepath;

  InsertSubtitle(n, final+5000, final+10000, txt, txt);
end.

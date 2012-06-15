// Example of movie info. Made by Bedazzle.

program MovieInfo;

// ---------------------------------------------

var
  n: Integer;
  txt: String;

begin
  n := GetSubtitleCount;

  if n > 0 then
  begin
     txt := GetVideoPosTime();
     txt := txt + ' / ' + GetVideoPosFrames();

     SetSubtitleText(0, txt);
  end
  else
     SetSubtitleText(0, 'Can not get video position info');
end.

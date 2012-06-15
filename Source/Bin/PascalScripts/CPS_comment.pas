// --= CPS Comment (in translation) =--
// Add info about the Readability Rythm
// of the original sub (Characters per second)
// as a comment [...] in the Translation.
// ------------------------------------
// Made by Buzcatcher - feb.2007
// http://subtitle-spotting.blogspot.com/
// improved by Bedazzle 2011.09.29

program CPScomment;

// -------------------------------------

const
  //FYI: 25cps = 40ms spotting for each char ; 20cps=50ms/char. etc.
  CPSlimit = 25;  //Change as you see fit.
  CRLF = ''#13''#10;
  
var
  i, j, n, p1, p2 : Integer;
  duration, sublength, cps : Integer;
  subtxt, subtrans : String;

// -------------------------------------

function CountCRLF(s : String): Integer;
var
  p : Integer;
begin
  Result := 0;
  p := pos(CRLF, s);
  while p > 0 do
  begin
    s := copy(s, p+length(CRLF), length(s)-p-length(CRLF)+1) ;
    p := pos(CRLF, s);
    Result := Result + 1;
  end;
end;
  
// -------------------------------------

begin
  if not IsTranslatedloaded then
    exit;

  n := GetSubtitleCount-1;
  j := 0;

  for i := 0 to n do
  begin
    subtrans := GetSubtitleTrans(i);
    subtxt := GetSubtitleText(i);

    // remove old CPS info if needed
    p1 := pos('[*', subtrans);
    p2 := pos('*]', subtrans);
    while ((p1>0) and (p2>0) and (p2>p1)) do
    begin
      subtrans := copy(subtrans, p2+2, length(subtrans)-p2);
      p1 := pos('[*', subtrans);
      p2 := pos('*]', subtrans);
    end;

    duration := GetSubtitleFinalTime(i) - GetSubtitleInitialTime(i);
    
    // text length without CRLF in multiline subs
    sublength := length(subtxt) - CountCRLF(subtxt)*length(CRLF);

    cps := round((sublength * 1000)/ duration);   //spotting speed.
    
    //Adding [*xx C/sec*] in the translation text.
    if (cps > CPSlimit) then
    begin
      subtrans := '[*' + IntToStr(cps) + ' Char/s*]' + subtrans;
      j := j+1;
    end;

	SetSubtitleTrans(i, subtrans);
  end;

  MsgBox(IntToStr(j) + ' Subtitles over ' + IntToStr(CPSlimit) + ' char/sec' + CRLF + 'Noted in Translation File', '&Ok', '', '', 0);
end.
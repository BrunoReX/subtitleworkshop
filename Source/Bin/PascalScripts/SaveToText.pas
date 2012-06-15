// SaveToText. Made by Bedazzle.

program SaveToText;

// ---------------------------------------------
const crlf = ''#13''#10;

var
  n          : integer;
  i          : integer;
  txt1, txt2 : string;
  fname      : string;
  stream     : TFileStream;
  z          : string;

// ---------------------------------------------

function ReplaceCRLF(t: string; rep: string): string;
var p: integer;
begin
  n := pos(crlf, t);

//  while n > 0 do
//  begin
//    t := copy(t, 1, n-1) + rep + copy(t, n+2, length(t)-n-1);
//    n := pos(crlf, t);
//  end;

  t := '#' + t + '^';
  
  result := t;
end;

// ---------------------------------------------

// ---------------------------------------------
// main program
// ---------------------------------------------
begin
  n := GetSubtitleCount;

  fname := 'c:\boo.txt';

  stream := TFileStream.Create(fname, fmCreate);
  try
    for i := 0 to n-1 do
    begin
      z := IntToStr(i);
      z := z + ': ';
      stream.Write(z, length(z));

      txt1 := GetSubtitleText(i);

      txt2 := ReplaceCRLF(txt1, '|');
      stream.WriteBuffer(txt2, length(txt2));
      stream.WriteBuffer(crlf, 2);
    end;
  finally
    stream.Free;
  end;
end.

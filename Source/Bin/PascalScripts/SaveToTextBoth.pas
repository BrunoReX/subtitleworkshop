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
      txt2 := GetSubtitleTrans(i);

      stream.WriteBuffer(txt1+'#'+txt2, length(txt1+'#'+txt2));
      stream.WriteBuffer(crlf, 2);
    end;
  finally
    stream.Free;
  end;
end.

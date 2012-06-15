// SaveToPlain. Made by Bedazzle, 2011.03.17

program SaveToPlain;

// ---------------------------------------------
const
  crlf = ''#13''#10;

var
  n          : integer;
  i          : integer;
  txt1 : string;
  fname      : string;
  stream     : TFileStream;

// ---------------------------------------------
// main program
// ---------------------------------------------
begin
  fname := 'c:\boo.txt';

  stream := TFileStream.Create(fname, fmCreate);
  try
    n := GetSubtitleCount;

    for i := 0 to n-1 do
    begin
      txt1 := GetSubtitleText(i);
      stream.WriteBuffer(txt1, length(txt1));
      stream.WriteBuffer(crlf, 2);
    end;
  finally
    stream.Free;
  end;
end.

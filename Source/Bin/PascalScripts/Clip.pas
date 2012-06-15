// Copy text to translation. Made by Bedazzle.

program CopyToTransa;

// ---------------------------------------------

var
  clip: TClipBoard;
  //n: Integer;
  //i: Integer;

  txt: String;

begin
  //n := GetSubtitleCount;

  //for i := 0 to n-1 do
  //begin
  //   if (IsSubtitleSelected(i) = true) then
  //   begin
  //      txt := GetSubtitleText(i);
  //      SetSubtitleTrans(i, txt);
  //   end;
  //end;

  txt := GetSubtitleText(0); 

  clip := TClipBoard.Create;
  clip.SetTextBuf(PAnsiChar(text));
  clip.Destroy;
end.

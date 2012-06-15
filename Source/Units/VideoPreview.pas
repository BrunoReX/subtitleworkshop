unit VideoPreview;

interface

uses Forms, Windows, Controls, ComCtrls, ExtCtrls, ActiveX, DirectShow9,
     USubtitlesFunctions, SysUtils, Menus, Classes, formMultipleStreams;

{ $DEFINE UNIOFF}

const
  CLSID_MPEG2Splitter           : TGUID = '{3AE86B20-7BE8-11D1-ABE6-00A0C905F375}';
  CLSID_OGGSplitter             : TGUID = '{F07E245F-5A1F-4D1E-8BFF-DC31D84A55AB}';
  CLSID_GabestMatroskaSplitter  : TGUID = '{0A68C3B5-9164-4A54-AFAF-995B2FF0E0D4}';
  CLSID_GabestRealMediaSplitter : TGUID = '{E21BE468-5C18-43EB-B0CC-DB93A847D769}';
  CLSID_GabestAviSplitter       : TGUID = '{9736D831-9D6C-4E72-B6E7-560EF9181001}';
  CLSID_HaaliMediaSplitter      : TGUID = '{55DA30FC-F16B-49FC-BAA5-AE59FC65F82D}';
  CLSID_VideoRenderer           : TGUID = '{70E102B0-5556-11CE-97C0-00AA0055595A}';
  CLSID_ffdshowVideDecoder      : TGUID = '{04FE9017-F873-410E-871E-AB91661A4EF7}';
  CLSID_LAVSplitter             : TGUID = '{171252A0-8820-4AFE-9DF8-5C92B2D66B04}';

// -----------------------------------------------------------------------------

type
  TRateClass = (rate100, rate10, rate20, rate30, rate40, rate50, rate60, rate70, rate80, rate90, rate150, rate200, rate300, rate400);

  // DirectShow Media Player.
  TDSMP = record
    Initialized  : Boolean;
    // DirectShow stuff
    GraphBuilder : IGraphBuilder;
    MediaControl : IMediaControl;
    MediaSeeking : IMediaSeeking;
    MediaEventEx : IMediaEvent;
    BasicAudio   : IBasicAudio;
    BasicVideo   : IBasicVideo;
    VideoWindow  : IVideoWindow;
    // Video info.
    VideoAvail   : Boolean;
    VideoWidth   : Integer;
    VideoHeight  : Integer;
  end;

// -----------------------------------------------------------------------------

procedure SetVideoPreviewMode(Flag: Boolean);
function FindFilter(Guid: TGUID): IBaseFilter;
function GetColorKeyFUNC: Integer;
function LoadMovie(const FileName: String): Boolean;
procedure FreeFile;
procedure SetPlaybackRate(Rate: Double; AlterAltPlayRateButton: Boolean = False);
procedure SetDefaultShortCut;
function GetPlaybackRate: Double;
procedure SetVideoPos(const Pos: Int64);
procedure Play;
procedure Pause;
procedure Stop;
function GetCurrentPos: Integer;
procedure SetTimeCounter(const CurrPos: Int64);
procedure UpdateSubtitlesPos;
procedure UpdateVideoPos;
procedure EnableVPCtrls(Flag: Boolean);

// -----------------------------------------------------------------------------

var
  // ------------------------- //
  //  DirectShow Media Player  //
  // ------------------------- //
  Player        : TDSMP;
  VideoDuration : Int64;
  Playing       : Boolean;
  // ------------------- //
  //  Subtitle handling  //
  // ------------------- //
  StartSubTime : Integer = -1;
  EndSubTime   : Integer = -1;
  // --
  DefAltPlayRateShortcut : Integer = 16393;

// -----------------------------------------------------------------------------

implementation

uses formMain, General, Functions;

// -----------------------------------------------------------------------------

procedure SetVideoPreviewMode(Flag: Boolean);
begin
  with frmMain do
  begin
    if Flag = True then
    begin
      mnuVideoPreviewMode.Checked := True;

{     pnlVideo.Height := (pnlParent1.Height div 2) - (spSplitter.Height div 2);
      if (spSplitter.Top < 70) then
        spSplitter.Top := 70;
      lstSubtitles.Top := pnlVideo.Height + spSplitter.Height;

      lstSubtitles.Height := pnlParent1.Height - spSplitter.Top - spSplitter.Height;
}
      pnlVolume.Height := (pnlParent1.Height div 2) - (spSplitter.Height div 2);

      if (spSplitter.Top < 70) then
        spSplitter.Top := 70;

      lstSubtitles.Top := pnlVolume.Height + spSplitter.Height;
      lstSubtitles.Height := pnlParent1.Height - spSplitter.Top - spSplitter.Height;

      if pnlVideo.Visible = False then
        pnlVideo.Show;
      if spSplitter.Visible = False then
        spSplitter.Show;
      if pnlVolume.Visible = False then
        pnlVolume.Show;

      sbSeekBar.Position := 0;
      sbSeekBar.Show;
      if frmMain.PlayOnLoad then
        UpdateVideoPos;

      if Player.Initialized then
        tcTimeCounter.Show else
      begin
        tcTimeCounter.Text1 := '';
        tcTimeCounter.Text2 := '';
      end;

    end else
    begin
      subSubtitle.Hide;
      mnuVideoPreviewMode.Checked := False;
      spSplitter.Hide;
//      pnlVideo.Hide;
      pnlVolume.Hide;

      lstSubtitles.Top := 0;
      lstSubtitles.Height := pnlParent1.Height;
      tcTimeCounter.Hide;
      sbSeekBar.Hide;
      pnlVolume.Hide;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function FindFilter(Guid: TGUID): IBaseFilter;
var
  EnumF   : IEnumFilters;
  Fetched : ULong;
  Fi      : IBaseFilter;
  g       : TGuid;
begin
  Result := nil;

  if Player.GraphBuilder = nil then
    exit;

  Player.GraphBuilder.EnumFilters(EnumF);
  if EnumF <> nil then
  begin
    while EnumF.Next(1, Fi, @Fetched) = S_OK do
    begin
      Fi.GetClassID(G);
      if IsEqualGUID(g, guid) then
        Result := Fi;
    end;
  end;
  Fi    := nil;
  EnumF := nil;
end;

// -----------------------------------------------------------------------------

function GetColorKeyFUNC: Integer;
var
  IO             : IOverlay;
  Pin            : IPin;
  Enum           : IEnumPins;
  f              : ULong;
  Ck             : TColorKey;
  fVideoRenderer : IBaseFilter;
begin
  Result:= RGB(0, 0, 0);
  FVideoRenderer := FindFilter(CLSID_VideoRenderer);

  if FVideoRenderer = nil then
    FVideoRenderer := FindFilter(CLSID_VideoMixingRenderer);
  if FVideoRenderer = nil then
    exit;

  FVideoRenderer.EnumPins(Enum); 
  Enum.Next(1, Pin, @f);
  Enum:= nil;

  if Pin = nil then
    Exit;

  Pin.QueryInterface(IID_IOverlay, IO);
  if IO = nil then begin Pin:= nil; exit; end;

  IO.GetDefaultColorKey(Ck);

  Result := RGB(GetRValue(ck.HighColorValue),GetGValue(ck.HighColorValue),GetBValue(ck.HighColorValue));

  FVideoRenderer := nil;
  IO             := nil;
  Pin            := nil;
end;

// -----------------------------------------------------------------------------

function LoadMovie(const FileName: String): Boolean;
  procedure RemoveVMR(GraphBuilder: IGraphBuilder);
  var
    EnumPins      : IEnumPins;
    Fetched       : ULong;
    Pin           : IPin;
    OutPin        : IPin;
    Dir           : TPinDirection;
    VideoRenderer : IBaseFilter;
  begin
    if GraphBuilder = nil then
      exit;

    VideoRenderer := FindFilter(CLSID_VideoMixingRenderer);

    if Assigned(VideoRenderer) then
    begin
      VideoRenderer.EnumPins(EnumPins);
      // We see where is VMR connected and store the Pin
      while EnumPins.Next(1, Pin, @Fetched) = S_OK do
      begin
        Pin.QueryDirection(Dir);
        if Dir = PINDIR_INPUT then
        begin
          Pin.ConnectedTo(OutPin);
          Break;
        end;
      end;
      EnumPins := nil;

      GraphBuilder.RemoveFilter(VideoRenderer);

      VideoRenderer := nil;
      CoCreateInstance(TGUID(CLSID_VideoRenderer), nil, CLSCTX_INPROC_SERVER, TGUID(IID_IBaseFilter), VideoRenderer);
      if Assigned(VideoRenderer) then
      begin
        GraphBuilder.AddFilter(VideoRenderer, PWideChar(WideString('Video Renderer')));
        VideoRenderer.EnumPins(EnumPins);
        EnumPins.Next(1, Pin, @Fetched);
        EnumPins := nil;

        // Connect the other video renderer with the Pin that VMR was previously connected to
        if (Assigned(Pin)) and (Assigned(OutPin)) then
          GraphBuilder.Connect(OutPin, Pin);
      end;

      Pin           := nil;
      OutPin        := nil;
      VideoRenderer := nil;
    end;
  end;
  //------------------
  procedure PlayOnlyStream1(GraphBuilder: IGraphBuilder);
    function FindSplitter: IBaseFilter;
    var
      EnumF   : IEnumFilters;
      Fetched : ULong;
      Fi      : IBaseFilter;
      g       : TGuid;
      FilterInfo: TFilterInfo;
    begin
      Result := nil;
      if GraphBuilder = nil then
        Exit;

      GraphBuilder.EnumFilters(EnumF);
      if EnumF <> nil then
      while EnumF.Next(1, Fi, @Fetched) = S_OK do  // 1 = how many filters to retrieve
      begin

        Fi.QueryFilterInfo(FilterInfo);
//        MsgBox(FilterInfo.achName, BTN_OK, '', '', MB_ICONWARNING, frmMain);

        Fi.GetClassID(G);
        if IsEqualGUID(G, CLSID_AviSplitter)
           or IsEqualGUID(G, CLSID_OGGSplitter)
           or IsEqualGUID(G, CLSID_MPEG1Splitter)
           or IsEqualGUID(G, CLSID_MPEG2Splitter)
           or IsEqualGUID(G, CLSID_GabestAviSplitter)
           or IsEqualGUID(G, CLSID_GabestMatroskaSplitter)
           or IsEqualGUID(G, CLSID_GabestRealMediaSplitter)
           or IsEqualGUID(G, CLSID_ffdshowVideDecoder)
//           or IsEqualGUID(G, CLSID_HaaliMediaSplitter)
//           or IsEqualGUID(G, CLSID_VideoRenderer)
           or IsEqualGUID(G, CLSID_LAVSplitter)
           then
          Result := Fi;


//          break;
//          if result = nil then
//            MsgBox(String(FilterInfo.achName)+#13+IntToHex(G.D1, 8)+'-'+IntToHex(G.D2, 4)+'-'+IntToHex(G.D3, 4)+#13+'result is nil', BTN_OK, '', '', MB_ICONWARNING, frmMain)
//          else
//            MsgBox(String(FilterInfo.achName)+#13+IntToHex(G.D1, 8)+'-'+IntToHex(G.D2, 4)+'-'+IntToHex(G.D3, 4)+#13+#13+'result is NOT nil', BTN_OK, '', '', MB_ICONWARNING, frmMain);

      end;
      Fi    := nil;
      EnumF := nil;

    end;
    //------------------
    function CountAudioStreams(BaseFilter: IBaseFilter): Byte;
    var
      EnumPins : IEnumPins;
      Fetched  : ULong;
      Pin      : IPin;
      PinType  : TAMMediaType;
    begin
      Result := 0;

      BaseFilter.EnumPins(EnumPins);
      while EnumPins.Next(1, Pin, @Fetched) = S_OK do // 1 = how many pins to retrieve
      begin
        if Pin.ConnectionMediaType(PinType) = S_OK then
          if IsEqualGUID(PinType.MajorType, MEDIAType_Audio) then
            Inc(Result);
      end;
      EnumPins := nil;
    end;
  //------------------
  var
    EnumPins : IEnumPins;
    Fetched  : ULong;
    Pin      : IPin;
    Pin2     : IPin;
    PinType  : TAMMediaType;
    Splitter : IBaseFilter;
    i        : Byte;
    Streams  : Byte;
    KeepStream : Byte;
  begin
    Splitter := FindSplitter;

    if Assigned(Splitter) then
    begin
      Streams := CountAudioStreams(Splitter);

      if Streams > 1 then
      begin
        frmMultipleStreams := TfrmMultipleStreams.Create(Application);
        frmMultipleStreams.cmbStreams.Clear;

        for i := 1 to Streams do
           frmMultipleStreams.cmbStreams.AddItem(IntToStr(i), nil);

        frmMultipleStreams.cmbStreams.ItemIndex := 0;

        frmMultipleStreams.ShowModal;
        KeepStream := StrToInt(frmMultipleStreams.cmbStreams.Items[frmMultipleStreams.cmbStreams.ItemIndex]);
        frmMultipleStreams.Free;

        Splitter.EnumPins(EnumPins);

        Streams := 1;
        while EnumPins.Next(1, Pin, @Fetched) = S_OK do // 1 = how many pins to retrieve
        begin
          if Pin.ConnectionMediaType(PinType) = S_OK then
          begin
            if IsEqualGUID(PinType.MajorType, MEDIAType_Audio) then
            begin
              if Streams <> KeepStream then  // eliminate all audio links except chosen
              begin
                Pin.ConnectedTo(Pin2);
                GraphBuilder.Disconnect(Pin);
                GraphBuilder.Disconnect(Pin2);
              end;
              Inc(Streams);
            end;
          end;
        end;
        EnumPins := nil;
        Splitter := nil;
      end;

{      Splitter.EnumPins(EnumPins);

      a := 0;
      while EnumPins.Next(1, Pin, @Fetched) = S_OK do // 1 = how many pins to retrieve
      begin
        if Pin.ConnectionMediaType(PinType) = S_OK then
        begin
          if IsEqualGUID(PinType.MajorType, MEDIAType_Audio) then
          begin
            if a >= 1 then  // eliminate all audio links except first one
            begin
              Pin.ConnectedTo(Pin2);
              GraphBuilder.Disconnect(Pin);
              GraphBuilder.Disconnect(Pin2);
            end;
            Inc(a);
          end;
        end;
      end;
      EnumPins := nil;
      Splitter := nil;
}
    end;
  end;

var
  mFPS         : Double;
  TempFPS      : Single;
  TempDur      : Integer;
  RenderResult : HResult;
begin
  Result := False;
  FreeFile;

  with Player do
  begin
    Initialized := False;
    
    CoInitialize(nil);
    if Failed(CoCreateInstance(TGUID(CLSID_FilterGraph), nil, CLSCTX_INPROC_SERVER, TGUID(IID_IGraphBuilder), GraphBuilder)) then exit;

    // ------------------ //
    //    File to play    //
    // ------------------ //
    RenderResult := GraphBuilder.RenderFile(PWideChar(WideString(FileName)), nil);
    if RenderResult <> S_OK then
    begin
      if (RenderResult <> VFW_S_AUDIO_NOT_RENDERED) and
         (RenderResult <> VFW_S_VIDEO_NOT_RENDERED) and
         (RenderResult <> VFW_S_PARTIAL_RENDER) and
         (RenderResult <> VFW_S_DUPLICATE_NAME) then
        exit else
        MsgBox(Format(InfoMsg[10], ['$'+IntToHex(RenderResult, 8)]), BTN_OK, '', '', MB_ICONWARNING, frmMain);
    end;

    // Remove VMR Renderer
    RemoveVMR(GraphBuilder);
    // Play only audio stream 1 (if multiple audio streams)
    PlayOnlyStream1(GraphBuilder);

    // -------------------------- //
    //    Fill Player variable    //
    // -------------------------- //
    if Failed(GraphBuilder.QueryInterface(IID_IMediaControl, MediaControl)) then exit;
    if Failed(GraphBuilder.QueryInterface(IID_IMediaSeeking, MediaSeeking)) then exit;
    if Failed(GraphBuilder.QueryInterface(IID_IMediaEventEx, MediaEventEx)) then exit;
    if Failed(GraphBuilder.QueryInterface(IID_IBasicAudio, BasicAudio)) then exit;
    if Failed(GraphBuilder.QueryInterface(IID_IBasicVideo, BasicVideo)) then exit;
    if Failed(GraphBuilder.QueryInterface(IID_IVideoWindow, VideoWindow)) then exit;

    // ------------------ //
    //   Set time format  //
    // ------------------ //
    MediaSeeking.SetTimeFormat(TIME_FORMAT_MEDIA_TIME);

    // ------------------- //
    // Assign video window //
    // ------------------- //
    VideoWindow.put_Owner(frmMain.pnlVideoDisplay.Handle); // Set owner
    VideoWindow.put_MessageDrain(frmMain.pnlVideoDisplay.Handle); // Set message drain to parent window
    VideoWindow.put_WindowStyle(WS_CHILD or WS_CLIPCHILDREN or WS_CLIPSIBLINGS); // Set window style
    VideoAvail := Assigned(BasicVideo) and Assigned(VideoWindow);
    MediaSeeking.GetDuration(VideoDuration);
    VideoDuration := VideoDuration div 10000;

    with frmMain do
    begin

      if VideoAvail then
      begin
        BasicVideo.get_VideoWidth(VideoWidth);
        BasicVideo.get_VideoHeight(VideoHeight);
        mFPS := 0;
        BasicVideo.get_AvgTimePerFrame(mFPS);

        if mFPS > 0 then
          mFPS := 1 / mFPS else
        begin
          mFPS := 0;
          GetVideoInfo(FileName, TempFPS, TempDur);
          mFPS := TempFPS;
        end;

        if mFPS > 0 then
          AddFPSItem(mFPS, True, False, False);
        MovieFPS := mFPS;
                         
        if TransparentSubs then
        begin
          subSubtitle.BackgroundColor := GetColorKeyFUNC;
          if ForceUsingReg then
            subSubtitle.ForceTransparency := True;
        end else
        begin
          subSubtitle.ForceTransparency := False;
          subSubtitle.BackgroundColor   := frmMain.BackgroundColor;
        end;
      end;

      MovieFile := FileName;
//{$IFNDEF UNIOFF}
      if (mnuTranslatorMode.Checked) then
      begin
        if (mnuDisplayOriginal.Checked) then
          subSubtitle.Font.Charset := OrgCharset else
          subSubtitle.Font.Charset := TransCharset;
      end else
        subSubtitle.Font.Charset := OrgCharset;
//{$ENDIF}
      if frmMain.PlayOnLoad then
      begin
        btnPlay.Hide;
        btnPause.Show;
        Playing := True;
      end else
      begin
        btnPlay.Show;
        btnPause.Hide;
        Playing := False;
      end;

      SetVideoPos(0);
      sbSeekBar.Max      := VideoDuration;
      sbSeekBar.Position := 0;
      tmrVideo.Enabled   := True;
      tcTimeCounter.Show;
      btnScrollList.Down := ScrollList;
      EnableVPCtrls(True);
      Player.Initialized := True;
    end;

    if frmMain.mnuVideoPreviewMode.Checked then
    begin
      UpdateVideoPos;
      UpdateSubtitlesPos;
    end;

    // --------------- //
    //  Playback rate  //
    // --------------- //
    if frmMain.mnu10P.Checked then SetPlayBackRate(0.10, True) else
    if frmMain.mnu20P.Checked then SetPlayBackRate(0.20, True) else
    if frmMain.mnu30P.Checked then SetPlayBackRate(0.30, True) else
    if frmMain.mnu40P.Checked then SetPlayBackRate(0.40, True) else
    if frmMain.mnu50P.Checked then SetPlayBackRate(0.50, True) else
    if frmMain.mnu60P.Checked then SetPlayBackRate(0.60, True) else
    if frmMain.mnu70P.Checked then SetPlayBackRate(0.70, True) else
    if frmMain.mnu80P.Checked then SetPlayBackRate(0.80, True) else
    if frmMain.mnu90P.Checked then SetPlayBackRate(0.90, True) else
    if frmMain.mnu150P.Checked then SetPlayBackRate(1.5, True) else
    if frmMain.mnu200P.Checked then SetPlayBackRate(2, True) else
    if frmMain.mnu300P.Checked then SetPlayBackRate(3, True) else
    if frmMain.mnu400P.Checked then SetPlayBackRate(4, True) else
      SetPlayBackRate(1, True);

    if frmMain.PlayOnLoad then
        MediaControl.Run;

    Result := True;

//    if frmMain.PlayOnLoad = False then
//      frmMain.btnPlayClick(nil);
  end;
end;

// -----------------------------------------------------------------------------

procedure FreeFile;
begin
  with Player do
  begin
    Initialized := False;
    if Assigned(MediaEventEx) then MediaEventEx := nil;
    if Assigned(MediaSeeking) then MediaSeeking := nil;
    if Assigned(MediaControl) then MediaControl := nil;
    if Assigned(BasicAudio)   then BasicAudio   := nil;
    if Assigned(BasicVideo)   then BasicVideo   := nil;
    if Assigned(VideoWindow)  then VideoWindow  := nil;
    if Assigned(GraphBuilder) then GraphBuilder := nil;
    FillChar(Player, SizeOf(Player), 0);
    CoUninitialize;
    with frmMain do
    begin
      tmrVideo.Enabled    := False;
      sbSeekBar.Position  := 0;
      sbSeekBar.Enabled   := False;
      subSubtitle.Text    := '';
      subSubtitle.Visible := False;
      tcTimeCounter.Text1 := '';
      tcTimeCounter.Text2 := '';
      tcTimeCounter.Hide;
      MovieFile := '';
      EnableVPCtrls(False);
      Playing := False;
      btnPause.Hide;
      btnPlay.Show;
      tcTimeCounter.Hide;
    end;    
  end;
end;

// -----------------------------------------------------------------------------

procedure SetPlaybackRate(Rate: Double; AlterAltPlayRateButton: Boolean = False);
begin
  with frmMain do
  begin
    if Player.Initialized then
    begin
      if Rate = GetPlaybackRate then
      begin
        mnu100P.Checked := True;
        Rate := 1;
      end;
      Player.MediaSeeking.SetRate(Rate);
      if AlterAltPlayRateButton then
      begin
        if Rate = 1 then
          btnAlterPlaybackRate.Down := False else
          btnAlterPlaybackRate.Down := True;
      end;
    end;  
  end;
end;

// -----------------------------------------------------------------------------

procedure SetDefaultShortCut;
begin
  with frmMain do
  begin
    mnu10P.ShortCut := 0;
    mnu20P.ShortCut := 0;
    mnu30P.ShortCut := 0;
    mnu40P.ShortCut := 0;
    mnu50P.ShortCut := 0;
    mnu60P.ShortCut := 0;
    mnu70P.ShortCut := 0;
    mnu80P.ShortCut := 0;
    mnu90P.ShortCut := 0;
    mnu150P.ShortCut := 0;
    mnu200P.ShortCut := 0;
    mnu300P.ShortCut := 0;
    mnu400P.ShortCut := 0;
    // 16393 = [Ctrl]+[Tab]
    case DefAltPlayRate of
      rate10: mnu10P.ShortCut := DefAltPlayRateShortcut;
      rate20: mnu20P.ShortCut := DefAltPlayRateShortcut;
      rate30: mnu30P.ShortCut := DefAltPlayRateShortcut;
      rate40: mnu40P.ShortCut := DefAltPlayRateShortcut;
      rate50: mnu50P.ShortCut := DefAltPlayRateShortcut;
      rate60: mnu60P.ShortCut := DefAltPlayRateShortcut;
      rate70: mnu70P.ShortCut := DefAltPlayRateShortcut;
      rate80: mnu80P.ShortCut := DefAltPlayRateShortcut;
      rate90: mnu90P.ShortCut := DefAltPlayRateShortcut;
      rate150: mnu150P.ShortCut := DefAltPlayRateShortcut;
      rate200: mnu200P.ShortCut := DefAltPlayRateShortcut;
      rate300: mnu300P.ShortCut := DefAltPlayRateShortcut;
      rate400: mnu400P.ShortCut := DefAltPlayRateShortcut;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function GetPlaybackRate: Double;
begin
  Result := -1;
  if Player.Initialized then
    Player.MediaSeeking.GetRate(Result);
end;

// -----------------------------------------------------------------------------

procedure SetVideoPos(const Pos: Int64);
var
  vPos: Int64;
begin
  if (Player.Initialized) then
  begin
    with frmMain do
    begin
      vPos := Pos * 10000;
      tmrVideo.Enabled := False;
      if vPos < 0 then vPos := 0;
      if vPos > (VideoDuration * 10000) then
      begin
        vPos := (VideoDuration * 10000);
        frmMain.btnPlay.Show;
        frmMain.btnPause.Hide;
      end;
      Player.MediaSeeking.SetPositions(vPos, AM_SEEKING_ABSOLUTEPOSITIONING, vPos, AM_SEEKING_NOPOSITIONING);
      sbSeekBar.Position := vPos div 10000;
      tmrVideo.Enabled := True;
      SetTimeCounter(vPos div 10000);
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure SetTimeCounter(const CurrPos: Int64);
begin
  with frmMain do
  begin
    if frmMain.FormatType = ftTime then
    begin
      tcTimeCounter.Text1 := TimeToString(CurrPos);
      tcTimeCounter.Text2 := TimeToString(VideoDuration);
    end else
    begin
      tcTimeCounter.Text1 := IntToStr(TimeToFrames(CurrPos, MovieFPS));
      tcTimeCounter.Text2 := IntToStr(TimeToFrames(VideoDuration, MovieFPS));
    end;
    tcTimeCounter.Text3 := FormatFloat('#.###', MovieFPS);
  end;
end;

// -----------------------------------------------------------------------------

procedure UpdateSubtitlesPos;
begin
  with frmMain do
  begin
    if (mnuVideoPreviewMode.Checked) then
    begin
      subSubtitle.Left := (pnlParent1.Width div 2) - (subSubtitle.Width div 2);

      if PreviewSubPosition = 0 then begin
        subSubtitle.Top := 5;
      end else begin
        subSubtitle.Top := pnlVideoDisplay.Height - subSubtitle.Height - 5;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure UpdateVideoPos;
var
  Proportion: Real;
  NewWidth, NewHeight, NewLeft: Integer;
begin
  if (Player.Initialized) and (Player.VideoAvail) and (frmMain.mnuVideoPreviewMode.Checked) then
  begin
    if (Player.VideoWidth > 0) and (Player.VideoHeight > 0) then
    begin
      Proportion := Player.VideoWidth / Player.VideoHeight;
      if (frmMain.pnlVideoDisplay.Width / frmMain.pnlVideoDisplay.Height) > Proportion then
      begin
        NewWidth  := Round(frmMain.pnlVideoDisplay.Height * Proportion);
        NewLeft   := (frmMain.pnlVideoDisplay.Width - NewWidth) Div 2;
        NewWidth  := NewLeft + NewWidth;
        NewHeight := frmMain.pnlVideoDisplay.Height;
      end else
      begin
        NewHeight := Round(frmMain.pnlVideoDisplay.Width / Proportion);
        NewLeft   := 0;
        NewWidth  := frmMain.pnlVideoDisplay.Width;
      end;

    {  Player.VideoWindow.put_Top(0);
      Player.VideoWindow.put_Left(NewLeft);
      Player.VideoWindow.put_Width(NewWidth-NewLeft);
      Player.VideoWindow.put_Height(NewHeight);
       }
      Player.VideoWindow.SetWindowPosition(NewLeft, 0, (NewWidth-NewLeft), (NewHeight));
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure Play;
begin
  if (Player.Initialized) and (Playing = False) then
  begin
    Player.MediaControl.Run;
    Playing := True;
    frmMain.tmrVideo.Enabled := True;
    frmMain.btnPause.Visible := True;
    frmMain.btnPlay.Visible  := False;
  end;
end;

// -----------------------------------------------------------------------------

procedure Pause;
begin
  if (Player.Initialized) then
  begin
    if Playing = True then
    begin
      Player.MediaControl.Pause;
      Playing := False;
      frmMain.tmrVideo.Enabled := False;
      frmMain.btnPause.Visible := False;
      frmMain.btnPlay.Visible  := True;
    end else
      Play;
  end;
end;

// -----------------------------------------------------------------------------

procedure Stop;
begin
  if (Player.Initialized) then
  begin
    Player.MediaControl.Stop;
    Playing := False;
    SetVideoPos(0);
    frmMain.tmrVideo.Enabled := False;
    frmMain.btnPause.Hide;
    frmMain.btnPlay.Show;
  end;
end;

// -----------------------------------------------------------------------------

function GetCurrentPos: Integer;
var
  cPos: Int64;
begin
  Result := 0;
  if (Player.Initialized) then
  begin
    Player.MediaSeeking.GetCurrentPosition(cPos);
    Result := cPos div 10000;
  end; 
end;

// -----------------------------------------------------------------------------

procedure EnableVPCtrls(Flag: Boolean);
begin
  with frmMain do
  begin
    sbSeekBar.Enabled            := Flag;
    btnPlay.Enabled              := Flag;
    btnPause.Enabled             := Flag;
    btnStop.Enabled              := Flag;
    btnScrollList.Enabled        := Flag;
    btnPrevSub.Enabled           := Flag;
    btnNextSub.Enabled           := Flag;
    btnRew.Enabled               := Flag;
    btnForward.Enabled           := Flag;
    btnAlterPlaybackRate.Enabled := Flag;
    btnMoveSubtitle.Enabled      := Flag;
    btnSetStartTime.Enabled      := Flag;
    btnSetFinalTime.Enabled      := Flag;
    btnStartSubtitle.Enabled     := Flag;
    btnEndSubtitle.Enabled       := Flag;
    btnSyncPoint1.Enabled        := Flag;
    btnSyncPoint2.Enabled        := Flag;
    btnAddSyncPoint.Enabled      := Flag;
  end;
end;

// -----------------------------------------------------------------------------

end.

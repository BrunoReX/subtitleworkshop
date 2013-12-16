// UCheckFormat - Unidad para la detecci�n de subt�tulos
// Copyright � 2001-2003 URUSoft.

unit UCheckFormat;

//------------------------------------------------------------------------------

interface

uses
  USubtitleFile, USubtitlesRead, SysUtils, FastStrings;

//------------------------------------------------------------------------------

function CheckSubtitleFormat(const tmpSubFile: TSubtitleFile): TSubtitleFormats;

//------------------------------------------------------------------------------

implementation

uses USubtitlesFunctions;

//------------------------------------------------------------------------------

function CheckSubtitleFormat(const tmpSubFile: TSubtitleFile): TSubtitleFormats;
var
  i: Integer;
begin
  Result := sfInvalid;

  for i := 0 to tmpSubFile.Count-1 do
  begin
    try

      // Advanced SubStation Alpha
      if (SmartPos('Dialogue:', tmpSubFile[i], False) > 0) and
         (SmartPos('Marked=', tmpSubFile[i], False) = 0) and
         (SmartPos('!effect', tmpSubFile[i], False) = 0) and
         (TimeInFormat(Trim(Copy(tmpSubFile[i], Pos(',', tmpSubFile[i]) + 1, SmartPos(',', tmpSubFile[i], True, Pos(',', tmpSubFile[i]) + 1) - (Pos(',', tmpSubFile[i]) + 1))), 'h:mm:ss.zz'))  and
         (TimeInFormat(Trim(Copy(tmpSubFile[i], SmartPos(',', tmpSubFile[i], True, Pos(',', tmpSubFile[i]) + 1) + 1, SmartPos(',', tmpSubFile[i], True, SmartPos(',', tmpSubFile[i], True, Pos(',', tmpSubFile[i]) + 1) + 1) - (SmartPos(',', tmpSubFile[i], True, Pos(',', tmpSubFile[i]) + 1) + 1))), 'h:mm:ss.zz')) then
      begin
        Result := sfAdvancedSubStationAlpha;
        Break;
      end;

      // AQTitle
      if (IsInteger(Copy(tmpSubFile[i], 6, Length(tmpSubFile[i])))) and
         (Pos('-->> ', tmpSubFile[i]) = 1) and
         (Length(tmpSubFile[i]) = 11) then
      begin
        Result := sfAQTitle;
        Break;
      end;

      // Captions DAT Text
      if (Pos('#T', tmpSubFile[i]) > 0) and (IsInteger(Copy(tmpSubFile[i], Pos('#T', tmpSubFile[i]) + 3, 14))) and
         ((Pos('#T', tmpSubFile[i+1]) > 0) and (IsInteger(Copy(tmpSubFile[i+1], 3, 14))) and
         (Pos('BG @', tmpSubFile[i+2]) > 0)) or
         ((Pos('BG @', tmpSubFile[i]) > 0)) then
      begin
        Result := sfCaptionsDatText;
        Break;
      end;

      // Captions Inc
      if (TimeInFormat(Copy(tmpSubFile[i], 1, 11), 'hh:mm:ss:zz') and
         (TimeInFormat(Copy(tmpSubFile[i], 13, 11), 'hh:mm:ss:zz') and
         (Pos('{0 [1 ', tmpSubFile[i+1]) = 1))) then
      begin
        Result := sfCaptionsInc;
        Break;
      end;

      // Cheetah
      if (SmartPos('** caption number', tmpSubFile[i], False) = 1) or
         ((SmartPos('*t ', tmpSubFile[i], False) = 1) and
         (TimeInFormat(Copy(tmpSubFile[i], 4, 11), 'hh:mm:ss:zz'))) then
      begin
        Result := sfCheetah;
        Break;
      end;

      // CPC-600
      if (TimeInFormat(Copy(tmpSubFile[i], 1, 11), 'hh:mm:ss:zz')) and
         (TimeInFormat(Copy(tmpSubFile[i+1], 1, 11), 'hh:mm:ss:zz')) and
         (SmartPos('�0NEN�',tmpSubFile[i], False) = 12) and
         (SmartPos('�0NEN�',tmpSubFile[i+1], False) = 12) then
      begin
        Result := sfCPC600;
        Break;
      end;

      // DKS Subtitle Format
      if (Pos('[', tmpSubFile[i]) = 1) and
         (Pos(']', tmpSubFile[i]) = 10) and
         (TimeInFormat(Copy(tmpSubFile[i], 2, 8), 'hh:mm:ss')) and
         (TimeInFormat(Copy(tmpSubFile[i+1], 2, 8), 'hh:mm:ss')) then
      begin
        Result := sfDKS;
        Break;
      end;

      // DVDSubtitle
      if (SmartPos('{T ', tmpSubFile[i], False) = 1) and
         (TimeInFormat(Copy(tmpSubFile[i], 4, 11), 'hh:mm:ss:zz')) then
      begin
        Result := sfDVDSubtitle;
        Break;
      end;

      // I-Author Script
      if (SmartPos('BMPFILE:', tmpSubFile[i], False) = 1) or
         (SmartPos('TIME:', tmpSubFile[i], False) = 1) or
         (SmartPos('STARTTIME:', tmpSubFile[i], False) = 1) then
      begin
        Result := sfIAuthor;
        Break;
      end;

      // JACOSub 2.7+
      if (TimeInFormat(Copy(tmpSubFile[i], 1, 10), 'h:mm:ss.zz')) and
         (TimeInFormat(Copy(tmpSubFile[i], 12, 10), 'h:mm:ss.zz')) and
         (Pos(',', tmpSubFile[i]) <> 12) and
         (Pos(',', tmpSubFile[i]) <> 11) and
         (Pos(#9, tmpSubFile[i]) = 0) then
      begin
        Result := sfJACOSub;
        Break;
      end;

      // MacSUB
      if (Pos('/', tmpSubFile[i]) = 1) and
         (IsInteger(Copy(tmpSubFile[i], 2, Length(tmpSubFile[i])))) then
      begin
        Result := sfMacSUB;
        Break;
      end;

      // MicroDVD
      if (IsInteger(Copy(tmpSubFile[i], 2, Pos('}', tmpSubFile[i]) - 2))) and
         (IsInteger(Copy(tmpSubFile[i], SmartPos('{', tmpSubFile[i], True, 2) + 1, SmartPos('}', tmpSubFile[i], True, Pos('}', tmpSubFile[i]) + 1) - (SmartPos('{', tmpSubFile[i], True, 2) + 1)))) and
         (StringCount('{', tmpSubFile[i]) >= 2) and
         (StringCount('}', tmpSubFile[i]) >= 2) and
         (Pos('{', tmpSubFile[i]) = 1) then
      begin
        Result := sfMicroDVD;
        Break;
      end;

      // MPlayer
      if (IsInteger(Copy(tmpSubFile[i], 1, Pos(',',tmpSubFile[i]) - 1))) and
         (IsInteger(Copy(tmpSubFile[i], Pos(',',tmpSubFile[i]) + 1, SmartPos(',', tmpSubFile[i], True, Pos(',',tmpSubFile[i]) + 1) - (Pos(',',tmpSubFile[i]) + 1)))) and
         (IsInteger(ReplaceString(tmpSubFile[i], ',', '')) = False) and
         (StringCount(',', tmpSubFile[i]) >= 3) then
      begin
        Result := sfMPlayer;
        Break;
      end;

      // MPlayer 2
      if (IsInteger(Copy(tmpSubFile[i], 2, Pos(']', tmpSubFile[i]) - 2))) and
         (IsInteger(Copy(tmpSubFile[i], SmartPos('[', tmpSubFile[i], True, 2) + 1, SmartPos(']', tmpSubFile[i], True, Pos(']', tmpSubFile[i]) + 1) - (SmartPos('[', tmpSubFile[i], True, 2) + 1)))) and
         (StringCount('[', tmpSubFile[i]) >= 2) and
         (StringCount('[', tmpSubFile[i]) >= 2) and
         (Pos('[', tmpSubFile[i]) = 1) then
      begin
        Result := sfMPlayer2;
        Break;
      end;

      // Philips SVCD Designer
      if (SmartPos('# PHILIPS SVCD DESIGNER', tmpSubFile[i], False) > 0) then
      begin
        Result := sfPhilipsSVCD;
        Break;
      end;

      // Phoenix Japanimation
      if (IsInteger(Copy(tmpSubFile[i], 1, Pos(',',tmpSubFile[i]) - 1))) and
         (Pos('"', tmpSubFile[i]) > 0) and
         (StringCount(',', Copy(tmpSubFile[i], 1, Pos('"', tmpSubFile[i]) - 1)) = 2) and
         (StringCount('"', tmpSubFile[i]) >= 2) then
      begin
        Result := sfPhoenixJS;
        Break;
      end;

      // Pinnacle Impression
      if (TimeInFormat(Copy(tmpSubFile[i], 1, 11), 'hh:mm:ss:zz')) and
         (TimeInFormat(Copy(tmpSubFile[i], 13, 11), 'hh:mm:ss:zz')) and
         (StringCount(':', Copy(tmpSubFile[i], 1, 24)) = 6) and
         (StringCount(',', Copy(tmpSubFile[i], 1, 24)) = 0) and
         (StringCount(' ', Copy(tmpSubFile[i], 1, 24)) = 2) and
         (Length(tmpSubFile[i]) > 24) then
      begin
        Result := sfPinnacleImpression;
        Break;
      end;

      // PowerDivX
      if (StringToTime(Copy(tmpSubFile[i], 2, Pos('}', tmpSubFile[i]) -2)) > -1) and
         (StringToTime(Copy(tmpSubFile[i], SmartPos('{', tmpSubFile[i], True, 2) + 1, SmartPos('}', tmpSubFile[i], True, Pos('}', tmpSubFile[i]) + 1) - (SmartPos('{', tmpSubFile[i], True, 2) + 1))) > -1) and
         (StringCount('{', tmpSubFile[i]) >= 2) and
         (StringCount('}', tmpSubFile[i]) >= 2) and
         (Pos('{', tmpSubFile[i]) = 1) then
      begin
        Result := sfPowerDivX;
        Break;
      end;

      // PowerPixel
      if (TimeInFormat(Copy(tmpSubFile[i], 1, 11), 'hh:mm:ss:zz')) and
         (TimeInFormat(Copy(tmpSubFile[i], 13,11), 'hh:mm:ss:zz')) and
         (Pos(#9, tmpSubFile[i]) = 12) and
         (Length(tmpSubFile[i]) = 23) then
      begin
        Result := sfPowerPixel;
        Break;
      end;

      // QuickTime Text
      if (SmartPos('{QTtext}', tmpSubFile[i], False) > 0) or
         (Pos('[', tmpSubFile[i]) = 1) and
         (Pos(']', tmpSubFile[i]) = 13) and
         (Pos('[', tmpSubFile[i+2]) = 1) and
         (Pos(']', tmpSubFile[i+2]) = 13) and
         (TimeInFormat(Copy(tmpSubFile[i], 2, 11), 'hh:mm:ss.zz')) and
         (TimeInFormat(Copy(tmpSubFile[i+2], 2, 11), 'hh:mm:ss.zz')) then
      begin
        Result := sfQuickTimeText;
        Break;
      end;

      // QuickTime Text
      if (StringToTime(Copy(tmpSubFile[i], SmartPos('begin="', tmpSubFile[i], False) + 7, SmartPos('"', tmpSubFile[i], True, SmartPos('begin="', tmpSubFile[i], False) + 7) - (SmartPos('begin="', tmpSubFile[i], False) + 7))) > -1) and // No usamos TimeInFormat porque vi unos RT en
         (StringToTime(Copy(tmpSubFile[i], SmartPos('end="', tmpSubFile[i], False) + 5, SmartPos('"', tmpSubFile[i], True, SmartPos('end="', tmpSubFile[i], False) + 5) - (SmartPos('end="', tmpSubFile[i], False) + 5))) > -1) and   // los cuales el formato del tiempo var�a
         (SmartPos('<time', tmpSubFile[i], False) > 0) and
         (SmartPos('begin="', tmpSubFile[i], False) > 0) and
         (SmartPos('end="', tmpSubFile[i], False) > 0) then
      begin
        Result := sfRealTime;
        Break;
      end;

      // SAMI Captioning
      if (SmartPos('<SAMI>', tmpSubFile[i], False) <> 0) or
         (SmartPos('</SAMI>', tmpSubFile[i], False) <> 0) or
         (SmartPos('<SYNC START=', tmpSubFile[i], False) <> 0) then
      begin
        Result := sfSAMI;
        Break;
      end;

      // Sasami script
      if (SmartPos(';Set.Time.Start=', tmpSubFile[i], False) > 0) and
         (IsInteger(Copy(tmpSubFile[i], SmartPos(';Set.Time.Start=', tmpSubFile[i], False) + 16, Length(tmpSubFile[i])))) then
      begin
        Result := sfSasamiScript;
        Break;
      end;

      // SBT
      if (StringToTime(Trim(tmpSubFile[i])) > -1) and
         (StringToTime(Trim(tmpSubFile[i+1])) > -1) and
         (StringToTime(Trim(tmpSubFile[i+2])) = -1) then
      begin
        Result := sfSBT;
        Break;
      end;

      // Sofni
      if (TimeInFormat(Copy(tmpSubFile[i], 1, 11), 'hh:mm:ss.zz')) and
         (TimeInFormat(Copy(tmpSubFile[i], 13, 11), 'hh:mm:ss.zz')) and
         (Pos('\',tmpSubFile[i]) = 12) then
      begin
        Result := sfSofni;
        Break;
      end;

      // Softitler RTF
      if (Copy(tmpSubFile[i], 1, 12) = '{\rtf1\ansi\') or
         (Copy(tmpSubFile[i], 1, 6) = '\par [') then
      begin
        Result := sfSoftitlerRTF;
        Break;
      end;

      // SonicDVD Creator
      if (TimeInFormat(Copy(tmpSubFile[i], 7, 11), 'hh:mm:ss:zz')) and
         (TimeInFormat(Copy(tmpSubFile[i], 20, 11), 'hh:mm:ss:zz')) and
         (StringCount('  ', Copy(tmpSubFile[i], 1, 32)) = 3) and
         (IsInteger(Copy(tmpSubFile[i], 1, 4))) then
      begin
        Result := sfSonicDVD;
        Break;
      end;

      // Sonic Scenarist
      if (TimeInFormat(Copy(tmpSubFile[i], Pos(#9#9, tmpSubFile[i]) + 2, 11), 'hh:mm:ss:zz')) and
         (TimeInFormat(Copy(tmpSubFile[i], Pos(#9#9, tmpSubFile[i]) + 14, 11), 'hh:mm:ss:zz')) and
         (Pos(#9#9, tmpSubFile[i]) > 0) then
      begin
        Result := sfSonicScenarist;
        Break;
      end;

      // Spruce DVDMaestro
      if (TimeInFormat(Copy(tmpSubFile[i], 10, 11), 'hh:mm:ss:zz')) and
         (TimeInFormat(Copy(tmpSubFile[i], 25, 11), 'hh:mm:ss:zz')) and
         (IsInteger(Copy(tmpSubFile[i], 1, 4))) then
      begin
        Result := sfSpruceDVDMaestro;
        Break;
      end;

      // Spruce Subtitle File
      if (TimeInFormat(Copy(tmpSubFile[i], 1, 11), 'hh:mm:ss:zz')) and
         (TimeInFormat(Copy(tmpSubFile[i], 13, 11), 'hh:mm:ss:zz')) and
         (StringCount(',', Copy(tmpSubFile[i], 1, 24)) = 2) and
         (Pos(',',tmpSubFile[i]) = 12) then
      begin
        Result := sfSpruceSubtitleFile;
        Break;
      end;

      // SST Script
      if ((SmartPos('SST',tmpSubFile[i], False) = 1) and
         (SmartPos('[TITLES]', tmpSubFile[i+1], False) = 1)) or
         (StringCount(#9, tmpSubFile[i]) = 5) and
         (IsInteger(Copy(tmpSubFile[i], 1, Pos(#9,tmpSubFile[i]) - 1))) then
      begin
        Result := sfSSTScript;
        Break;
      end;

      // SubRip
      if (TimeInFormat(Copy(tmpSubFile[i], 1, 12), 'hh:mm:ss,zzz')) and
         (TimeInFormat(Copy(tmpSubFile[i], 18, 12), 'hh:mm:ss,zzz')) and
         (Pos(' --> ', tmpSubFile[i]) > 0) then
      begin
        Result := sfSubRip;
        Break;
      end;

      // SubSonic
      if (IsInteger(Copy(tmpSubFile[i], 1, 1))) and
         (Pos(' \ ~:\', tmpSubFile[i]) > 0) then
      begin
        Result := sfSubSonic;
        Break;
      end;

      // SubStation Alpha
      if ((SmartPos('Dialogue:', tmpSubFile[i], False) > 0) or
         (SmartPos('Marked', tmpSubFile[i], False) > 0) or
         (SmartPos('!effect', tmpSubFile[i], False) > 0) or
         (SmartPos('Comment:', tmpSubFile[i], False) > 0) or
         (SmartPos('Command:', tmpSubFile[i], False) > 0)) and
         (TimeInFormat(Trim(Copy(tmpSubFile[i], Pos(',', tmpSubFile[i]) + 1, SmartPos(',', tmpSubFile[i], True, Pos(',', tmpSubFile[i]) + 1) - (Pos(',', tmpSubFile[i]) + 1))), 'h:mm:ss.zz'))  and
         (TimeInFormat(Trim(Copy(tmpSubFile[i], SmartPos(',', tmpSubFile[i], True, Pos(',', tmpSubFile[i]) + 1) + 1, SmartPos(',', tmpSubFile[i], True, SmartPos(',', tmpSubFile[i], True, Pos(',', tmpSubFile[i]) + 1) + 1) - (SmartPos(',', tmpSubFile[i], True, Pos(',', tmpSubFile[i]) + 1) + 1))), 'h:mm:ss.zz')) then
      begin
        Result := sfSubStationAlpha;
        Break;
      end;

      // SubViewer 1.0
      if // [hh:mm:ss]
         ((TimeInFormat(Copy(tmpSubFile[i], 2, 8), 'hh:mm:ss')) and
         (TimeInFormat(Copy(tmpSubFile[i+2], 2, 8), 'hh:mm:ss')) and
         (Pos('[', tmpSubFile[i]) = 1) and
         (Pos(']',tmpSubFile[i]) = 10) and
         (Length(tmpSubFile[i]) = 10)) or
         // hh:mm:ss
         ((TimeInFormat(tmpSubFile[i], 'hh:mm:ss')) and
         (Length(tmpSubFile[i]) = 8) and
         (TimeInFormat(tmpSubFile[i+2], 'hh:mm:ss')) and
         (Length(tmpSubFile[i+2]) = 8)) then
      begin
        Result := sfSubViewer1;
        Break;
      end;

      // SubViewer 2.0
      if ((TimeInFormat(Copy(tmpSubFile[i], 1, 11), 'hh:mm:ss.zz')) and
         (TimeInFormat(Copy(tmpSubFile[i], 13, 11), 'hh:mm:ss.zz'))) or
         (TimeInFormat(Copy(tmpSubFile[i], 1, 11), 'hh:mm:ss,zz')) and
         (TimeInFormat(Copy(tmpSubFile[i], 13, 11), 'hh:mm:ss,zz')) and
         (StringCount(':',tmpSubFile[i], False) = 4) and
         (Pos(',', tmpSubFile[i]) = 12) then
      begin
        Result := sfSubViewer2;
        Break;
      end;

      // TMPlayer
      if SmartPos('NTP', tmpSubFile[i]) = 0 then
      if // TMPlayer Multiline Format
         ((StringCount(':', tmpSubFile[i]) >= 2) and
         (Pos(',', tmpSubFile[i]) = 9) and
         (Pos('=', tmpSubFile[i]) = 11) and
         (TimeInFormat(Copy(tmpSubFile[i], 1, 10), 'hh:mm:ss,1'))) or // z <> Milliseconds, it's "1" or "2" depending on the line number

         // TMPlayer Format (Time structure 1)
         ((StringCount(':', Copy(tmpSubFile[i], 0, 9)) = 3) and
         (Pos(':', tmpSubFile[i]) = 3) and
         (TimeInFormat(Copy(tmpSubFile[i], 1, 8), 'hh:mm:ss'))) or

         // TMPlayer Format (Time structure 2)
         ((StringCount(':', Copy(tmpSubFile[i], 0, 8)) = 3) and
         (Pos(':', tmpSubFile[i]) = 2) and
         (TimeInFormat(Copy(tmpSubFile[i], 1, 7), 'h:mm:ss'))) or

         // TMPlayer+ Format (Time structure 1)
         ((StringCount(':', Copy(tmpSubFile[i], 0, 9)) = 2) and
         (Pos(':', tmpSubFile[i]) = 3) and
         (Pos('=',tmpSubFile[i]) = 9) and
         (TimeInFormat(Copy(tmpSubFile[i], 1, 8), 'hh:mm:ss'))) or

         // TMPlayer+ Format (Time structure 2)
         ((StringCount(':', tmpSubFile[i]) >= 2) and
         (Pos(':', tmpSubFile[i]) = 2) and
         (Pos('=',tmpSubFile[i]) = 8) and
         (TimeInFormat(Copy(tmpSubFile[i], 1, 7), 'h:mm:ss'))) then
      begin
        Result := sfTMPlayer;
        Break;
      end;

      // Turbo Titler
      if (TimeInFormat(Copy(tmpSubFile[i], 1, 10), 'h:mm:ss.zz')) and
         (TimeInFormat(Copy(tmpSubFile[i], 12, 10), 'h:mm:ss.zz')) and
         (Pos('-', tmpSubFile[i]) <> 13) and
         (Pos(' ', tmpSubFile[i]) = 26) and
         (Pos(',', tmpSubFile[i]) = 11) then
      begin
        Result := sfTurboTitler;
        Break;
      end;

      // ViPlay Subtitle File
      if (AnsiUpperCase(tmpSubFile[i]) = '{* VIPLAY SUBTITLE FILE *}') or
         ((Pos('-', tmpSubFile[i]) = 13) and
         (Pos('=', tmpSubFile[i]) = 26) and
         (TimeInFormat(Copy(tmpSubFile[i], 1, 12), 'hh:mm:ss,zzz')) and
         (TimeInFormat(Copy(tmpSubFile[i], 14, 12), 'hh:mm:ss,zzz'))) then
      begin
        Result := sfViPlay;
        Break;
      end;

      // ZeroG
      if (SmartPos('% Zero G 1.0', tmpSubFile[i], False) <> 0) Or
         (TimeInFormat(Copy(tmpSubFile[i], 5, 10), 'h:mm:ss.zz')) and
         (TimeInFormat(Copy(tmpSubFile[i], 16, 10), 'h:mm:ss.zz')) then
      begin
        Result := sfZeroG;
        Break;
      end;

    except
      Result := sfInvalid;
    end;
  end;
end;

//------------------------------------------------------------------------------

end.

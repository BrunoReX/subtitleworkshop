{*
 *  ViPlay3 - Rise of the Players
 *
 *  Author  : Aldo Lacavalla
 *  Email   : aml@urusoft.net
 *  Website : www.urusoft.net
 *
 *  The contents of this file are used with permission, subject to
 *  the Mozilla Public License Version 1.1 (the "License"); you may
 *  not use this file except in compliance with the License. You may
 *  obtain a copy of the License at
 *  http://www.mozilla.org/MPL/MPL-1.1.html
 *
 *  Software distributed under the License is distributed on an
 *  "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 *  implied. See the License for the specific language governing
 *  rights and limitations under the License.
 *
 *  Copyright (C) 2001-2005 Aldo Lacavalla <urusoft@gmail.com>
 *}

unit USTimeUtils;

// -----------------------------------------------------------------------------

interface

uses
  SysUtils, FastStrings, USStringUtils;

// -----------------------------------------------------------------------------

function TimeToFrames(const Time: Cardinal; const FPS: Single): Cardinal;
function FramesToTime(const Frames, FPS: Single): Cardinal;
//function TimeToString(const Time: Cardinal; TimeFormat: String = 'hh:mm:ss'): String;
//function StringToTime(const Time: String; const NoHours: Boolean = False): Cardinal;
function RefTimeToMSecs(RefTime: Int64): Cardinal;
function MSecsToRefTime(MSecs: Cardinal): Int64;
function GetDateAndTime(Format: String = 'hh:mm:ss, dd/mm/yyyy'): String;

// -----------------------------------------------------------------------------

implementation

//------------------------------------------------------------------------------

function TimeToFrames(const Time: Cardinal; const FPS: Single): Cardinal;
begin
  Result := Round((Time / 1000) * FPS);
end;

// -----------------------------------------------------------------------------

function FramesToTime(const Frames, FPS: Single): Cardinal;
begin
  if FPS > 0 then
    Result := Round((Frames / FPS) * 1000)
  else
    Result := 0;
end;

// -----------------------------------------------------------------------------
{
function TimeToString(const Time: Cardinal; TimeFormat: String = 'hh:mm:ss'): String;
var
  Hour, Min, Sec, MSec : Word;
  Count, tmp           : Byte;
begin
  Hour := Trunc(Time / 3600000);
  Min  := Trunc((Time-(Hour*3600000)) / 60000);
  Sec  := Trunc((Time-(Hour*3600000)-(Min*60000)) / 1000);
  MSec := Trunc((Time-(Hour*3600000)-(Min*60000)-(Sec*1000)));

  if TimeFormat = 'hh:mm:ss' then
    Result := Format('%.2d:%.2d:%.2d', [Hour, Min, Sec])
  else
  begin
    Count := StringCount('h', TimeFormat);
    if Count > 0 then
      TimeFormat := ReplaceString(TimeFormat, StringOfChar('h', Count), PadLeft(IntToStr(Hour), '0', Count))
    else
      Min := Min + Hour * 60;

    Count := StringCount('m', TimeFormat);
    if Count > 0 then
      TimeFormat := ReplaceString(TimeFormat, StringOfChar('m', Count), PadLeft(IntToStr(Min), '0', Count))
    else
      Sec := Sec + Min * 60;

    Count := StringCount('s', TimeFormat);
    if Count > 0 then
      TimeFormat := ReplaceString(TimeFormat, StringOfChar('s', Count), PadLeft(IntToStr(Sec), '0', Count));

    Count := StringCount('z', TimeFormat);
    if Count > 0 then
    begin
      tmp := Pos('z', TimeFormat);
      TimeFormat := Copy(ReplaceString(TimeFormat, StringOfChar('z', Count), Copy(PadLeft(IntToStr(MSec), '0', 3), 0, Count)), 0, tmp + Count-1);
    end;

    Result := TimeFormat;
  end;
end;
}
// -----------------------------------------------------------------------------
{
function StringToTime(const Time: String; const NoHours: Boolean = False): Cardinal;
var
  H, M, S, Z, i                : Integer;
  PCount, PFirst, PSec, PThird : Integer;
begin
  Result := 0;
  if (Time = '') then Exit;

  H      := 0;
  M      := 0;
  S      := 0;
  Z      := 0;
  PCount := 0;
  PFirst := 0;
  PSec   := 0;
  PThird := 0;

  for i := 1 to Length(Time) do
  begin
    if not (Time[i] in ['0'..'9']) then
      if (Time[i] in [':', ',', '.']) then
      begin
        if (i = 1) or (i = Length(Time)) then Exit;

        case PCount of
          0 : PFirst := i;
          1 : PSec   := i;
          2 : PThird := i;
        end;

        Inc(PCount);
      end
      else
        Exit;
  end;

  try
    if PFirst > 0 then
    begin
      if NoHours then
      begin
        M := StringToInt(Copy(Time, 0, PFirst - 1));
        if PSec = 0 then
          S := StringToInt(Copy(Time, PFirst + 1, Length(Time)-PFirst));
      end
      else
      begin
        H := StringToInt(Copy(Time, 0, PFirst - 1));
        if PSec = 0 then
          M := StringToInt(Copy(Time, PFirst + 1, Length(Time)-PFirst));
      end;

      if PSec > 0 then
      begin
        if NoHours then
        begin
          S := StringToInt(Copy(Time, PFirst + 1, PSec - PFirst - 1));
          Z := StringToInt(PadRight(Copy(Time, PSec + 1, Length(Time)), '0', 3, False));
        end
        else
          M := StringToInt(Copy(Time, PFirst + 1, PSec - PFirst - 1));

        if PThird > 0 then
        begin
          S := StringToInt(Copy(Time, PSec + 1, PThird - PSec - 1));
          Z := StringToInt(PadRight(Copy(Time, PThird + 1, Length(Time)), '0', 3, False));
        end
        else
          if not NoHours then
            S := StringToInt(Copy(Time, PSec + 1, Length(Time)));
      end;

      Result := ((H*3600)*1000) + ((M*60)*1000) + (S*1000) + Z;
    end;
  except
    Result := 0;
  end;
end;
}
// -----------------------------------------------------------------------------

function RefTimeToMSecs(RefTime: Int64): Cardinal;
begin
  Result := Cardinal(RefTime div 10000);
end;

// -----------------------------------------------------------------------------

function MSecsToRefTime(MSecs: Cardinal): Int64;
begin
  Result := MSecs * 10000;
end;

// -----------------------------------------------------------------------------

function GetDateAndTime(Format: String = 'hh:mm:ss, dd/mm/yyyy'): String;
begin
  DateTimeToString(Result, Format, Now);
end;

// -----------------------------------------------------------------------------

end.

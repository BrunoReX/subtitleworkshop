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

unit USStringUtils;

// -----------------------------------------------------------------------------

interface

uses
  Windows, Classes, SysUtils, Math, FastStrings;

// -----------------------------------------------------------------------------

function Iff(const Condition: Boolean; const TruePart, FalsePart: String): String; overload;
function Iff(const Condition: Boolean; const TruePart, FalsePart: Byte): Byte; overload;
function Iff(const Condition: Boolean; const TruePart, FalsePart: Integer): Integer; overload;
function Iff(const Condition: Boolean; const TruePart, FalsePart: Cardinal): Cardinal; overload;
function Iff(const Condition: Boolean; const TruePart, FalsePart: Int64): Int64; overload;
function Iff(const Condition: Boolean; const TruePart, FalsePart: Boolean): Boolean; overload;
function ReplaceEnters(const S: String; const OldPattern: String = #13#10; const NewPattern: String = '|'): String;
function ReplaceString(const S, OldPattern, NewPattern: String; ReplaceAll: Boolean = True; IgnoreCase: Boolean = True): String;
function StringCount(const AFindString, ASourceString: String; const CaseSensitive: Boolean = True): Integer;
function PadLeft(const S: String; const PadChar: Char; const Length: Integer; const Cut: Boolean = False): String;
function PadRight(const S: String; const PadChar: Char; const Length: Integer; const Cut: Boolean): String;
function ReplaceChrsToEntities(const Text: String): String;
function StringToBoolean(const S: String; const Default: Boolean = False): Boolean;
function StringToByte(const S: String; const Default: Byte = 0): Byte;
function StringToShortInt(const S: String; const Default: ShortInt = 0): ShortInt;
function StringToSmallInt(const S: String; const Default: SmallInt = 0): SmallInt;
function StringToInt(const S: String; const Default: Integer = 0): Integer;
function StringToRect(S: String): TRect;

// -----------------------------------------------------------------------------

implementation

//------------------------------------------------------------------------------

function Iff(const Condition: Boolean; const TruePart, FalsePart: String): String;
begin
  if Condition then
    Result := TruePart
  else
    Result := FalsePart;
end;

// -----------------------------------------------------------------------------

function Iff(const Condition: Boolean; const TruePart, FalsePart: Byte): Byte;
begin
  if Condition then
    Result := TruePart
  else
    Result := FalsePart;
end;

// -----------------------------------------------------------------------------

function Iff(const Condition: Boolean; const TruePart, FalsePart: Integer): Integer;
begin
  if Condition then
    Result := TruePart
  else
    Result := FalsePart;
end;

// -----------------------------------------------------------------------------

function Iff(const Condition: Boolean; const TruePart, FalsePart: Cardinal): Cardinal;
begin
  if Condition then
    Result := TruePart
  else
    Result := FalsePart;
end;

// -----------------------------------------------------------------------------

function Iff(const Condition: Boolean; const TruePart, FalsePart: Int64): Int64;
begin
  if Condition then
    Result := TruePart
  else
    Result := FalsePart;
end;

// -----------------------------------------------------------------------------

function Iff(const Condition: Boolean; const TruePart, FalsePart: Boolean): Boolean;
begin
  if Condition then
    Result := TruePart
  else
    Result := FalsePart;
end;

// -----------------------------------------------------------------------------

function ReplaceEnters(const S: String; const OldPattern: String = #13#10; const NewPattern: String = '|'): String;
begin
  Result := FastReplace(S, OldPattern, NewPattern);
end;

// -----------------------------------------------------------------------------

function ReplaceString(const S, OldPattern, NewPattern: String; ReplaceAll: Boolean = True; IgnoreCase: Boolean = True): String;
var
  Flags: TReplaceFlags;
begin
  Flags := [];
  if ReplaceAll then Flags := Flags + [rfReplaceAll];
  if IgnoreCase then Flags := Flags + [rfIgnoreCase];
//  Result := FastAnsiReplace(S, OldPattern, NewPattern, Flags);
  Result := StringReplace(S, OldPattern, NewPattern, Flags);
end;

// -----------------------------------------------------------------------------

function StringCount(const AFindString, ASourceString: String; const CaseSensitive: Boolean = True): Integer;
var
  Find, Source, NextPos : PChar;
  LSource, LFind        : Integer;
  Next                  : TFastPosProc;
  JumpTable             : TBMJumpTable;
begin
  Result  := 0;
  LSource := Length(ASourceString);
  if LSource = 0 then Exit;

  LFind := Length(AFindString);
  if LFind = 0 then Exit;

  if CaseSensitive then
  begin
    Next := BMPos;
    MakeBMTable(PChar(AFindString), Length(AFindString), JumpTable);
  end
  else
  begin
    Next := BMPosNoCase;
    MakeBMTableNoCase(PChar(AFindString), Length(AFindString), JumpTable);
  end;

  Source := @ASourceString[1];
  Find   := @AFindString[1];

  repeat
    NextPos := Next(Source, Find, LSource, LFind, JumpTable);
    if NextPos <> NIL then
    begin
      Dec(LSource, (NextPos - Source) + LFind);
      Inc(Result);
      Source := NextPos + LFind;
    end;
  until NextPos = NIL;
end;

// -----------------------------------------------------------------------------

function PadLeft(const S: String; const PadChar: Char; const Length: Integer; const Cut: Boolean = False): String;
var
  F, L, P, M : Integer;
  I, J       : PChar;
begin
  if Length = 0 then
  begin
    if Cut then
      Result := ''
    else
      Result := S;

    Exit;
  end;

  M := System.Length(S);
  if Length = M then
  begin
    Result := S;
    Exit;
  end;

  if Cut then
    L := Length
  else
    L := Max(Length, M);

  P := Max(0, L - M);

  SetLength(Result, L);

  if P > 0 then
    FillChar(Pointer(Result)^, P, PadChar);

  if L > P then
  begin
    I := Pointer(Result);
    J := Pointer(S);
    Inc(I, P);
    for F := 1 to L - P do
    begin
      I^ := J^;
      Inc(I);
      Inc(J);
    end;
  end;
end;

// -----------------------------------------------------------------------------

function PadRight(const S: String; const PadChar: Char; const Length: Integer; const Cut: Boolean): String;
var
  F, L, P, M : Integer;
  I, J       : PChar;
begin
  if Length = 0 then
  begin
    if Cut then
      Result := ''
    else
      Result := S;

    Exit;
  end;

  M := System.Length(S);
  if Length = M then
  begin
    Result := S;
    Exit;
  end;

  if Cut then
    L := Length
  else
    L := Max(Length, M);

  P := L - M;
  if P < 0 then
    P := 0;

  SetLength(Result, L);
  if L > P then
  begin
    I := Pointer(Result);
    J := Pointer(S);

    for F := 1 to L - P do
    begin
      I^ := J^;
      Inc(I);
      Inc(J);
    end;
  end;

  if P > 0 then
    FillChar(Result[L - P + 1], P, PadChar);
end;

// -----------------------------------------------------------------------------

function ReplaceChrsToEntities(const Text: String): String;
var
  i: Integer;
begin
  if Text = '' then
    Result := Text
  else
  begin
    Result := '';

    for i := 1 to Length(Text) do
      if not (Text[i] in ['a'..'z', 'A'..'Z', '0'..'9', ' ', #40..#47, #58..#59,
               '\', '=']) then
        Result := Result + '&#' + IntToStr(Ord(Text[i])) + ';'
      else
        Result := Result + Text[i];
  end;
end;

// -----------------------------------------------------------------------------

function StringToBoolean(const S: String; const Default: Boolean = False): Boolean;
begin
  if S = '' then
    Result := Default
  else
    Result := Iff(S = '0', False, True);
end;

// -----------------------------------------------------------------------------

function StringToByte(const S: String; const Default: Byte = 0): Byte;
begin
  Result := Byte(StringToInt(S, Default));
end;

// -----------------------------------------------------------------------------

function StringToShortInt(const S: String; const Default: ShortInt = 0): ShortInt;
begin
  Result := ShortInt(StringToInt(S, Default));
end;

// -----------------------------------------------------------------------------

function StringToSmallInt(const S: String; const Default: SmallInt = 0): SmallInt;
begin
  Result := SmallInt(StringToInt(S, Default));
end;

// -----------------------------------------------------------------------------

function StringToInt(const S: String; const Default: Integer = 0): Integer;
begin
  if S = '' then
    Result := Default
  else
    Result := StrToIntDef(S, Default);
end;

// -----------------------------------------------------------------------------

function StringToRect(S: String): TRect;
var
  x: Byte;
begin
  if S = '' then
    Result := Rect(0, 0, 0, 0)
  else
    try
      x := Pos(',', S);
      Result.Left := StrToInt(Copy(S, 1, x-1));
      Delete(S, 1, x);

      x := Pos(',', S);
      Result.Top := StrToInt(Copy(S, 1, x-1));
      Delete(S, 1, x);

      x := Pos(',', S);
      Result.Right := StrToInt(Copy(S, 1, x-1));
      Delete(S, 1, x);

      Result.Bottom := StrToInt(S);
    except
      Result := Rect(0, 0, 0, 0);
    end;
end;

// -----------------------------------------------------------------------------

end.

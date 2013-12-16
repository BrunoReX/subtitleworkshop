{---------------------------------------------------------------------

  RZNEdit, a component with edit controls for

    real numbers      -> TRealEdit

    integers          -> TIntegerEdit

    and

    positive integers -> TCardinalEdit

  Version 1.7

  This is my version of a numeric input component. It comes with
  three different objects, each handling its special input range
  ( TRealEdit, TIntegerEdit and TCardinalEdit ).
  All input is watched, accepted characters are
    for TRealEdit     : [-,+,0,..,9,E,e,.]
    for TInteger      : [-,+,0,..,9]
    for TCardinalEdit : [0,..,9]
  The clipboard is supported.
  An empty input is interpreted as 0.
  For TRealEdit and TIntegerEdit an input containing only a
  plus-sign or a minus-sign is also regarded as 0.
  The windows setting should use a . as decimal separator
  Ancestor class is the TCommonEdit, which is derived from
  TCustomEdit, new properties are:

    new:
    FormatString : is used in the Format-routine from Delphi,
                   eg '%12.5e'

    MaxValue \
              : determine the input boundaries, if Validate is True
    MinValue /
    Validate  : determines if input is checked against boundaries
    Value     : the result

    ColorNormal  : Color of normal text; on entering the control,
                   the color is reset to ColorNormal
    ColorWarning : Color of text, if value is not within boundaries,
                   the color is set on leaving the control's focus

    OnOverflow, OnUnderflow : Two events, which are triggered
      when the input is out of [MinValue..MaxValue],
      works only if Validate is True


  rk 13.05.99

  Bob Kratz                                 R.Kratz@fz-rossendorf.de

 ---------------------------------------------------------------------}


Unit RZNEdit;


Interface

{---------------------------------------------------------------------}

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Clipbrd;

{---------------------------------------------------------------------}

Type

{---------------------------------------------------------------------}

  TKeyChar = ( NumberChar, BackspaceChar, UnknownChar );

{---------------------------------------------------------------------}

  TCommonEdit = Class( TCustomEdit )
  Private
    FFormatString, FText : String;
    FValidate            : Boolean;
    FAlignment           : TAlignment;
    FColorNormal,
    FColorWarning        : TColor;
    FOnOverflow,
    FOnUnderflow         : TNotifyEvent;

    Function  EmptyOrSign : Boolean;
    Function  IsValidChar( Const Key : Char) : Boolean; Virtual;
    Function  CheckKeyChar( Const Key : Char) : TKeyChar; Virtual;
    Procedure SetAlignment( Const AValue : TAlignment );
    Procedure SetFormatString( Const A : String );
    Procedure SetValue2;  Virtual;
    Procedure SetValidate( Const B :  Boolean );
    Function  SyntaxOk : Boolean; Virtual;

  Protected
    Procedure CMEnter( Var Message : TCMGotFocus ); Message CM_ENTER;
    Procedure CMExit( Var Message : TCMExit );   Message CM_EXIT;
    Procedure CreateParams( Var Params : TCreateParams ); Override;
    Procedure KeyDown( Var Key : Word; Shift : TShiftState ); Override;
    Procedure KeyPress( Var Key : Char ); Override;

  Public
    Constructor Create( AOwner : TComponent ); Override;

  Published
    Property Alignment : TAlignment Read  FAlignment
                                    Write SetAlignment;
    Property AutoSelect;
    Property AutoSize;
    Property Anchors;
    Property BorderStyle;
    Property Color;
    Property ColorNormal  : TColor Read  FColorNormal
                                   Write FColorNormal;
    Property ColorWarning : TColor Read  FColorWarning
                                   Write FColorWarning;
    Property Ctl3D;
    Property Cursor;
    Property DragCursor;
    Property DragMode;
    Property Enabled;
    Property Font;
    Property FormatString : String Read  FFormatString
                                   Write SetFormatString;
    Property Height;
    Property HelpContext;
    Property Hint;
    Property Left;
    Property MaxLength;
    Property Name;
    Property ParentColor;
    Property ParentCtl3D;
    Property ParentFont;
    Property ParentShowHint;
    Property PopupMenu;
    Property ReadOnly;
    Property ShowHint;
    Property TabOrder;
    Property TabStop;
    Property Tag;
    Property Visible;
    Property OnChange;
    Property OnClick;
    Property OnDblClick;
    Property OnDragDrop;
    Property OnDragOver;
    Property OnEndDrag;
    Property OnEnter;
    Property OnExit;
    Property OnKeyDown;
    Property OnKeyPress;
    Property OnKeyUp;
    Property OnMouseDown;
    Property OnMouseMove;
    Property OnMouseUp;
    Property OnOverflow  : TNotifyEvent Read  FOnOverflow
                                        Write FOnOverflow;
    Property OnUnderflow : TNotifyEvent Read  FOnUnderflow
                                        Write FOnUnderflow;
    Property Validate : Boolean  Read FValidate Write SetValidate;
  End;

{---------------------------------------------------------------------}

  TRealEdit = Class( TCommonEdit )
  Private
    FMinValue, FMaxValue : Extended;

    Function  GetValue : Extended;
    Function  CheckKeyChar( Const Key : Char) : TKeyChar; Override;
    Function  CheckValue( Const NewValue : Extended ) : Extended;
    Procedure SetValue2;  Override;
    Procedure SetValue( Const AValue : Extended );
    Function  SyntaxOk : Boolean; Override;

  Public
    Constructor Create( AOwner : TComponent ); Override;

  Published
    Property MaxValue : Extended Read FMaxValue Write FMaxValue;
    Property MinValue : Extended Read FMinValue Write FMinValue;
    Property Value    : Extended Read GetValue  Write SetValue;
  End;

{---------------------------------------------------------------------}

  TIntegerEdit = Class( TCommonEdit )
  Private
    FMinValue, FMaxValue : Integer;

    Function  GetValue : Integer;
    Function  CheckKeyChar( Const Key : Char) : TKeyChar; Override;
    Function  CheckValue( Const NewValue : Integer ) : Integer;
    Procedure SetMaxValue( Const NewValue : Integer );
    Procedure SetMinValue( Const NewValue : Integer );
    Procedure SetValue2;  Override;
    Procedure SetValue( Const AValue : Integer );
    Function  SyntaxOk : Boolean; Override;

  Public
    Constructor Create( AOwner : TComponent ); Override;

  Published
    Property MaxValue : Integer Read FMaxValue Write SetMaxValue;
    Property MinValue : Integer Read FMinValue Write SetMinValue;
    Property Value    : Integer Read GetValue  Write SetValue;
  End;

{---------------------------------------------------------------------}

  TCardinalEdit = Class( TCommonEdit )
  Private
    FMinValue, FMaxValue : Cardinal;

    Function  GetValue : Cardinal;
    Function  CheckKeyChar( Const Key : Char) : TKeyChar; Override;
    Function  CheckValue( Const NewValue : Cardinal ) : Cardinal;
    Procedure SetMaxValue( Const NewValue : Cardinal );
    Procedure SetMinValue( Const NewValue : Cardinal );
    Procedure SetValue2;  Override;
    Procedure SetValue( Const AValue : Cardinal );
    Function  SyntaxOk : Boolean; Override;

  Public
    Constructor Create( AOwner : TComponent ); Override;

  Published
    Property MaxValue : Cardinal Read FMaxValue Write SetMaxValue;
    Property MinValue : Cardinal Read FMinValue Write SetMinValue;
    Property Value    : Cardinal Read GetValue  Write SetValue;
  End;


{---------------------------------------------------------------------}
Procedure Register;
{---------------------------------------------------------------------}


Implementation

{---------------------------------------------------------------------}

Uses WinProcs;



{---------------------------------------------------------------------
  TCommonEdit
 ---------------------------------------------------------------------}


{---------------------------------------------------------------------
  Descendant will override this method to implement the
  right behavior to keyboard input
 ---------------------------------------------------------------------}
{---------------------------------------------------------------------}
Function TCommonEdit.CheckKeyChar(Const Key: Char): TKeyChar;
{---------------------------------------------------------------------}
Begin Result := UnknownChar; End;

{---------------------------------------------------------------------}
Procedure TCommonEdit.CMEnter(Var Message: TCMGotFocus);
{---------------------------------------------------------------------}
Begin
  If AutoSelect And Not(csLButtonDown In ControlState) Then SelectAll;
  Font.Color := FColorNormal;
  Inherited;
End;

{---------------------------------------------------------------------}
Procedure TCommonEdit.CMExit(Var Message: TCMExit);
{---------------------------------------------------------------------}
Begin
  Inherited;
  SetValue2;
End;

{---------------------------------------------------------------------}
Constructor TCommonEdit.Create(AOwner: TComponent);
{---------------------------------------------------------------------}
Begin
  Inherited Create( AOwner );
  FValidate     := False;
  FAlignment    := taLeftJustify;
  FColorNormal  := clBlack;
  FColorWarning := clRed;
End;

{---------------------------------------------------------------------}
Procedure TCommonEdit.CreateParams(Var Params: TCreateParams);
{---------------------------------------------------------------------}
Const Alignments : Array[TAlignment] Of Word =
                  ( ES_LEFT, ES_RIGHT, ES_CENTER );
Begin
  Inherited CreateParams( Params );
  Params.Style := Params.Style Or ES_MULTILINE Or Alignments[Alignment];
End;

{---------------------------------------------------------------------}
Function TCommonEdit.EmptyOrSign: Boolean;
{---------------------------------------------------------------------}
Begin
  Result := (FText='') Or (FText='-') Or (FText='+');
End;

{---------------------------------------------------------------------}
Function TCommonEdit.IsValidChar(Const Key: Char): Boolean;
{---------------------------------------------------------------------}
Begin
  Case CheckKeyChar( Key ) Of
    NumberChar :
      Begin
        Ftext := Copy( Text, 1, SelStart ) + Key +
                 Copy( Text, SelStart+1+SelLength, 255 );
        Result := SyntaxOk;
      End;

    BackspaceChar :
      Begin
        If SelLength = 0 Then
          Ftext := Copy( Text, 1, SelStart-1 ) +
                   Copy( Text, SelStart+1, 255 )
        Else
          Ftext := Copy( Text, 1, SelStart ) +
                   Copy( Text, SelStart+1+SelLength, 255 );
        Result := SyntaxOk;
      End;

  Else
    Result := False;
  End;
End;

{---------------------------------------------------------------------}
Procedure TCommonEdit.KeyDown(Var Key: Word; Shift: TShiftState);
{---------------------------------------------------------------------}
Begin
  If ssCtrl In Shift Then Begin
    Case Key Of
      88 : { Ctrl X }
           If SelLength <> 0 Then Begin
             Ftext := Copy( Text, 1, SelStart ) +
                      Copy( Text, SelStart+1+SelLength, 255 );
             If SyntaxOk Then Begin
               Clipboard.AsText := SelText;
               Key := VK_DELETE;
               KeyDown( Key, [] );
             End
             Else Key := 0;
           End;

      67 : { Ctrl C }
           Clipboard.AsText := SelText;

      86 : { Ctrl V }
           If Clipboard.HasFormat(CF_TEXT) Then Begin
             Ftext := Copy( Text, 1, SelStart ) +
                      Clipboard.AsText +
                      Copy( Text, SelStart+1, 255 );
             If SyntaxOk Then Begin
               SelText := Clipboard.AsText;
               Key := 0;
             End;
           End
           Else
             MessageDlg( 'No text on the Clipboard', mtInformation,
                         [mbOK],0 );

    Else End;
  End
  Else
    If Key = VK_DELETE Then Begin
      If SelLength = 0 Then
        Ftext := Copy( Text, 1, SelStart ) +
                 Copy( Text, SelStart+2, 255 )
      Else
        Ftext := Copy( Text, 1, SelStart ) +
                 Copy( Text, SelStart+1+SelLength, 255 );
      If Not SyntaxOk Then Key := 0;
    End;

  Inherited KeyDown( Key, Shift );

End;

{---------------------------------------------------------------------}
Procedure TCommonEdit.KeyPress(Var Key: Char);
{---------------------------------------------------------------------}
Begin
  If IsValidChar( Key ) Then Inherited KeyPress( Key )
                        Else Key := #0;
End;

{---------------------------------------------------------------------}
Procedure TCommonEdit.SetAlignment(Const AValue: TAlignment);
{---------------------------------------------------------------------}
Begin
  If FAlignment <> AValue Then Begin
    FAlignment := AValue;
    RecreateWnd;
  End;
End;

{---------------------------------------------------------------------}
Procedure TCommonEdit.SetFormatString(Const A: String);
{---------------------------------------------------------------------}
Begin
  FFormatString := A;
  SetValue2;
End;

{---------------------------------------------------------------------}
Procedure TCommonEdit.SetValidate(Const B: Boolean);
{---------------------------------------------------------------------}
Begin
  FValidate := B;
  SetValue2;
End;

{---------------------------------------------------------------------
  Descendant will override this method
 ---------------------------------------------------------------------}
{---------------------------------------------------------------------}
Procedure TCommonEdit.SetValue2;
{---------------------------------------------------------------------}
Begin End;

{---------------------------------------------------------------------
  Descendant will override this method
 ---------------------------------------------------------------------}
{---------------------------------------------------------------------}
Function TCommonEdit.SyntaxOk: Boolean;
{---------------------------------------------------------------------}
Begin Result := True; End;



{---------------------------------------------------------------------
  TRealEdit
 ---------------------------------------------------------------------}

{---------------------------------------------------------------------}
Function TRealEdit.CheckKeyChar(Const Key: Char): TKeyChar;
{---------------------------------------------------------------------}
Begin
  Case Key Of
    '0'..'9', '+', '-', 'E', 'e', '.' : Result := NumberChar;
    #8                                : Result := BackspaceChar;
  Else
                                        Result := UnknownChar;
  End;
End;

{---------------------------------------------------------------------}
Function TRealEdit.CheckValue(Const NewValue: Extended): Extended;
{---------------------------------------------------------------------}
Begin
  Result := NewValue;
  Font.Color := FColorNormal;
  If FValidate Then Begin
    If NewValue < FMinValue Then Begin
      Result := FMinValue;
      Font.Color := FColorWarning;
      If Assigned( OnUnderflow ) Then OnUnderflow( self );
    End
    Else
      If NewValue > FMaxValue Then Begin
        Result := FMaxValue;
        Font.Color := FColorWarning;
        If Assigned( OnOverflow ) Then OnOverflow( self );
      End;
  End;
End;

{---------------------------------------------------------------------}
Constructor TRealEdit.Create(AOwner: TComponent);
{---------------------------------------------------------------------}
Begin
  Inherited Create( AOwner );
  CharCase      := ecUpperCase;
  FFormatString := '%g';
  FMinValue     := 0;
  FMaxValue     := 0;
  SetValue2;
End;

{---------------------------------------------------------------------}
Function TRealEdit.GetValue: Extended;
{---------------------------------------------------------------------}
Begin
  Try
    If Length( Text ) <> 0 Then Result := StrToFloat( Text )
                           Else Result := 0;
  Except
    Result := FMinValue;
  End;
End;

{---------------------------------------------------------------------
  Method for the property Value
 ---------------------------------------------------------------------}
{---------------------------------------------------------------------}
Procedure TRealEdit.SetValue(Const AValue: Extended);
{---------------------------------------------------------------------}
Begin
  Text := Format( FFormatString, [CheckValue( AValue )] );
End;

{---------------------------------------------------------------------
  Overridden method, serves also to set the edit's text
 ---------------------------------------------------------------------}
{---------------------------------------------------------------------}
Procedure TRealEdit.SetValue2;
{---------------------------------------------------------------------}
Begin
  Text := Format( FFormatString, [CheckValue( Value )] );
End;

{---------------------------------------------------------------------}
Function TRealEdit.SyntaxOk: Boolean;
{---------------------------------------------------------------------}
Begin
  Try
    {-----------------------------------------------------------
      Syntax correct if transformation causes no exception.
      If the input is empty or a sign ( FText = '', '+', '-' ),
      it is interpreted as 0. During development within the IDE
      you may run into an extra exception.
     -----------------------------------------------------------}

    If Not EmptyOrSign Then StrToFloat( FText );
    Result := True;

  Except
    Result := False;
  End;
End;



{---------------------------------------------------------------------
  TIntegerEdit
 ---------------------------------------------------------------------}

{---------------------------------------------------------------------}
{---------------------------------------------------------------------}
Function TIntegerEdit.CheckKeyChar(Const Key: Char): TKeyChar;
{---------------------------------------------------------------------}
Begin
  Case Key Of
    '0'..'9', '+', '-' : Result := NumberChar;
    #8                 : Result := BackspaceChar;
  Else
                         Result := UnknownChar;
  End;
End;

{---------------------------------------------------------------------}
Function TIntegerEdit.CheckValue(Const NewValue: Integer): Integer;
{---------------------------------------------------------------------}
Begin
  Result := NewValue;
  Font.Color := FColorNormal;
  If FValidate Then Begin
    If NewValue < FMinValue Then Begin
      Result:= FMinValue;
      Font.Color := FColorWarning;
      If Assigned( OnUnderflow ) Then OnUnderflow( self );
    End
    Else
      If NewValue > FMaxValue Then Begin
        Result:= FMaxValue;
        Font.Color := FColorWarning;
        If Assigned( OnOverflow ) Then OnOverflow( self );
      End;
  End;
End;

{---------------------------------------------------------------------}
Constructor TIntegerEdit.Create(AOwner: TComponent);
{---------------------------------------------------------------------}
Begin
  Inherited Create( AOwner );
  FMinValue     := 0;
  FMaxValue     := 0;
  FFormatString := '%d';
  SetValue2;
End;

{---------------------------------------------------------------------}
Function TIntegerEdit.GetValue: Integer;
{---------------------------------------------------------------------}
Begin
  Try
    If Length( Text ) <> 0 Then Result := StrToInt( Text )
                           Else Result := 0;
  Except
    Result := FMinValue;
  End;
End;

{---------------------------------------------------------------------}
Procedure TIntegerEdit.SetMaxValue(Const NewValue: Integer);
{---------------------------------------------------------------------}
Begin FMaxValue := NewValue; End;

{---------------------------------------------------------------------}
Procedure TIntegerEdit.SetMinValue(Const NewValue: Integer);
{---------------------------------------------------------------------}
Begin FMinValue := NewValue; End;

{---------------------------------------------------------------------}
Procedure TIntegerEdit.SetValue(Const AValue: Integer);
{---------------------------------------------------------------------}
Begin
  Text := Format( FFormatString, [CheckValue( AValue )] );
End;

{---------------------------------------------------------------------}
Procedure TIntegerEdit.SetValue2;
{---------------------------------------------------------------------}
Begin
  Text := Format( FFormatString, [CheckValue( Value )] );
End;

{---------------------------------------------------------------------}
Function TIntegerEdit.SyntaxOk: Boolean;
{---------------------------------------------------------------------}
Begin
  Try
    {-----------------------------------------------------------
      Syntax correct if transformation causes no exception.
      If the input is empty or a sign ( FText = '', '+', '-' ),
      it is interpreted as 0. During development within the IDE
      you may run into an extra exception.
     -----------------------------------------------------------}

    If Not EmptyOrSign Then StrToInt( FText );
    Result := True;

  Except
    Result := False;
  End;
End;



{---------------------------------------------------------------------
  TCardinalEdit
 ---------------------------------------------------------------------}

{---------------------------------------------------------------------}
Function TCardinalEdit.CheckKeyChar(Const Key: Char): TKeyChar;
{---------------------------------------------------------------------}
Begin
  Case Key Of
    '0'..'9' : Result := NumberChar;
    #8       : Result := BackspaceChar;
  Else
               Result := UnknownChar;
  End;
End;

{---------------------------------------------------------------------}
Function TCardinalEdit.CheckValue(Const NewValue: Cardinal): Cardinal;
{---------------------------------------------------------------------}
Begin
  Result := NewValue;
  Font.Color := FColorNormal;
  If FValidate Then Begin
    If NewValue < FMinValue Then Begin
      Result := FMinValue;
      Font.Color := FColorWarning;
      If Assigned( OnUnderflow ) Then OnUnderflow( self );
    End
    Else
      If NewValue > FMaxValue Then Begin
        Result := FMaxValue;
        Font.Color := FColorWarning;
        If Assigned( OnOverflow ) Then OnOverflow( self );
      End;
  End;
End;

{---------------------------------------------------------------------}
Constructor TCardinalEdit.Create(AOwner: TComponent);
{---------------------------------------------------------------------}
Begin
  Inherited Create( AOwner );
  FMinValue     := 0;
  FMaxValue     := 0;
  FFormatString := '%u';
  SetValue2;
End;

{---------------------------------------------------------------------}
Function TCardinalEdit.GetValue: Cardinal;
{---------------------------------------------------------------------}
Begin
  Try
    If Length( Text ) <> 0 Then Result := StrToInt64( Text )
                           Else Result := 0;
  Except
    Result := FMinValue;
  End;
End;

{---------------------------------------------------------------------}
Procedure TCardinalEdit.SetMaxValue(Const NewValue: Cardinal);
{---------------------------------------------------------------------}
Begin FMaxValue := NewValue; End;

{---------------------------------------------------------------------}
Procedure TCardinalEdit.SetMinValue(Const NewValue: Cardinal);
{---------------------------------------------------------------------}
Begin FMinValue := NewValue; End;

{---------------------------------------------------------------------}
Procedure TCardinalEdit.SetValue(Const AValue: Cardinal);
{---------------------------------------------------------------------}
Begin
  Text := Format( FFormatString, [CheckValue( AValue )] );
End;

{---------------------------------------------------------------------}
Procedure TCardinalEdit.SetValue2;
{---------------------------------------------------------------------}
Begin
  Text := Format( FFormatString, [CheckValue( Value )] );
End;

{---------------------------------------------------------------------}
Function TCardinalEdit.SyntaxOk: Boolean;
{---------------------------------------------------------------------}
Begin
  Try
    {-----------------------------------------------------------
      Syntax correct if transformation causes no exception.
      If the input is empty or a sign ( FText = '', '+', '-' ),
      it is interpreted as 0. During development within the IDE
      you may run into an extra exception.
      Extra care must be taken because of the type Cardinal.
     -----------------------------------------------------------}

    If Not EmptyOrSign
      Then Result := StrToInt64( FText ) <= 4294967295
      Else Result := True;

  Except
    Result := False;
  End;
End;


{---------------------------------------------------------------------}
Procedure Register;
{---------------------------------------------------------------------}
Begin
  RegisterComponents('RZNEdit', [TRealEdit]);
  RegisterComponents('RZNEdit', [TIntegerEdit]);
  RegisterComponents('RZNEdit', [TCardinalEdit]);
End;


End.


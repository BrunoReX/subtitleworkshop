{
@abstract(Compiletime STDCtrls support)
@author(Carlo Kok <ck@carlo-kok.com>)
}
unit ifpii_stdctrls;

{$I ifps3_def.inc}
interface
uses
  ifpscomp, ifps3utl;
{
   Will register files from:
     stdctrls

Requires:
  STD, classes, controls and graphics
}

procedure SIRegister_StdCtrls_TypesAndConsts(cl: TIFPSPascalCompiler);



procedure SIRegisterTCUSTOMGROUPBOX(Cl: TIFPSPascalCompiler);
procedure SIRegisterTGROUPBOX(Cl: TIFPSPascalCompiler);
procedure SIRegisterTCUSTOMLABEL(Cl: TIFPSPascalCompiler);
procedure SIRegisterTLABEL(Cl: TIFPSPascalCompiler);
procedure SIRegisterTCUSTOMEDIT(Cl: TIFPSPascalCompiler);
procedure SIRegisterTEDIT(Cl: TIFPSPascalCompiler);
procedure SIRegisterTCUSTOMMEMO(Cl: TIFPSPascalCompiler);
procedure SIRegisterTMEMO(Cl: TIFPSPascalCompiler);
procedure SIRegisterTCUSTOMCOMBOBOX(Cl: TIFPSPascalCompiler);
procedure SIRegisterTCOMBOBOX(Cl: TIFPSPascalCompiler);
procedure SIRegisterTBUTTONCONTROL(Cl: TIFPSPascalCompiler);
procedure SIRegisterTBUTTON(Cl: TIFPSPascalCompiler);
procedure SIRegisterTCUSTOMCHECKBOX(Cl: TIFPSPascalCompiler);
procedure SIRegisterTCHECKBOX(Cl: TIFPSPascalCompiler);
procedure SIRegisterTRADIOBUTTON(Cl: TIFPSPascalCompiler);
procedure SIRegisterTCUSTOMLISTBOX(Cl: TIFPSPascalCompiler);
procedure SIRegisterTLISTBOX(Cl: TIFPSPascalCompiler);
procedure SIRegisterTSCROLLBAR(Cl: TIFPSPascalCompiler);

procedure SIRegister_StdCtrls(cl: TIFPSPascalCompiler);


implementation

procedure SIRegisterTCUSTOMGROUPBOX(Cl: TIFPSPascalCompiler);
begin
  Cl.AddClassN(cl.FindClass('TCUSTOMCONTROL'), 'TCUSTOMGROUPBOX');
end;


procedure SIRegisterTGROUPBOX(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCUSTOMGROUPBOX'), 'TGROUPBOX') do
  begin
    RegisterProperty('CAPTION', 'String', iptrw);
    RegisterProperty('COLOR', 'Longint', iptrw);
    RegisterProperty('FONT', 'TFont', iptrw);
    RegisterProperty('ONCLICK', 'TNotifyEvent', iptrw);
    RegisterProperty('ONDBLCLICK', 'TNotifyEvent', iptrw);

    {$IFNDEF IFPS3_MINIVCL}
    RegisterProperty('CTL3D', 'Boolean', iptrw);
    RegisterProperty('DRAGCURSOR', 'Longint', iptrw);
    RegisterProperty('DRAGMODE', 'TDragMode', iptrw);
    RegisterProperty('PARENTCOLOR', 'Boolean', iptrw);
    RegisterProperty('PARENTCTL3D', 'Boolean', iptrw);
    RegisterProperty('PARENTFONT', 'Boolean', iptrw);
    RegisterProperty('PARENTSHOWHINT', 'Boolean', iptrw);
    RegisterProperty('POPUPMENU', 'TPopupMenu', iptrw);
    RegisterProperty('ONDRAGDROP', 'TDragDropEvent', iptrw);
    RegisterProperty('ONDRAGOVER', 'TDragOverEvent', iptrw);
    RegisterProperty('ONENDDRAG', 'TEndDragEvent', iptrw);
    RegisterProperty('ONENTER', 'TNotifyEvent', iptrw);
    RegisterProperty('ONEXIT', 'TNotifyEvent', iptrw);
    RegisterProperty('ONMOUSEDOWN', 'TMouseEvent', iptrw);
    RegisterProperty('ONMOUSEMOVE', 'TMouseMoveEvent', iptrw);
    RegisterProperty('ONMOUSEUP', 'TMouseEvent', iptrw);
    RegisterProperty('ONSTARTDRAG', 'TStartDragEvent', iptrw);
    {$ENDIF}
  end;
end;





procedure SIRegisterTCUSTOMLABEL(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TGRAPHICCONTROL'), 'TCUSTOMLABEL') do
  begin
    {$IFNDEF IFPS3_MINIVCL}
{$IFNDEF CLX}
    RegisterProperty('CANVAS', 'TCANVAS', iptr);
{$ENDIF}
    {$ENDIF}
  end;
end;


procedure SIRegisterTLABEL(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCUSTOMLABEL'), 'TLABEL') do
  begin
    RegisterProperty('ALIGNMENT', 'TAlignment', iptrw);
    RegisterProperty('AUTOSIZE', 'Boolean', iptrw);
    RegisterProperty('CAPTION', 'String', iptrw);
    RegisterProperty('COLOR', 'Longint', iptrw);
    RegisterProperty('FOCUSCONTROL', 'TWinControl', iptrw);
    RegisterProperty('FONT', 'TFont', iptrw);
    RegisterProperty('WORDWRAP', 'Boolean', iptrw);
    RegisterProperty('ONCLICK', 'TNotifyEvent', iptrw);
    RegisterProperty('ONDBLCLICK', 'TNotifyEvent', iptrw);

    {$IFNDEF IFPS3_MINIVCL}
    RegisterProperty('LAYOUT', 'TTextLayout', iptrw);
    RegisterProperty('DRAGCURSOR', 'Longint', iptrw);
    RegisterProperty('DRAGMODE', 'TDragMode', iptrw);
    RegisterProperty('PARENTCOLOR', 'Boolean', iptrw);
    RegisterProperty('PARENTFONT', 'Boolean', iptrw);
    RegisterProperty('PARENTSHOWHINT', 'Boolean', iptrw);
    RegisterProperty('SHOWACCELCHAR', 'Boolean', iptrw);
    RegisterProperty('TRANSPARENT', 'Boolean', iptrw);
    RegisterProperty('ONDRAGDROP', 'TDragDropEvent', iptrw);
    RegisterProperty('ONDRAGOVER', 'TDragOverEvent', iptrw);
    RegisterProperty('ONENDDRAG', 'TEndDragEvent', iptrw);
    RegisterProperty('ONMOUSEDOWN', 'TMouseEvent', iptrw);
    RegisterProperty('ONMOUSEMOVE', 'TMouseMoveEvent', iptrw);
    RegisterProperty('ONMOUSEUP', 'TMouseEvent', iptrw);
    RegisterProperty('ONSTARTDRAG', 'TStartDragEvent', iptrw);
    {$ENDIF}
  end;
end;







procedure SIRegisterTCUSTOMEDIT(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TWINCONTROL'), 'TCUSTOMEDIT') do
  begin
    RegisterMethod('procedure CLEAR');
    RegisterMethod('procedure CLEARSELECTION');
    RegisterMethod('procedure SELECTALL');
    RegisterProperty('MODIFIED', 'BOOLEAN', iptrw);
    RegisterProperty('SELLENGTH', 'INTEGER', iptrw);
    RegisterProperty('SELSTART', 'INTEGER', iptrw);
    RegisterProperty('SELTEXT', 'STRING', iptrw);
    RegisterProperty('TEXT', 'string', iptrw);

    {$IFNDEF IFPS3_MINIVCL}
    RegisterMethod('procedure COPYTOCLIPBOARD');
    RegisterMethod('procedure CUTTOCLIPBOARD');
    RegisterMethod('procedure PASTEFROMCLIPBOARD');
    RegisterMethod('function GETSELTEXTBUF(BUFFER:PCHAR;BUFSIZE:INTEGER):INTEGER');
    RegisterMethod('procedure SETSELTEXTBUF(BUFFER:PCHAR)');
    {$ENDIF}
  end;
end;




procedure SIRegisterTEDIT(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCUSTOMEDIT'), 'TEDIT') do
  begin
    RegisterProperty('AUTOSELECT', 'Boolean', iptrw);
    RegisterProperty('AUTOSIZE', 'Boolean', iptrw);
    RegisterProperty('BORDERSTYLE', 'TBorderStyle', iptrw);
    RegisterProperty('COLOR', 'Longint', iptrw);
    RegisterProperty('FONT', 'TFont', iptrw);
    RegisterProperty('HIDESELECTION', 'Boolean', iptrw);
    RegisterProperty('MAXLENGTH', 'Integer', iptrw);
    RegisterProperty('PASSWORDCHAR', 'Char', iptrw);
    RegisterProperty('READONLY', 'Boolean', iptrw);
    RegisterProperty('TEXT', 'string', iptrw);
    RegisterProperty('ONCHANGE', 'TNotifyEvent', iptrw);
    RegisterProperty('ONCLICK', 'TNotifyEvent', iptrw);
    RegisterProperty('ONDBLCLICK', 'TNotifyEvent', iptrw);
    RegisterProperty('ONKEYDOWN', 'TKeyEvent', iptrw);
    RegisterProperty('ONKEYPRESS', 'TKeyPressEvent', iptrw);
    RegisterProperty('ONKEYUP', 'TKeyEvent', iptrw);

    {$IFNDEF IFPS3_MINIVCL}
    RegisterProperty('CHARCASE', 'TEditCharCase', iptrw);
    RegisterProperty('CTL3D', 'Boolean', iptrw);
    RegisterProperty('DRAGCURSOR', 'Longint', iptrw);
    RegisterProperty('DRAGMODE', 'TDragMode', iptrw);
    RegisterProperty('OEMCONVERT', 'Boolean', iptrw);
    RegisterProperty('PARENTCOLOR', 'Boolean', iptrw);
    RegisterProperty('PARENTCTL3D', 'Boolean', iptrw);
    RegisterProperty('PARENTFONT', 'Boolean', iptrw);
    RegisterProperty('PARENTSHOWHINT', 'Boolean', iptrw);
    RegisterProperty('POPUPMENU', 'TPopupMenu', iptrw);
    RegisterProperty('ONDRAGDROP', 'TDragDropEvent', iptrw);
    RegisterProperty('ONDRAGOVER', 'TDragOverEvent', iptrw);
    RegisterProperty('ONENDDRAG', 'TEndDragEvent', iptrw);
    RegisterProperty('ONENTER', 'TNotifyEvent', iptrw);
    RegisterProperty('ONEXIT', 'TNotifyEvent', iptrw);
    RegisterProperty('ONMOUSEDOWN', 'TMouseEvent', iptrw);
    RegisterProperty('ONMOUSEMOVE', 'TMouseMoveEvent', iptrw);
    RegisterProperty('ONMOUSEUP', 'TMouseEvent', iptrw);
    RegisterProperty('ONSTARTDRAG', 'TStartDragEvent', iptrw);
    {$ENDIF}
  end;
end;




procedure SIRegisterTCUSTOMMEMO(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCUSTOMEDIT'), 'TCUSTOMMEMO') do
  begin
    {$IFNDEF CLX}
    RegisterProperty('LINES', 'TSTRINGS', iptrw);
    {$ENDIF}
  end;
end;


procedure SIRegisterTMEMO(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCUSTOMMEMO'), 'TMEMO') do
  begin
    {$IFDEF CLX}
    RegisterProperty('LINES', 'TSTRINGS', iptrw);
    {$ENDIF}
    RegisterProperty('ALIGNMENT', 'TAlignment', iptrw);
    RegisterProperty('BORDERSTYLE', 'TBorderStyle', iptrw);
    RegisterProperty('COLOR', 'Longint', iptrw);
    RegisterProperty('FONT', 'TFont', iptrw);
    RegisterProperty('HIDESELECTION', 'Boolean', iptrw);
    RegisterProperty('MAXLENGTH', 'Integer', iptrw);
    RegisterProperty('READONLY', 'Boolean', iptrw);
    RegisterProperty('SCROLLBARS', 'TScrollStyle', iptrw);
    RegisterProperty('WANTRETURNS', 'Boolean', iptrw);
    RegisterProperty('WANTTABS', 'Boolean', iptrw);
    RegisterProperty('WORDWRAP', 'Boolean', iptrw);
    RegisterProperty('ONCHANGE', 'TNotifyEvent', iptrw);
    RegisterProperty('ONCLICK', 'TNotifyEvent', iptrw);
    RegisterProperty('ONDBLCLICK', 'TNotifyEvent', iptrw);
    RegisterProperty('ONKEYDOWN', 'TKeyEvent', iptrw);
    RegisterProperty('ONKEYPRESS', 'TKeyPressEvent', iptrw);
    RegisterProperty('ONKEYUP', 'TKeyEvent', iptrw);

    {$IFNDEF IFPS3_MINIVCL}
    RegisterProperty('CTL3D', 'Boolean', iptrw);
    RegisterProperty('DRAGCURSOR', 'Longint', iptrw);
    RegisterProperty('DRAGMODE', 'TDragMode', iptrw);
    RegisterProperty('OEMCONVERT', 'Boolean', iptrw);
    RegisterProperty('PARENTCOLOR', 'Boolean', iptrw);
    RegisterProperty('PARENTCTL3D', 'Boolean', iptrw);
    RegisterProperty('PARENTFONT', 'Boolean', iptrw);
    RegisterProperty('PARENTSHOWHINT', 'Boolean', iptrw);
    RegisterProperty('POPUPMENU', 'TPopupMenu', iptrw);
    RegisterProperty('ONDRAGDROP', 'TDragDropEvent', iptrw);
    RegisterProperty('ONDRAGOVER', 'TDragOverEvent', iptrw);
    RegisterProperty('ONENDDRAG', 'TEndDragEvent', iptrw);
    RegisterProperty('ONENTER', 'TNotifyEvent', iptrw);
    RegisterProperty('ONEXIT', 'TNotifyEvent', iptrw);
    RegisterProperty('ONMOUSEDOWN', 'TMouseEvent', iptrw);
    RegisterProperty('ONMOUSEMOVE', 'TMouseMoveEvent', iptrw);
    RegisterProperty('ONMOUSEUP', 'TMouseEvent', iptrw);
    RegisterProperty('ONSTARTDRAG', 'TStartDragEvent', iptrw);
    {$ENDIF}
  end;
end;





procedure SIRegisterTCUSTOMCOMBOBOX(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TWINCONTROL'), 'TCUSTOMCOMBOBOX') do
  begin
    RegisterProperty('DROPPEDDOWN', 'BOOLEAN', iptrw);
    RegisterProperty('ITEMS', 'TSTRINGS', iptrw);
    RegisterProperty('ITEMINDEX', 'INTEGER', iptrw);

    {$IFNDEF IFPS3_MINIVCL}
    RegisterMethod('procedure CLEAR');
    RegisterMethod('procedure SELECTALL');
    RegisterProperty('CANVAS', 'TCANVAS', iptr);
    RegisterProperty('SELLENGTH', 'INTEGER', iptrw);
    RegisterProperty('SELSTART', 'INTEGER', iptrw);
    RegisterProperty('SELTEXT', 'STRING', iptrw);
    {$ENDIF}
  end;
end;


procedure SIRegisterTCOMBOBOX(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCUSTOMCOMBOBOX'), 'TCOMBOBOX') do
  begin
    RegisterProperty('STYLE', 'TComboBoxStyle', iptrw);
    RegisterProperty('COLOR', 'Longint', iptrw);
    RegisterProperty('DROPDOWNCOUNT', 'Integer', iptrw);
    RegisterProperty('FONT', 'TFont', iptrw);
    RegisterProperty('MAXLENGTH', 'Integer', iptrw);
    RegisterProperty('SORTED', 'Boolean', iptrw);
    RegisterProperty('TEXT', 'string', iptrw);
    RegisterProperty('ONCHANGE', 'TNotifyEvent', iptrw);
    RegisterProperty('ONCLICK', 'TNotifyEvent', iptrw);
    RegisterProperty('ONDBLCLICK', 'TNotifyEvent', iptrw);
    RegisterProperty('ONKEYDOWN', 'TKeyEvent', iptrw);
    RegisterProperty('ONKEYPRESS', 'TKeyPressEvent', iptrw);
    RegisterProperty('ONKEYUP', 'TKeyEvent', iptrw);

    {$IFNDEF IFPS3_MINIVCL}
    RegisterProperty('CTL3D', 'Boolean', iptrw);
    RegisterProperty('DRAGMODE', 'TDragMode', iptrw);
    RegisterProperty('DRAGCURSOR', 'Longint', iptrw);
    RegisterProperty('ITEMHEIGHT', 'Integer', iptrw);
    RegisterProperty('PARENTCOLOR', 'Boolean', iptrw);
    RegisterProperty('PARENTCTL3D', 'Boolean', iptrw);
    RegisterProperty('PARENTFONT', 'Boolean', iptrw);
    RegisterProperty('PARENTSHOWHINT', 'Boolean', iptrw);
    RegisterProperty('POPUPMENU', 'TPopupMenu', iptrw);
    RegisterProperty('ONDRAGDROP', 'TDragDropEvent', iptrw);
    RegisterProperty('ONDRAGOVER', 'TDragOverEvent', iptrw);
    RegisterProperty('ONDRAWITEM', 'TDrawItemEvent', iptrw);
    RegisterProperty('ONDROPDOWN', 'TNotifyEvent', iptrw);
    RegisterProperty('ONENDDRAG', 'TEndDragEvent', iptrw);
    RegisterProperty('ONENTER', 'TNotifyEvent', iptrw);
    RegisterProperty('ONEXIT', 'TNotifyEvent', iptrw);
    RegisterProperty('ONMEASUREITEM', 'TMeasureItemEvent', iptrw);
    RegisterProperty('ONSTARTDRAG', 'TStartDragEvent', iptrw);
    {$ENDIF}
  end;
end;



procedure SIRegisterTBUTTONCONTROL(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TWINCONTROL'), 'TBUTTONCONTROL') do
  begin
  end;
end;



procedure SIRegisterTBUTTON(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TBUTTONCONTROL'),  'TBUTTON') do
  begin
    RegisterProperty('CANCEL', 'BOOLEAN', iptrw);
    RegisterProperty('CAPTION', 'String', iptrw);
    RegisterProperty('DEFAULT', 'BOOLEAN', iptrw);
    RegisterProperty('FONT', 'TFont', iptrw);
    RegisterProperty('MODALRESULT', 'LONGINT', iptrw);
    RegisterProperty('ONCLICK', 'TNotifyEvent', iptrw);

    {$IFNDEF IFPS3_MINIVCL}
    RegisterProperty('DRAGCURSOR', 'Longint', iptrw);
    RegisterProperty('DRAGMODE', 'TDragMode', iptrw);
    RegisterProperty('PARENTFONT', 'Boolean', iptrw);
    RegisterProperty('PARENTSHOWHINT', 'Boolean', iptrw);
    RegisterProperty('POPUPMENU', 'TPopupMenu', iptrw);
    RegisterProperty('ONDRAGDROP', 'TDragDropEvent', iptrw);
    RegisterProperty('ONDRAGOVER', 'TDragOverEvent', iptrw);
    RegisterProperty('ONENDDRAG', 'TEndDragEvent', iptrw);
    RegisterProperty('ONENTER', 'TNotifyEvent', iptrw);
    RegisterProperty('ONEXIT', 'TNotifyEvent', iptrw);
    RegisterProperty('ONKEYDOWN', 'TKeyEvent', iptrw);
    RegisterProperty('ONKEYPRESS', 'TKeyPressEvent', iptrw);
    RegisterProperty('ONKEYUP', 'TKeyEvent', iptrw);
    RegisterProperty('ONMOUSEDOWN', 'TMouseEvent', iptrw);
    RegisterProperty('ONMOUSEMOVE', 'TMouseMoveEvent', iptrw);
    RegisterProperty('ONMOUSEUP', 'TMouseEvent', iptrw);
    RegisterProperty('ONSTARTDRAG', 'TStartDragEvent', iptrw);
    {$ENDIF}
  end;
end;



procedure SIRegisterTCUSTOMCHECKBOX(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TBUTTONCONTROL'), 'TCUSTOMCHECKBOX') do
  begin
  end;
end;



procedure SIRegisterTCHECKBOX(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCUSTOMCHECKBOX'), 'TCHECKBOX') do
  begin
    RegisterProperty('ALIGNMENT', 'TAlignment', iptrw);
    RegisterProperty('ALLOWGRAYED', 'Boolean', iptrw);
    RegisterProperty('CAPTION', 'String', iptrw);
    RegisterProperty('CHECKED', 'Boolean', iptrw);
    RegisterProperty('COLOR', 'Longint', iptrw);
    RegisterProperty('FONT', 'TFont', iptrw);
    RegisterProperty('STATE', 'TCheckBoxState', iptrw);
    RegisterProperty('ONCLICK', 'TNotifyEvent', iptrw);

    {$IFNDEF IFPS3_MINIVCL}
    RegisterProperty('CTL3D', 'Boolean', iptrw);
    RegisterProperty('DRAGCURSOR', 'Longint', iptrw);
    RegisterProperty('DRAGMODE', 'TDragMode', iptrw);
    RegisterProperty('PARENTCOLOR', 'Boolean', iptrw);
    RegisterProperty('PARENTCTL3D', 'Boolean', iptrw);
    RegisterProperty('PARENTFONT', 'Boolean', iptrw);
    RegisterProperty('PARENTSHOWHINT', 'Boolean', iptrw);
    RegisterProperty('POPUPMENU', 'TPopupMenu', iptrw);
    RegisterProperty('ONDRAGDROP', 'TDragDropEvent', iptrw);
    RegisterProperty('ONDRAGOVER', 'TDragOverEvent', iptrw);
    RegisterProperty('ONENDDRAG', 'TEndDragEvent', iptrw);
    RegisterProperty('ONENTER', 'TNotifyEvent', iptrw);
    RegisterProperty('ONEXIT', 'TNotifyEvent', iptrw);
    RegisterProperty('ONKEYDOWN', 'TKeyEvent', iptrw);
    RegisterProperty('ONKEYPRESS', 'TKeyPressEvent', iptrw);
    RegisterProperty('ONKEYUP', 'TKeyEvent', iptrw);
    RegisterProperty('ONMOUSEDOWN', 'TMouseEvent', iptrw);
    RegisterProperty('ONMOUSEMOVE', 'TMouseMoveEvent', iptrw);
    RegisterProperty('ONMOUSEUP', 'TMouseEvent', iptrw);
    RegisterProperty('ONSTARTDRAG', 'TStartDragEvent', iptrw);
    {$ENDIF}
  end;
end;





procedure SIRegisterTRADIOBUTTON(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TBUTTONCONTROL'), 'TRADIOBUTTON') do
  begin
    RegisterProperty('ALIGNMENT', 'TALIGNMENT', iptrw);
    RegisterProperty('CAPTION', 'String', iptrw);
    RegisterProperty('CHECKED', 'BOOLEAN', iptrw);
    RegisterProperty('COLOR', 'Longint', iptrw);
    RegisterProperty('FONT', 'TFont', iptrw);
    RegisterProperty('ONCLICK', 'TNotifyEvent', iptrw);
    RegisterProperty('ONDBLCLICK', 'TNotifyEvent', iptrw);

    {$IFNDEF IFPS3_MINIVCL}
    RegisterProperty('CTL3D', 'Boolean', iptrw);
    RegisterProperty('DRAGCURSOR', 'Longint', iptrw);
    RegisterProperty('DRAGMODE', 'TDragMode', iptrw);
    RegisterProperty('PARENTCOLOR', 'Boolean', iptrw);
    RegisterProperty('PARENTCTL3D', 'Boolean', iptrw);
    RegisterProperty('PARENTFONT', 'Boolean', iptrw);
    RegisterProperty('PARENTSHOWHINT', 'Boolean', iptrw);
    RegisterProperty('POPUPMENU', 'TPopupMenu', iptrw);
    RegisterProperty('ONDRAGDROP', 'TDragDropEvent', iptrw);
    RegisterProperty('ONDRAGOVER', 'TDragOverEvent', iptrw);
    RegisterProperty('ONENDDRAG', 'TEndDragEvent', iptrw);
    RegisterProperty('ONENTER', 'TNotifyEvent', iptrw);
    RegisterProperty('ONEXIT', 'TNotifyEvent', iptrw);
    RegisterProperty('ONKEYDOWN', 'TKeyEvent', iptrw);
    RegisterProperty('ONKEYPRESS', 'TKeyPressEvent', iptrw);
    RegisterProperty('ONKEYUP', 'TKeyEvent', iptrw);
    RegisterProperty('ONMOUSEDOWN', 'TMouseEvent', iptrw);
    RegisterProperty('ONMOUSEMOVE', 'TMouseMoveEvent', iptrw);
    RegisterProperty('ONMOUSEUP', 'TMouseEvent', iptrw);
    RegisterProperty('ONSTARTDRAG', 'TStartDragEvent', iptrw);
    {$ENDIF}
  end;
end;



procedure SIRegisterTCUSTOMLISTBOX(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TWINCONTROL'), 'TCUSTOMLISTBOX') do
  begin
    RegisterProperty('ITEMS', 'TSTRINGS', iptrw);
    RegisterProperty('ITEMINDEX', 'INTEGER', iptrw);
    RegisterProperty('SELCOUNT', 'INTEGER', iptr);
    RegisterProperty('SELECTED', 'BOOLEAN INTEGER', iptrw);

    {$IFNDEF IFPS3_MINIVCL}
    RegisterMethod('procedure CLEAR');
    RegisterMethod('function ITEMATPOS(POS:TPOINT;EXISTING:BOOLEAN):INTEGER');
    RegisterMethod('function ITEMRECT(INDEX:INTEGER):TRECT');
    RegisterProperty('CANVAS', 'TCANVAS', iptr);
    RegisterProperty('TOPINDEX', 'INTEGER', iptrw);
    {$ENDIF}
  end;
end;



procedure SIRegisterTLISTBOX(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCUSTOMLISTBOX'), 'TLISTBOX') do
  begin
    RegisterProperty('BORDERSTYLE', 'TBorderStyle', iptrw);
    RegisterProperty('COLOR', 'Longint', iptrw);
    RegisterProperty('FONT', 'TFont', iptrw);
    RegisterProperty('MULTISELECT', 'Boolean', iptrw);
    RegisterProperty('SORTED', 'Boolean', iptrw);
    RegisterProperty('STYLE', 'TListBoxStyle', iptrw);
    RegisterProperty('ONCLICK', 'TNotifyEvent', iptrw);
    RegisterProperty('ONDBLCLICK', 'TNotifyEvent', iptrw);
    RegisterProperty('ONKEYDOWN', 'TKeyEvent', iptrw);
    RegisterProperty('ONKEYPRESS', 'TKeyPressEvent', iptrw);
    RegisterProperty('ONKEYUP', 'TKeyEvent', iptrw);

    {$IFNDEF IFPS3_MINIVCL}
    RegisterProperty('COLUMNS', 'Integer', iptrw);
    RegisterProperty('CTL3D', 'Boolean', iptrw);
    RegisterProperty('DRAGCURSOR', 'Longint', iptrw);
    RegisterProperty('DRAGMODE', 'TDragMode', iptrw);
    RegisterProperty('EXTENDEDSELECT', 'Boolean', iptrw);
    RegisterProperty('INTEGRALHEIGHT', 'Boolean', iptrw);
    RegisterProperty('ITEMHEIGHT', 'Integer', iptrw);
    RegisterProperty('PARENTCOLOR', 'Boolean', iptrw);
    RegisterProperty('PARENTCTL3D', 'Boolean', iptrw);
    RegisterProperty('PARENTFONT', 'Boolean', iptrw);
    RegisterProperty('PARENTSHOWHINT', 'Boolean', iptrw);
    RegisterProperty('POPUPMENU', 'TPopupMenu', iptrw);
    RegisterProperty('TABWIDTH', 'Integer', iptrw);
    RegisterProperty('ONDRAGDROP', 'TDragDropEvent', iptrw);
    RegisterProperty('ONDRAGOVER', 'TDragOverEvent', iptrw);
    RegisterProperty('ONDRAWITEM', 'TDrawItemEvent', iptrw);
    RegisterProperty('ONENDDRAG', 'TEndDragEvent', iptrw);
    RegisterProperty('ONENTER', 'TNotifyEvent', iptrw);
    RegisterProperty('ONEXIT', 'TNotifyEvent', iptrw);
    RegisterProperty('ONMEASUREITEM', 'TMeasureItemEvent', iptrw);
    RegisterProperty('ONMOUSEDOWN', 'TMouseEvent', iptrw);
    RegisterProperty('ONMOUSEMOVE', 'TMouseMoveEvent', iptrw);
    RegisterProperty('ONMOUSEUP', 'TMouseEvent', iptrw);
    RegisterProperty('ONSTARTDRAG', 'TStartDragEvent', iptrw);
    {$ENDIF}
  end;
end;






procedure SIRegisterTSCROLLBAR(Cl: TIFPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TWINCONTROL'), 'TSCROLLBAR') do
  begin
    RegisterProperty('KIND', 'TSCROLLBARKIND', iptrw);
    RegisterProperty('MAX', 'INTEGER', iptrw);
    RegisterProperty('MIN', 'INTEGER', iptrw);
    RegisterProperty('POSITION', 'INTEGER', iptrw);
    RegisterProperty('ONCHANGE', 'TNOTIFYEVENT', iptrw);

    {$IFNDEF IFPS3_MINIVCL}
    RegisterMethod('procedure SETPARAMS(APOSITION,AMIN,AMAX:INTEGER)');
    RegisterProperty('CTL3D', 'Boolean', iptrw);
    RegisterProperty('DRAGCURSOR', 'Longint', iptrw);
    RegisterProperty('DRAGMODE', 'TDragMode', iptrw);
    RegisterProperty('LARGECHANGE', 'TSCROLLBARINC', iptrw);
    RegisterProperty('PARENTCTL3D', 'Boolean', iptrw);
    RegisterProperty('PARENTSHOWHINT', 'Boolean', iptrw);
    RegisterProperty('POPUPMENU', 'TPopupMenu', iptrw);
    RegisterProperty('SMALLCHANGE', 'TSCROLLBARINC', iptrw);
    RegisterProperty('ONDRAGDROP', 'TDragDropEvent', iptrw);
    RegisterProperty('ONDRAGOVER', 'TDragOverEvent', iptrw);
    RegisterProperty('ONENDDRAG', 'TEndDragEvent', iptrw);
    RegisterProperty('ONENTER', 'TNotifyEvent', iptrw);
    RegisterProperty('ONEXIT', 'TNotifyEvent', iptrw);
    RegisterProperty('ONKEYDOWN', 'TKeyEvent', iptrw);
    RegisterProperty('ONKEYPRESS', 'TKeyPressEvent', iptrw);
    RegisterProperty('ONKEYUP', 'TKeyEvent', iptrw);
    RegisterProperty('ONSCROLL', 'TSCROLLEVENT', iptrw);
    RegisterProperty('ONSTARTDRAG', 'TStartDragEvent', iptrw);
    {$ENDIF}
  end;
end;



procedure SIRegister_StdCtrls_TypesAndConsts(cl: TIFPSPascalCompiler);
begin
  cl.AddTypeS('TEditCharCase', '(ecNormal, ecUpperCase, ecLowerCase)');
  cl.AddTypeS('TScrollStyle', '(ssNone, ssHorizontal, ssVertical, ssBoth)');
  cl.AddTypeS('TComboBoxStyle', '(csDropDown, csSimple, csDropDownList, csOwnerDrawFixed, csOwnerDrawVariable)');
  cl.AddTypeS('TDrawItemEvent', 'procedure(Control: TWinControl; Index: Integer; Rect: TRect; State: Byte)');
  cl.AddTypeS('TMeasureItemEvent', 'procedure(Control: TWinControl; Index: Integer; var Height: Integer)');
  cl.AddTypeS('TCheckBoxState', '(cbUnchecked, cbChecked, cbGrayed)');
  cl.AddTypeS('TListBoxStyle', '(lbStandard, lbOwnerDrawFixed, lbOwnerDrawVariable)');
  cl.AddTypeS('TScrollCode', '(scLineUp, scLineDown, scPageUp, scPageDown, scPosition, scTrack, scTop, scBottom, scEndScroll)');
  cl.AddTypeS('TScrollEvent', 'procedure(Sender: TObject; ScrollCode: TScrollCode;var ScrollPos: Integer)');

  Cl.addTypeS('TEOwnerDrawState', '(odSelected, odGrayed, odDisabled, odChecked,'
    +' odFocused, odDefault, odHotLight, odInactive, odNoAccel, odNoFocusRect,'
    +' odReserved1, odReserved2, odComboBoxEdit)');
  cl.AddTypeS('TTextLayout', '( tlTop, tlCenter, tlBottom )');
  cl.AddTypeS('TOwnerDrawState', 'set of TEOwnerDrawState');
end;


procedure SIRegister_stdctrls(cl: TIFPSPascalCompiler);
begin
  SIRegister_StdCtrls_TypesAndConsts(cl);
  {$IFNDEF IFPS3_MINIVCL}
  SIRegisterTCUSTOMGROUPBOX(Cl);
  SIRegisterTGROUPBOX(Cl);
  {$ENDIF}
  SIRegisterTCUSTOMLABEL(Cl);
  SIRegisterTLABEL(Cl);
  SIRegisterTCUSTOMEDIT(Cl);
  SIRegisterTEDIT(Cl);
  SIRegisterTCUSTOMMEMO(Cl);
  SIRegisterTMEMO(Cl);
  SIRegisterTCUSTOMCOMBOBOX(Cl);
  SIRegisterTCOMBOBOX(Cl);
  SIRegisterTBUTTONCONTROL(Cl);
  SIRegisterTBUTTON(Cl);
  SIRegisterTCUSTOMCHECKBOX(Cl);
  SIRegisterTCHECKBOX(Cl);
  SIRegisterTRADIOBUTTON(Cl);
  SIRegisterTCUSTOMLISTBOX(Cl);
  SIRegisterTLISTBOX(Cl);
  {$IFNDEF IFPS3_MINIVCL}
  SIRegisterTSCROLLBAR(Cl);
  {$ENDIF}
end;

// IFPS3_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)


end.






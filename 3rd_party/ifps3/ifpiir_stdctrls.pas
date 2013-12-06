{
@abstract(Runtime stdctrls definitions)
@author(Carlo Kok <ck@carlo-kok.com>)
}
unit ifpiir_stdctrls;

{$I ifps3_def.inc}
interface
uses
  ifps3, ifps3utl;
{
   Will register files from:
     stdctrls

Requires:
  STD, classes, controls and graphics
}

procedure RIRegisterTCUSTOMGROUPBOX(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTGROUPBOX(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTCUSTOMLABEL(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTLABEL(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTCUSTOMEDIT(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTEDIT(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTCUSTOMMEMO(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTMEMO(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTCUSTOMCOMBOBOX(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTCOMBOBOX(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTBUTTONCONTROL(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTBUTTON(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTCUSTOMCHECKBOX(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTCHECKBOX(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTRADIOBUTTON(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTCUSTOMLISTBOX(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTLISTBOX(Cl: TIFPSRuntimeClassImporter);
procedure RIRegisterTSCROLLBAR(Cl: TIFPSRuntimeClassImporter);

procedure RIRegister_stdctrls(cl: TIFPSRuntimeClassImporter);

implementation
uses
  sysutils, classes{$IFDEF CLX}, QControls, QStdCtrls, QGraphics{$ELSE}, controls, stdctrls, Graphics{$ENDIF};

procedure RIRegisterTCUSTOMGROUPBOX(Cl: TIFPSRuntimeClassImporter);
begin
  Cl.Add(TCUSTOMGROUPBOX);
end;


procedure RIRegisterTGROUPBOX(Cl: TIFPSRuntimeClassImporter);
begin
  Cl.Add(TGROUPBOX);
end;
{$IFNDEF CLX}
procedure TCUSTOMLABELCANVAS_R(Self: TCUSTOMLABEL; var T: TCanvas); begin T := Self.CANVAS; end;
{$ENDIF}

procedure RIRegisterTCUSTOMLABEL(Cl: TIFPSRuntimeClassImporter);
begin
  with Cl.Add(TCUSTOMLABEL) do
  begin
    {$IFNDEF IFPS3_MINIVCL}
{$IFNDEF CLX}
    RegisterPropertyHelper(@TCUSTOMLABELCANVAS_R, nil, 'CANVAS');
{$ENDIF}
    {$ENDIF}
  end;
end;

procedure RIRegisterTLABEL(Cl: TIFPSRuntimeClassImporter);
begin
  Cl.Add(TLABEL);
end;
procedure TCUSTOMEDITMODIFIED_R(Self: TCUSTOMEDIT; var T: BOOLEAN); begin T := Self.MODIFIED; end;
procedure TCUSTOMEDITMODIFIED_W(Self: TCUSTOMEDIT; T: BOOLEAN); begin Self.MODIFIED := T; end;
procedure TCUSTOMEDITSELLENGTH_R(Self: TCUSTOMEDIT; var T: INTEGER); begin T := Self.SELLENGTH; end;
procedure TCUSTOMEDITSELLENGTH_W(Self: TCUSTOMEDIT; T: INTEGER); begin Self.SELLENGTH := T; end;
procedure TCUSTOMEDITSELSTART_R(Self: TCUSTOMEDIT; var T: INTEGER); begin T := Self.SELSTART; end;
procedure TCUSTOMEDITSELSTART_W(Self: TCUSTOMEDIT; T: INTEGER); begin Self.SELSTART := T; end;
procedure TCUSTOMEDITSELTEXT_R(Self: TCUSTOMEDIT; var T: STRING); begin T := Self.SELTEXT; end;
procedure TCUSTOMEDITSELTEXT_W(Self: TCUSTOMEDIT; T: STRING); begin Self.SELTEXT := T; end;
procedure TCUSTOMEDITTEXT_R(Self: TCUSTOMEDIT; var T: string); begin T := Self.TEXT; end;
procedure TCUSTOMEDITTEXT_W(Self: TCUSTOMEDIT; T: string); begin Self.TEXT := T; end;


procedure RIRegisterTCUSTOMEDIT(Cl: TIFPSRuntimeClassImporter);
begin
  with Cl.Add(TCUSTOMEDIT) do
  begin
    RegisterMethod(@TCUSTOMEDIT.CLEAR, 'CLEAR');
    RegisterMethod(@TCUSTOMEDIT.CLEARSELECTION, 'CLEARSELECTION');
    RegisterMethod(@TCUSTOMEDIT.SELECTALL, 'SELECTALL');
    RegisterPropertyHelper(@TCUSTOMEDITMODIFIED_R, @TCUSTOMEDITMODIFIED_W, 'MODIFIED');
    RegisterPropertyHelper(@TCUSTOMEDITSELLENGTH_R, @TCUSTOMEDITSELLENGTH_W, 'SELLENGTH');
    RegisterPropertyHelper(@TCUSTOMEDITSELSTART_R, @TCUSTOMEDITSELSTART_W, 'SELSTART');
    RegisterPropertyHelper(@TCUSTOMEDITSELTEXT_R, @TCUSTOMEDITSELTEXT_W, 'SELTEXT');
    RegisterPropertyHelper(@TCUSTOMEDITTEXT_R, @TCUSTOMEDITTEXT_W, 'TEXT');

    {$IFNDEF IFPS3_MINIVCL}
    RegisterMethod(@TCUSTOMEDIT.COPYTOCLIPBOARD, 'COPYTOCLIPBOARD');
    RegisterMethod(@TCUSTOMEDIT.CUTTOCLIPBOARD, 'CUTTOCLIPBOARD');
    RegisterMethod(@TCUSTOMEDIT.PASTEFROMCLIPBOARD, 'PASTEFROMCLIPBOARD');
    RegisterMethod(@TCUSTOMEDIT.GETSELTEXTBUF, 'GETSELTEXTBUF');
    RegisterMethod(@TCUSTOMEDIT.SETSELTEXTBUF, 'SETSELTEXTBUF');
    {$ENDIF}
  end;
end;

procedure RIRegisterTEDIT(Cl: TIFPSRuntimeClassImporter);
begin
  Cl.Add(TEDIT);
end;


procedure TCUSTOMMEMOLINES_R(Self: {$IFDEF CLX}TMemo{$ELSE}TCUSTOMMEMO{$ENDIF}; var T: TSTRINGS); begin T := Self.LINES; end;
procedure TCUSTOMMEMOLINES_W(Self: {$IFDEF CLX}TMemo{$ELSE}TCUSTOMMEMO{$ENDIF}; T: TSTRINGS); begin Self.LINES := T; end;


procedure RIRegisterTCUSTOMMEMO(Cl: TIFPSRuntimeClassImporter);
begin
  with Cl.Add(TCUSTOMMEMO) do
  begin
    {$IFNDEF CLX}
    RegisterPropertyHelper(@TCUSTOMMEMOLINES_R, @TCUSTOMMEMOLINES_W, 'LINES');
    {$ENDIF}
  end;
end;


procedure RIRegisterTMEMO(Cl: TIFPSRuntimeClassImporter);
begin
  with Cl.Add(TMEMO) do
  begin
    {$IFDEF CLX}
    RegisterPropertyHelper(@TCUSTOMMEMOLINES_R, @TCUSTOMMEMOLINES_W, 'LINES');
    {$ENDIF}
  end;
end;


procedure TCUSTOMCOMBOBOXCANVAS_R(Self: TCUSTOMCOMBOBOX; var T: TCANVAS); begin T := Self.CANVAS; end;
procedure TCUSTOMCOMBOBOXDROPPEDDOWN_R(Self: TCUSTOMCOMBOBOX; var T: BOOLEAN); begin T := Self.DROPPEDDOWN; end;
procedure TCUSTOMCOMBOBOXDROPPEDDOWN_W(Self: TCUSTOMCOMBOBOX; T: BOOLEAN); begin Self.DROPPEDDOWN := T; end;
procedure TCUSTOMCOMBOBOXITEMS_R(Self: TCUSTOMCOMBOBOX; var T: TSTRINGS); begin T := Self.ITEMS; end;
procedure TCUSTOMCOMBOBOXITEMS_W(Self: TCUSTOMCOMBOBOX; T: TSTRINGS); begin Self.ITEMS := T; end;
procedure TCUSTOMCOMBOBOXITEMINDEX_R(Self: TCUSTOMCOMBOBOX; var T: INTEGER); begin T := Self.ITEMINDEX; end;
procedure TCUSTOMCOMBOBOXITEMINDEX_W(Self: TCUSTOMCOMBOBOX; T: INTEGER); begin Self.ITEMINDEX := T; end;
procedure TCUSTOMCOMBOBOXSELLENGTH_R(Self: TCUSTOMCOMBOBOX; var T: INTEGER); begin T := Self.SELLENGTH; end;
procedure TCUSTOMCOMBOBOXSELLENGTH_W(Self: TCUSTOMCOMBOBOX; T: INTEGER); begin Self.SELLENGTH := T; end;
procedure TCUSTOMCOMBOBOXSELSTART_R(Self: TCUSTOMCOMBOBOX; var T: INTEGER); begin T := Self.SELSTART; end;
procedure TCUSTOMCOMBOBOXSELSTART_W(Self: TCUSTOMCOMBOBOX; T: INTEGER); begin Self.SELSTART := T; end;
procedure TCUSTOMCOMBOBOXSELTEXT_R(Self: TCUSTOMCOMBOBOX; var T: STRING); begin T := Self.SELTEXT; end;
procedure TCUSTOMCOMBOBOXSELTEXT_W(Self: TCUSTOMCOMBOBOX; T: STRING); begin Self.SELTEXT := T; end;


procedure RIRegisterTCUSTOMCOMBOBOX(Cl: TIFPSRuntimeClassImporter);
begin
  with Cl.Add(TCUSTOMCOMBOBOX) do
  begin
    RegisterPropertyHelper(@TCUSTOMCOMBOBOXDROPPEDDOWN_R, @TCUSTOMCOMBOBOXDROPPEDDOWN_W, 'DROPPEDDOWN');
    RegisterPropertyHelper(@TCUSTOMCOMBOBOXITEMS_R, @TCUSTOMCOMBOBOXITEMS_W, 'ITEMS');
    RegisterPropertyHelper(@TCUSTOMCOMBOBOXITEMINDEX_R, @TCUSTOMCOMBOBOXITEMINDEX_W, 'ITEMINDEX');

    {$IFNDEF IFPS3_MINIVCL}
    RegisterMethod(@TCUSTOMCOMBOBOX.CLEAR, 'CLEAR');
    RegisterMethod(@TCUSTOMCOMBOBOX.SELECTALL, 'SELECTALL');
    RegisterPropertyHelper(@TCUSTOMCOMBOBOXCANVAS_R, nil, 'CANVAS');
    RegisterPropertyHelper(@TCUSTOMCOMBOBOXSELLENGTH_R, @TCUSTOMCOMBOBOXSELLENGTH_W, 'SELLENGTH');
    RegisterPropertyHelper(@TCUSTOMCOMBOBOXSELSTART_R, @TCUSTOMCOMBOBOXSELSTART_W, 'SELSTART');
    RegisterPropertyHelper(@TCUSTOMCOMBOBOXSELTEXT_R, @TCUSTOMCOMBOBOXSELTEXT_W, 'SELTEXT');
    {$ENDIF}
  end;
end;




procedure RIRegisterTCOMBOBOX(Cl: TIFPSRuntimeClassImporter);
begin
  Cl.Add(TCOMBOBOX);
end;



procedure RIRegisterTBUTTONCONTROL(Cl: TIFPSRuntimeClassImporter);
begin
  Cl.Add(TBUTTONCONTROL);
end;



procedure RIRegisterTBUTTON(Cl: TIFPSRuntimeClassImporter);
begin
  Cl.Add(TBUTTON);
end;




procedure RIRegisterTCUSTOMCHECKBOX(Cl: TIFPSRuntimeClassImporter);
begin
  Cl.Add(TCUSTOMCHECKBOX);
end;


procedure RIRegisterTCHECKBOX(Cl: TIFPSRuntimeClassImporter);
begin
  Cl.Add(TCHECKBOX);
end;


procedure RIRegisterTRADIOBUTTON(Cl: TIFPSRuntimeClassImporter);
begin
  Cl.Add(TRADIOBUTTON);
end;

procedure TCUSTOMLISTBOXCANVAS_R(Self: TCUSTOMLISTBOX; var T: TCANVAS); begin T := Self.CANVAS; end;
procedure TCUSTOMLISTBOXITEMS_R(Self: TCUSTOMLISTBOX; var T: TSTRINGS); begin T := Self.ITEMS; end;
procedure TCUSTOMLISTBOXITEMS_W(Self: TCUSTOMLISTBOX; T: TSTRINGS); begin Self.ITEMS := T; end;
procedure TCUSTOMLISTBOXITEMINDEX_R(Self: TCUSTOMLISTBOX; var T: INTEGER); begin T := Self.ITEMINDEX; end;
procedure TCUSTOMLISTBOXITEMINDEX_W(Self: TCUSTOMLISTBOX; T: INTEGER); begin Self.ITEMINDEX := T; end;
procedure TCUSTOMLISTBOXSELCOUNT_R(Self: TCUSTOMLISTBOX; var T: INTEGER); begin T := Self.SELCOUNT; end;
procedure TCUSTOMLISTBOXSELECTED_R(Self: TCUSTOMLISTBOX; var T: BOOLEAN; t1: INTEGER); begin T := Self.SELECTED[t1]; end;
procedure TCUSTOMLISTBOXSELECTED_W(Self: TCUSTOMLISTBOX; T: BOOLEAN; t1: INTEGER); begin Self.SELECTED[t1] := T; end;
procedure TCUSTOMLISTBOXTOPINDEX_R(Self: TCUSTOMLISTBOX; var T: INTEGER); begin T := Self.TOPINDEX; end;
procedure TCUSTOMLISTBOXTOPINDEX_W(Self: TCUSTOMLISTBOX; T: INTEGER); begin Self.TOPINDEX := T; end;


procedure RIRegisterTCUSTOMLISTBOX(Cl: TIFPSRuntimeClassImporter);
begin
  with Cl.Add(TCUSTOMLISTBOX) do
  begin
    RegisterPropertyHelper(@TCUSTOMLISTBOXITEMS_R, @TCUSTOMLISTBOXITEMS_W, 'ITEMS');
    RegisterPropertyHelper(@TCUSTOMLISTBOXITEMINDEX_R, @TCUSTOMLISTBOXITEMINDEX_W, 'ITEMINDEX');
    RegisterPropertyHelper(@TCUSTOMLISTBOXSELCOUNT_R, nil, 'SELCOUNT');
    RegisterPropertyHelper(@TCUSTOMLISTBOXSELECTED_R, @TCUSTOMLISTBOXSELECTED_W, 'SELECTED');

    {$IFNDEF IFPS3_MINIVCL}
    RegisterMethod(@TCUSTOMLISTBOX.CLEAR, 'CLEAR');
    RegisterMethod(@TCUSTOMLISTBOX.ITEMATPOS, 'ITEMATPOS');
    RegisterMethod(@TCUSTOMLISTBOX.ITEMRECT, 'ITEMRECT');
    RegisterPropertyHelper(@TCUSTOMLISTBOXCANVAS_R, nil, 'CANVAS');
    RegisterPropertyHelper(@TCUSTOMLISTBOXTOPINDEX_R, @TCUSTOMLISTBOXTOPINDEX_W, 'TOPINDEX');
    {$ENDIF}
  end;
end;


procedure RIRegisterTLISTBOX(Cl: TIFPSRuntimeClassImporter);
begin
  Cl.Add(TLISTBOX);
end;


procedure RIRegisterTSCROLLBAR(Cl: TIFPSRuntimeClassImporter);
begin
  with Cl.Add(TSCROLLBAR) do
  begin
    RegisterMethod(@TSCROLLBAR.SETPARAMS, 'SETPARAMS');
  end;
end;


procedure RIRegister_stdctrls(cl: TIFPSRuntimeClassImporter);
begin
  {$IFNDEF IFPS3_MINIVCL}
  RIRegisterTCUSTOMGROUPBOX(Cl);
  RIRegisterTGROUPBOX(Cl);
  {$ENDIF}
  RIRegisterTCUSTOMLABEL(Cl);
  RIRegisterTLABEL(Cl);
  RIRegisterTCUSTOMEDIT(Cl);
  RIRegisterTEDIT(Cl);
  RIRegisterTCUSTOMMEMO(Cl);
  RIRegisterTMEMO(Cl);
  RIRegisterTCUSTOMCOMBOBOX(Cl);
  RIRegisterTCOMBOBOX(Cl);
  RIRegisterTBUTTONCONTROL(Cl);
  RIRegisterTBUTTON(Cl);
  RIRegisterTCUSTOMCHECKBOX(Cl);
  RIRegisterTCHECKBOX(Cl);
  RIRegisterTRADIOBUTTON(Cl);
  RIRegisterTCUSTOMLISTBOX(Cl);
  RIRegisterTLISTBOX(Cl);
  {$IFNDEF IFPS3_MINIVCL}
  RIRegisterTSCROLLBAR(Cl);
  {$ENDIF}
end;

// IFPS3_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)

end.



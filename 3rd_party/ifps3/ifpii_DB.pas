{
@abstract(Compiletime DB support)
@author(Carlo Kok <ck@carlo-kok.com>)
}
Unit ifpii_DB;
{
This file has been generated by UnitParser v0.4, written by M. Knight.
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ifps3 are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok''s conv unility

Licence :
This software is provided 'as-is', without any expressed or implied
warranty. In no event will the author be held liable for any damages
arising from the use of this software.
Permission is granted to anyone to use this software for any kind of
application, and to alter it and redistribute it freely, subject to
the following restrictions:
1. The origin of this software must not be misrepresented, you must
   not claim that you wrote the original software.
2. Altered source versions must be plainly marked as such, and must
   not be misrepresented as being the original software.
3. You may not create a library that uses this library as a main part
   of the program and sell that library.
4. You must have a visible line in your programs aboutbox or
   documentation that it is made using Innerfuse Script and where
   Innerfuse Pascal Script can be found.
5. This notice may not be removed or altered from any source
   distribution.

If you have any questions concerning this license write to Carlo Kok:
  ck@carlo-kok.com or try the newsserver:
  news://news.carlo-kok.com/
}
{$I ifps3_def.inc}
Interface
uses
  ifpscomp;

procedure SIRegisterTDATASET(CL: TIFPSPascalCompiler);
procedure SIRegisterTPARAMS(CL: TIFPSPascalCompiler);
procedure SIRegisterTPARAM(CL: TIFPSPascalCompiler);
procedure SIRegisterTGUIDFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTVARIANTFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTREFERENCEFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTDATASETFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTARRAYFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTADTFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTOBJECTFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTGRAPHICFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTMEMOFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTBLOBFIELD(CL: TIFPSPascalCompiler);
{$IFDEF IFPS3_D6PLUS}
procedure SIRegisterTFMTBCDFIELD(CL: TIFPSPascalCompiler);
{$ENDIF}
procedure SIRegisterTBCDFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTVARBYTESFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTBYTESFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTBINARYFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTTIMEFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTDATEFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTDATETIMEFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTBOOLEANFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTCURRENCYFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTFLOATFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTAUTOINCFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTWORDFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTLARGEINTFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTSMALLINTFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTINTEGERFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTNUMERICFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTWIDESTRINGFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTSTRINGFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTFIELD(CL: TIFPSPascalCompiler);
procedure SIRegisterTLOOKUPLIST(CL: TIFPSPascalCompiler);
procedure SIRegisterTFIELDS(CL: TIFPSPascalCompiler);
procedure SIRegisterTFIELDLIST(CL: TIFPSPascalCompiler);
procedure SIRegisterTFIELDDEFLIST(CL: TIFPSPascalCompiler);
procedure SIRegisterTFLATLIST(CL: TIFPSPascalCompiler);
procedure SIRegisterTINDEXDEFS(CL: TIFPSPascalCompiler);
procedure SIRegisterTINDEXDEF(CL: TIFPSPascalCompiler);
procedure SIRegisterTFIELDDEFS(CL: TIFPSPascalCompiler);
procedure SIRegisterTFIELDDEF(CL: TIFPSPascalCompiler);
procedure SIRegisterTDEFCOLLECTION(CL: TIFPSPascalCompiler);
procedure SIRegisterTNAMEDITEM(CL: TIFPSPascalCompiler);
procedure SIRegister_DB(Cl: TIFPSPascalCompiler);

implementation
Uses Sysutils;

Function RegClassS(cl : TIFPSPascalCompiler;Const InheritsFrom,Classname : String) : TIFPSCompileTimeClass;
begin
Result := cl.FindClass(Classname);
if Result = nil then
  Result := cl.AddClassN(cl.FindClass(InheritsFrom),Classname)
else
  Result.ClassInheritsFrom := cl.FindClass(InheritsFrom);
end;

procedure SIRegisterTDATASET(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TCOMPONENT','TDATASET') do
  begin
  RegisterMethod('Function ACTIVEBUFFER : PCHAR');
  RegisterMethod('Procedure APPEND');
  RegisterMethod('Procedure APPENDRECORD( const VALUES : array of const)');
//  RegisterMethod('Function BOOKMARKVALID( BOOKMARK : TBOOKMARK) : BOOLEAN');
  RegisterMethod('Procedure CANCEL');
  RegisterMethod('Procedure CHECKBROWSEMODE');
  RegisterMethod('Procedure CLEARFIELDS');
  RegisterMethod('Procedure CLOSE');
  RegisterMethod('Function CONTROLSDISABLED : BOOLEAN');
//  RegisterMethod('Function COMPAREBOOKMARKS( BOOKMARK1, BOOKMARK2 : TBOOKMARK) : INTEGER');
  RegisterMethod('Function CREATEBLOBSTREAM( FIELD : TFIELD; MODE : TBLOBSTREAMMODE) : TSTREAM');
  RegisterMethod('Procedure CURSORPOSCHANGED');
  RegisterMethod('Procedure DELETE');
  RegisterMethod('Procedure DISABLECONTROLS');
  RegisterMethod('Procedure EDIT');
  RegisterMethod('Procedure ENABLECONTROLS');
  RegisterMethod('Function FIELDBYNAME( const FIELDNAME : STRING) : TFIELD');
  RegisterMethod('Function FINDFIELD( const FIELDNAME : STRING) : TFIELD');
  RegisterMethod('Function FINDFIRST : BOOLEAN');
  RegisterMethod('Function FINDLAST : BOOLEAN');
  RegisterMethod('Function FINDNEXT : BOOLEAN');
  RegisterMethod('Function FINDPRIOR : BOOLEAN');
  RegisterMethod('Procedure FIRST');
//  RegisterMethod('Procedure FREEBOOKMARK( BOOKMARK : TBOOKMARK)');
//  RegisterMethod('Function GETBOOKMARK : TBOOKMARK');
  RegisterMethod('Function GETCURRENTRECORD( BUFFER : PCHAR) : BOOLEAN');
//  RegisterMethod('Procedure GETDETAILDATASETS( LIST : TLIST)');
//  RegisterMethod('Procedure GETFIELDLIST( LIST : TLIST; const FIELDNAMES : STRING)');
//  RegisterMethod('Procedure GETDETAILLINKFIELDS( MASTERFIELDS, DETAILFIELDS : TLIST)');
//  RegisterMethod('Function GETBLOBFIELDDATA( FIELDNO : INTEGER; var BUFFER : TBLOBBYTEDATA) : INTEGER');
  RegisterMethod('Procedure GETFIELDNAMES( LIST : TSTRINGS)');
//  RegisterMethod('Procedure GOTOBOOKMARK( BOOKMARK : TBOOKMARK)');
  RegisterMethod('Procedure INSERT');
  RegisterMethod('Procedure INSERTRECORD( const VALUES : array of const)');
  RegisterMethod('Function ISEMPTY : BOOLEAN');
  RegisterMethod('Function ISLINKEDTO( DATASOURCE : TDATASOURCE) : BOOLEAN');
  RegisterMethod('Function ISSEQUENCED : BOOLEAN');
  RegisterMethod('Procedure LAST');
  RegisterMethod('Function LOCATE( const KEYFIELDS : STRING; const KEYVALUES : VARIANT; OPTIONS : TLOCATEOPTIONS) : BOOLEAN');
  RegisterMethod('Function LOOKUP( const KEYFIELDS : STRING; const KEYVALUES : VARIANT; const RESULTFIELDS : STRING) : VARIANT');
  RegisterMethod('Function MOVEBY( DISTANCE : INTEGER) : INTEGER');
  RegisterMethod('Procedure NEXT');
  RegisterMethod('Procedure OPEN');
  RegisterMethod('Procedure POST');
  RegisterMethod('Procedure PRIOR');
  RegisterMethod('Procedure REFRESH');
//  RegisterMethod('Procedure RESYNC( MODE : TRESYNCMODE)');
  RegisterMethod('Procedure SETFIELDS( const VALUES : array of const)');
  RegisterMethod('Function TRANSLATE( SRC, DEST : PCHAR; TOOEM : BOOLEAN) : INTEGER');
  RegisterMethod('Procedure UPDATECURSORPOS');
  RegisterMethod('Procedure UPDATERECORD');
  RegisterMethod('Function UPDATESTATUS : TUPDATESTATUS');
  RegisterProperty('AGGFIELDS', 'TFIELDS', iptr);
  RegisterProperty('BOF', 'BOOLEAN', iptr);
//  RegisterProperty('BOOKMARK', 'TBOOKMARKSTR', iptrw);
  RegisterProperty('CANMODIFY', 'BOOLEAN', iptr);
  RegisterProperty('DATASETFIELD', 'TDATASETFIELD', iptrw);
  RegisterProperty('DATASOURCE', 'TDATASOURCE', iptr);
  RegisterProperty('DEFAULTFIELDS', 'BOOLEAN', iptr);
  RegisterProperty('DESIGNER', 'TDATASETDESIGNER', iptr);
  RegisterProperty('EOF', 'BOOLEAN', iptr);
  RegisterProperty('BLOCKREADSIZE', 'INTEGER', iptrw);
  RegisterProperty('FIELDCOUNT', 'INTEGER', iptr);
  RegisterProperty('FIELDDEFS', 'TFIELDDEFS', iptrw);
  RegisterProperty('FIELDDEFLIST', 'TFIELDDEFLIST', iptr);
  RegisterProperty('FIELDS', 'TFIELDS', iptr);
  RegisterProperty('FIELDLIST', 'TFIELDLIST', iptr);
  RegisterProperty('FIELDVALUES', 'VARIANT STRING', iptrw);
  RegisterProperty('FOUND', 'BOOLEAN', iptr);
{$IFDEF IFPS3_D6PLUS}
  RegisterProperty('ISUNIDIRECTIONAL', 'BOOLEAN', iptr);
{$ENDIF}
  RegisterProperty('MODIFIED', 'BOOLEAN', iptr);
  RegisterProperty('OBJECTVIEW', 'BOOLEAN', iptrw);
  RegisterProperty('RECORDCOUNT', 'INTEGER', iptr);
  RegisterProperty('RECNO', 'INTEGER', iptrw);
  RegisterProperty('RECORDSIZE', 'WORD', iptr);
  RegisterProperty('SPARSEARRAYS', 'BOOLEAN', iptrw);
  RegisterProperty('STATE', 'TDATASETSTATE', iptr);
  RegisterProperty('FILTER', 'STRING', iptrw);
  RegisterProperty('FILTERED', 'BOOLEAN', iptrw);
  RegisterProperty('FILTEROPTIONS', 'TFILTEROPTIONS', iptrw);
  RegisterProperty('ACTIVE', 'BOOLEAN', iptrw);
  RegisterProperty('AUTOCALCFIELDS', 'BOOLEAN', iptrw);
  RegisterProperty('BEFOREOPEN', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('AFTEROPEN', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('BEFORECLOSE', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('AFTERCLOSE', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('BEFOREINSERT', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('AFTERINSERT', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('BEFOREEDIT', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('AFTEREDIT', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('BEFOREPOST', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('AFTERPOST', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('BEFORECANCEL', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('AFTERCANCEL', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('BEFOREDELETE', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('AFTERDELETE', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('BEFORESCROLL', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('AFTERSCROLL', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('BEFOREREFRESH', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('AFTERREFRESH', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('ONCALCFIELDS', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('ONDELETEERROR', 'TDATASETERROREVENT', iptrw);
  RegisterProperty('ONEDITERROR', 'TDATASETERROREVENT', iptrw);
  RegisterProperty('ONFILTERRECORD', 'TFILTERRECORDEVENT', iptrw);
  RegisterProperty('ONNEWRECORD', 'TDATASETNOTIFYEVENT', iptrw);
  RegisterProperty('ONPOSTERROR', 'TDATASETERROREVENT', iptrw);
  end;
end;

procedure SIRegisterTPARAMS(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TCOLLECTION','TPARAMS') do
  begin
  RegisterMethod('Procedure ASSIGNVALUES( VALUE : TPARAMS)');
  RegisterMethod('Procedure ADDPARAM( VALUE : TPARAM)');
  RegisterMethod('Procedure REMOVEPARAM( VALUE : TPARAM)');
  RegisterMethod('Function CREATEPARAM( FLDTYPE : TFIELDTYPE; const PARAMNAME : STRING; PARAMTYPE : TPARAMTYPE) : TPARAM');
//  RegisterMethod('Procedure GETPARAMLIST( LIST : TLIST; const PARAMNAMES : STRING)');
  RegisterMethod('Function ISEQUAL( VALUE : TPARAMS) : BOOLEAN');
  RegisterMethod('Function PARSESQL( SQL : STRING; DOCREATE : BOOLEAN) : STRING');
  RegisterMethod('Function PARAMBYNAME( const VALUE : STRING) : TPARAM');
  RegisterMethod('Function FINDPARAM( const VALUE : STRING) : TPARAM');
  RegisterProperty('ITEMS', 'TPARAM INTEGER', iptrw);
  RegisterProperty('PARAMVALUES', 'VARIANT STRING', iptrw);
  end;
end;

procedure SIRegisterTPARAM(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TCOLLECTIONITEM','TPARAM') do
  begin
  RegisterMethod('Procedure ASSIGNFIELD( FIELD : TFIELD)');
  RegisterMethod('Procedure ASSIGNFIELDVALUE( FIELD : TFIELD; const VALUE : VARIANT)');
  RegisterMethod('Procedure CLEAR');
//  RegisterMethod('Procedure GETDATA( BUFFER : POINTER)');
  RegisterMethod('Function GETDATASIZE : INTEGER');
  RegisterMethod('Procedure LOADFROMFILE( const FILENAME : STRING; BLOBTYPE : TBLOBTYPE)');
  RegisterMethod('Procedure LOADFROMSTREAM( STREAM : TSTREAM; BLOBTYPE : TBLOBTYPE)');
//  RegisterMethod('Procedure SETBLOBDATA( BUFFER : POINTER; SIZE : INTEGER)');
//  RegisterMethod('Procedure SETDATA( BUFFER : POINTER)');
{$IFDEF IFPS3_D6PLUS}
  RegisterProperty('ASBCD', 'CURRENCY', iptrw);
{$ENDIF}
{$IFDEF IFPS3_D6PLUS}
  RegisterProperty('ASFMTBCD', 'TBCD', iptrw);
{$ENDIF}
  RegisterProperty('ASBLOB', 'TBLOBDATA', iptrw);
  RegisterProperty('ASBOOLEAN', 'BOOLEAN', iptrw);
  RegisterProperty('ASCURRENCY', 'CURRENCY', iptrw);
  RegisterProperty('ASDATE', 'TDATETIME', iptrw);
  RegisterProperty('ASDATETIME', 'TDATETIME', iptrw);
  RegisterProperty('ASFLOAT', 'DOUBLE', iptrw);
  RegisterProperty('ASINTEGER', 'LONGINT', iptrw);
  RegisterProperty('ASSMALLINT', 'LONGINT', iptrw);
  RegisterProperty('ASMEMO', 'STRING', iptrw);
  RegisterProperty('ASSTRING', 'STRING', iptrw);
  RegisterProperty('ASTIME', 'TDATETIME', iptrw);
  RegisterProperty('ASWORD', 'LONGINT', iptrw);
  RegisterProperty('BOUND', 'BOOLEAN', iptrw);
  RegisterProperty('ISNULL', 'BOOLEAN', iptr);
  RegisterProperty('NATIVESTR', 'STRING', iptrw);
  RegisterProperty('TEXT', 'STRING', iptrw);
  RegisterProperty('DATATYPE', 'TFIELDTYPE', iptrw);
{$IFDEF IFPS3_D6PLUS}
  RegisterProperty('PRECISION', 'INTEGER', iptrw);
  RegisterProperty('NUMERICSCALE', 'INTEGER', iptrw);
  RegisterProperty('SIZE', 'INTEGER', iptrw);
{$ENDIF}
  RegisterProperty('NAME', 'STRING', iptrw);
  RegisterProperty('PARAMTYPE', 'TPARAMTYPE', iptrw);
  RegisterProperty('VALUE', 'VARIANT', iptrw);
  end;
end;

procedure SIRegisterTGUIDFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TFIELD','TGUIDFIELD') do
  begin
  end;
end;

procedure SIRegisterTVARIANTFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TFIELD','TVARIANTFIELD') do
  begin
  end;
end;

procedure SIRegisterTREFERENCEFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TDATASETFIELD','TREFERENCEFIELD') do
  begin
  RegisterProperty('REFERENCETABLENAME', 'STRING', iptrw);
  end;
end;

procedure SIRegisterTDATASETFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TOBJECTFIELD','TDATASETFIELD') do
  begin
  RegisterProperty('NESTEDDATASET', 'TDATASET', iptr);
  RegisterProperty('INCLUDEOBJECTFIELD', 'BOOLEAN', iptrw);
  end;
end;

procedure SIRegisterTARRAYFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TOBJECTFIELD','TARRAYFIELD') do
  begin
  end;
end;

procedure SIRegisterTADTFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TOBJECTFIELD','TADTFIELD') do
  begin
  end;
end;

procedure SIRegisterTOBJECTFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TFIELD','TOBJECTFIELD') do
  begin
  RegisterProperty('FIELDCOUNT', 'INTEGER', iptr);
  RegisterProperty('FIELDS', 'TFIELDS', iptr);
  RegisterProperty('FIELDVALUES', 'VARIANT INTEGER', iptrw);
  RegisterProperty('UNNAMED', 'BOOLEAN', iptr);
  RegisterProperty('OBJECTTYPE', 'STRING', iptrw);
  end;
end;

procedure SIRegisterTGRAPHICFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TBLOBFIELD','TGRAPHICFIELD') do
  begin
  end;
end;

procedure SIRegisterTMEMOFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TBLOBFIELD','TMEMOFIELD') do
  begin
  end;
end;

procedure SIRegisterTBLOBFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TFIELD','TBLOBFIELD') do
  begin
  RegisterMethod('Procedure LOADFROMFILE( const FILENAME : STRING)');
  RegisterMethod('Procedure LOADFROMSTREAM( STREAM : TSTREAM)');
  RegisterMethod('Procedure SAVETOFILE( const FILENAME : STRING)');
  RegisterMethod('Procedure SAVETOSTREAM( STREAM : TSTREAM)');
  RegisterProperty('BLOBSIZE', 'INTEGER', iptr);
  RegisterProperty('MODIFIED', 'BOOLEAN', iptrw);
  RegisterProperty('VALUE', 'STRING', iptrw);
  RegisterProperty('TRANSLITERATE', 'BOOLEAN', iptrw);
  RegisterProperty('BLOBTYPE', 'TBLOBTYPE', iptrw);
{$IFDEF IFPS3_D6PLUS}
  RegisterProperty('GRAPHICHEADER', 'BOOLEAN', iptrw);
{$ENDIF}
  end;
end;

{$IFDEF IFPS3_D6PLUS}
procedure SIRegisterTFMTBCDFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TNUMERICFIELD','TFMTBCDFIELD') do
  begin
  RegisterProperty('VALUE', 'TBCD', iptrw);
  RegisterProperty('CURRENCY', 'BOOLEAN', iptrw);
  RegisterProperty('MAXVALUE', 'STRING', iptrw);
  RegisterProperty('MINVALUE', 'STRING', iptrw);
  RegisterProperty('PRECISION', 'INTEGER', iptrw);
  end;
end;
{$ENDIF}

procedure SIRegisterTBCDFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TNUMERICFIELD','TBCDFIELD') do
  begin
  RegisterProperty('VALUE', 'CURRENCY', iptrw);
  RegisterProperty('CURRENCY', 'BOOLEAN', iptrw);
  RegisterProperty('MAXVALUE', 'CURRENCY', iptrw);
  RegisterProperty('MINVALUE', 'CURRENCY', iptrw);
  RegisterProperty('PRECISION', 'INTEGER', iptrw);
  end;
end;

procedure SIRegisterTVARBYTESFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TBYTESFIELD','TVARBYTESFIELD') do
  begin
  end;
end;

procedure SIRegisterTBYTESFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TBINARYFIELD','TBYTESFIELD') do
  begin
  end;
end;

procedure SIRegisterTBINARYFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TFIELD','TBINARYFIELD') do
  begin
  end;
end;

procedure SIRegisterTTIMEFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TDATETIMEFIELD','TTIMEFIELD') do
  begin
  end;
end;

procedure SIRegisterTDATEFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TDATETIMEFIELD','TDATEFIELD') do
  begin
  end;
end;

procedure SIRegisterTDATETIMEFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TFIELD','TDATETIMEFIELD') do
  begin
  RegisterProperty('VALUE', 'TDATETIME', iptrw);
  RegisterProperty('DISPLAYFORMAT', 'STRING', iptrw);
  end;
end;

procedure SIRegisterTBOOLEANFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TFIELD','TBOOLEANFIELD') do
  begin
  RegisterProperty('VALUE', 'BOOLEAN', iptrw);
  RegisterProperty('DISPLAYVALUES', 'STRING', iptrw);
  end;
end;

procedure SIRegisterTCURRENCYFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TFLOATFIELD','TCURRENCYFIELD') do
  begin
  end;
end;

procedure SIRegisterTFLOATFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TNUMERICFIELD','TFLOATFIELD') do
  begin
  RegisterProperty('VALUE', 'DOUBLE', iptrw);
  RegisterProperty('CURRENCY', 'BOOLEAN', iptrw);
  RegisterProperty('MAXVALUE', 'DOUBLE', iptrw);
  RegisterProperty('MINVALUE', 'DOUBLE', iptrw);
  RegisterProperty('PRECISION', 'INTEGER', iptrw);
  end;
end;

procedure SIRegisterTAUTOINCFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TINTEGERFIELD','TAUTOINCFIELD') do
  begin
  end;
end;

procedure SIRegisterTWORDFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TINTEGERFIELD','TWORDFIELD') do
  begin
  end;
end;

procedure SIRegisterTLARGEINTFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TNUMERICFIELD','TLARGEINTFIELD') do
  begin
  RegisterProperty('ASLARGEINT', 'LARGEINT', iptrw);
  RegisterProperty('VALUE', 'LARGEINT', iptrw);
  RegisterProperty('MAXVALUE', 'LARGEINT', iptrw);
  RegisterProperty('MINVALUE', 'LARGEINT', iptrw);
  end;
end;

procedure SIRegisterTSMALLINTFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TINTEGERFIELD','TSMALLINTFIELD') do
  begin
  end;
end;

procedure SIRegisterTINTEGERFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TNUMERICFIELD','TINTEGERFIELD') do
  begin
  RegisterProperty('VALUE', 'LONGINT', iptrw);
  RegisterProperty('MAXVALUE', 'LONGINT', iptrw);
  RegisterProperty('MINVALUE', 'LONGINT', iptrw);
  end;
end;

procedure SIRegisterTNUMERICFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TFIELD','TNUMERICFIELD') do
  begin
  RegisterProperty('DISPLAYFORMAT', 'STRING', iptrw);
  RegisterProperty('EDITFORMAT', 'STRING', iptrw);
  end;
end;

procedure SIRegisterTWIDESTRINGFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TSTRINGFIELD','TWIDESTRINGFIELD') do
  begin
  RegisterProperty('VALUE', 'WIDESTRING', iptrw);
  end;
end;

procedure SIRegisterTSTRINGFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TFIELD','TSTRINGFIELD') do
  begin
  RegisterProperty('VALUE', 'STRING', iptrw);
  RegisterProperty('FIXEDCHAR', 'BOOLEAN', iptrw);
  RegisterProperty('TRANSLITERATE', 'BOOLEAN', iptrw);
  end;
end;

procedure SIRegisterTFIELD(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TCOMPONENT','TFIELD') do
  begin
//RegisterMethod('Procedure ASSIGNVALUE( const VALUE : TVARREC)');
  RegisterMethod('Procedure CLEAR');
  RegisterMethod('Procedure FOCUSCONTROL');
//  RegisterMethod('Function GETDATA( BUFFER : POINTER; NATIVEFORMAT : BOOLEAN) : BOOLEAN');
  RegisterMethod('Function ISVALIDCHAR( INPUTCHAR : CHAR) : BOOLEAN');
  RegisterMethod('Procedure REFRESHLOOKUPLIST');
//  RegisterMethod('Procedure SETDATA( BUFFER : POINTER; NATIVEFORMAT : BOOLEAN)');
  RegisterMethod('Procedure SETFIELDTYPE( VALUE : TFIELDTYPE)');
//  RegisterMethod('Procedure VALIDATE( BUFFER : POINTER)');
{$IFDEF IFPS3_D6PLUS}
  RegisterProperty('ASBCD', 'TBCD', iptrw);
{$ENDIF}
  RegisterProperty('ASBOOLEAN', 'BOOLEAN', iptrw);
  RegisterProperty('ASCURRENCY', 'CURRENCY', iptrw);
  RegisterProperty('ASDATETIME', 'TDATETIME', iptrw);
  RegisterProperty('ASFLOAT', 'DOUBLE', iptrw);
  RegisterProperty('ASINTEGER', 'LONGINT', iptrw);
  RegisterProperty('ASSTRING', 'STRING', iptrw);
  RegisterProperty('ASVARIANT', 'VARIANT', iptrw);
  RegisterProperty('ATTRIBUTESET', 'STRING', iptrw);
  RegisterProperty('CALCULATED', 'BOOLEAN', iptrw);
  RegisterProperty('CANMODIFY', 'BOOLEAN', iptr);
  RegisterProperty('CURVALUE', 'VARIANT', iptr);
  RegisterProperty('DATASET', 'TDATASET', iptrw);
  RegisterProperty('DATASIZE', 'INTEGER', iptr);
  RegisterProperty('DATATYPE', 'TFIELDTYPE', iptr);
  RegisterProperty('DISPLAYNAME', 'STRING', iptr);
  RegisterProperty('DISPLAYTEXT', 'STRING', iptr);
  RegisterProperty('EDITMASK', 'TEDITMASK', iptrw);
  RegisterProperty('EDITMASKPTR', 'TEDITMASK', iptr);
  RegisterProperty('EDITMASK', 'STRING', iptrw);
  RegisterProperty('EDITMASKPTR', 'STRING', iptr);
  RegisterProperty('FIELDNO', 'INTEGER', iptr);
  RegisterProperty('FULLNAME', 'STRING', iptr);
  RegisterProperty('ISINDEXFIELD', 'BOOLEAN', iptr);
  RegisterProperty('ISNULL', 'BOOLEAN', iptr);
  RegisterProperty('LOOKUP', 'BOOLEAN', iptrw);
  RegisterProperty('LOOKUPLIST', 'TLOOKUPLIST', iptr);
  RegisterProperty('NEWVALUE', 'VARIANT', iptrw);
  RegisterProperty('OFFSET', 'INTEGER', iptr);
  RegisterProperty('OLDVALUE', 'VARIANT', iptr);
  RegisterProperty('PARENTFIELD', 'TOBJECTFIELD', iptrw);
  RegisterProperty('SIZE', 'INTEGER', iptrw);
  RegisterProperty('TEXT', 'STRING', iptrw);
  RegisterProperty('VALIDCHARS', 'TFIELDCHARS', iptrw);
  RegisterProperty('VALUE', 'VARIANT', iptrw);
  RegisterProperty('ALIGNMENT', 'TALIGNMENT', iptrw);
  RegisterProperty('AUTOGENERATEVALUE', 'TAUTOREFRESHFLAG', iptrw);
  RegisterProperty('CUSTOMCONSTRAINT', 'STRING', iptrw);
  RegisterProperty('CONSTRAINTERRORMESSAGE', 'STRING', iptrw);
  RegisterProperty('DEFAULTEXPRESSION', 'STRING', iptrw);
  RegisterProperty('DISPLAYLABEL', 'STRING', iptrw);
  RegisterProperty('DISPLAYWIDTH', 'INTEGER', iptrw);
  RegisterProperty('FIELDKIND', 'TFIELDKIND', iptrw);
  RegisterProperty('FIELDNAME', 'STRING', iptrw);
  RegisterProperty('HASCONSTRAINTS', 'BOOLEAN', iptr);
  RegisterProperty('INDEX', 'INTEGER', iptrw);
  RegisterProperty('IMPORTEDCONSTRAINT', 'STRING', iptrw);
  RegisterProperty('LOOKUPDATASET', 'TDATASET', iptrw);
  RegisterProperty('LOOKUPKEYFIELDS', 'STRING', iptrw);
  RegisterProperty('LOOKUPRESULTFIELD', 'STRING', iptrw);
  RegisterProperty('KEYFIELDS', 'STRING', iptrw);
  RegisterProperty('LOOKUPCACHE', 'BOOLEAN', iptrw);
  RegisterProperty('ORIGIN', 'STRING', iptrw);
  RegisterProperty('PROVIDERFLAGS', 'TPROVIDERFLAGS', iptrw);
  RegisterProperty('READONLY', 'BOOLEAN', iptrw);
  RegisterProperty('REQUIRED', 'BOOLEAN', iptrw);
  RegisterProperty('VISIBLE', 'BOOLEAN', iptrw);
  RegisterProperty('ONCHANGE', 'TFIELDNOTIFYEVENT', iptrw);
  RegisterProperty('ONGETTEXT', 'TFIELDGETTEXTEVENT', iptrw);
  RegisterProperty('ONSETTEXT', 'TFIELDSETTEXTEVENT', iptrw);
  RegisterProperty('ONVALIDATE', 'TFIELDNOTIFYEVENT', iptrw);
  end;
end;

procedure SIRegisterTLOOKUPLIST(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TOBJECT','TLOOKUPLIST') do
  begin
  RegisterMethod('Constructor CREATE');
  RegisterMethod('Procedure ADD( const AKEY, AVALUE : VARIANT)');
  RegisterMethod('Procedure CLEAR');
  RegisterMethod('Function VALUEOFKEY( const AKEY : VARIANT) : VARIANT');
  end;
end;

procedure SIRegisterTFIELDS(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TOBJECT','TFIELDS') do
  begin
  RegisterMethod('Constructor CREATE( ADATASET : TDATASET)');
  RegisterMethod('Procedure ADD( FIELD : TFIELD)');
  RegisterMethod('Procedure CHECKFIELDNAME( const FIELDNAME : STRING)');
  RegisterMethod('Procedure CHECKFIELDNAMES( const FIELDNAMES : STRING)');
  RegisterMethod('Procedure CLEAR');
  RegisterMethod('Function FINDFIELD( const FIELDNAME : STRING) : TFIELD');
  RegisterMethod('Function FIELDBYNAME( const FIELDNAME : STRING) : TFIELD');
  RegisterMethod('Function FIELDBYNUMBER( FIELDNO : INTEGER) : TFIELD');
  RegisterMethod('Procedure GETFIELDNAMES( LIST : TSTRINGS)');
  RegisterMethod('Function INDEXOF( FIELD : TFIELD) : INTEGER');
  RegisterMethod('Procedure REMOVE( FIELD : TFIELD)');
  RegisterProperty('COUNT', 'INTEGER', iptr);
  RegisterProperty('DATASET', 'TDATASET', iptr);
  RegisterProperty('FIELDS', 'TFIELD INTEGER', iptrw);
  end;
end;

procedure SIRegisterTFIELDLIST(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TFLATLIST','TFIELDLIST') do
  begin
  RegisterMethod('Function FIELDBYNAME( const NAME : STRING) : TFIELD');
  RegisterMethod('Function FIND( const NAME : STRING) : TFIELD');
  RegisterProperty('FIELDS', 'TFIELD INTEGER', iptr);
  end;
end;

procedure SIRegisterTFIELDDEFLIST(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TFLATLIST','TFIELDDEFLIST') do
  begin
  RegisterMethod('Function FIELDBYNAME( const NAME : STRING) : TFIELDDEF');
  RegisterMethod('Function FIND( const NAME : STRING) : TFIELDDEF');
  RegisterProperty('FIELDDEFS', 'TFIELDDEF INTEGER', iptr);
  end;
end;

procedure SIRegisterTFLATLIST(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TSTRINGLIST','TFLATLIST') do
  begin
  RegisterMethod('Constructor CREATE( ADATASET : TDATASET)');
  RegisterMethod('Procedure UPDATE');
  RegisterProperty('DATASET', 'TDATASET', iptr);
  end;
end;

procedure SIRegisterTINDEXDEFS(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TDEFCOLLECTION','TINDEXDEFS') do
  begin
  RegisterMethod('Constructor CREATE( ADATASET : TDATASET)');
  RegisterMethod('Function ADDINDEXDEF : TINDEXDEF');
  RegisterMethod('Function FIND( const NAME : STRING) : TINDEXDEF');
  RegisterMethod('Procedure UPDATE');
  RegisterMethod('Function FINDINDEXFORFIELDS( const FIELDS : STRING) : TINDEXDEF');
  RegisterMethod('Function GETINDEXFORFIELDS( const FIELDS : STRING; CASEINSENSITIVE : BOOLEAN) : TINDEXDEF');
  RegisterMethod('Procedure ADD( const NAME, FIELDS : STRING; OPTIONS : TINDEXOPTIONS)');
  RegisterProperty('ITEMS', 'TINDEXDEF INTEGER', iptrw);
  end;
end;

procedure SIRegisterTINDEXDEF(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TNAMEDITEM','TINDEXDEF') do
  begin
  RegisterMethod('Constructor CREATE( OWNER : TINDEXDEFS; const NAME, FIELDS : STRING; OPTIONS : TINDEXOPTIONS)');
  RegisterProperty('FIELDEXPRESSION', 'STRING', iptr);
  RegisterProperty('CASEINSFIELDS', 'STRING', iptrw);
  RegisterProperty('DESCFIELDS', 'STRING', iptrw);
  RegisterProperty('EXPRESSION', 'STRING', iptrw);
  RegisterProperty('FIELDS', 'STRING', iptrw);
  RegisterProperty('OPTIONS', 'TINDEXOPTIONS', iptrw);
  RegisterProperty('SOURCE', 'STRING', iptrw);
  RegisterProperty('GROUPINGLEVEL', 'INTEGER', iptrw);
  end;
end;

procedure SIRegisterTFIELDDEFS(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TDEFCOLLECTION','TFIELDDEFS') do
  begin
  RegisterMethod('Constructor CREATE( AOWNER : TPERSISTENT)');
  RegisterMethod('Function ADDFIELDDEF : TFIELDDEF');
  RegisterMethod('Function FIND( const NAME : STRING) : TFIELDDEF');
  RegisterMethod('Procedure UPDATE');
  RegisterMethod('Procedure ADD( const NAME : STRING; DATATYPE : TFIELDTYPE; SIZE : INTEGER; REQUIRED : BOOLEAN)');
  RegisterProperty('HIDDENFIELDS', 'BOOLEAN', iptrw);
  RegisterProperty('ITEMS', 'TFIELDDEF INTEGER', iptrw);
  RegisterProperty('PARENTDEF', 'TFIELDDEF', iptr);
  end;
end;

procedure SIRegisterTFIELDDEF(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TNAMEDITEM','TFIELDDEF') do
  begin
//  RegisterMethod('Constructor CREATE( OWNER : TFIELDDEFS; const NAME : STRING; DATATYPE : TFIELDTYPE; SIZE : INTEGER; REQUIRED : BOOLEAN; FIELDNO : INTEGER)');
  RegisterMethod('Function ADDCHILD : TFIELDDEF');
  RegisterMethod('Function CREATEFIELD( OWNER : TCOMPONENT; PARENTFIELD : TOBJECTFIELD; const FIELDNAME : STRING; CREATECHILDREN : BOOLEAN) : TFIELD');
  RegisterMethod('Function HASCHILDDEFS : BOOLEAN');
  RegisterProperty('FIELDCLASS', 'TFIELDCLASS', iptr);
  RegisterProperty('FIELDNO', 'INTEGER', iptrw);
  RegisterProperty('INTERNALCALCFIELD', 'BOOLEAN', iptrw);
  RegisterProperty('PARENTDEF', 'TFIELDDEF', iptr);
  RegisterProperty('REQUIRED', 'BOOLEAN', iptrw);
  RegisterProperty('ATTRIBUTES', 'TFIELDATTRIBUTES', iptrw);
  RegisterProperty('CHILDDEFS', 'TFIELDDEFS', iptrw);
  RegisterProperty('DATATYPE', 'TFIELDTYPE', iptrw);
  RegisterProperty('PRECISION', 'INTEGER', iptrw);
  RegisterProperty('SIZE', 'INTEGER', iptrw);
  end;
end;

procedure SIRegisterTDEFCOLLECTION(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TOWNEDCOLLECTION','TDEFCOLLECTION') do
  begin
//  RegisterMethod('Constructor CREATE( ADATASET : TDATASET; AOWNER : TPERSISTENT; ACLASS : TCOLLECTIONITEMCLASS)');
  RegisterMethod('Function FIND( const ANAME : STRING) : TNAMEDITEM');
  RegisterMethod('Procedure GETITEMNAMES( LIST : TSTRINGS)');
  RegisterMethod('Function INDEXOF( const ANAME : STRING) : INTEGER');
  RegisterProperty('DATASET', 'TDATASET', iptr);
  RegisterProperty('UPDATED', 'BOOLEAN', iptrw);
  end;
end;

procedure SIRegisterTNAMEDITEM(CL: TIFPSPascalCompiler);
Begin
With RegClassS(cl,'TCOLLECTIONITEM','TNAMEDITEM') do
  begin
  RegisterProperty('NAME', 'STRING', iptrw);
  end;
end;

procedure SIRegister_DB(Cl: TIFPSPascalCompiler);
Begin
cl.AddTypeS('TFieldType', '(ftUnknown, ftString, ftSmallint, ftInteger, ftWord, ftBoolean, ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime,'+
    'ftBytes, ftVarBytes, ftAutoInc, ftBlob, ftMemo, ftGraphic, ftFmtMemo, ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor, ftFixedChar, ftWideString,'+
    'ftLargeint, ftADT, ftArray, ftReference, ftDataSet, ftOraBlob, ftOraClob, ftVariant, ftInterface, ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd)');
cl.addTypeS('TLocateOption','(loCaseInsensitive, loPartialKey)');
cl.addtypes('TLocateOptions','set of TLocateOption');
cl.addtypes('TUpdateStatus','(usUnmodified, usModified, usInserted, usDeleted)');
cl.addtypes('TUpdateStatusSet', 'set of TUpdateStatus');

    cl.addTypeS('TPARAMTYPE', 'BYTE');
RegClassS(cl,'TComponent','TDATASET');
RegClassS(cl,'TComponent','TFIELD');
RegClassS(cl,'TComponent','TFIELDDEFS');
RegClassS(cl,'TComponent','TINDEXDEFS');
RegClassS(cl, 'TComponent', 'TObjectField');
RegClassS(cl, 'TComponent', 'TDataLink');
RegClassS(cl, 'TComponent', 'TDataSource');
RegClassS(cl, 'TComponent', 'TParam');

SIRegisterTNAMEDITEM(Cl);
Cl.addTypeS('TDEFUPDATEMETHOD', 'Procedure');
SIRegisterTDEFCOLLECTION(Cl);
cl.AddConstantN('FAHIDDENCOL','LONGINT').Value.tu32 := 1;
cl.AddConstantN('FAREADONLY','LONGINT').Value.tu32 := 2;
cl.AddConstantN('FAREQUIRED','LONGINT').Value.tu32 := 4;
cl.AddConstantN('FALINK','LONGINT').Value.tu32 := 8;
cl.AddConstantN('FAUNNAMED','LONGINT').Value.tu32 := 16;
cl.AddConstantN('FAFIXED','LONGINT').Value.tu32 := 32;
cl.addTypeS('TFIELDATTRIBUTES', 'BYTE');
SIRegisterTFIELDDEF(Cl);
SIRegisterTFIELDDEFS(Cl);
cl.AddConstantN('IXPRIMARY','LONGINT').Value.tu32 := 1;
cl.AddConstantN('IXUNIQUE','LONGINT').Value.tu32 := 2;
cl.AddConstantN('IXDESCENDING','LONGINT').Value.tu32 := 4;
cl.AddConstantN('IXCASEINSENSITIVE','LONGINT').Value.tu32 := 8;
cl.AddConstantN('IXEXPRESSION','LONGINT').Value.tu32 := 16;
cl.AddConstantN('IXNONMAINTAINED','LONGINT').Value.tu32 := 32;
cl.addTypeS('TINDEXOPTIONS', 'BYTE');
SIRegisterTINDEXDEF(Cl);
SIRegisterTINDEXDEFS(Cl);
SIRegisterTFLATLIST(Cl);
SIRegisterTFIELDDEFLIST(Cl);
SIRegisterTFIELDLIST(Cl);
cl.AddConstantN('FKDATA','LONGINT').Value.tu32 := 1;
cl.AddConstantN('FKCALCULATED','LONGINT').Value.tu32 := 2;
cl.AddConstantN('FKLOOKUP','LONGINT').Value.tu32 := 4;
cl.AddConstantN('FKINTERNALCALC','LONGINT').Value.tu32 := 8;
cl.AddConstantN('FKAGGREGATE','LONGINT').Value.tu32 := 16;
cl.addTypeS('TFIELDKINDS', 'BYTE');
SIRegisterTFIELDS(Cl);
cl.AddConstantN('PFINUPDATE','LONGINT').Value.tu32 := 1;
cl.AddConstantN('PFINWHERE','LONGINT').Value.tu32 := 2;
cl.AddConstantN('PFINKEY','LONGINT').Value.tu32 := 4;
cl.AddConstantN('PFHIDDEN','LONGINT').Value.tu32 :=8;
cl.addTypeS('TPROVIDERFLAGS', 'BYTE');
cl.addTypeS('TFIELDNOTIFYEVENT', 'Procedure ( SENDER : TFIELD)');
cl.addTypeS('TFIELDGETTEXTEVENT', 'Procedure ( SENDER : TFIELD; var TEXT : S'
   +'TRING; DISPLAYTEXT : BOOLEAN)');
cl.addTypeS('TFIELDSETTEXTEVENT', 'Procedure ( SENDER : TFIELD; const TEXT :'
   +' STRING)');
cl.addTypeS('TAUTOREFRESHFLAG', '( ARNONE, ARAUTOINC, ARDEFAULT )');
SIRegisterTLOOKUPLIST(Cl);
SIRegisterTFIELD(Cl);
SIRegisterTSTRINGFIELD(Cl);
SIRegisterTWIDESTRINGFIELD(Cl);
SIRegisterTNUMERICFIELD(Cl);
SIRegisterTINTEGERFIELD(Cl);
SIRegisterTSMALLINTFIELD(Cl);
cl.addTypeS('LARGEINT', 'INT64');
SIRegisterTLARGEINTFIELD(Cl);
SIRegisterTWORDFIELD(Cl);
SIRegisterTAUTOINCFIELD(Cl);
SIRegisterTFLOATFIELD(Cl);
SIRegisterTCURRENCYFIELD(Cl);
SIRegisterTBOOLEANFIELD(Cl);
SIRegisterTDATETIMEFIELD(Cl);
SIRegisterTDATEFIELD(Cl);
SIRegisterTTIMEFIELD(Cl);
SIRegisterTBINARYFIELD(Cl);
SIRegisterTBYTESFIELD(Cl);
SIRegisterTVARBYTESFIELD(Cl);
SIRegisterTBCDFIELD(Cl);
{$IFDEF IFPS3_D6PLUS}
SIRegisterTFMTBCDFIELD(Cl);
{$ENDIF}
cl.addTypeS('TBLOBTYPE', 'BYTE');
SIRegisterTBLOBFIELD(Cl);
SIRegisterTMEMOFIELD(Cl);
SIRegisterTGRAPHICFIELD(Cl);
SIRegisterTOBJECTFIELD(Cl);
SIRegisterTADTFIELD(Cl);
SIRegisterTARRAYFIELD(Cl);
SIRegisterTDATASETFIELD(Cl);
SIRegisterTREFERENCEFIELD(Cl);
SIRegisterTVARIANTFIELD(Cl);
SIRegisterTGUIDFIELD(Cl);
cl.addTypeS('TBLOBDATA', 'STRING');
cl.AddConstantN('PTUNKNOWN','LONGINT').Value.tu32 := 1;
cl.AddConstantN('PTINPUT','LONGINT').Value.tu32 := 2;
cl.AddConstantN('PTOUTPUT','LONGINT').Value.tu32 := 4;
cl.AddConstantN('PTINPUTOUTPUT','LONGINT').Value.tu32 := 8;
cl.AddConstantN('PTRESULT','LONGINT').Value.tu32 := 16;
RegClassS(cl,'TObject','TPARAMS');
SIRegisterTPARAM(Cl);
SIRegisterTPARAMS(Cl);
cl.addTypeS('TDATAACTION', '( DAFAIL, DAABORT, DARETRY )');
cl.addTypeS('TBLOBSTREAMMODE', '( BMREAD, BMWRITE, BMREADWRITE )');
cl.addTypeS('TDATAOPERATION', 'Procedure');
cl.addTypeS('TDATASETNOTIFYEVENT', 'Procedure ( DATASET : TDATASET)');
cl.addTypeS('TDATASETERROREVENT', 'Procedure ( DATASET : TDATASET; E : TObject'
   +'; var ACTION : TDATAACTION)');
cl.addTypeS('TFILTERRECORDEVENT', 'Procedure ( DATASET : TDATASET; var ACCEP'
   +'T : BOOLEAN)');
SIRegisterTDATASET(Cl);
end;

{$IFDEF USEIMPORTER}
initialization
CIImporter.AddCallBack(@SIRegister_DB,PT_ClassImport);
{$ENDIF}
end.

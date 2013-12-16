unit formMain;

{$WARN UNIT_PLATFORM OFF}
{ $DEFINE UNIOFF}

interface

uses
//  RichEdit,
  VarLord, FormPosition,
  StrUtils, TntDialogs, Functions, General, TreeViewHandle,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, VirtualTrees, ComCtrls, Mask,
  USubtitlesFunctions, MiMenu, USubtitleAPI, IniFiles,
  ToolWin, MiSubtitulo, ImgList, VideoPreview, DirectShow9, ShellAPI, {MiHint, } // removed due to lost MiHint.pas
  FileTypes, NFormSizing, FastStrings, InfoErrorsFunctions, ClipBrd, URLMon,
  SWSeekBar, SWButton, USSpeller, Undo, SWTimeCounter, StrMan, ShortCuts,
  TimeMaskEdit, VTInPlaceEdition, FileCtrl, IFPS3CompExec, ifpsComp, ifps3,
  ifpii_controls, ifpii_std, ifpii_classes, ifpii_graphics, ifpii_forms,
  ifpii_stdctrls, ifpii_extctrls, ifpii_menus, ifpiir_controls, ifpiir_std,
  ifpiir_classes, ifpiir_graphics, ifpiir_forms, ifpiir_stdctrls,
  ifpiir_extctrls, ifpiir_menus, ifpidateutils, ifpidateutilsr, TntStdCtrls,
  RZNEdit, TntComCtrls;

type
  TTagClass = (tagBold, tagItalic, tagUnderline, tagColor, tagOff, tagBoldRemove, tagItalicRemove, tagUnderlineRemove, tagColorRemove);

  TExtRichEdit = Class(TRichEdit)
  public
    property OnDblClick;
  end;

  TfrmMain = class(TForm)
    mnuMain: TMainMenu;
    mnuFile: TMenuItem;
    mnuNewSubtitle: TMenuItem;
    mnuLoad: TMenuItem;
    mnuLoadOriginal: TMenuItem;
    mnuLoadTranslated: TMenuItem;
    mnuLoadSubtitle: TMenuItem;
    mnuRecent: TMenuItem;
    N10: TMenuItem;
    mnuClearList: TMenuItem;
    N5: TMenuItem;
    mnuTranslatorSave: TMenuItem;
    mnuSaveOriginal: TMenuItem;
    mnuSaveTranslated: TMenuItem;
    N12: TMenuItem;
    mnuSaveOriginalAs: TMenuItem;
    mnuSaveTranslatedAs: TMenuItem;
    mnuSaveFile: TMenuItem;
    mnuSaveFileAs: TMenuItem;
    N1: TMenuItem;
    mnuClose: TMenuItem;
    mnuExit: TMenuItem;
    mnuEdit: TMenuItem;
    mnuInsertSubtitle: TMenuItem;
    mnuRemoveSelected: TMenuItem;
    N18: TMenuItem;
    mnuCut: TMenuItem;
    mnuCopy: TMenuItem;
    mnuPaste: TMenuItem;
    N3: TMenuItem;
    mnuSelectAll: TMenuItem;
    N13: TMenuItem;
    mnuTimings: TMenuItem;
    mnuSetDurationLimits: TMenuItem;
    mnuSetDelay: TMenuItem;
    mnuAdjustSubtitles: TMenuItem;
    N16: TMenuItem;
    mnuReverseText: TMenuItem;
    mnuSort: TMenuItem;
    mnuTranslatorMode: TMenuItem;
    mnuSearch: TMenuItem;
    mnuSubSearch: TMenuItem;
    mnuFindNext: TMenuItem;
    mnuSearchAndReplace: TMenuItem;
    N6: TMenuItem;
    mnuGoToLineNumber: TMenuItem;
    mnuTools: TMenuItem;
    mnuBatchConvert: TMenuItem;
    N2: TMenuItem;
    mnuSplitSubtitle: TMenuItem;
    mnuJoinSubtitle: TMenuItem;
    N11: TMenuItem;
    mnuInformationAndErrors: TMenuItem;
    mnuAddFPSfromAVI: TMenuItem;
    N7: TMenuItem;
    mnuExternalPreview: TMenuItem;
    mnuZeroFunction: TMenuItem;
    mnuMovie: TMenuItem;
    mnuOpenMovie: TMenuItem;
    mnuCloseMovie: TMenuItem;
    N14: TMenuItem;
    mnuVideoPreviewMode: TMenuItem;
    N9: TMenuItem;
    mnuPlayPause: TMenuItem;
    mnuStop: TMenuItem;
    N15: TMenuItem;
    mnuBack5Sec: TMenuItem;
    mnuFwd5Sec: TMenuItem;
    mnuSettings: TMenuItem;
    mnuSubSettings: TMenuItem;
    mnuOutputSettings: TMenuItem;
    N4: TMenuItem;
    mnuLanguage: TMenuItem;
    mnuHelp: TMenuItem;
    mnuHelpOfProgram: TMenuItem;
    mnuAboutSubtitleWorkshop: TMenuItem;
    N8: TMenuItem;
    mnuCheckForNewVersion: TMenuItem;
    pnlControl: TPanel;
    lblMode: TLabel;
    lblFPS: TLabel;
    lblInputFPS: TLabel;
    lblWorkWith: TLabel;
    cmbMode: TComboBox;
    cmbFPS: TComboBox;
    cmbInputFPS: TComboBox;
    rdoDuration: TRadioButton;
    rdoFinalTime: TRadioButton;
    rdoBoth: TRadioButton;
    lblText: TLabel;
    lblDuration: TLabel;
    lblHide: TLabel;
    lblShow: TLabel;
    MiMenu: TMiMenu;
    dlgLoadFile: TOpenDialog;
    tmrVideo: TTimer;
    lblTranslation: TLabel;
    N17: TMenuItem;
    mnuSubtitleToDisplay: TMenuItem;
    mnuDisplayOriginal: TMenuItem;
    mnuDisplayTranslation: TMenuItem;
    mnuPlayback: TMenuItem;
    mnuVidSubtitles: TMenuItem;
    mnuSetStartTime: TMenuItem;
    mnuSetFinalTime: TMenuItem;
    N19: TMenuItem;
    mnuStartSubtitle: TMenuItem;
    mnuEndSubtitle: TMenuItem;
    mnuSubtitles: TMenuItem;
    mnuCombineSubtitles: TMenuItem;
    mnuSmartLineAdjust: TMenuItem;
    cmbOrgCharset: TComboBox;
    cmbTransCharset: TComboBox;
    mnuAddSyncPoint: TMenuItem;
    mnuLoadProject: TMenuItem;
    N20: TMenuItem;
    mnuSaveProject: TMenuItem;
    N21: TMenuItem;
    mnuTranslation: TMenuItem;
    N22: TMenuItem;
    mnuSwap: TMenuItem;
    N23: TMenuItem;
    mnuExtendLength: TMenuItem;
    mnuStylePopup: TPopupMenu;
    mnuBold: TMenuItem;
    mnuItalic: TMenuItem;
    mnuUnderline: TMenuItem;
    mnuTexts: TMenuItem;
    mnuConvertCase: TMenuItem;
    N24: TMenuItem;
    mnuUnbreakSubtitles: TMenuItem;
    N25: TMenuItem;
    mnuSetColor: TMenuItem;
    dlgColor: TColorDialog;
    mnuRemoveColorTags: TMenuItem;
{    MiHint: TMiHint; } // removed due to lost source of MiHint.pas
    tmrSaveWork: TTimer;
    N26: TMenuItem;
    mnuReadTimesFromFile: TMenuItem;
    N27: TMenuItem;
    mnuReadTextsFromFile: TMenuItem;
    mnuAdjustToSyncSubs: TMenuItem;
    mnuRightToLeft: TMenuItem;
    mnuFixPunctuation: TMenuItem;
    NFormSizing: TNFormSizing;
    mnuAdjust: TMenuItem;
    mnuTimeExpanderReducer: TMenuItem;
    mnuPlaybackRate: TMenuItem;
    mnu50P: TMenuItem;
    mnu60P: TMenuItem;
    mnu70P: TMenuItem;
    mnu80P: TMenuItem;
    mnu90P: TMenuItem;
    mnu100P: TMenuItem;
    imgLstMenu: TImageList;
    mnuInfoErrors: TMenuItem;
    N28: TMenuItem;
    mnuRecheckErrors: TMenuItem;
    mnuFixAllErrors: TMenuItem;
    N29: TMenuItem;
    mnuJumpToNextError: TMenuItem;
    mnuInfoErrorsSettings: TMenuItem;
    N30: TMenuItem;
    mnuDeleteUnnecessaryLinks: TMenuItem;
    mnuDivideLines: TMenuItem;
    mnuRewind: TMenuItem;
    N31: TMenuItem;
    mnuForward: TMenuItem;
    mnuSpellCheck: TMenuItem;
    N32: TMenuItem;
    USSpellCheck: TUSSpell;
    mnuSetMaxLineLength: TMenuItem;
    mnuInsertBefore: TMenuItem;
    N33: TMenuItem;
    mnuMarkSelectedSubs: TMenuItem;
    mnuUnMarkSelectedSubs: TMenuItem;
    mnuFixErrorsInSelSubs: TMenuItem;
    mnuAutomaticDurations: TMenuItem;
    mnuSAMILangExtractor: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    mnuMoveSubtitle: TMenuItem;
    mnuVariousInformation: TMenuItem;
    mnuSubDblClick: TMenuItem;
    mnuJumpToNextLine: TMenuItem;
    mnuJumpToPrevLine: TMenuItem;
    mnuShowLeftPanel: TMenuItem;
    pnlParent2: TPanel;
    pnlParent1: TPanel;
    spSplitter: TSplitter;
    lstSubtitles: TVirtualStringTree;
    mnuEffects: TMenuItem;
    mnuTypeEffect: TMenuItem;
    mnuFlash: TMenuItem;
    mnuFastFlash: TMenuItem;
    mnuMediumFlash: TMenuItem;
    mnuSlowFlash: TMenuItem;
    N37: TMenuItem;
    mnuShowTimeControls: TMenuItem;
    mnuOCRScripts: TMenuItem;
    mnuShiftPlusMS: TMenuItem;
    mnuShiftLessMS: TMenuItem;
    mnuShiftMoreMSShow: TMenuItem;
    mnuShiftLessMSShow: TMenuItem;
    mnuShiftMoreMSHide: TMenuItem;
    mnuShiftLessMSHide: TMenuItem;
    mnuMovieInfo: TMenuItem;
    mnuFastDivideLines: TMenuItem;
    tmeShow: TTimeMaskEdit;
    tmeHide: TTimeMaskEdit;
    tmeDuration: TTimeMaskEdit;
    mnuSaveMediaStartupFile: TMenuItem;
    mnuSaveASX: TMenuItem;
    mnuSaveSMIL: TMenuItem;
    N34: TMenuItem;
    mnuUndo: TMenuItem;
    mnuRedo: TMenuItem;
    mnuPascalScripts: TMenuItem;
    psCompExec: TIFPS3CompExec;
    mnu40P: TMenuItem;
    mnu30P: TMenuItem;
    mnu20P: TMenuItem;
    mnu10P: TMenuItem;
    mnuSynchronization: TMenuItem;
    N38: TMenuItem;
    mnuFirstSyncPoint: TMenuItem;
    mnuLastSyncPoint: TMenuItem;
    cmbOCRScripts: TComboBox;
    mnuShowInMainForm: TMenuItem;
    N39: TMenuItem;
    mnuUseInPlaceEdition: TMenuItem;
    mnuShowSubtitles: TMenuItem;
    mnu150P: TMenuItem;
    mnu200P: TMenuItem;
    mnu400P: TMenuItem;
    mnu300P: TMenuItem;
    mnuJumpToNextSub: TMenuItem;
    mnuJumpToPrevSub: TMenuItem;
    lblCPS: TLabel;
    pnlVolume: TPanel;
    pnlVideo: TPanel;
    pnlVideoControls: TPanel;
    sbSeekBar: TSWSeekBar;
    btnPause: TSWButton;
    btnPlay: TSWButton;
    btnStop: TSWButton;
    btnRew: TSWButton;
    btnForward: TSWButton;
    btnAlterPlaybackRate: TSWButton;
    btnSetStartTime: TSWButton;
    btnSetFinalTime: TSWButton;
    btnStartSubtitle: TSWButton;
    btnEndSubtitle: TSWButton;
    btnAddSyncPoint: TSWButton;
    btnScrollList: TSWButton;
    btnPrevSub: TSWButton;
    btnNextSub: TSWButton;
    tcTimeCounter: TSWTimeCounter;
    btnMoveSubtitle: TSWButton;
    btnSyncPoint1: TSWButton;
    btnSyncPoint2: TSWButton;
    subSubtitle: TMiSubtitulo;
    scrVolume: TScrollBar;
    mdtTranslationCPS: TRealEdit;
    mdtSubtitleCPS: TRealEdit;
    pnlVideoDisplay: TPanel;
    imgSubsGraph: TImage;
    Image1: TImage;
    N40: TMenuItem;
    mmoSubtitleText: TRichEdit;
    mmoTranslation: TRichEdit;
    N41: TMenuItem;
    mnuSetTagItalic: TMenuItem;
    mnuSetTagBold: TMenuItem;
    mnuSetTagUnderline: TMenuItem;
    mnuSetTagColor: TMenuItem;
    procedure lstSubtitlesInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure lstSubtitlesFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure lstSubtitlesGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure lstSubtitlesGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    procedure FormCreate(Sender: TObject);
    procedure spSplitterMoved(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mnuVideoPreviewModeClick(Sender: TObject);
    procedure mnuCloseClick(Sender: TObject);
    procedure mnuLoadSubtitleClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mnuFileClick(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuClearListClick(Sender: TObject);
    procedure lstSubtitlesFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
    procedure lstSubtitlesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mnuOpenMovieClick(Sender: TObject);
    procedure mnuCloseMovieClick(Sender: TObject);
    procedure tmrVideoTimer(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure mnuPlayPauseClick(Sender: TObject);
    procedure mnuStopClick(Sender: TObject);
    procedure mnuMovieClick(Sender: TObject);
    procedure mnuSubSettingsClick(Sender: TObject);
    procedure rdoDurationClick(Sender: TObject);
    procedure rdoFinalTimeClick(Sender: TObject);
    procedure rdoBothClick(Sender: TObject);
    procedure mnuSaveFileClick(Sender: TObject);
    procedure mnuGoToLineNumberClick(Sender: TObject);
    procedure mnuTranslatorModeClick(Sender: TObject);
    procedure mnuLoadOriginalClick(Sender: TObject);
    procedure mnuLoadTranslatedClick(Sender: TObject);
    procedure mnuSaveTranslatedClick(Sender: TObject);
    procedure mnuSaveFileAsClick(Sender: TObject);
    procedure mnuSaveTranslatedAsClick(Sender: TObject);
    procedure mmoTranslationChange(Sender: TObject);
    procedure mmoSubtitleTextChange(Sender: TObject);
    procedure lstSubtitlesDblClick(Sender: TObject);
    procedure mnuDisplayOriginalClick(Sender: TObject);
    procedure mnuDisplayTranslationClick(Sender: TObject);
    procedure lstSubtitlesPaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure btnSetStartTimeClick(Sender: TObject);
    procedure btnSetFinalTimeClick(Sender: TObject);
    procedure btnStartSubtitleClick(Sender: TObject);
    procedure btnEndSubtitleClick(Sender: TObject);
    procedure mnuInsertSubtitleClick(Sender: TObject);
    procedure mnuRemoveSelectedClick(Sender: TObject);
    procedure lstSubtitlesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lstSubtitlesMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnuCutClick(Sender: TObject);
    procedure mnuCopyClick(Sender: TObject);
    procedure mnuPasteClick(Sender: TObject);
    procedure mnuZeroFunctionClick(Sender: TObject);
    procedure mnuSortClick(Sender: TObject);
    procedure mnuReverseTextClick(Sender: TObject);
    procedure mnuSetStartTimeClick(Sender: TObject);
    procedure mnuSetFinalTimeClick(Sender: TObject);
    procedure mnuStartSubtitleClick(Sender: TObject);
    procedure mnuEndSubtitleClick(Sender: TObject);
    procedure mnuCombineSubtitlesClick(Sender: TObject);
    procedure mnuSmartLineAdjustClick(Sender: TObject);
    procedure mnuNewSubtitleClick(Sender: TObject);
    procedure btnAddSyncPointClick(Sender: TObject);
    procedure mnuSelectAllClick(Sender: TObject);
    procedure mnuBack5SecClick(Sender: TObject);
    procedure mnuFwd5SecClick(Sender: TObject);
    procedure mnuSetDurationLimitsClick(Sender: TObject);
    procedure mnuEditClick(Sender: TObject);
    procedure mnuSetDelayClick(Sender: TObject);
    procedure mnuAdjustSubtitlesClick(Sender: TObject);
    procedure mnuSubSearchClick(Sender: TObject);
    procedure mnuSearchClick(Sender: TObject);
    procedure mnuFindNextClick(Sender: TObject);
    procedure mnuSearchAndReplaceClick(Sender: TObject);
    procedure mnuLoadProjectClick(Sender: TObject);
    procedure mnuSaveProjectClick(Sender: TObject);
    procedure mnuBatchConvertClick(Sender: TObject);
    procedure mnuSwapClick(Sender: TObject);
    procedure mnuExtendLengthClick(Sender: TObject);
    procedure mnuSplitSubtitleClick(Sender: TObject);
    procedure mnuBoldClick(Sender: TObject);
    procedure mnuItalicClick(Sender: TObject);
    procedure mnuUnderlineClick(Sender: TObject);
    procedure mnuStylePopupPopup(Sender: TObject);
    procedure mnuConvertCaseClick(Sender: TObject);
    procedure mnuUnbreakSubtitlesClick(Sender: TObject);
    procedure mnuSetColorClick(Sender: TObject);
    procedure mnuRemoveColorTagsClick(Sender: TObject);
    procedure mnuToolsClick(Sender: TObject);
    procedure mnuJoinSubtitleClick(Sender: TObject);
    procedure mnuAddFPSfromAVIClick(Sender: TObject);
    procedure mnuInformationAndErrorsClick(Sender: TObject);
    procedure tmrSaveWorkTimer(Sender: TObject);
    procedure cmbInputFPSKeyPress(Sender: TObject; var Key: Char);
    procedure cmbFPSKeyPress(Sender: TObject; var Key: Char);
    procedure mnuReadTimesFromFileClick(Sender: TObject);
    procedure mnuReadTextsFromFileClick(Sender: TObject);
    procedure mnuAdjustToSyncSubsClick(Sender: TObject);
    procedure mnuFixPunctuationClick(Sender: TObject);
    procedure mnuTimeExpanderReducerClick(Sender: TObject);
    procedure mnuAboutSubtitleWorkshopClick(Sender: TObject);
    procedure mnuExternalPreviewClick(Sender: TObject);
    procedure mnuOutputSettingsClick(Sender: TObject);
    procedure pnlVideoDisplayClick(Sender: TObject);
    procedure subSubtitleClick(Sender: TObject);
    procedure mnu10PClick(Sender: TObject);
    procedure mnu20PClick(Sender: TObject);
    procedure mnu30PClick(Sender: TObject);
    procedure mnu40PClick(Sender: TObject);
    procedure mnu50PClick(Sender: TObject);
    procedure mnu60PClick(Sender: TObject);
    procedure mnu70PClick(Sender: TObject);
    procedure mnu80PClick(Sender: TObject);
    procedure mnu90PClick(Sender: TObject);
    procedure mnu100PClick(Sender: TObject);
    procedure mnu150PClick(Sender: TObject);
    procedure mnu200PClick(Sender: TObject);
    procedure mnu300PClick(Sender: TObject);
    procedure mnu400PClick(Sender: TObject);
    procedure mnuRecheckErrorsClick(Sender: TObject);
    procedure mnuJumpToNextErrorClick(Sender: TObject);
    procedure mnuFixAllErrorsClick(Sender: TObject);
    procedure mnuInfoErrorsSettingsClick(Sender: TObject);
    procedure cmbOrgCharsetSelect(Sender: TObject);
    procedure cmbTransCharsetSelect(Sender: TObject);
    procedure cmbModeSelect(Sender: TObject);
    procedure cmbInputFPSSelect(Sender: TObject);
    procedure cmbFPSSelect(Sender: TObject);
    procedure mnuDeleteUnnecessaryLinksClick(Sender: TObject);
    procedure mnuCheckForNewVersionClick(Sender: TObject);
    procedure mnuDivideLinesClick(Sender: TObject);
    procedure sbSeekBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbSeekBarMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbSeekBarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnAlterPlaybackRateClick(Sender: TObject);
    procedure mnuRewindClick(Sender: TObject);
    procedure mnuForwardClick(Sender: TObject);
    procedure btnScrollListClick(Sender: TObject);
    procedure mnuSpellCheckClick(Sender: TObject);
    procedure btnRewMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnForwardMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mnuHelpOfProgramClick(Sender: TObject);
    procedure tmrSeekRewFFTimer(Sender: TObject);
    procedure btnRewMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnForwardMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mnuSetMaxLineLengthClick(Sender: TObject);
    procedure mnuInsertBeforeClick(Sender: TObject);
    procedure mnuMarkSelectedSubsClick(Sender: TObject);
    procedure mnuUnMarkSelectedSubsClick(Sender: TObject);
    procedure mnuFixErrorsInSelSubsClick(Sender: TObject);
    procedure mnuAutomaticDurationsClick(Sender: TObject);
    procedure mnuSAMILangExtractorClick(Sender: TObject);
    procedure btnPrevSubClick(Sender: TObject);
    procedure btnNextSubClick(Sender: TObject);
    procedure btnMoveSubtitleClick(Sender: TObject);
    procedure mnuMoveSubtitleClick(Sender: TObject);
    procedure mnuVariousInformationClick(Sender: TObject);
    procedure mnuSubDblClickClick(Sender: TObject);
    procedure mnuJumpToNextLineClick(Sender: TObject);
    procedure mnuJumpToPrevLineClick(Sender: TObject);
    procedure mnuShowLeftPanelClick(Sender: TObject);
    procedure mnuTypeEffectClick(Sender: TObject);
    procedure mnuFastFlashClick(Sender: TObject);
    procedure mnuMediumFlashClick(Sender: TObject);
    procedure mnuSlowFlashClick(Sender: TObject);
    procedure mnuShowTimeControlsClick(Sender: TObject);
    procedure mnuShiftPlusMSClick(Sender: TObject);
    procedure mnuShiftLessMSClick(Sender: TObject);
    procedure mnuMovieInfoClick(Sender: TObject);
    procedure mnuFastDivideLinesClick(Sender: TObject);
    procedure mnuAddSyncPointClick(Sender: TObject);
    procedure tmeShowTimeChangeFromEditOnly(Sender: TObject; NewTime: Cardinal);
    procedure tmeHideTimeChangeFromEditOnly(Sender: TObject; NewTime: Cardinal);
    procedure tmeDurationTimeChangeFromEditOnly(Sender: TObject; NewTime: Cardinal);
    procedure lstSubtitlesCreateEditor(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; out EditLink: IVTEditLink);
    procedure lstSubtitlesEditing(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
    procedure mnuSaveASXClick(Sender: TObject);
    procedure mnuSaveSMILClick(Sender: TObject);
    procedure mnuUndoClick(Sender: TObject);
    procedure mnuRedoClick(Sender: TObject);
    procedure psCompExecCompile(Sender: TIFPS3CompExec);
    procedure psCompExecExecute(Sender: TIFPS3CompExec);
    procedure psCompExecCompImport(Sender: TObject; x: TIFPSPascalCompiler);
    procedure psCompExecExecImport(Sender: TObject; se: TIFPSExec; x: TIFPSRuntimeClassImporter);
    procedure psCompExecAfterExecute(Sender: TIFPS3CompExec);
    procedure btnSyncPoint1Click(Sender: TObject);
    procedure btnSyncPoint2Click(Sender: TObject);
    procedure mnuFirstSyncPointClick(Sender: TObject);
    procedure mnuLastSyncPointClick(Sender: TObject);
    procedure cmbOCRScriptsSelect(Sender: TObject);
    procedure mnuShowInMainFormClick(Sender: TObject);
    procedure mnuUseInPlaceEditionClick(Sender: TObject);
    procedure mnuShowSubtitlesClick(Sender: TObject);
    procedure mnuJumpToNextSubClick(Sender: TObject);
    procedure mnuJumpToPrevSubClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lstSubtitlesGetHint(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var LineBreakStyle: TVTTooltipLineBreakStyle; var HintText: WideString);
    procedure FormActivate(Sender: TObject);
    procedure scrVolumeChange(Sender: TObject);
    procedure mdtTranslationCPSKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mdtSubtitleCPSKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mmoTranslationKeyPress(Sender: TObject; var Key: Char);
    procedure mmoSubtitleTextKeyPress(Sender: TObject; var Key: Char);
    procedure lstSubtitlesKeyPress(Sender: TObject; var Key: Char);
    procedure mnuShiftMoreMSShowClick(Sender: TObject);
    procedure mnuShiftLessMSShowClick(Sender: TObject);
    procedure mnuShiftMoreMSHideClick(Sender: TObject);
    procedure mnuShiftLessMSHideClick(Sender: TObject);
    procedure ProcessRE(re : TRichEdit; TextCol, TagCol: TColor);
    procedure HighlightTags(IsSubtitleText: Boolean);
    procedure mnuSetTagBoldClick(Sender: TObject);
    procedure mnuSetTagItalicClick(Sender: TObject);
    procedure mnuSetTagUnderlineClick(Sender: TObject);
    procedure mnuSetTagColorClick(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure GoToLineNumber(Line : Integer);
    function GetCPSColor(const CPS: Real): TColor;
    procedure RepaintSubGraph();
    procedure ShiftTimes(ShowShift: Integer; HideShift: Integer);
    procedure SetPartialTag(const OTag, CTag: String);
  private
    procedure ReadString(var Msg: TWMCOPYDATA); message WM_COPYDATA;
    procedure GetLangs;
    procedure GetOCRScripts;
    procedure GetPascalScripts;
    procedure mnuLanguageClick(Sender: TObject);
    procedure mnuOCRScriptClick(Sender: TObject);
    procedure mnuPascalScriptClick(Sender: TObject);
    procedure SetLanguage(LangFile: String);
    procedure AppExeption(Sender: TObject; E: Exception);
    procedure DroppedFile(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure SetCurrentVolume;
    procedure SetUndoTimeChange(Start : Boolean);
    procedure ProcessTag(Tag : TTagClass; WholeSubtitle: Boolean; Color: TColor = clBlack);
    procedure RichDblClick(Sender: TObject);
    function GetOrgModified(): Boolean;
    function GetTransModified(): Boolean;
    procedure SetTransModified(const Value: Boolean);
    procedure SetOrgModified(const Value: Boolean);
    procedure CMDialogKey(var Msg: TCMDialogKey); message CM_DIALOGKEY;   // tab testing
  public
    Vars : TVarLord;
    FormPos : TFormPosition;
    FormatType     : (ftTime, ftFrames);
    ActualLangFile : String;
    // -----------------//
    //   Loaded files   //
    // -----------------//
    OrgFile       : String;
    OrgFormat     : Integer;
    OrgFileModified   : Boolean;
    TransFile     : String;
    TransFormat   : Integer;
    TransFileModified : Boolean;
    OldInputFPS   : Single;
    OldFPS        : Single;
    MovieFile     : String;
    // -------------------------//
    // Global boolean variables //
    // -------------------------//
    ConfirmDelete     : Boolean; // Confirm when deleting subtitles
    InvalidFPlainText : Boolean; // Interpret invalid files as plain text
    AutoSearchMovie   : Boolean; // Autosearch for movie
    ForceWorkWithTime : Boolean; // Force working in time mode
    KeepOrderOfLines  : Boolean; // Keep order of lines when reverse text
    SelTextNL         : Boolean; // Select text on jump to next line
    SelTextPL         : Boolean; // Select text on jump to previous line
    AskToSave         : Boolean; // Ask to save on exit program/close subtitle
    SaveAsBackup      : Boolean; // Save as backup
    MarkUntransSubs   : Boolean; // Mark untranslated subtitles
    ApplyStyleInList  : Boolean; // Apply style to subtitles in the list
    ScrollList        : Boolean; // Scroll list to current subtitle

    // ------------------------
    RFMaxCount : Integer; // Max. number of recent files
    // --------------//
    // Video Preview //
    // --------------//
//    pnlVideoHeight  : Integer; // Height of the video panel
    BackgroundColor : Integer; // Background color of subtitles
    TransparentSubs : Boolean; // Transparent subtitles
    ForceUsingReg   : Boolean; // Force transparency using regions
    MovieFPS        : Double;  // FPS of the movie
    OnDoubleClick   : Byte;    // Action when double click in a subtitle and we are in video preview mode
    OnShiftDblClick : Byte;    // Action when shift-double click in a subtitle and we are in video preview mode
    SecsToJump1     : Byte;    // Seconds to jump on double click
    SecsToJump2     : Byte;    // Seconds to jump on shift-double click
    RewFFTime       : Integer; // Time to rewind/forward
    DefAltPlayRate  : TRateClass; // Default altered playback rate
    // For the Rew and FF buttons
    tmrSeekRewFF : TTimer;
    Seeking      : Boolean;
    PreviewSubPosition : Byte;
    PlayOnLoad   : Boolean;    // Play video after load
    // ----------------//
    // Synchronization //
    // ----------------//
    FirstDialogInVideo : Integer;
    LastDialogInVideo  : Integer;
    SyncPointsArray    : array of TSyncPoint;
    // -------------------//
    //  Search & Replace  //
    // -------------------//
    SearchWord      : String; // String to use with "Find next" menu
    CaseSensitive   : Boolean;
    MatchWholeWords : Boolean;
    // ---------//
    //  Others  //
    // ---------//
    UnTransSubsColor     : Integer;
    OrgCharset           : Integer;
    TransCharset         : Integer;
    AdjustFormOpened     : Boolean;
    InfoErrorsFormOpened : Boolean;
    frmSaveAsExecuting: Boolean;
    // ----------
    procedure UpdateRFMenus;
    procedure RefreshTimes;
    procedure AddToRecent(const FileName: String);
    procedure RFMenuClick(Sender: TObject);
    procedure EnableCtrls(const Flag: boolean);
    procedure SetTranslationCtrlsPositions;
    property OrgModified: Boolean read GetOrgModified write SetOrgModified;
    property TransModified: Boolean read GetTransModified write SetTransModified;
  end;

var
  frmMain          : TfrmMain;
  InterfaceEnabled : Boolean;
  RFMenuItems      : array[0..20] of TMenuItem;
  CurrRewOrFF      : Boolean;
  tmrRewFF         : TTimer;
  // Go to line number...
  GoToLineNum  : String;
  EnterLineNum : String;
  // Language strings
  LabelText         : String;
  LabelTranslation  : String;
  TransLeftLines    : String;
  TextOrTransLength : String;
  ManualFile        : String;
  SelectOutputDir   : String;
  ID_PLAINTEXT      : String;
  ID_STPROJECT      : String;
  ID_SRF            : String;
  ShiftMS           : String;
  ShiftMSShow       : String;
  ShiftMSHide       : String;
  // Recent files
  RecentFiles : TStringList;
  // Translator mode
  UntranslatedSub : String;
  // ---------------
  SyncPoint: TClassicSyncPoints;

implementation

uses formSettings, formSaveAs, formDurationLimits, formAdjustSubtitles,
  formSetDelay, formSearchAndReplace, formBatchConvert, formSplit,
  formConvertCase, formJoin, formTimeExpanderReducer, formAbout,
  formOutputSettings, formInfoErrors, formInfoErrorsSettings,
  formDivideLines, formAutomaticDurations, formSAMILangExtractor,
  formVariousInfo;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmMain.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WinClassName := 'SubtitleWorkshop';
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.ReadString(var Msg: TWMCOPYDATA);
begin
  CommandLineProcess(PChar(String(Msg.CopyDataStruct.lpData)));
  if IsIconic(Application.Handle) = True then
    Application.Restore else
    Application.BringToFront;
end;

// ---------------------------------------------------------------------------//
//                                                                            //
//                      VirtualTreeView Handle Functions                      //
//                                                                            //
// ---------------------------------------------------------------------------//

procedure TfrmMain.lstSubtitlesInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  Data: PSubtitleItem;
begin
  if Assigned(Node) then
  begin
    Data             := Sender.GetNodeData(Node);
    Data.InitialTime := 0;
    Data.FinalTime   := 0;
    Data.Text        := '';
    Data.Translation := '';
    Data.ErrorType   := [];
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PSubtitleItem;
begin
  Data             := Sender.GetNodeData(Node);
  Data.InitialTime := 0;
  Data.FinalTime   := 0;
  Data.Text        := '';
  Data.Translation := '';
  Data.Marked      := False;
  Data.ErrorType   := [];
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TSubtitleItem);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
var
  Data: PSubtitleItem;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
  begin
    case Column of
      0: CellText := IntToStr(Node.Index+1);
      1:
        begin
          if frmMain.FormatType = ftTime then
            CellText := TimeToString(Data.InitialTime) else
            CellText := IntToStr(TimeToFrames(Data.InitialTime, GetInputFPS));
        end;
      2:
        begin
          if frmMain.FormatType = ftTime then
            CellText := TimeToString(Data.FinalTime) else
            CellText := IntToStr(TimeToFrames(Data.FinalTime, GetInputFPS));
        end;
      3: CellText := {$IFDEF UTF8}ReplaceEnters(Data.Text, '|'){$ELSE}StringToWideStringEx(ReplaceEnters(Data.Text, '|'), CharsetToCodePage(OrgCharset)){$ENDIF};
      4: CellText := {$IFDEF UTF8}ReplaceEnters(Data.Text, '|'){$ELSE}StringToWideStringEx(ReplaceEnters(Data.Translation, '|'), CharsetToCodePage(TransCharset)){$ENDIF};
    end;
  end;
end;

// ---------------------------------------------------------------------------//
//                                                                            //
//                             Handle exceptions                              //
//                                                                            //
// ---------------------------------------------------------------------------//

procedure TfrmMain.AppExeption(Sender: TObject; E: Exception);
begin
  if MsgBox(Format(ErrorMsg[02],[E.ClassName, Sender.ClassName, (Sender as TComponent).Name, E.Message, ID_EMAIL]), BTN_OK, BTN_CANCEL, '', MB_ICONERROR, frmMain) = 2 then
    Application.Terminate;
end;

// ---------------------------------------------------------------------------//
//                                                                            //
//                      Language file related procedures                      //
//                                                                            //
// ---------------------------------------------------------------------------//

procedure TfrmMain.SetLanguage(LangFile: String);
var
  LF  : TIniFile;
  tmp :  String;
begin
  if ExtractFileExt(LangFile) <> '.lng' then
    LangFile := LangFile + '.lng';
  LangFile := ExtractFilePath(Application.ExeName) + 'Langs\' + LangFile;

  ActualLangFile := LangFile;
  LF := TIniFile.Create(LangFile);
  try
    Vars.UILanguage := Copy(ExtractFileName(ActualLangFile), 0, Length(ExtractFileName(ActualLangFile))-4);

    With LF do
    begin
//{$IFNDEF UNIOFF}
      frmMain.Font.Charset      := ReadInteger('General', 'Font charset', 0);
      tcTimeCounter.FontCharset := frmMain.Font.Charset;
//{$ENDIF}
      tcTimeCounter.Text4       := ReadString('General', 'FPS', 'FPS');
      ID_PLAINTEXT              := ReadString('General', 'PlainText', 'Plain Text') + ' (*.txt)|*.txt';
      ID_STPROJECT              := ReadString('General', 'STP', 'Subtitle Translation Project');
      ID_SRF                    := ReadString('General', 'SRF', 'Subtitle Report File') + ' (*.srf)|*.srf';

      // Botones standard
      BTN_OK     := ReadString('Standard buttons', '01', '&Ok');
      BTN_CANCEL := ReadString('Standard buttons', '02', '&Cancel');
      BTN_BROWSE := ReadString('Standard buttons', '03', '&Browse');
      BTN_APPLY  := ReadString('Standard buttons', '04', '&Apply');
      BTN_EXIT   := ReadString('Standard buttons', '05', '&Exit');
      BTN_YES    := ReadString('Standard buttons', '06', '&Yes');
      BTN_NO     := ReadString('Standard buttons', '07', '&No');

      // Go to line...
      GoToLineNum  := ReadString('Go to line', '01', 'Go to line number');
      EnterLineNum := ReadString('Go to line', '02', 'Enter line number:');

      // Standard String
      AllSupportedFiles := ReadString('General', 'AllFiles', 'All supported files');

      lblMode.Caption := ReadString('Main Form', '01', 'Mode:');
      cmbMode.Clear;
      cmbMode.Items.Add(ReadString('Main Form', '02', 'Time (recommended)'));
      cmbMode.Items.Add(ReadString('Main Form', '03', 'Frames'));
      cmbMode.ItemIndex   := 0;
      lblInputFPS.Caption := ReadString('Main Form', '04', 'Input FPS:');
      lblFPS.Caption      := ReadString('Main Form', '05', 'FPS:');
      lblWorkWith.Caption := ReadString('Main Form', '06', 'Work with:');
      tmp                 := ReadString('Main Form', '07', 'Duration|Final time|Both');
      rdoDuration.Caption   := Copy(tmp, 1, Pos('|', tmp) - 1);
      rdoFinalTime.Caption  := Copy(tmp, Pos('|', tmp) + 1, SmartPos('|', tmp, True, Pos('|', tmp) + 1) - (Pos('|', tmp) + 1));
      rdoBoth.Caption       := Copy(tmp, SmartPos('|', tmp, True, Pos('|', tmp) + 1) + 1, Length(tmp));

//{$IFNDEF UNIOFF}
      lstSubtitles.Header.Columns[0].Text := StringToWideStringEx(ReadString('Main Form', '08', 'Num'), CharSetToCodePage(frmMain.Font.Charset));
      lstSubtitles.Header.Columns[1].Text := StringToWideStringEx(ReadString('Main Form', '09', 'Show'), CharSetToCodePage(frmMain.Font.Charset));
      lblShow.Caption                     := ReadString('Main Form', '09', 'Show') + ':';
      lstSubtitles.Header.Columns[2].Text := StringToWideStringEx(ReadString('Main Form', '10', 'Hide'), CharSetToCodePage(frmMain.Font.Charset));
      lblHide.Caption                     := ReadString('Main Form', '10', 'Hide') + ':';
      LabelText                           := ReadString('Main Form', '11', 'Text');
      LabelTranslation                    := ReadString('Main Form', '12', 'Translation');
      TransLeftLines                      := ReadString('Main Form', '13', '%d untranslated lines');
      lblDuration.Caption                 := ReadString('Main Form', '14', 'Duration:');
      TextOrTransLength                   := ReadString('Main Form', '15', '%s (%s characters):');
      lblCPS.Caption                      := ReadString('Main Form', '17', 'CPS:');
      lstSubtitles.Header.Columns[3].Text := StringToWideStringEx(LabelText, CharSetToCodePage(frmMain.Font.Charset));
      lstSubtitles.Header.Columns[4].Text := StringToWideStringEx(LabelTranslation, CharSetToCodePage(frmMain.Font.Charset));
//{$ELSE}
//      lstSubtitles.Header.Columns[0].Text := ReadString('Main Form', '08', 'Num');
//      lstSubtitles.Header.Columns[1].Text := ReadString('Main Form', '09', 'Show');
//      lstSubtitles.Header.Columns[2].Text := ReadString('Main Form', '10', 'Hide');
//      lblShow.Caption                     := ReadString('Main Form', '09', 'Show') + ':';
//      lblHide.Caption                     := ReadString('Main Form', '10', 'Hide') + ':';
//      LabelText                           := ReadString('Main Form', '11', 'Text');
//      LabelTranslation                    := ReadString('Main Form', '12', 'Translation');
//      TransLeftLines                      := ReadString('Main Form', '13', '%d untranslated lines');
//      lblDuration.Caption                 := ReadString('Main Form', '14', 'Duration:');
//      TextOrTransLength                   := ReadString('Main Form', '15', '%s (%s characters):');
//      lstSubtitles.Header.Columns[3].Text := LabelText;
//      lstSubtitles.Header.Columns[4].Text := LabelTranslation;
//{$ENDIF}

      UntranslatedSub := ReadString('Main Form', '16', '- Untranslated subtitle -');

      if Assigned(lstSubtitles.FocusedNode) then
        mmoSubtitleTextChange(frmMain as TObject) else
        lblText.Caption := LabelText + ':';

      if mnuTranslatorMode.Checked then
      begin
        if Assigned(lstSubtitles.FocusedNode) then
          mmoTranslationChange(frmMain as TObject) else
          lblTranslation.Caption := LabelTranslation + ':';
      end;

      // ---------------------------------------------------------------------------------------------------------------
      {$include _MainMenu}
      // ---------------------------------------------------------------------------------------------------------------
      {$include _Messages}
      // ---------------------------------------------------------------------------------------------------------------
    end;
  finally
    LF.Free;
  end;

  LF := TIniFile.Create(ExtractFilePath(Application.ExeName) + ID_ININAME);
  try
//{$IFNDEF UNIOFF}
    Font.Name := LF.ReadString('Program look', 'Font', 'Tahoma');
    Font.Size := LF.ReadInteger('Program look', 'Font size', 8);
    MiMenu.Fuente.Name         := Font.Name;
    MiMenu.Fuente.Size         := Font.Size;
    MiMenu.Fuente.Charset      := frmMain.Font.Charset;
//{$ENDIF}
    MiMenu.RefreshMenu;
//{$IFNDEF UNIOFF}
    lstSubtitles.ParentFont    := True;
    lstSubtitles.Header.Font   := Font;

    tmeShow.ParentFont         := True;
    tmeHide.ParentFont         := True;
    tmeDuration.ParentFont     := True;
    mmoSubtitleText.ParentFont := True;
    mmoTranslation.ParentFont  := True;
    mdtSubtitleCPS.ParentFont    := True;
    mdtTranslationCPS.ParentFont := True;
//{$ENDIF}

    tmeShow.Font.Style         := Font.Style + [fsBold];
    tmeHide.Font.Style         := Font.Style + [fsBold];
    tmeDuration.Font.Style     := Font.Style + [fsBold];
    mmoSubtitleText.Font.Style := Font.Style + [fsBold];
    mmoTranslation.Font.Style  := Font.Style + [fsBold];
    mmoSubtitleText.Font.Size  := Font.Size + 2;
    mmoTranslation.Font.Size   := Font.Size + 2;
    mdtSubtitleCPS.Font.Style     := Font.Style + [fsBold];
    mdtTranslationCPS.Font.Style  := Font.Style + [fsBold];
  finally
    LF.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuLanguageClick(Sender: TObject);
begin
  SetLanguage((Sender as TMenuItem).Caption);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuOCRScriptClick(Sender: TObject);
begin
  OCRDefFile := ExtractFilePath(Application.ExeName) + 'OCRScripts\' + (Sender as TMenuItem).Caption + ID_OCREXT;
  cmbOCRScripts.ItemIndex := cmbOCRScripts.Items.IndexOf(ExtractFileName(Copy(OCRDefFile, 1, Length(OCRDefFile)-4)));
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.GetLangs;
var
  Busca : TSearchRec;
  i     : Integer;
  A     : TMenuItem;
  Langs : TStringList;
begin
  Langs := TStringList.Create;
  try
    i := FindFirst(ExtractFilePath(Application.ExeName) + 'Langs\*.lng', faAnyFile, Busca);
    while i = 0 do
    begin
      Langs.Add(Copy(Busca.Name, 1, Length(Busca.Name)-4));
      i := FindNext(Busca);
    end;
    FindClose(Busca);

    Langs.Sort;
    for i := 0 to Langs.Count-1 do
    begin
      A := TMenuItem.Create(Self);
      A.Caption := Langs[i];
      A.OnClick := mnuLanguageClick;
      mnuLanguage.Add(a);
    end;
  finally
    Langs.Free;
  end;

  if mnuLanguage.Count = 0 then
  begin
    mnuLanguage.Visible := False;
    N4.Visible          := False;
  end else
  begin
    mnuLanguage.Visible := True;
    N4.Visible          := True;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.GetOCRScripts;
var
  Busca   : TSearchRec;
  i       : Integer;
  A       : TMenuItem;     
  Scripts : TStringList;
begin
  Scripts := TStringList.Create;
  try
    i := FindFirst(ExtractFilePath(Application.ExeName) + 'OCRScripts\*' + ID_OCREXT, faAnyFile, Busca);
    while i = 0 do
    begin
      Scripts.Add(Copy(Busca.Name, 1, Length(Busca.Name)-4));
      i := FindNext(Busca);
    end;
    FindClose(Busca);

    Scripts.Sort;
    for i := 0 to Scripts.Count-1 do
    begin
      A := TMenuItem.Create(Self);
      A.Caption    := Scripts[i];
      A.OnClick    := mnuOCRScriptClick;
      A.RadioItem  := True;
      A.GroupIndex := 1;
      A.AutoCheck  := True;
      mnuOCRScripts.Add(A);
    end;
    cmbOCRScripts.Items.Assign(Scripts);
  finally
    Scripts.Free;
  end;

  if mnuOCRScripts.Count = 0 then
    mnuOCRScripts.Visible := False else
    mnuOCRScripts.Visible := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.GetPascalScripts;
var
  Busca   : TSearchRec;
  i       : Integer;
  A       : TMenuItem;     
  Scripts : TStringList;
begin
  Scripts := TStringList.Create;
  try
    i := FindFirst(ExtractFilePath(Application.ExeName) + 'PascalScripts\*.pas', faAnyFile, Busca);
    while i = 0 do
    begin
      Scripts.Add(Copy(Busca.Name, 1, Length(Busca.Name)-4));
      i := FindNext(Busca);
    end;
    FindClose(Busca);

    Scripts.Sort;
    for i := 0 to Scripts.Count-1 do
    begin
      A := TMenuItem.Create(Self);
      A.Caption    := Scripts[i];
      A.OnClick    := mnuPascalScriptClick;
      mnuPascalScripts.Add(A);
    end;
  finally
    Scripts.Free;
  end;

  if mnuPascalScripts.Count = 0 then
    mnuPascalScripts.Visible := False else
    mnuPascalScripts.Visible := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.EnableCtrls(const Flag: boolean);
begin
  lblMode.Enabled         := Flag;
  cmbMode.Enabled         := Flag;
  lblFPS.Enabled          := Flag;
  cmbFPS.Enabled          := Flag;
  lblWorkWith.Enabled     := Flag;
  rdoDuration.Enabled     := Flag;
  rdoFinalTime.Enabled    := Flag;
  rdoBoth.Enabled         := Flag;
  cmbOrgCharset.Enabled   := Flag;
  cmbTransCharset.Enabled := (Flag) and (mnuTranslatorMode.Checked);

  lstSubtitles.Enabled    := Flag;
  lblShow.Enabled         := Flag;
  tmeShow.Enabled         := Flag;
  lblHide.Enabled         := Flag;
  tmeHide.Enabled         := Flag;
  lblDuration.Enabled     := Flag;
  tmeDuration.Enabled     := Flag;
  lblText.Enabled         := Flag;
  mmoSubtitleText.Enabled := Flag;
  lblCPS.Enabled          := Flag;
  mdtSubtitleCPS.Enabled  := Flag;

  if mnuTranslatorMode.Checked then
  begin
    mmoTranslation.Enabled := Flag;
    lblTranslation.Enabled := Flag;
    mdtTranslationCPS.Enabled := Flag;
  end;

  InterfaceEnabled := Flag;

  if Flag = True then
  begin
    if rdoDuration.Checked then
    begin
      lblHide.Enabled     := False;
      tmeHide.Enabled     := False;
      lblDuration.Enabled := True;
      tmeDuration.Enabled := True;
    end else
    if rdoFinalTime.Checked then
    begin
      lblHide.Enabled     := True;
      tmeHide.Enabled     := True;
      lblDuration.Enabled := False;
      tmeDuration.Enabled := False;
    end else
    if rdoBoth.Checked then
    begin
      lblHide.Enabled     := True;
      tmeHide.Enabled     := True;
      lblDuration.Enabled := True;
      tmeDuration.Enabled := True;
    end;
    if frmMain.Visible = False then
      frmMain.Show;
    lstSubtitles.SetFocus;
  end;
end;

// ---------------------------------------------------------------------------//
//                                                                            //
//                                Drag & Drop                                 //
//                                                                            //
// ---------------------------------------------------------------------------//

procedure TfrmMain.DroppedFile(var Msg: TWMDropFiles);
var
  FileName : array[0..MAX_PATH] of Char;
  Ext      : String;
begin
  try
    if DragQueryFile(Msg.Drop, 0, FileName, MAX_PATH) > 0 then
    begin
      Ext := LowerCase(ExtractFileExt(FileName));
      if (Ext = ID_STPEXT) then // Subtitle translation project
        LoadProject(FileName) else
      if (Ext = ID_SRFEXT) then // URUSoft Subtitle Report file
        LoadSRF(FileName) else
      // Video file
      if (Ext = '.asf') or (Ext = '.avi')  or (Ext = '.avs') or (Ext = '.mp4') or (Ext = '.mkv') or
         (Ext = '.divx') or (Ext = '.mp3') or (Ext = '.mpg') or (Ext = '.mpeg') or
         (Ext = '.m1v') or (Ext = '.ogg') or (Ext = '.ogm') or (Ext = '.qt') or
         (Ext = '.vob') or (Ext = '.wav') or (Ext = '.wmv') then
      begin
        if LoadMovie(FileName) = False then
          MsgBox(Format(ErrorMsg[05], [FileName]), BTN_OK, '', '', MB_ICONERROR, frmMain) else
        begin
          if mnuVideoPreviewMode.Checked = False then
            SetVideoPreviewMode(True);
        end;
      end else
      begin // Subtitle file
        if (OrgFile = '') or (mnuTranslatorMode.Checked = False) then
          LoadSubtitle(FileName, GetInputFPS) else
          LoadSubtitle(FileName, GetFPS, 0, True);
      end;
      Msg.Result := 0;
    end;
  finally
    DragFinish(Msg.Drop);
  end;
end;

// ---------------------------------------------------------------------------//
//                                                                            //
//                       Refresh times & texts function                       //
//                                                                            //
// ---------------------------------------------------------------------------//

function TfrmMain.GetCPSColor(const CPS: Real): TColor;
begin
  if cps <= Vars.CPSrange1 then
    Result := Vars.CPScolor1 else
  if cps <= Vars.CPSrange2 then
    Result := Vars.CPScolor2 else
  if cps <= Vars.CPSrange3 then
    Result := Vars.CPScolor3 else
  Result := Vars.CPScolor4;
end;

procedure TfrmMain.RefreshTimes;
var
  Data : PSubtitleItem;
  s    : Integer;
  cps  : Real;
  Dur  : Integer;
begin
  if (lstSubtitles.SelectedCount = 1) and (Assigned(lstSubtitles.FocusedNode)) and (lstSubtitles.Selected[lstSubtitles.FocusedNode]) then
  begin
    Data := lstSubtitles.GetNodeData(lstSubtitles.FocusedNode);
    if Assigned(Data) then
    begin
      s := mmoSubtitleText.SelStart;
      mmoSubtitleText.Text := Data.Text;
      mmoSubtitleText.SelStart := s;

      if mnuTranslatorMode.Checked then
      begin
        s := mmoTranslation.SelStart;
        mmoTranslation.Text := Data.Translation;
        mmoTranslation.SelStart := s;
      end;

      Dur              := Data.FinalTime - Data.InitialTime;
      tmeShow.Time     := Data.InitialTime;
      tmeHide.Time     := Data.FinalTime;
      tmeDuration.Time := Dur;

	    // 1-8 blue >8 black >18 orange >24 red
      cps := GetCharsPerMSec(Data.Text, Dur);
      mdtSubtitleCPS.Value := cps;
      mdtSubtitleCPS.Font.Color := GetCPSColor(cps);

      cps := GetCharsPerMSec(Data.Translation, Dur);
      mdtTranslationCPS.Value := cps;
      mdtTranslationCPS.Font.Color := GetCPSColor(cps);

      if FormatType = ftTime then
      begin
        tmeShow.TimeMode     := tmTime;
        tmeHide.TimeMode     := tmTime;
        tmeDuration.TimeMode := tmTime;
      end else
      begin
        tmeShow.TimeMode     := tmFrames;
        tmeHide.TimeMode     := tmFrames;
        tmeDuration.TimeMode := tmFrames;
      end;
    end;
  end else
  begin
    tmeShow.Clear;
    tmeHide.Clear;
    tmeDuration.Clear;
    mmoSubtitleText.Clear;
    lblText.Caption := LabelText + ':';
    mdtSubtitleCPS.Clear;

    if mnuTranslatorMode.Checked then
    begin
      lblTranslation.Caption := LabelTranslation + ':';
      mmoTranslation.Clear;
      mdtTranslationCPS.Clear;
    end;
  end;

  RepaintSubGraph;
end;

// ---------------------------------------------------------------------------//
//                                                                            //
//                            Recent files related                            //
//                                                                            //
// ---------------------------------------------------------------------------//

procedure TfrmMain.RFMenuClick(Sender: TObject);
var
  i   : Integer;
  Ext : String;
begin
  for i := 0 to High(RFMenuItems) do
    if RFMenuItems[i] = Sender then
    begin
      Ext := LowerCase(ExtractFileExt(RecentFiles[i]));
      if (Ext = ID_STPEXT) then // Subtitle Translation Project
        LoadProject(RecentFiles[i]) else
      begin
        if (mnuTranslatorMode.Checked) and (OrgFile <> '') then
          LoadSubtitle(RecentFiles[i], GetInputFPS, 0, True) else
          LoadSubtitle(RecentFiles[i], GetInputFPS);
      end;
      HighlightTags(True);
      HighlightTags(False);
      break;
    end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.UpdateRFMenus;
var
  i: Integer;
begin
  for i := Low(RFMenuItems) to High(RFMenuItems) do
  begin
    with RFMenuItems[i] do
    begin
      if i < RecentFiles.Count then
      begin
        if i < RFMaxCount then
        begin
          Visible := True;
          Caption := '&' + IntToStr(i+1) + ' ' + RecentFiles[i];
        end else
        begin
          Visible := False;
          Caption := '';
        end;
      end
      else
        Visible := False;
    end;
  end;
  if MiMenu.Activo then
    MiMenu.Activo := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.AddToRecent(const FileName: String);
var
  i: Integer;
begin
  for i := RecentFiles.Count-1 downto 0 do
    if AnsiCompareFileName(FileName, RecentFiles[i]) = 0 then
      RecentFiles.Delete(i);
  RecentFiles.Insert(0, FileName);
  UpdateRFMenus;
end;

// ---------------------------------------------------------------------------//
//                                                                            //
//           Form Create - Load all settings & initialize variables           //
//                                                                            //
// ---------------------------------------------------------------------------//

procedure TfrmMain.FormCreate(Sender: TObject);
  procedure SetWorkshopPos(OnTop: Integer);
  begin
    SetWindowPos(frmMain.Handle, OnTop, frmMain.Left, frmMain.Top, frmMain.Width, frmMain.Height, SWP_NOMOVE + SWP_NOSIZE);
  end;

var
  Ini       : TIniFile;
  i         : Integer;
  NewItem   : TMenuItem;
  TextAlign : TTextAlign;
begin
  // --------------------------------- //
  //      Window position & size       //
  // --------------------------------- //
  FormPos := TFormPosition.Create(frmMain,
                                  ExtractFilePath(Application.ExeName) + '\' + ID_ININAME,
                                  'Main Window',
                                  (Screen.Width div 2) - (frmMain.Width div 2),
                                  (Screen.Height div 2) - (frmMain.Height div 2),
                                  frmMain.Width{724}, frmMain.Height{405});

  TExtRichEdit(mmoSubtitleText).OnDblClick := RichDblClick;
  TExtRichEdit(mmoTranslation).OnDblClick  := RichDblClick;

  imgSubsGraph.Left := sbSeekBar.Left+6;
  imgSubsGraph.Width := sbSeekBar.Width-12;
  imgSubsGraph.Top := 0;
  imgSubsGraph.Height := 5;

  Application.OnException := AppExeption; // Procedure to handle exceptions

//  Application.OnShowHint := MiHintShowHint;

  // ---------------------------//
  //   Initialize SubtitleAPI   //
  // ---------------------------//

  Vars := TVarLord.Create(ExtractFilePath(Application.ExeName) + '\' + ID_ININAME);

  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\' + ID_ININAME);
  try
    GetLangs;
    GetPascalScripts;
    GetOCRScripts;
    SetLanguage(Vars.UILanguage);
    ReadSetShortcuts;

    // ---------------------------------//
    //    Initialize SubtitleAPI DLL    //
    // ---------------------------------//
    SubtitleAPI := TSubtitleAPI.Create(ExtractFilePath(Application.ExeName) + ID_DLLDIR + '\' +ID_DLLNAME);

    if SubtitleAPI.Initialized = False then
    begin
      MsgBox(Format(ErrorMsg[01], [ID_DLLNAME, ID_WEBPAGE, ExtractFilePath(Application.ExeName) + ID_DLLDIR]), BTN_EXIT, '', '', MB_ICONERROR, Self);
      SubtitleAPI.Free;
      Ini.Free;
      ExitProcess(0);
    end;

    // ---------------------------//
    //    Initialize variables    //
    // ---------------------------//
    Caption               := ID_PROGRAM;
    DecimalSeparator      := ',';
    OrgFile               := '';
    TransFile             := '';
    MovieFile             := '';
    SearchWord            := '';
    OldInputFPS           := 0;
    OldFPS                := 0;
    IniRoot               := ExtractFilePath(Application.ExeName) + '\' + ID_ININAME;
    FormatType            := ftTime;
    RecentFiles           := TStringList.Create;
    FirstDialogInVideo    := -1;
    LastDialogInVideo     := -1;
    sbSeekBar.Position    := 0;
    dlgLoadFile.Filter    := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
    AdjustFormOpened      := False;
    InfoErrorsFormOpened  := False;
    frmSaveAsExecuting    := False;
    SetLength(frmMain.SyncPointsArray, 0);
    EnableCtrls(False);
    AddFPS(cmbInputFPS);
    AddFPS(cmbFPS);
    // Edit boxes FPS
    OldFPS          := GetFPS;
    tmeShow.FPS     := OldFPS;
    tmeHide.FPS     := OldFPS;
    tmeDuration.FPS := OldFPS;

    AddCharsets(cmbOrgCharset);
    AddCharsets(cmbTransCharset);

    tmeShow.Clear;
    tmeHide.Clear;
    tmeDuration.Clear;
    mdtSubtitleCPS.Clear;
    mdtTranslationCPS.Clear;

    // Undo and redo lists
    UndoList        := TList.Create;
    RedoList        := TList.Create;
    mnuUndo.Enabled := False;
    mnuRedo.Enabled := False;

    mnuShowInMainForm.Checked := Ini.ReadBool('General', 'Show OCR Scripts in main form', True);

    // --------------------------------- //
    //            Recent Files           //
    // --------------------------------- //

    // We read the maximum, default value is 10
    RFMaxCount := Ini.ReadInteger('Settings','MaxRF',10);
    // Create all the menus
    for i := High(RFMenuItems) downto 0 do
    begin
      NewItem         := TMenuItem.Create(Self);
      NewItem.OnClick := RFMenuClick;
      mnuRecent.Insert(0,NewItem);
      RFMenuItems[i]  := NewItem;
    end;
    // Add recent files from ini to the TStringList
    AddRecentFiles;
    UpdateRFMenus;



    // --------------------------------- //
    //              General              //
    // --------------------------------- //

    // Read last folder
    dlgLoadFile.InitialDir := Ini.ReadString('General', 'Last folder', '');

    if Ini.ReadBool('Settings','Always on top', False) then
      SetWorkshopPos(HWND_TOPMOST) else
      SetWorkshopPos(HWND_NOTOPMOST);


    case Ini.ReadInteger('General', 'Work with', 3) of
      1: rdoDuration.Checked := True;
      2: rdoFinalTime.Checked := True else
      rdoBoth.Checked := True;
    end;

    // --------------------------------- //
    //              Charsets             //
    // --------------------------------- //
    cmbOrgCharset.ItemIndex       := Ini.ReadInteger('General', 'Original charset', 0);
    cmbTransCharset.ItemIndex     := Ini.ReadInteger('General', 'Translated charset', 0);
    OrgCharset                    := StrCharsetToInt(cmbOrgCharset.Items[cmbOrgCharset.ItemIndex]);
    TransCharset                  := StrCharsetToInt(cmbTransCharset.Items[cmbTransCharset.ItemIndex]);
//{$IFNDEF UNIOFF}
    mmoSubtitleText.Font.Charset  := OrgCharset;
    mmoTranslation.Font.Charset   := TransCharset;
//{$ENDIF}
    if Ini.ReadBool('Settings', 'Show charsets in main form', True) then
    begin
      frmMain.cmbOCRScripts.Top := 288;
      cmbOrgCharset.Show;
      cmbTransCharset.Show;
    end else
    begin
      frmMain.cmbOCRScripts.Top := frmMain.cmbOrgCharset.Top;
      cmbOrgCharset.Hide;
      cmbTransCharset.Hide;
    end;

    // --------------------------------- //
    //        Particular settings        //
    // --------------------------------- //
    ConfirmDelete        := Ini.ReadBool('Settings', 'Confirm when deleting a subtitle', False);
    InvalidFPlainText    := Ini.ReadBool('Settings', 'Interpret invalid files as plain text', False);
    AutoSearchMovie      := Ini.ReadBool('Settings', 'Autosearch for movie', True);
    ForceWorkWithTime    := Ini.ReadBool('Settings', 'Force working in time mode', False);
    KeepOrderOfLines     := Ini.ReadBool('Settings', 'Keep order of lines when reverse text', True);
    SelTextNL            := Ini.ReadBool('Settings', 'Select text on jump to next line', True);
    SelTextPL            := Ini.ReadBool('Settings', 'Select text on jump to previous line', True);
    RFMaxCount           := Ini.ReadInteger('Settings', 'MaxRF', 10);
    // Tags settings
    SubtitleAPI.NoInteractionWithTags := Ini.ReadBool('Settings', 'No interaction with tags', False);
    SubtitleAPI.WorkWithTags          := Ini.ReadBool('Settings', 'Work with style tags', True);

    // --------------------------------- //
    //            Save related           //
    // --------------------------------- //

    AskToSave            := Ini.ReadBool('Save', 'Ask to save', True);
    tmrSaveWork.Enabled  := Ini.ReadBool('Save', 'Save work automatically', False);
    tmrSaveWork.Interval := Ini.ReadInteger('Save', 'Time interval', 60000);
    SaveAsBackup         := Ini.ReadBool('Save', 'Save as backup', True); 

    // --------------------------------- //
    //           Video Preview           //
    // --------------------------------- //
    //pnlVideo.Height := Ini.ReadInteger('Video preview', 'Video panel height', (pnlParent1.Height div 2) - (spSplitter.Height div 2));
    OnDoubleClick   := Ini.ReadInteger('Video preview', 'Double click in a subtitle', 1);
    OnShiftDblClick := Ini.ReadInteger('Video preview', 'Shift-double click in a subtitle', 2);
    SecsToJump1     := Ini.ReadInteger('Video preview', 'Seconds to jump 1', 1);
    SecsToJump2     := Ini.ReadInteger('Video preview', 'Seconds to jump 2', 1);
    case TRateClass(Ini.ReadInteger('Video preview', 'Playback rate', Integer(rate100))) of
      rate100: mnu100P.Checked := True;
      rate10:  mnu10P.Checked  := True;
      rate20:  mnu20P.Checked  := True;
      rate30:  mnu30P.Checked  := True;
      rate40:  mnu40P.Checked  := True;
      rate50:  mnu50P.Checked  := True;
      rate60:  mnu60P.Checked := True;
      rate70:  mnu70P.Checked := True;
      rate80:  mnu80P.Checked := True;
      rate90:  mnu90P.Checked := True;
      rate150: mnu150P.Checked := True;
      rate200: mnu200P.Checked := True;
      rate300: mnu300P.Checked := True;
      rate400: mnu400P.Checked := True;
    end;
    frmMain.DefAltPlayRate := TRateClass(Ini.ReadInteger('Video preview', 'Default altered playback rate', Integer(rate200)));

    RewFFTime := StrSecToMS(Ini.ReadString('Video preview', 'Rewind and forward', '0,500'));
    SetDefaultShortCut;
    ScrollList := Ini.ReadBool('Video preview', 'Scroll list', False);
    mnuDisplayOriginal.Checked := Ini.ReadBool('Video preview', 'Displaying original', True);
    mnuDisplayTranslation.Checked := not mnuDisplayOriginal.Checked;
    mnuShowSubtitles.Checked := Ini.ReadBool('Video preview', 'Show subtitles', True);
    PlayOnLoad := Ini.ReadBool('Video preview', 'Play on load', True);

    // --------------------------------- //
    //      Video Preview subtitles      //
    // --------------------------------- //
    subSubtitle.Border      := Ini.ReadBool('Video preview subtitles','Draw border', True);
    subSubtitle.Shadow      := Ini.ReadBool('Video preview subtitles','Draw shadow', True);
    TransparentSubs         := Ini.ReadBool('Video preview subtitles','Transparent', True);
    ForceUsingReg           := Ini.ReadBool('Video preview subtitles','Force using regions', True);
    subSubtitle.Font.Name   := Ini.ReadString('Video preview subtitles', 'Font name', 'Tahoma');
    subSubtitle.Font.Size   := Ini.ReadInteger('Video preview subtitles', 'Font size', 14);
    subSubtitle.TextColor   := Ini.ReadInteger('Video preview subtitles', 'Font color', clWhite);
    BackgroundColor         := Ini.ReadInteger('Video preview subtitles', 'Background color', clBtnFace);
    subSubtitle.TransparentColor := Ini.ReadInteger('Video preview subtitles', 'Transparency color', RGB(5,5,5));
    subSubtitle.BorderWidth := Ini.ReadInteger('Video preview subtitles', 'Border width', 1);
    subSubtitle.ShadowWidth := Ini.ReadInteger('Video preview subtitles', 'Shadow width', 1);
    subSubtitle.Font.Style  := [];
    if Ini.ReadBool('Video preview subtitles', 'Bold', True) then
      subSubtitle.Font.Style := subSubtitle.Font.Style + [fsBold];
    if Ini.ReadBool('Video preview subtitles', 'Italic', False) then
      subSubtitle.Font.Style := subSubtitle.Font.Style + [fsItalic];
    if Ini.ReadBool('Video preview subtitles', 'Underline', False) then
      subSubtitle.Font.Style := subSubtitle.Font.Style + [fsUnderline];
    PreviewSubPosition := Ini.ReadInteger('Video preview subtitles', 'Position', 1);


    // -------------------------------- //
    //      Information and Errors      //
    // -------------------------------- //
    ShowConfMainForm  := Ini.ReadBool('Information and Errors', 'Show confirmations in main form on fix', False);
    MarkErrorsInList  := Ini.ReadBool('Information and Errors', 'Mark errors in main form''s list', True);
    MarkWithColor     := Ini.ReadInteger('Information and Errors', 'Mark with color', clRed);
    MarkBold          := Ini.ReadBool('Information and Errors', 'Bold', True);
    MarkItalic        := Ini.ReadBool('Information and Errors', 'Italic', False);
    MarkUnderline     := Ini.ReadBool('Information and Errors', 'Underline', False);
    MarkOnLoad        := Ini.ReadBool('Information and Errors', 'Mark errors on load subtitle', False);
    FixOneUnitOverlap := Ini.ReadBool('Information and Errors', 'Fix one unit overlap at load', False);
    FixOnLoad         := Ini.ReadBool('Information and Errors', 'Fix errors on load subtitle', False);
    OCRDefFile        := Ini.ReadString('Information and Errors', 'OCR Definitions file', ExtractFilePath(Application.ExeName) + 'OCRScripts\Default' + ID_OCREXT);

    for i := 0 to mnuOCRScripts.Count-1 do
      if mnuOCRScripts.Items[i].Caption = ExtractFileName(Copy(OCRDefFile, 1, Length(OCRDefFile)-4)) then
        mnuOCRScripts.Items[i].Checked := True;
    cmbOCRScripts.ItemIndex := cmbOCRScripts.Items.IndexOf(ExtractFileName(Copy(OCRDefFile, 1, Length(OCRDefFile)-4)));    

    // ----------------------------- //
    //            Advanced           //
    // ----------------------------- //
    RepeatableChars      := Ini.ReadString('Information and Errors', 'Repeatable chars', '-¡!¿?";\/_[]=');
    ProhibitedChars      := Ini.ReadString('Information and Errors', 'Prohibited chars', '@#*');
    ToleranceForRepeated := Ini.ReadInteger('Information and Errors', 'Tolerance for repeated subtitles', 100);
    SpaceAfterChars      := Ini.ReadString('Information and Errors', 'Space after characters', '-');
    SpaceBeforeChars     := Ini.ReadString('Information and Errors', 'Space before characters', '');
    TooLongDuration      := Ini.ReadInteger('Information and Errors', 'Too long duration', 6000);
    TooShortDuration     := Ini.ReadInteger('Information and Errors', 'Too short duration', 700);
    TooLongLine          := Ini.ReadInteger('Information and Errors', 'Too long line', 45);
    TooSmallCPS          := Ini.ReadFloat('Information and Errors', 'Too small CPS', 8.0);
    TooBigCPS            := Ini.ReadFloat('Information and Errors', 'Too big CPS', 24.0);

    // ----------------------------- //
    //      Errors to check for      //
    // ----------------------------- //
    ErrorsToCheck := TErrorsCheck.Create(IniRoot, 'Errors to check for', 'Unnecessary spaces to check for');

    // ----------------------- //
    //      Errors to fix      //
    // ----------------------- //
    ErrorsToFix := TErrors.Create(IniRoot, 'Errors to fix', 'Unnecessary spaces to fix');

    // --------------------------------- //
    //             File Types            //
    // --------------------------------- //

    if Ini.ReadBool('File types', 'Register extensions on start', False) then
      AssociateExtensions(Ini.ReadString('File types', 'Associated extensions', ''), True);

    // --------------------------------- //
    //           Program Look            //
    // --------------------------------- //
    case Ini.ReadInteger('Program look', '"Text" and "Translation" fields align', 2) of
      0: begin mmoSubtitleText.Alignment := taLeftJustify; mmoTranslation.Alignment := taLeftJustify; end;
      1: begin mmoSubtitleText.Alignment := taRightJustify; mmoTranslation.Alignment := taRightJustify; end else
      begin mmoSubtitleText.Alignment := Classes.taCenter; mmoTranslation.Alignment := Classes.taCenter; end;
    end;

    // --------------------------------- //
    //             List Look             //
    // --------------------------------- //
    if Ini.ReadBool('List look', 'Show grid lines', True) then
      frmMain.lstSubtitles.TreeOptions.PaintOptions := [toShowHorzGridLines, toShowVertGridLines, toShowButtons, toShowDropmark, toShowTreeLines,toThemeAware,toUseBlendedImages] else
      frmMain.lstSubtitles.TreeOptions.PaintOptions := [toShowButtons, toShowDropmark, toShowTreeLines,toThemeAware,toUseBlendedImages];
    ApplyStyleInList := Ini.ReadBool('List look', 'Apply style to subtitles', True);
    MarkUnTransSubs  := Ini.ReadBool('List look', 'Mark untranslated subtitles', True);
    UnTransSubsColor := Ini.ReadInteger('List look', 'Untranslated subtitles color', clRed);
    if Ini.ReadBool('List look', 'Show horizontal scrollbar', True) = False then
      lstSubtitles.ScrollBarOptions.ScrollBars := ssVertical else
      lstSubtitles.ScrollBarOptions.ScrollBars := ssBoth;

    // ------------------------- //
    //          Menu Look        //
    // ------------------------- //
    MiMenu.Activo    := Ini.ReadBool('Menu look', 'Use Office XP Style menu', True);
    MiMenu.Degradado := Ini.ReadBool('Menu look', 'Use gradient menu', True);

    // --------------------------------- //
    //             Interfaces            //
    // --------------------------------- //

    mnuShowLeftPanel.Checked := Ini.ReadBool('Interface', 'Show left panel', True);
    if Ini.ReadBool('Interface', 'Show time controls', True) then
      mnuShowTimeControls.Checked := True else
    begin
      mnuShowTimeControls.Checked := False;
      mnuShowTimeControlsClick(Sender);
    end;
    if Ini.ReadBool('Interface', 'Use in-place edition', False) then
    begin
      mnuUseInPlaceEdition.Checked := True;
      lstSubtitles.TreeOptions.MiscOptions := lstSubtitles.TreeOptions.MiscOptions + [toEditable];
    end else
    begin
      mnuUseInPlaceEdition.Checked := False;
      lstSubtitles.TreeOptions.MiscOptions := lstSubtitles.TreeOptions.MiscOptions - [toEditable];
    end;

    SetVideoPreviewMode(Ini.ReadBool('Interface', 'Video Preview Mode', False));
    SetTranslatorMode(Ini.ReadBool('Interface', 'Translator mode', False), False);
    EnableVPCtrls(False);

    scrVolume.Position := Vars.Volume;

    // --------------------------------------//
    //    Command line parameters reading    //
    // --------------------------------------//

    for i := 1 to ParamCount do
      CommandLineProcess(ParamStr(i));

  finally
    Ini.Free;
  end;

  // ------------------------------------------------------------------------ //
  //                            Set Output settings                           //
  // ------------------------------------------------------------------------ //
  
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Output.ini');
  try
    // ------------------------ //
    //       DVD Subtitle       //
    // ------------------------ //
    SubtitleAPI.SetOutputSettingsDVDSubtitle(True,
                                             Ini.ReadString('DVD Subtitle', 'Disk ID',   ''),
                                             Ini.ReadString('DVD Subtitle', 'DVD Title', ''),
                                             Ini.ReadString('DVD Subtitle', 'Language',  'EN'),
                                             Ini.ReadString('DVD Subtitle', 'Author',    ''),
                                             Ini.ReadString('DVD Subtitle', 'Web',       ''),
                                             Ini.ReadString('DVD Subtitle', 'Info',      ''),
                                             Ini.ReadString('DVD Subtitle', 'License',   ''));

    // ------------------------ //
    //           SAMI           //
    // ------------------------ //
    if Ini.ReadString('SAMI', 'Align', 'Center') = 'Left' then
      TextAlign := taLeft else
    if Ini.ReadString('SAMI', 'Align', 'Center') = 'Right' then
      TextAlign := taRight else
      TextAlign := taCenter;
    SubtitleAPI.SetOutputSettingsSAMI(True,
                                      Ini.ReadString( 'SAMI', 'Font',           'Tahoma'),
                                      Ini.ReadInteger('SAMI', 'Size',           24),
                                      Ini.ReadBool(   'SAMI', 'Bold',           True),
                                      Ini.ReadBool(   'SAMI', 'Italic',         False),
                                      Ini.ReadBool(   'SAMI', 'Underline',      False),
                                      Ini.ReadInteger('SAMI', 'Subtitle color', clWhite),
                                      Ini.ReadInteger('SAMI', 'Background color', clBlack),
                                      TextAlign);

    // ------------------------ //
    //      Sonic Scenarist     //
    // ------------------------ //
    SubtitleAPI.SetOutputSettingsSonicScenarist(True,
                                                Ini.ReadBool(   'Scenarist', 'PAL',        True),
                                                Ini.ReadBool(   'Scenarist', 'Drop frame', False),
                                                Ini.ReadInteger('Scenarist', 'Color0',     3),
                                                Ini.ReadInteger('Scenarist', 'Color1',     4),
                                                Ini.ReadInteger('Scenarist', 'Color2',     3),
                                                Ini.ReadInteger('Scenarist', 'Color3',     9),
                                                Ini.ReadInteger('Scenarist', 'Contrast0',  0),
                                                Ini.ReadInteger('Scenarist', 'Contrast1',  15),
                                                Ini.ReadInteger('Scenarist', 'Contrast2',  15),
                                                Ini.ReadInteger('Scenarist', 'Contrast3',  15));

    // ------------------------ //
    //         SubViewer        //
    // ------------------------ //
    SubtitleAPI.SetOutputSettingsSubViewer1(True,
                                            Ini.ReadString( 'SubViewer', 'Title',   ''),
                                            Ini.ReadString( 'SubViewer', 'Author',  ''),
                                            Ini.ReadString( 'SubViewer', 'Source',  ''),
                                            Ini.ReadString( 'SubViewer', 'Program', ''),
                                            Ini.ReadString( 'SubViewer', 'Path',    ''),
                                            Ini.ReadInteger('SubViewer', 'Delay',   0));

    // ------------------------ //
    //        SubViewer 2       //
    // ------------------------ //
    SubtitleAPI.SetOutputSettingsSubViewer2(True,
                                            Ini.ReadString( 'SubViewer 2', 'Title',     ''),
                                            Ini.ReadString( 'SubViewer 2', 'Author',    ''),
                                            Ini.ReadString( 'SubViewer 2', 'Source',    ''),
                                            Ini.ReadString( 'SubViewer 2', 'Program',   ''),
                                            Ini.ReadString( 'SubViewer 2', 'Path',      ''),
                                            Ini.ReadInteger('SubViewer 2', 'Delay',     0),
                                            Ini.ReadInteger('SubViewer 2', 'CD-Track',  0),
                                            Ini.ReadString( 'SubViewer 2', 'Comment',   ''),
                                            Ini.ReadString( 'SubViewer 2', 'Font Name', 'Tahoma'),
                                            Ini.ReadInteger('SubViewer 2', 'Font Size', 24),
                                            Ini.ReadInteger('SubViewer 2', 'Color',     clWhite),
                                            Ini.ReadBool(   'SubViewer 2', 'Bold',      True),
                                            Ini.ReadBool(   'SubViewer 2', 'Italic',    False),
                                            Ini.ReadBool(   'SubViewer 2', 'Underline', False),
                                            Ini.ReadBool(   'SubViewer 2', 'Strikeout', False));

    // ------------------------ //
    //     SubStation Alpha     //
    // ------------------------ //
    SubtitleAPI.SetOutputSettingsSubStationAlpha(True,
                                                 Ini.ReadString( 'SSA', 'Title', '<untitled>'),
                                                 Ini.ReadString( 'SSA', 'Script', '<unknown>'),
                                                 Ini.ReadString( 'SSA', 'Font name', 'Tahoma'),
                                                 Ini.ReadInteger('SSA', 'Font size', 24),
                                                 Ini.ReadBool('SSA', 'Bold', True),
                                                 Ini.ReadBool('SSA', 'Italic', False),
                                                 Ini.ReadInteger('SSA', 'BorderStyle', 1),
                                                 Ini.ReadInteger('SSA', 'Primary Color', 16777215),
                                                 Ini.ReadInteger('SSA', 'Secondary Color', 16777215),
                                                 Ini.ReadInteger('SSA', 'Tertiary Color', 16777215),
                                                 Ini.ReadInteger('SSA', 'Shadow Color', 12632256),
                                                 Ini.ReadInteger('SSA', 'Outline', 1),
                                                 Ini.ReadInteger('SSA', 'Shadow', 1),
                                                 (Ini.ReadInteger('SSA', 'Alignment', 2) or (Ini.ReadInteger('SSA', 'Type of subtitles', 1) shl 2)),
                                                 Ini.ReadInteger('SSA', 'Left margin', 30),
                                                 Ini.ReadInteger('SSA', 'Right margin', 30),
                                                 Ini.ReadInteger('SSA', 'Vertical margin', 415),
                                                 Ini.ReadInteger('SSA', 'Encoding', 0)
                                                 );
    // ------------------------ //
    //          TMPlayer        //
    // ------------------------ //

    case Ini.ReadInteger('TMPlayer', 'Format', 0) of
      1: SubtitleAPI.SetOutputSettingsTMPlayer(True, tfTimeStruct1);
      2: SubtitleAPI.SetOutputSettingsTMPlayer(True, tfTimeStruct2);
      3: SubtitleAPI.SetOutputSettingsTMPlayer(True, tfPlusTimeStruct1);
      4: SubtitleAPI.SetOutputSettingsTMPlayer(True, tfPlusTimeStruct2) else
      SubtitleAPI.SetOutputSettingsTMPlayer(True, tfMultiline);
    end;
  finally
    Ini.Free;
  end;

  DragAcceptFiles(frmMain.Handle, True); // For drag & drop
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.spSplitterMoved(Sender: TObject);
begin
  lstSubtitles.Top    := spSplitter.Top + spSplitter.Height;
  lstSubtitles.Height := pnlParent1.Height - spSplitter.top - spSplitter.Height;
  UpdateSubtitlesPos;
  UpdateVideoPos;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.FormResize(Sender: TObject);
begin
  lstSubtitles.Width := pnlParent1.Width;
  if (mnuVideoPreviewMode.Checked) then
  begin
    SetVideoPreviewMode(True);
    UpdateSubtitlesPos;
    UpdateVideoPos;
    if Player.Initialized then
      SetTimeCounter(GetCurrentPos) else
      tcTimeCounter.Hide;
  end;
  SetTranslationCtrlsPositions;
  cmbOCRScripts.Visible := (mnuShowInMainForm.Checked) and (pnlControl.Height > (cmbOCRScripts.Height + cmbOCRScripts.Top + 3));
  RepaintSubGraph;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuVideoPreviewModeClick(Sender: TObject);
begin
  SetVideoPreviewMode(not mnuVideoPreviewMode.Checked);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuCloseClick(Sender: TObject);
begin
  CloseSub;
end;
                                
// -----------------------------------------------------------------------------

procedure TfrmMain.mnuLoadSubtitleClick(Sender: TObject);
begin
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
  begin
    if (dlgLoadFile.FilterIndex) <= (SubtitleAPI.FormatsCount+1) then
      LoadSubtitle(dlgLoadFile.FileName, GetInputFPS, dlgLoadFile.FilterIndex) else
    begin
      if (dlgLoadFile.FilterIndex) = (SubtitleAPI.FormatsCount+2) then
        LoadSRF(dlgLoadFile.FileName) else
        LoadPlainText(dlgLoadFile.FileName);
    end;
    HighlightTags(True);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.FormDestroy(Sender: TObject);
var
  Ini : TIniFile;
  a   : TRateClass;
begin
  SubtitleAPI.Free;
  SaveFPS(cmbInputFPS);

  Ini := TIniFile.Create(IniRoot);
  try
    // Save recent files...
    SaveRecentFiles;
    // Free recent files TStringList...
    RecentFiles.Free;
    // Current OCR Script...
    Ini.WriteString('Information and Errors', 'OCR Definitions file', OCRDefFile);
    Ini.WriteBool('General', 'Show OCR Scripts in main form', mnuShowInMainForm.Checked);

    // Work with...
    if rdoDuration.Checked then
      Ini.WriteInteger('General','Work with', 1) else
    if rdoFinalTime.Checked then
      Ini.WriteInteger('General','Work with', 2) else
    if rdoBoth.Checked then
      Ini.WriteInteger('General','Work with', 3);

    // Save last folder
    Ini.WriteString('General', 'Last folder', dlgLoadFile.InitialDir);

    // Charsets...
    Ini.WriteInteger('General', 'Original charset', cmbOrgCharset.ItemIndex);
    Ini.WriteInteger('General', 'Translated charset', cmbTransCharset.ItemIndex);

    if mnuTranslatorMode.Checked = False then
    begin
      // Columns width for normal mode
      Ini.WriteInteger('Columns width (normal mode)', '1', lstSubtitles.Header.Columns[0].Width);
      Ini.WriteInteger('Columns width (normal mode)', '2', lstSubtitles.Header.Columns[1].Width);
      Ini.WriteInteger('Columns width (normal mode)', '3', lstSubtitles.Header.Columns[2].Width);
      Ini.WriteInteger('Columns width (normal mode)', '4', lstSubtitles.Header.Columns[3].Width);
    end else
    begin
      // Columns width for translator mode
      Ini.WriteInteger('Columns width (translator mode)', '1', lstSubtitles.Header.Columns[0].Width);
      Ini.WriteInteger('Columns width (translator mode)', '2', lstSubtitles.Header.Columns[1].Width);
      Ini.WriteInteger('Columns width (translator mode)', '3', lstSubtitles.Header.Columns[2].Width);
      Ini.WriteInteger('Columns width (translator mode)', '4', lstSubtitles.Header.Columns[3].Width);
      Ini.WriteInteger('Columns width (translator mode)', '5', lstSubtitles.Header.Columns[4].Width);
    end;  

    // --------------------------------- //
    //          WINDOW POSITION          //
    // --------------------------------- //
    FreeAndNil(FormPos);

    // ----------------- //
    //   Video preview   //
    // ----------------- //
    //Ini.WriteInteger('Video preview', 'Video panel height', pnlVideo.Height);
    if mnu10P.Checked then a := rate10 else
    if mnu20P.Checked then a := rate20 else
    if mnu30P.Checked then a := rate30 else
    if mnu40P.Checked then a := rate40 else
    if mnu50P.Checked then a := rate50 else
    if mnu60P.Checked then a := rate60 else
    if mnu70P.Checked then a := rate70 else
    if mnu80P.Checked then a := rate80 else
    if mnu90P.Checked then a := rate90 else
    if mnu150P.Checked then a := rate150 else
    if mnu200P.Checked then a := rate200 else
    if mnu300P.Checked then a := rate300 else
    if mnu400P.Checked then a := rate400 else
      a := rate100;
    Ini.WriteInteger('Video preview', 'Playback rate', Integer(a));

    Ini.WriteBool('Video preview', 'Scroll list', ScrollList);
    Ini.WriteBool('Video preview', 'Displaying original', mnuDisplayOriginal.Checked);
    Ini.WriteBool('Video preview', 'Show subtitles', mnuShowSubtitles.Checked);

    // ---------------- //
    //     Interfaces   //
    // ---------------- //
    Ini.WriteBool('Interface', 'Translator mode', mnuTranslatorMode.Checked);
    Ini.WriteBool('Interface', 'Video Preview Mode', mnuVideoPreviewMode.Checked);
    Ini.WriteBool('Interface', 'Show left panel', mnuShowLeftPanel.Checked);
    Ini.WriteBool('Interface', 'Show time controls', mnuShowTimeControls.Checked);
    Ini.WriteBool('Interface', 'Use in-place edition', mnuUseInPlaceEdition.Checked);

    ClearUndoList(UndoList);
    ClearUndoList(RedoList);

  finally
    Ini.Free;
  end;

  FreeAndNil(Vars);
  FreeAndNil(ErrorsToCheck);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFileClick(Sender: TObject);
begin
  mnuRecent.Visible           := (RecentFiles.Count > 0) and (RFMaxCount > 0);
  mnuLoadSubtitle.Enabled     := mnuTranslatorMode.Checked = False;
  mnuSaveFile.Enabled         := (lstSubtitles.RootNodeCount > 0);
  mnuSaveFileAs.Enabled       := (lstSubtitles.RootNodeCount > 0);
  mnuTranslatorSave.Enabled   := (lstSubtitles.RootNodeCount > 0);
  mnuSaveProject.Enabled      := (lstSubtitles.RootNodeCount > 0);
  mnuSaveOriginal.Enabled     := (lstSubtitles.RootNodeCount > 0);
  mnuSaveTranslated.Enabled   := (lstSubtitles.RootNodeCount > 0);
  mnuSaveOriginalAs.Enabled   := (lstSubtitles.RootNodeCount > 0) and (mnuTranslatorMode.Checked);
  mnuSaveTranslatedAs.Enabled := (lstSubtitles.RootNodeCount > 0) and (mnuTranslatorMode.Checked);
  mnuLoadTranslated.Enabled   := (OrgFile <> '');
  mnuClose.Enabled            := lstSubtitles.RootNodeCount > 0;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuEditClick(Sender: TObject);
begin
  mnuInsertSubtitle.Enabled    := InterfaceEnabled;
  mnuInsertBefore.Enabled      := InterfaceEnabled;
  mnuRemoveSelected.Enabled    := lstSubtitles.SelectedCount > 0;
  mnuCut.Enabled               := lstSubtitles.SelectedCount > 0;
  mnuCopy.Enabled              := lstSubtitles.SelectedCount > 0;
  mnuPaste.Enabled             := (ClipBoard.HasFormat(CF_TEXT)) and (InterfaceEnabled);
  mnuSelectAll.Enabled         := lstSubtitles.RootNodeCount > 0;
  // -------
  mnuTimings.Enabled           := lstSubtitles.RootNodeCount > 0;
  mnuShiftPlusMS.Caption       := Format(ShiftMS, ['+' + IntToStr(Vars.ShiftTime)]);
  mnuShiftLessMS.Caption       := Format(ShiftMS, ['-' + IntToStr(Vars.ShiftTime)]);
  // -------
  mnuShiftMoreMSShow.Caption   := Format(ShiftMSShow, ['+' + IntToStr(Vars.ShiftTime)]);
  mnuShiftLessMSShow.Caption   := Format(ShiftMSShow, ['-' + IntToStr(Vars.ShiftTime)]);
  mnuShiftMoreMSHide.Caption   := Format(ShiftMSHide, ['+' + IntToStr(Vars.ShiftTime)]);
  mnuShiftLessMSHide.Caption   := Format(ShiftMSHide, ['-' + IntToStr(Vars.ShiftTime)]);
  // -------
  mnuTexts.Enabled             := lstSubtitles.RootNodeCount > 0;
  mnuDivideLines.Enabled       := (lstSubtitles.RootNodeCount > 0) and (lstSubtitles.SelectedCount = 1) and (Assigned(lstSubtitles.FocusedNode)) and ((Length(GetSubText(lstSubtitles.FocusedNode)) > Vars.BreakLineAfter) or (Pos(#13#10, GetSubText(lstSubtitles.FocusedNode)) > 0));
  mnuFastDivideLines.Enabled   := mnuDivideLines.Enabled;
  mnuSubtitles.Enabled         := lstSubtitles.RootNodeCount > 0;
  mnuEffects.Enabled           := GetSubText(frmMain.lstSubtitles.FocusedNode) <> '';
  mnuCombineSubtitles.Enabled  := lstSubtitles.SelectedCount > 1;
  mnuSort.Enabled              := lstSubtitles.RootNodeCount > 1;
  // -------
  mnuSwap.Enabled := (mnuTranslatorMode.Checked) and (InterfaceEnabled);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSearchClick(Sender: TObject);
begin
  mnuSubSearch.Enabled        := lstSubtitles.RootNodeCount > 0;
  mnuFindNext.Enabled         := (lstSubtitles.RootNodeCount > 0) and (SearchWord <> '');
  mnuSearchAndReplace.Enabled := lstSubtitles.RootNodeCount > 0;
  mnuGoToLineNumber.Enabled   := lstSubtitles.RootNodeCount > 0;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuToolsClick(Sender: TObject);
begin
  mnuSpellCheck.Enabled           := lstSubtitles.RootNodeCount > 0;
  mnuSplitSubtitle.Enabled        := lstSubtitles.RootNodeCount > 1;
  mnuInformationAndErrors.Enabled := lstSubtitles.RootNodeCount > 0;
  mnuVariousInformation.Enabled   := InterfaceEnabled;
  mnuRecheckErrors.Enabled        := (MarkErrorsInList) and (lstSubtitles.RootNodeCount > 0);
  mnuFixAllErrors.Enabled         := lstSubtitles.RootNodeCount > 0;
  mnuFixErrorsInSelSubs.Enabled   := lstSubtitles.SelectedCount > 0;
  mnuJumpToNextError.Enabled      := lstSubtitles.RootNodeCount > 0;
  mnuExternalPreview.Enabled      := lstSubtitles.RootNodeCount > 0;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuExitClick(Sender: TObject);
begin
  frmMain.Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuClearListClick(Sender: TObject);
begin
  RecentFiles.Clear;
  UpdateRFMenus;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
begin
  RefreshTimes;
  HighlightTags(True);
  HighlightTags(False);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    DeleteSelectedNodes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuOpenMovieClick(Sender: TObject);
begin
  dlgLoadFile.Filter := AllSupportedFiles +
                        '|*.asf;*.avi;*.avs;*.mp4;*.mkv;*.divx;*.mp3;*.mpg;*.mpeg;*.m1v;*.ogm;*.ogg;*.qt;*.vob;*.wav;*.wmv|' +
                        'All files (*.*)|*.*|'+
                        'ASF (*.asf)|*.asf|AVI (*.avi)|*.avi|Avisynth (*.avs)|*.avs|OGM (*.ogm)|*.ogm|OGG (*.ogg)|*.ogg|Matroska (*.mkv)|*.mkv|DivX (*.mp4; *.divx)|*.mp4; ' +
                        '*.divx|MP3 (*.mp3)|*.mp3|MPEG (*.mpg; *.mpeg; *.m1v)|*.mpg; *.mpeg; *.m1v|QuickTime 2.0 (*.qt)|*.qt|VOB (*.vob)|*.vob|WAV (*.wav)|*.wmv|WMV (*.wmv)|*.wmv' ;
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
  begin
    if LoadMovie(dlgLoadFile.FileName) = False then
      MsgBox(Format(ErrorMsg[05], [dlgLoadFile.FileName]), BTN_OK, '', '', MB_ICONERROR, frmMain) else
    begin
      if mnuVideoPreviewMode.Checked = False then
        SetVideoPreviewMode(True);
    end;

    SetCurrentVolume;
  end;
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
  RepaintSubGraph;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuCloseMovieClick(Sender: TObject);
begin
  FreeFile;
  RepaintSubGraph;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.tmrVideoTimer(Sender: TObject);
var
  Node         : PVirtualNode;
  Data         : PSubtitleItem;
  LastNodeData : PSubtitleItem;
  CurrTime     : Integer;
  CurrentPos   : Int64;
  SubtitleText : String;
begin
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked = True) then
  begin
    Player.MediaSeeking.GetCurrentPosition(CurrentPos);
    CurrTime := CurrentPos div 10000;

    if lstSubtitles.RootNodeCount > 0 then
    begin
      Node := lstSubtitles.GetFirst;
      LastNodeData := lstSubtitles.GetNodeData(lstSubtitles.GetLast);
      while Assigned(Node) do
      begin
        Data := lstSubtitles.GetNodeData(Node);
        if (CurrTime >= Data.InitialTime) and (CurrTime <= Data.FinalTime) then
        begin
          if mnuTranslatorMode.Checked then
          begin
            if mnuDisplayOriginal.Checked then
              SubtitleText := Data.Text else
              SubtitleText := Data.Translation;
          end else
            SubtitleText := Data.Text;

          if subSubtitle.Text <> SubtitleText then
          begin
            subSubtitle.Hide;
//{$IFNDEF UNIOFF}
            subSubtitle.Font.Charset := OrgCharset;
//{$ENDIF}
            subSubtitle.Text := SubtitleText;
            UpdateSubtitlesPos;

            if ScrollList then
            begin
              UnSelectAll(lstSubtitles);
              lstSubtitles.ScrollIntoView(Node, True);
              lstSubtitles.Selected[Node] := True;
              lstSubtitles.FocusedNode    := Node;
            end;
            if mnuShowSubtitles.Checked then subSubtitle.Show;
          end;
          Break;
        end
        else if (CurrTime < Data.FinalTime) or (CurrTime > LastNodeData.FinalTime) then
        begin
          subSubtitle.Visible := False;
          subSubtitle.Text := '';
          Break;
        end;
        Node := Node.NextSibling;
      end;
    end;

    if VideoDuration > 0 then
    begin
      if CurrentPos = (VideoDuration * 10000) then
      begin
        CurrentPos := 0;
        Player.MediaSeeking.SetPositions(CurrentPos, AM_SEEKING_ABSOLUTEPOSITIONING, CurrentPos, AM_SEEKING_NOPOSITIONING);
        Player.MediaControl.Stop;
        Playing := False;
        tmrVideo.Enabled := False;
        btnPlay.Show;
        btnPause.Hide;
        sbSeekBar.Position := 0;
      end else
      begin
        sbSeekBar.Position := CurrentPos div 10000;
        SetTimeCounter(CurrentPos div 10000);
      end;
    end;

  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnPlayClick(Sender: TObject);
begin
  Pause;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuPlayPauseClick(Sender: TObject);
begin
  Pause;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnStopClick(Sender: TObject);
begin
  Stop;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.tmrSeekRewFFTimer(Sender: TObject);
begin
  while (Seeking) do
  begin
    Application.ProcessMessages;
    if btnRew.State = sPressed then
      SetVideoPos(GetCurrentPos - RewFFTime) else
    if btnForward.State = sPressed then
      SetVideoPos(GetCurrentPos + RewFFTime);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnRewMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SetVideoPos(GetCurrentPos - RewFFTime);
  Seeking := True;
  tmrSeekRewFF          := TTimer.Create(Application);
  tmrSeekRewFF.Interval := 500;
  tmrSeekRewFF.OnTimer  := tmrSeekRewFFTimer;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnRewMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Seeking := False;
  tmrSeekRewFF.Enabled := False;
  tmrSeekRewFF.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnForwardMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SetVideoPos(GetCurrentPos + RewFFTime);
  Seeking := True;
  tmrSeekRewFF          := TTimer.Create(Application);
  tmrSeekRewFF.Interval := 500;
  tmrSeekRewFF.OnTimer  := tmrSeekRewFFTimer;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnForwardMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Seeking := False;
  tmrSeekRewFF.Enabled := False;
  tmrSeekRewFF.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuStopClick(Sender: TObject);
begin
  Stop;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuMovieClick(Sender: TObject);
begin
  mnuCloseMovie.Enabled := Player.Initialized;
  mnuMovieInfo.Enabled  := Player.Initialized;
  // ------
  mnuPlayback.Enabled   := Player.Initialized;
  mnuPlayPause.Enabled  := Player.Initialized;
  mnuStop.Enabled       := Player.Initialized;
  mnuBack5Sec.Enabled   := Player.Initialized;
  mnuFwd5Sec.Enabled    := Player.Initialized;
  // ------
  mnuPlaybackRate.Enabled := Player.Initialized;
  mnu50P.Enabled          := Player.Initialized;
  mnu60P.Enabled          := Player.Initialized;
  mnu70P.Enabled          := Player.Initialized;
  mnu80P.Enabled          := Player.Initialized;
  mnu90P.Enabled          := Player.Initialized;
  mnu100P.Enabled         := Player.Initialized;
  // ------
  mnuVidSubtitles.Enabled  := Player.Initialized;
  mnuSetStartTime.Enabled  := Player.Initialized;
  mnuSetFinalTime.Enabled  := Player.Initialized;
  mnuStartSubtitle.Enabled := Player.Initialized;
  mnuEndSubtitle.Enabled   := Player.Initialized;
  // ------
  mnuSynchronization.Enabled := (Player.Initialized) and (lstSubtitles.RootNodeCount > 0);
  mnuFirstSyncPoint.Enabled  := (Player.Initialized) and (lstSubtitles.RootNodeCount > 0);
  mnuLastSyncPoint.Enabled   := (Player.Initialized) and (lstSubtitles.RootNodeCount > 0);
  mnuAddSyncPoint.Enabled    := (Player.Initialized) and (lstSubtitles.RootNodeCount > 0);
  // ------
  mnuSubtitleToDisplay.Visible    := mnuTranslatorMode.Checked;
  mnuSaveMediaStartupFile.Enabled := (OrgFile <> '') and (MovieFile <> '');
  mnuSaveASX.Enabled              := (OrgFile <> '') and (MovieFile <> '');
  mnuSaveSMIL.Enabled             := (OrgFile <> '') and (MovieFile <> '');
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSubSettingsClick(Sender: TObject);
begin
  frmSettings := TfrmSettings.Create(Application);
  frmSettings.ShowModal;
  // Apply always on top
  if frmSettings.chkAlwaysOnTop.Checked then
    SetWindowPos(frmMain.Handle, HWND_TOPMOST, frmMain.Left, frmMain.Top, frmMain.Width, frmMain.Height, SWP_NOMOVE + SWP_NOSIZE) else
    SetWindowPos(frmMain.Handle, HWND_NOTOPMOST, frmMain.Left, frmMain.Top, frmMain.Width, frmMain.Height, SWP_NOMOVE + SWP_NOSIZE);
  frmSettings.Free;

  RepaintSubGraph;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuOutputSettingsClick(Sender: TObject);
begin
  frmOutputSettings := TfrmOutputSettings.Create(Application);
  frmOutputSettings.ShowModal;
  frmOutputSettings.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.cmbModeSelect(Sender: TObject);
begin
  if cmbMode.ItemIndex = 0 then
    FormatType := ftTime else
    FormatType := ftFrames;
  lstSubtitles.Refresh;
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.rdoDurationClick(Sender: TObject);
begin
  if InterfaceEnabled then
  begin
    lblHide.Enabled     := False;
    tmeHide.Enabled     := False;
    lblDuration.Enabled := True;
    tmeDuration.Enabled := True;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.rdoFinalTimeClick(Sender: TObject);
begin
  if InterfaceEnabled then
  begin
    lblHide.Enabled     := True;
    tmeHide.Enabled     := True;
    lblDuration.Enabled := False;
    tmeDuration.Enabled := False;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.rdoBothClick(Sender: TObject);
begin
  if InterfaceEnabled then
  begin
    lblHide.Enabled     := True;
    tmeHide.Enabled     := True;
    lblDuration.Enabled := True;
    tmeDuration.Enabled := True;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.SetUndoTimeChange(Start : Boolean);
var
  UndoAction: PUndoAction;
begin
    ClearUndoList(RedoList);
    mnuRedo.Enabled := False;
    New(UndoAction);
    UndoAction^.UndoActionType                 := uaTimeChange;
    UndoAction^.BufferSize                     := SizeOf(TTimeChange);
    UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node                           := lstSubtitles.FocusedNode;
    UndoAction^.LineNumber                     := UndoAction^.Node.Index;
    UndoAction^.BindToNext                     := False;
    if Start = True then
    begin
      PTimeChange(UndoAction^.Buffer)^.StartTime := GetStartTime(lstSubtitles.FocusedNode);
      PTimeChange(UndoAction^.Buffer)^.FinalTime := -1;
    end else begin
      PTimeChange(UndoAction^.Buffer)^.StartTime := -1;
      PTimeChange(UndoAction^.Buffer)^.FinalTime := GetFinalTime(lstSubtitles.FocusedNode);
    end;
    UndoList.Add(UndoAction);
    mnuUndo.Enabled := True;
end;

procedure TfrmMain.tmeShowTimeChangeFromEditOnly(Sender: TObject; NewTime: Cardinal);
begin
  if (lstSubtitles.SelectedCount = 1) then
  begin
    SetUndoTimeChange(True);
    SetStartTime(lstSubtitles.FocusedNode, NewTime);
    lstSubtitles.RepaintNode(lstSubtitles.FocusedNode);
    RefreshTimes;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.tmeHideTimeChangeFromEditOnly(Sender: TObject; NewTime: Cardinal);
begin
  if (lstSubtitles.SelectedCount = 1) then
  begin
    SetUndoTimeChange(False);
    SetFinalTime(lstSubtitles.FocusedNode, NewTime);
    lstSubtitles.RepaintNode(lstSubtitles.FocusedNode);
    RefreshTimes;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.tmeDurationTimeChangeFromEditOnly(Sender: TObject; NewTime: Cardinal);
begin
  if (lstSubtitles.SelectedCount = 1) then
  begin
    SetUndoTimeChange(False);
    SetFinalTime(lstSubtitles.FocusedNode, Cardinal(GetStartTime(lstSubtitles.FocusedNode)) + NewTime);
    lstSubtitles.RepaintNode(lstSubtitles.FocusedNode);
    RefreshTimes;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSaveProjectClick(Sender: TObject);
var
  dlgSaveProject : TSaveDialog;
  Ini            : TIniFile;
  OriginalFile   : String;
  TranslatedFile : String;
  MMovieFile     : String;
begin
  dlgSaveProject := TSaveDialog.Create(Application);
  try
    if OrgFile <> '' then
    begin
      UpdateArray;
      if SaveFile(OrgFile, OrgFormat, GetFPS) then  // We save original file in it's original format
        OrgModified := False;
      SubtitleAPI.ClearSubtitles;
    end else
      mnuSaveFileAsClick(Sender);

    if TransFile <> '' then
    begin
      UpdateArray(True);
      if SaveFile(TransFile, TransFormat, GetFPS) then // We save translated file in it's original format
        TransModified := False;
      SubtitleAPI.ClearSubtitles;
    end else // If file doesn't exist then, save as...
      mnuSaveTranslatedAsClick(Sender);

    if (OrgFile <> '') and (TransFile <> '') then
    begin
      dlgSaveProject.Filter := ID_STPROJECT + ' (*' + ID_STPEXT + ')|*' + ID_STPEXT;
      if (dlgSaveProject.Execute) and (dlgSaveProject.FileName <> '') then
      begin
        if ExtractFileExt(dlgSaveProject.FileName) = '' then
          dlgSaveProject.FileName := dlgSaveProject.FileName + ID_STPEXT;
        if (ExtractFilePath(OrgFile) = ExtractFilePath(TransFile)) and
           (ExtractFilePath(OrgFile) = ExtractFilePath(dlgSaveProject.FileName)) then
        begin
          OriginalFile   := ExtractFileName(OrgFile);
          TranslatedFile := ExtractFileName(TransFile);
        end else
        begin
          OriginalFile   := OrgFile;
          TranslatedFile := TransFile;
        end;
        if (ExtractFilePath(dlgSaveProject.FileName)) = (ExtractFilePath(MovieFile)) then
          MMovieFile := ExtractFileName(MovieFile) else
          MMovieFile := MovieFile;

        Ini := TIniFile.Create(dlgSaveProject.FileName);
        try
          Ini.WriteString('Subtitle files', 'Original', OriginalFile);
          Ini.WriteString('Subtitle files', 'Translated', TranslatedFile);
          Ini.WriteString('Movie file', 'Movie', MMovieFile);
          Ini.WriteInteger('Other', 'Focused node', lstSubtitles.FocusedNode.Index);
          Ini.WriteInteger('Movie file', 'Position', GetCurrentPos);
        finally
          Ini.Free;
        end;
      end;
    end;
  finally
    dlgSaveProject.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSaveFileClick(Sender: TObject);
begin
  if OrgFile <> '' then
  begin
    SubtitleAPI.SetOutputSettingsEncoding(StrCharsetToInt(cmbOrgCharset.Items[cmbOrgCharset.ItemIndex]));

    UpdateArray;
    if SaveFile(OrgFile, OrgFormat, GetFPS) then  // We save original file in it's original format
      OrgModified := False;
    SubtitleAPI.ClearSubtitles;
  end else
    mnuSaveFileAsClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.SetTranslationCtrlsPositions;
begin
  if mnuShowLeftPanel.Checked then
  begin
    pnlControl.Visible := True;
    pnlParent2.Left    := pnlControl.Left + pnlControl.Width + 7;
    pnlParent2.Width   := frmMain.ClientWidth - (pnlControl.Left + pnlControl.Width) - 15;

    lblShow.Left     := pnlParent2.Left;
    tmeShow.Left     := pnlParent2.Left;

    lblHide.Left     := tmeShow.Left + tmeShow.Width + 7;
    tmeHide.Left     := lblHide.Left;

    lblDuration.Left := pnlParent2.Left;
    tmeDuration.Left := pnlParent2.Left;

    lblCPS.Left            := lblHide.Left;
    mdtSubtitleCPS.Left    := lblHide.Left;
    mdtTranslationCPS.Left := lblHide.Left + mdtSubtitleCPS.Width + 4;
  end else
  begin
    pnlControl.Visible := False;
    pnlParent2.Left    := pnlControl.Left;
    pnlParent2.Width   := frmMain.ClientWidth - 16;

    lblShow.Left     := pnlControl.Left;
    tmeShow.Left     := pnlControl.Left;

    lblHide.Left     := tmeShow.Left + tmeShow.Width + 21;
    tmeHide.Left     := lblHide.Left;

    lblDuration.Left := pnlControl.Left;
    tmeDuration.Left := pnlControl.Left;

    lblCPS.Left            := lblHide.Left;
    mdtSubtitleCPS.Left    := lblHide.Left;
    mdtTranslationCPS.Left := lblHide.Left + mdtSubtitleCPS.Width + 4;
  end;

  if mnuShowTimeControls.Checked then
    mmoSubtitleText.Left := tmeHide.Left + tmeHide.Width + 8 else
    mmoSubtitleText.Left := tmeShow.Left;

  if mnuTranslatorMode.Checked then
  begin
    mmoSubtitleText.Width := ((frmMain.ClientWidth - mmoSubtitleText.Left) div 2) - 7;
    mmoTranslation.Width  := mmoSubtitleText.Width;
    mmoTranslation.Left   := mmoSubtitleText.Left + mmoSubtitleText.Width + 7;
    mmoTranslation.Height := mmoSubtitleText.Height;
  end else
    mmoSubtitleText.Width := (frmMain.ClientWidth - mmoSubtitleText.Left) - 8;

  mmoSubtitleText.Top := tmeHide.Top;
  mmoTranslation.Top  := mmoSubtitleText.Top;
  // Label...
  lblText.Left        := mmoSubtitleText.Left;
  lblTranslation.Top  := lblText.Top;
  lblTranslation.Left := mmoTranslation.Left;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuTranslatorModeClick(Sender: TObject);
begin
  SetTranslatorMode(not mnuTranslatorMode.Checked);
end;
// -----------------------------------------------------------------------------

procedure TfrmMain.mnuLoadProjectClick(Sender: TObject);
begin                 
  dlgLoadFile.Filter := ID_STPROJECT + ' (*' + ID_STPEXT + ')|*.stp';
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
  begin
    LoadProject(dlgLoadFile.FileName);
    SetCurrentVolume;
    HighlightTags(True);
    HighlightTags(False);
  end;
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuLoadOriginalClick(Sender: TObject);
begin
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then begin
    LoadSubtitle(dlgLoadFile.FileName, GetInputFPS, dlgLoadFile.FilterIndex);
    HighlightTags(True);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuLoadTranslatedClick(Sender: TObject);
begin
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then begin
    LoadSubtitle(dlgLoadFile.FileName, GetInputFPS, dlgLoadFile.FilterIndex, True);
    HighlightTags(False);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSaveTranslatedClick(Sender: TObject);
begin
  if TransFile <> '' then
  begin
    SubtitleAPI.SetOutputSettingsEncoding(StrCharsetToInt(cmbTransCharset.Items[cmbTransCharset.ItemIndex]));

    UpdateArray(True);
    if SaveFile(TransFile, TransFormat, GetFPS) then // We save translated file in it's original format
  		TransModified := False;
    SubtitleAPI.ClearSubtitles
  end else // If file doesn't exist then, save as...
    mnuSaveTranslatedAsClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSaveFileAsClick(Sender: TObject);
begin
  SubtitleAPI.SetOutputSettingsEncoding(StrCharsetToInt(cmbOrgCharset.Items[cmbOrgCharset.ItemIndex]));

  frmSaveAs := TfrmSaveAs.Create(Application);
  frmSaveAs.SaveTranslation := False;
  frmSaveAs.ShowModal;
  frmSaveAs.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSaveTranslatedAsClick(Sender: TObject);
begin
  SubtitleAPI.SetOutputSettingsEncoding(StrCharsetToInt(cmbTransCharset.Items[cmbTransCharset.ItemIndex]));

  frmSaveAs := TfrmSaveAs.Create(Application);
  frmSaveAs.SaveTranslation := True;
  frmSaveAs.ShowModal;
  frmSaveAs.Free;
  SubtitleAPI.ClearSubtitles;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mmoSubtitleTextChange(Sender: TObject);
var
  OldString: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
begin
  if (lstSubtitles.SelectedCount = 1) and (mmoSubtitleText.Text <> ReplaceString(GetSubText(lstSubtitles.FocusedNode), '|', #13#10)) and (GetFocus <> lstSubtitles.Handle) then
  begin
    OldString := GetSubText(lstSubtitles.FocusedNode);
    SetText(lstSubtitles.FocusedNode, mmoSubtitleText.Text);
    DetectChangesForUndo(OldString, GetSubText(lstSubtitles.FocusedNode), True);
    lstSubtitles.RepaintNode(lstSubtitles.FocusedNode);
    OrgModified := True;
    HighlightTags(True);
  end;
  lblText.Caption := Format(TextOrTransLength, [LabelText, GetLengthForEachLine(mmoSubtitleText.Text)]);
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mmoTranslationChange(Sender: TObject);
var
  OldString: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
begin
  if mnuTranslatorMode.Checked = True then
  begin
    if (lstSubtitles.SelectedCount = 1) and (mmoTranslation.Text <> GetSubTranslation(lstSubtitles.FocusedNode)) and (GetFocus <> lstSubtitles.Handle) then
    begin
      OldString := GetSubTranslation(lstSubtitles.FocusedNode);
      SetTranslation(lstSubtitles.FocusedNode, mmoTranslation.Text);
      DetectChangesForUndo(OldString, GetSubTranslation(lstSubtitles.FocusedNode), False);
      lstSubtitles.RepaintNode(lstSubtitles.FocusedNode);
  	  TransModified := True;
      HighlightTags(False);
    end;
  end;
  lblTranslation.Caption := Format(TextOrTransLength, [LabelTranslation, GetLengthForEachLine(mmoTranslation.Text)]);
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesDblClick(Sender: TObject);
begin
  if (lstSubtitles.Enabled) and (mmoSubtitleText.Enabled) {and (mmoTranslationX.Enabled) }then
  begin
    if (Player.Initialized) and (mnuVideoPreviewMode.Checked = True) then
    begin
      if (HiWord(GetKeyState(VK_SHIFT)) <> 0) then
      begin
        UnSelectAll(lstSubtitles);
        case OnShiftDblClick of
          0:
            begin
              if mnuTranslatorMode.Checked then
                mmoTranslation.SetFocus else
                mmoSubtitleText.SetFocus;
            end;
          1: SetVideoPos(GetStartTime(lstSubtitles.FocusedNode));
          2: SetVideoPos(GetStartTime(lstSubtitles.FocusedNode) - (SecsToJump2 * 1000));
        end;
        lstSubtitles.Selected[lstSubtitles.FocusedNode] := True;
      end else
      begin
        case OnDoubleClick of
          0:
            begin
              if mnuTranslatorMode.Checked then
                mmoTranslation.SetFocus else
                mmoSubtitleText.SetFocus;
            end;
          1: SetVideoPos(GetStartTime(lstSubtitles.FocusedNode));
          2: SetVideoPos(GetStartTime(lstSubtitles.FocusedNode) - (SecsToJump1 * 1000));
        end;
      end;  

    end else
    begin
      if mnuTranslatorMode.Checked then
        mmoTranslation.SetFocus else
        mmoSubtitleText.SetFocus;
    end;  
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuDisplayOriginalClick(Sender: TObject);
begin
  mnuDisplayOriginal.Checked    := True;
  mnuDisplayTranslation.Checked := False;
//{$IFNDEF UNIOFF}
  subSubtitle.Font.Charset      := OrgCharset;
//{$ENDIF}
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuDisplayTranslationClick(Sender: TObject);
begin
  mnuDisplayOriginal.Checked    := False;
  mnuDisplayTranslation.Checked := True;
//{$IFNDEF UNIOFF}
  subSubtitle.Font.Charset      := TransCharset;
//{$ENDIF}
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesPaintText(Sender: TBaseVirtualTree;
  const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType);
var
  Data     : PSubtitleItem;
  Color    : Integer;
  ItemText : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
begin
  Data := Sender.GetNodeData(Node);

  if Column = 3 then
    ItemText := Data.Text else
  if Column = 4 then
    ItemText := Data.Translation;

  if (((Data.ErrorType <> []) and (MarkErrorsInList)) or (Data.Marked)) and (Column <> 4) then
  begin
    if (Column = 1) or (Column = 2) or (Column = 3) then
    begin
      TargetCanvas.Font.Color := MarkWithColor;
      TargetCanvas.Font.Style := [];
      if MarkBold      then TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold];
      if MarkItalic    then TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsItalic];
      if MarkUnderline then TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsUnderline];
    end;
  end else
  if (Column = 3) or (Column = 4) then
  begin
    Color := GetSubColor(ItemText);
    if ApplyStyleInList then
    begin
      if (Pos(OPEN_I, ItemText) > 0) then
        TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsItalic];
      if (Pos(OPEN_B, ItemText) > 0) then
        TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold];
      if (Pos(OPEN_U, ItemText) > 0) then
        TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsUnderline];
      if (Color > -1) then
        TargetCanvas.Font.Color := Color;
    end;
    if (mnuTranslatorMode.Checked) and (MarkUntransSubs) and (Column = 4) then
    begin
      // We mark items that are not translated...
      if (Data.Text = Data.Translation) or (Data.Translation = '') or (Data.Translation = UntranslatedSub) then
        TargetCanvas.Font.Color := UnTransSubsColor else
        begin
          if (ApplyStyleInList) and (Color > -1) then
            TargetCanvas.Font.Color := Color;
        end;
    end;
  end;
end;


// -----------------------------------------------------------------------------

procedure TfrmMain.btnMoveSubtitleClick(Sender: TObject);
var
  CurrTime : Integer;
  DiffTime : Integer;
begin
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked) and (lstSubtitles.SelectedCount >= 1) then
  begin
    CurrTime := GetCurrentPos;
    DiffTime := CurrTime - GetStartTime(lstSubtitles.GetFirstSelected);
    SetDelay(DiffTime, True);
  end;  
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnSetStartTimeClick(Sender: TObject);
var
  UndoAction: PUndoAction;
begin
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked) and (Assigned(lstSubtitles.FocusedNode)) and (lstSubtitles.SelectedCount = 1) then
  begin
    ClearUndoList(RedoList);
    mnuRedo.Enabled := False;

    New(UndoAction);
    UndoAction^.UndoActionType := uaTimeChange;
    UndoAction^.BufferSize     := SizeOf(TTimeChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := lstSubtitles.FocusedNode;
    UndoAction^.LineNumber     := lstSubtitles.FocusedNode.Index;
    UndoAction^.BindToNext     := False;
    PTimeChange(UndoAction^.Buffer)^.StartTime := GetStartTime(lstSubtitles.FocusedNode);
    PTimeChange(UndoAction^.Buffer)^.FinalTime := -1;
    UndoList.Add(UndoAction);

    mnuUndo.Enabled := True;
    SetStartTime(lstSubtitles.FocusedNode, GetCurrentPos);
    lstSubtitles.RepaintNode(lstSubtitles.FocusedNode);
    RefreshTimes;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnSetFinalTimeClick(Sender: TObject);
var
  UndoAction  : PUndoAction;
  UndoAction2 : PUndoAction;
  CurrPos     : Integer;
begin
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked) and (Assigned(lstSubtitles.FocusedNode)) and (lstSubtitles.SelectedCount = 1) then
  begin
    ClearUndoList(RedoList);
    mnuRedo.Enabled := False;
      
    New(UndoAction);
    UndoAction^.UndoActionType := uaTimeChange;
    UndoAction^.BufferSize     := SizeOf(TTimeChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := lstSubtitles.FocusedNode;
    UndoAction^.LineNumber     := lstSubtitles.FocusedNode.Index;
    UndoAction^.BindToNext     := False;
    PTimeChange(UndoAction^.Buffer)^.StartTime := -1;
    PTimeChange(UndoAction^.Buffer)^.FinalTime := GetFinalTime(lstSubtitles.FocusedNode);
    UndoList.Add(UndoAction);

    CurrPos := GetCurrentPos;
    SetFinalTime(lstSubtitles.FocusedNode, CurrPos);
    if Assigned(lstSubtitles.FocusedNode.NextSibling) then
    begin
      if GetStartTime(lstSubtitles.FocusedNode.NextSibling) <= CurrPos then
      begin
        PUndoAction(UndoList.Last)^.BindToNext := True;

        New(UndoAction2);
        UndoAction2^.UndoActionType := uaTimeChange;
        UndoAction2^.BufferSize     := SizeOf(TTimeChange);
        UndoAction2^.Buffer         := AllocMem(UndoAction2^.BufferSize);
        UndoAction2^.Node           := lstSubtitles.FocusedNode.NextSibling;
        UndoAction2^.LineNumber     := lstSubtitles.FocusedNode.NextSibling.Index;
        UndoAction2^.BindToNext     := False;
        PTimeChange(UndoAction2^.Buffer)^.StartTime := GetStartTime(lstSubtitles.FocusedNode.NextSibling);
        PTimeChange(UndoAction2^.Buffer)^.FinalTime := -1;
        UndoList.Add(UndoAction2);

        if FormatType = ftTime then
          SetStartTime(lstSubtitles.FocusedNode.NextSibling, CurrPos + ID_TIMEOVERLAPPRECISION) else
          SetStartTime(lstSubtitles.FocusedNode.NextSibling, CurrPos + Round(GetFPS));
      end;
      lstSubtitles.Selected[lstSubtitles.FocusedNode] := False;
      lstSubtitles.FocusedNode := lstSubtitles.FocusedNode.NextSibling;
    end;
    lstSubtitles.Selected[lstSubtitles.FocusedNode] := True;
    RefreshTimes;
    mnuUndo.Enabled := True;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnStartSubtitleClick(Sender: TObject);
begin
  if (Player.Initialized) then
    StartSubTime := GetCurrentPos; 
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnEndSubtitleClick(Sender: TObject);
var
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
begin
  if (Player.Initialized) and (StartSubTime <> -1) and (lstSubtitles.Enabled) then
  begin
    Node := InsertNode;
    if Assigned(lstSubtitles.FocusedNode) then
      lstSubtitles.Selected[lstSubtitles.FocusedNode] := False;
    lstSubtitles.FocusedNode := Node;
    lstSubtitles.Selected[Node] := True;
    SetStartTime(Node, StartSubtime);
    SetFinalTime(Node, GetCurrentPos);

    ClearUndoList(RedoList);
    mnuRedo.Enabled := False;

    New(UndoAction);
    UndoAction^.UndoActionType := uaInsertLine;
    UndoAction^.LineNumber     := lstSubtitles.FocusedNode.Index;
    UndoAction^.Node           := lstSubtitles.FocusedNode;
    UndoAction^.BindToNext     := False;
    UndoAction^.Buffer         := nil;
    UndoAction^.BufferSize     := 0;
    UndoList.Add(UndoAction);
    mnuUndo.Enabled := True;

    mmoSubtitleText.SetFocus;
    RefreshTimes;
  end;  
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuInsertSubtitleClick(Sender: TObject);
var
  UndoAction: PUndoAction;
begin
  InsertNode;
  ClearUndoList(RedoList);
  mnuRedo.Enabled := False;
  lstSubtitles.Refresh;
  RefreshTimes;

  New(UndoAction);
  UndoAction^.UndoActionType := uaInsertLine;
  UndoAction^.LineNumber     := lstSubtitles.FocusedNode.Index;
  UndoAction^.Node           := lstSubtitles.FocusedNode;
  UndoAction^.BindToNext     := False;
  UndoAction^.Buffer         := nil;
  UndoAction^.BufferSize     := 0;
  UndoList.Add(UndoAction);
  mnuUndo.Enabled := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuInsertBeforeClick(Sender: TObject);
var
  UndoAction: PUndoAction;
begin
  InsertNode(False);
  ClearUndoList(RedoList);
  mnuRedo.Enabled := False;
  lstSubtitles.Refresh;
  RefreshTimes;

  New(UndoAction);
  UndoAction^.UndoActionType := uaInsertLine;
  UndoAction^.LineNumber     := lstSubtitles.FocusedNode.Index;
  UndoAction^.Node           := lstSubtitles.FocusedNode;
  UndoAction^.BindToNext     := False;
  UndoAction^.Buffer         := nil;
  UndoAction^.BufferSize     := 0;
  UndoList.Add(UndoAction);
  mnuUndo.Enabled := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuRemoveSelectedClick(Sender: TObject);
begin
  DeleteSelectedNodes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  RefreshTimes;
  HighlightTags(True);
  HighlightTags(False);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if AskToSaveFile = False then
    CanClose := False else
    CanClose := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuCutClick(Sender: TObject);
begin
  if GetFocus = lstSubtitles.Handle then
  begin
    CopyNodesToClipBoard;
    DeleteSelectedNodes;
  end else
  if GetFocus = mmoSubtitleText.Handle then
    mmoSubtitleText.CutToClipboard else
  if (mnuTranslatorMode.Checked) and (GetFocus = mmoTranslation.Handle) then
    mmoTranslation.CutToClipboard;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuCopyClick(Sender: TObject);
var
  CurrFocus: HWND;
begin
  CurrFocus := GetFocus;
  if CurrFocus = lstSubtitles.Handle then
    CopyNodesToClipBoard else
  if CurrFocus = mmoSubtitleText.Handle then
    mmoSubtitleText.CopyToClipboard else
  if (mnuTranslatorMode.Checked) and (CurrFocus = mmoTranslation.Handle) then
    mmoTranslation.CopyToClipboard else
  if CurrFocus = tmeShow.Handle then
    ClipBoard.SetTextBuf(PChar(TimeToString(tmeShow.Time))) else
  if CurrFocus = tmeHide.Handle then
    ClipBoard.SetTextBuf(PChar(TimeToString(tmeHide.Time))) else
  if CurrFocus = tmeDuration.Handle then
    ClipBoard.SetTextBuf(PChar(TimeToString(tmeDuration.Time)));
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuPasteClick(Sender: TObject);
var
  CurrFocus : HWND;
  Text      : String;
  Time      : Integer;
begin
  CurrFocus := GetFocus;
  if GetFocus = lstSubtitles.Handle then
    PasteNodesFromClipBoard else
  if Clipboard.HasFormat(CF_TEXT) then
  begin
    if GetFocus = mmoSubtitleText.Handle then
      mmoSubtitleText.PasteFromClipboard else
    if (mnuTranslatorMode.Checked) and (GetFocus = mmoTranslation.Handle) then
      mmoTranslation.PasteFromClipboard else
    begin
      if (CurrFocus = tmeShow.Handle) or (CurrFocus = tmeHide.Handle) or (CurrFocus = tmeDuration.Handle) then
      begin
        Text := Clipboard.AsText;
        if Text <> '' then
        begin
          if IsInteger(Text) then
            Time := FramesToTime(StrToInt(Text), GetFPS) else
            Time := StringToTime(Text);
          if Time = -1 then exit;

          if GetFocus = tmeShow.Handle then
            SetStartTime(lstSubtitles.FocusedNode, Time);
          if GetFocus = tmeHide.Handle then
            SetFinalTime(lstSubtitles.FocusedNode, Time);
          if GetFocus = tmeDuration.Handle then
            SetFinalTime(lstSubtitles.FocusedNode, GetStartTime(lstSubtitles.FocusedNode) + Time);

          lstSubtitles.RepaintNode(lstSubtitles.FocusedNode);
          RefreshTimes;
        end;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuJumpToNextLineClick(Sender: TObject);
var
  a: HWND;
  i: Integer;
begin
  a := GetFocus;
  if (mnuTranslatorMode.Checked) and (a = mmoTranslation.Handle) then
    MemoKeyPress(mmoTranslation, lstSubtitles, True) else
  if (a = mmoSubtitleText.Handle) or (a = lstSubtitles.Handle) then
    MemoKeyPress(mmoSubtitleText, lstSubtitles, True) else
  if a = tmeShow.Handle then
  begin
    i := tmeShow.SelStart;
    MemoKeyPress(tmeShow, lstSubtitles, True);
    if tmeShow.SelStart <> i then
      tmeShow.SelStart := i;
  end else
  if a = tmeHide.Handle then
  begin
    i := tmeHide.SelStart;
    MemoKeyPress(tmeHide, lstSubtitles, True);
    if tmeHide.SelStart <> i then
      tmeHide.SelStart := i;
  end else
  if a = tmeDuration.Handle then
  begin
    i := tmeDuration.SelStart;
    MemoKeyPress(tmeDuration, lstSubtitles, True);
    if tmeDuration.SelStart <> i then
      tmeDuration.SelStart := i;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuJumpToPrevLineClick(Sender: TObject);
var
  a: HWND;
  i: Integer;
begin
  a := GetFocus;
  if (mnuTranslatorMode.Checked) and (a = mmoTranslation.Handle) then
    MemoKeyPress(mmoTranslation, lstSubtitles, False) else
  if (a = mmoSubtitleText.Handle) or (a = lstSubtitles.Handle) then
    MemoKeyPress(mmoSubtitleText, lstSubtitles, False) else
  if a = tmeShow.Handle then
  begin
    i := tmeShow.SelStart;
    MemoKeyPress(tmeShow, lstSubtitles, False);
    if tmeShow.SelStart <> i then
      tmeShow.SelStart := i;
  end else
  if a = tmeHide.Handle then
  begin
    i := tmeHide.SelStart;
    MemoKeyPress(tmeHide, lstSubtitles, False);
    if tmeHide.SelStart <> i then
      tmeHide.SelStart := i;
  end else
  if a = tmeDuration.Handle then
  begin
    i := tmeDuration.SelStart;
    MemoKeyPress(tmeDuration, lstSubtitles, False);
    if tmeDuration.SelStart <> i then
      tmeDuration.SelStart := i;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuJumpToNextSubClick(Sender: TObject);
begin
  btnNextSub.OnClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuJumpToPrevSubClick(Sender: TObject);
begin
  btnPrevSub.OnClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuZeroFunctionClick(Sender: TObject);
begin
  if (GetFocus = mmoSubtitleText.Handle) then
    mmoSubtitleText.Undo else
  if (mnuTranslatorMode.Checked) and (GetFocus = mmoTranslation.Handle) then
    mmoTranslation.Undo else
  ZeroFunction;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSubDblClickClick(Sender: TObject);
begin
  lstSubtitlesDblClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSortClick(Sender: TObject);
begin
  SortSubtitles;
  lstSubtitles.Refresh;
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuReverseTextClick(Sender: TObject);
begin
  TreeViewHandle.ReverseText(KeepOrderOfLines);
  lstSubtitles.Refresh;
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFixPunctuationClick(Sender: TObject);
var
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
begin
  ClearUndoList(RedoList);
  mnuRedo.Enabled := False;

  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    New(UndoAction);
    UndoAction^.UndoActionType := uaRTLFix;
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;
    UndoAction^.BufferSize     := SizeOf(TRTLFix);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    PRTLFix(UndoAction^.Buffer)^.ReverseText    := False;
    PRTLFix(UndoAction^.Buffer)^.FixPunctuation := True;
    PRTLFix(UndoAction^.Buffer)^.Original       := True;
      
    if mnuTranslatorMode.Checked then
    begin
      PRTLFix(UndoAction^.Buffer)^.Original := False;
      if GetSubTranslation(Node) <> UntranslatedSub then
        SetTranslation(Node, FixRTLPunctuation(GetSubTranslation(Node)));
    end else
      SetText(Node, FixRTLPunctuation(GetSubText(Node)));

    Node := lstSubtitles.GetNextSelected(Node);
    UndoAction^.BindToNext := Assigned(Node);
    UndoList.Add(UndoAction);     
  end;

  mnuUndo.Enabled := True;
  lstSubtitles.Refresh;
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuMoveSubtitleClick(Sender: TObject);
begin
  btnMoveSubtitleClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetStartTimeClick(Sender: TObject);
begin
  btnSetStartTimeClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetFinalTimeClick(Sender: TObject);
begin
  btnSetFinalTimeClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuStartSubtitleClick(Sender: TObject);
begin
  btnStartSubtitleClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuEndSubtitleClick(Sender: TObject);
begin
  btnEndSubtitleClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuCombineSubtitlesClick(Sender: TObject);
var
  Data       : PSubtitleItem;
  UpdNode    : PVirtualNode;
  Node       : PVirtualNode;
  FinalTime  : Integer;
  NewText    : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  NewTrans   : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  UndoAction : PUndoAction;
begin
  if lstSubtitles.SelectedCount > 1 then
  begin
    UpdNode := lstSubtitles.GetFirstSelected;
    FinalTime := GetFinalTime(UpdNode);
    NewText  := GetSubText(UpdNode);
    NewTrans := GetSubTranslation(UpdNode);

{
    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.Node           := UpdNode;
    UndoAction^.LineNumber     := UpdNode.Index;
    UndoAction^.BindToNext     := True;
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
    PFullTextChange(UndoAction^.Buffer)^.OldText := NewText;
    PFullTextChange(UndoAction^.Buffer)^.OldTrans := NewTrans;
    UndoList.Add(UndoAction);
}
    Data := lstSubtitles.GetNodeData(UpdNode);
    New(UndoAction);
    UndoAction^.UndoActionType := uaFullSubChange;
    UndoAction^.BufferSize     := SizeOf(TLineChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := UpdNode;
    UndoAction^.LineNumber     := UpdNode.Index;
    UndoAction^.BindToNext     := True;
    PLineChange(UndoAction^.Buffer).SubtitleItem := Data^;
    UndoList.Add(UndoAction);

    Node := lstSubtitles.GetNextSelected(UpdNode);
    while Assigned(Node) do
    begin
      FinalTime := GetFinalTime(Node);
      if GetSubText(Node) <> '' then
        NewText := NewText + #13#10 + GetSubText(Node);
      if GetSubTranslation(Node) <> '' then
        NewTrans := NewTrans + #13#10 + GetSubTranslation(Node);
      Node := lstSubtitles.GetNextSelected(Node);
    end;

    lstSubtitles.Selected[UpdNode] := False;
    DeleteSelectedWithUndo;
    lstSubtitles.FocusedNode := UpdNode;
    lstSubtitles.Selected[UpdNode] := True;

    SetFinalTime(UpdNode, FinalTime);
    SetText(UpdNode, NewText);
    SetTranslation(UpdNode, NewTrans);

    RefreshTimes;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSmartLineAdjustClick(Sender: TObject);
var
  adj1, adj2, adj3 : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  a          : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  tmp        : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
  IsOriginal : Boolean;
begin
  if mmoTranslation.Focused then
    IsOriginal := False else
    IsOriginal := True;

  ClearUndoList(RedoList);
  mnuRedo.Enabled := False;

  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;

    if IsOriginal then
    begin
      tmp := GetSubText(Node);
      PFullTextChange(UndoAction^.Buffer)^.OldText := tmp;
      PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;
    end else begin
      tmp := GetSubTranslation(Node);
      PFullTextChange(UndoAction^.Buffer)^.OldTrans := tmp;
      PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
      PFullTextChange(UndoAction^.Buffer)^.OldText := GetSubText(Node);   // original must be stored too
    end;

    adj1 := AdjustLines(tmp, True, True);
    adj2 := AdjustLines(tmp, True, False);
    adj3 := AdjustLines(tmp, False, False);

    if Vars.ToggleBreakPoint then
    begin
      if (tmp = adj2) or (tmp = adj3) then
      begin
      if tmp = adj2 then
        a := adj3 else
      if tmp = adj3 then
        a := adj2
      end else
        a := adj1;
    end else
      a := adj1;

    if IsOriginal then
      SetText(Node, a) else
      SetTranslation(Node, a);

    if (GetSubText(Node) <> PFullTextChange(UndoAction^.Buffer)^.OldText) or
       ((mnuTranslatorMode.Checked) and (GetSubTranslation(Node) <> PFullTextChange(UndoAction^.Buffer)^.OldTrans)) then
      UndoList.Add(UndoAction);

    Node := lstSubtitles.GetNextSelected(Node);
    UndoAction^.BindToNext := Assigned(Node);
  end;

  mnuUndo.Enabled := True;
  lstSubtitles.Refresh;
  RefreshTimes;
  frmMain.OrgModified := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuConvertCaseClick(Sender: TObject);
begin
  frmConvertCase := TfrmConvertCase.Create(Application);
  frmConvertCase.ShowModal;
  frmConvertCase.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuUnbreakSubtitlesClick(Sender: TObject);
var
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
begin
  ClearUndoList(RedoList);
  mnuRedo.Enabled := False;

  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;
    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := mnuTranslatorMode.Checked;
    PFullTextChange(UndoAction^.Buffer)^.OldText := GetSubText(Node);

    SetText(Node, ReplaceEnters(GetSubText(Node), ' '));
    if mnuTranslatorMode.Checked then
    begin
      PFullTextChange(UndoAction^.Buffer)^.OldTrans := GetSubTranslation(Node);
      SetTranslation(Node, ReplaceEnters(GetSubTranslation(Node), ' '));
    end;
    
    Node := lstSubtitles.GetNextSelected(Node);
    UndoAction^.BindToNext := Assigned(Node);

    UndoList.Add(UndoAction);
  end;

  mnuUndo.Enabled := True;
  lstSubtitles.Refresh;
  RefreshTimes;
  frmMain.OrgModified := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuDivideLinesClick(Sender: TObject);
begin
  frmDivideLines := TfrmDivideLines.Create(Application);
  frmDivideLines.ShowModal;
  frmDivideLines.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFastDivideLinesClick(Sender: TObject);
var
  Ini                 : TIniFile;
  BreaksArray         : TOpenIntegerArray;
  AdjustAutomatically : Boolean;
  Part1, Part2        : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  ExtraVar            : Integer;
  Data1, Data2        : PSubtitleItem;
  Time1               : Integer;
  DurPerChar          : Single;
  UndoAction          : PUndoAction;
  IsOriginal          : Boolean;
  tmp                 : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
begin
  if mmoTranslation.Focused then
    IsOriginal := False else
    IsOriginal := True;

  ClearUndoList(RedoList);
  mnuRedo.Enabled := False;

  // refactoring -> change to global variable
  Ini := TIniFile.Create(IniRoot);
  try
    AdjustAutomatically := Ini.ReadBool('Advanced', 'Smart line adjust automatically', True);
  finally
    Ini.Free;
  end;

  Data1 := lstSubtitles.GetNodeData(lstSubtitles.FocusedNode);

  if IsOriginal then
    ProcessStringToDivide(Data1.Text, BreaksArray, AdjustAutomatically, Part1, Part2, ExtraVar) else
    ProcessStringToDivide(Data1.Translation, BreaksArray, AdjustAutomatically, Part1, Part2, ExtraVar);

  if ((Part1<>'') and (Part2<>'')) then
  begin
  lstSubtitles.InsertNode(lstSubtitles.FocusedNode, amInsertAfter);
  Data2 := lstSubtitles.GetNodeData(lstSubtitles.GetNextSibling(lstSubtitles.FocusedNode));

  New(UndoAction);
  UndoAction^.UndoActionType := uaFullTextChange;
  UndoAction^.Node           := lstSubtitles.FocusedNode;
  UndoAction^.LineNumber     := lstSubtitles.FocusedNode.Index;
  UndoAction^.BindToNext     := True;
  UndoAction^.BufferSize     := SizeOf(TFullTextChange);
  UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
  PFullTextChange(UndoAction^.Buffer)^.OldText := Data1.Text;
  if IsOriginal then
    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True
  else
  begin
    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
    PFullTextChange(UndoAction^.Buffer)^.OldTrans := Data1.Translation;
  end;
  UndoList.Add(UndoAction);

  New(UndoAction);
  UndoAction^.UndoActionType := uaTimeChange;
  UndoAction^.Node           := lstSubtitles.FocusedNode;
  UndoAction^.LineNumber     := lstSubtitles.FocusedNode.Index;
  UndoAction^.BindToNext     := True;
  UndoAction^.BufferSize     := SizeOf(TTimeChange);
  UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
  PTimeChange(UndoAction^.Buffer)^.StartTime := Data1.InitialTime;
  PTimeChange(UndoAction^.Buffer)^.FinalTime := Data1.FinalTime;
  UndoList.Add(UndoAction);

  New(UndoAction);
  UndoAction^.UndoActionType := uaInsertLine;
  UndoAction^.Node           := lstSubtitles.GetNextSibling(lstSubtitles.FocusedNode);
  UndoAction^.LineNumber     := UndoAction^.Node.Index;
  UndoAction^.BindToNext     := False;
  UndoAction^.Buffer         := nil;
  UndoAction^.BufferSize     := 0;
  UndoList.Add(UndoAction);

  TrimParts(Part1, Part2);

  if IsOriginal then
    tmp := RemoveSWTags(Data1.Text, True, True, True, True) else
    tmp := RemoveSWTags(Data1.Translation, True, True, True, True);

  if Length(tmp) <> 0 then
    DurPerChar := (Data1.FinalTime - Data1.InitialTime) / Length(tmp) else // Milliseconds
    DurPerChar := 0;
  Time1 := Round(DurPerChar * Length(Part1));

  if IsOriginal then
    Data1.Text        := Part1 else
    Data1.Translation := Part1;

  ExtraVar        := Data1.FinalTime;
  Data1.FinalTime := Time1 + Data1.InitialTime;

  if IsOriginal then
  begin
    Data2.Text        := Part2;
    Data2.Translation := UntranslatedSub;
  end else
  begin
//    Data2.Text        := UntranslatedSub;
    Data2.Translation := Part2;
  end;

  Data2.InitialTime := Data1.FinalTime + Vars.GapBetweenSubs;
  Data2.FinalTime   := ExtraVar;

  lstSubtitles.Selected[lstSubtitles.FocusedNode] := False;
  lstSubtitles.FocusedNode := lstSubtitles.FocusedNode.NextSibling;
  lstSubtitles.Selected[lstSubtitles.FocusedNode] := True;  

  end;

  mnuUndo.Enabled := True;
  RefreshTimes;
  lstSubtitles.Refresh;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetMaxLineLengthClick(Sender: TObject);
  function BreakInLines(Text: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; MaximumLineLength: Integer): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  var
    i: Integer;
    StyleTag : TStyleTag;
  begin
    StyleTag := StoreTags(Text);

    // Remove tags
    Text := RemoveSWTags(Text, True, True, True, True);
    Text := WrapText(ReplaceEnters(Text, ' '), MaximumLineLength);

    i := Pos(' ' + #13#10, Text);
    while i > 0 do
    begin
      Delete(Text, i, 1);
      i := Pos(' ' + #13#10, Text);
    end;  

    if SubtitleAPI.NoInteractionWithTags = False then
    begin
      Text := RestoreSWTags(Text, StyleTag);
    end;

    Result := Text;
  end;
var
  Node       : PVirtualNode;
  OldText    : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  NewText    : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  OldTrans   : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  NewTrans   : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  UndoAction : PUndoAction;
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;

    OldText := GetSubText(Node);
    NewText := BreakInLines(OldText, Vars.MaxLineLength);

    PFullTextChange(UndoAction^.Buffer)^.OldText := OldText;

    SetText(Node, NewText);
    if mnuTranslatorMode.Checked then
    begin
      OldTrans := GetSubTranslation(Node);
      NewTrans := BreakInLines(OldTrans, Vars.MaxLineLength);

      PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;
      PFullTextChange(UndoAction^.Buffer)^.OldTrans := OldTrans;
      SetTranslation(Node, NewTrans);
    end;

    Node := lstSubtitles.GetNextSelected(Node);
    UndoAction^.BindToNext := Assigned(Node);

    if ((mnuTranslatorMode.Checked = False) and (OldText <> NewText)) or
       ((mnuTranslatorMode.Checked = True) and (OldTrans <> NewTrans)) then
      UndoList.Add(UndoAction);
  end;
  mnuUndo.Enabled := True;
  lstSubtitles.Refresh;
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.cmbOrgCharsetSelect(Sender: TObject);
begin
//{$IFNDEF UNIOFF}
  if cmbOrgCharset.ItemIndex <> -1 then
  begin
    OrgCharset := StrCharsetToInt(cmbOrgCharset.Items[cmbOrgCharset.ItemIndex]);
    mmoSubtitleText.Font.Charset := OrgCharset;
    lstSubtitles.Refresh;
    if (Player.Initialized) and (mnuDisplayOriginal.Checked) then
      subSubtitle.Font.Charset := OrgCharset;
  end;
//{$ENDIF}
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.cmbTransCharsetSelect(Sender: TObject);
begin
//{$IFNDEF UNIOFF}
  if cmbTransCharset.ItemIndex <> -1 then
  begin
    TransCharset := StrCharsetToInt(cmbTransCharset.Items[cmbTransCharset.ItemIndex]);
    mmoTranslation.Font.Charset := TransCharset;
    lstSubtitles.Refresh;
    if (Player.Initialized) and (mnuDisplayTranslation.Checked) then
      subSubtitle.Font.Charset := TransCharset;
  end;
//{$ENDIF}
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuNewSubtitleClick(Sender: TObject);
begin
  if CloseSub then
  begin
    SubtitleAPI.CreateNewSubtitle;
    OldInputFPS := GetInputFPS;
    EnableCtrls(True);
    InsertNode;
    RefreshTimes;
    OrgModified   := False;
    TransModified := False;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFirstSyncPointClick(Sender: TObject);
begin
  btnSyncPoint1Click(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuLastSyncPointClick(Sender: TObject);
begin
  btnSyncPoint2Click(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuAddSyncPointClick(Sender: TObject);
begin
  btnAddSyncPointClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnSyncPoint1Click(Sender: TObject);
begin
  if (Player.Initialized) and (lstSubtitles.RootNodeCount > 1) and (lstSubtitles.Enabled) then
  begin
    SyncPoint.Point1Sub   := GetStartTime(lstSubtitles.GetFirstSelected);
    SyncPoint.Point1Movie := GetCurrentPos;
  end;  
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnSyncPoint2Click(Sender: TObject);
begin
  if (Player.Initialized) and (SyncPoint.Point1Sub <> -1) and (SyncPoint.Point1Movie <> -1) and (lstSubtitles.RootNodeCount > 1) and (lstSubtitles.Enabled) then
  begin
    SyncPoint.Point2Sub   := GetStartTime(lstSubtitles.GetFirstSelected);
    SyncPoint.Point2Movie := GetCurrentPos;

    if MsgBox(Format(QuestionMsg[06], [TimeToString(SyncPoint.Point1Sub),
                                      TimeToString(SyncPoint.Point1Movie),
                                      TimeToString(SyncPoint.Point2Sub),
                                      TimeToString(SyncPoint.Point2Movie)]),
              BTN_YES, BTN_NO, '', MB_ICONQUESTION, frmMain) = mrOk then
    begin
      AdjustSubtitles(SyncPoint);
      SyncPoint.Point1Sub   := -1;
      SyncPoint.Point1Movie := -1;
      SyncPoint.Point2Sub   := -1;
      SyncPoint.Point2Movie := -1;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnAddSyncPointClick(Sender: TObject);
begin
  if (lstSubtitles.RootNodeCount > 1) and (Assigned(lstSubtitles.FocusedNode)) and (lstSubtitles.SelectedCount = 1) then
  begin
    if AdjustFormOpened = False then
    begin
      frmAdjustSubtitles := TfrmAdjustSubtitles.Create(Application);
      frmAdjustSubtitles.pgeMode.ActivePageIndex := 1;
      frmAdjustSubtitles.Show;
      AdjustFormOpened := True;
    end else
      frmAdjustSubtitles.BringToFront;
    frmAdjustSubtitles.AddSyncPoint(GetStartTime(lstSubtitles.GetFirstSelected), GetCurrentPos, lstSubtitles.GetFirstSelected.Index + 1);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSelectAllClick(Sender: TObject);
begin
  lstSubtitles.SelectAll(False);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuBack5SecClick(Sender: TObject);
begin
  SetVideoPos(GetCurrentPos - 5000);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFwd5SecClick(Sender: TObject);
begin
  SetVideoPos(GetCurrentPos + 5000);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetDurationLimitsClick(Sender: TObject);
begin
  frmDurationLimits := TfrmDurationLimits.Create(Application);
  frmDurationLimits.ShowModal;
  frmDurationLimits.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetDelayClick(Sender: TObject);
begin
  frmSetDelay := TfrmSetDelay.Create(Application);
  frmSetDelay.ShowModal;
  frmSetDelay.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuAdjustSubtitlesClick(Sender: TObject);
begin
  if AdjustFormOpened = False then
  begin
    frmAdjustSubtitles := TfrmAdjustSubtitles.Create(Application);
    frmAdjustSubtitles.pgeMode.ActivePageIndex := 0;    
    frmAdjustSubtitles.Show;
    AdjustFormOpened := True;
  end else
    frmAdjustSubtitles.BringToFront;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSubSearchClick(Sender: TObject);
begin
  frmSearchAndReplace := TfrmSearchAndReplace.Create(Application);
  frmSearchAndReplace.pgeCtrl.ActivePageIndex := 0;
  frmSearchAndReplace.ShowModal;
  frmSearchAndReplace.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFindNextClick(Sender: TObject);
begin
  if FindInNode(SearchWord, CaseSensitive, MatchWholeWords, True) = nil then
    MsgBox(Format(InfoMsg[01], [SearchWord]), BTN_OK, '', '', MB_ICONINFORMATION, frmMain) else
    RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSearchAndReplaceClick(Sender: TObject);
begin
  frmSearchAndReplace := TfrmSearchAndReplace.Create(Application);
  frmSearchAndReplace.pgeCtrl.ActivePageIndex := 1;
  frmSearchAndReplace.ShowModal;
  frmSearchAndReplace.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuGoToLineNumberClick(Sender: TObject);
var
  S    : String;
begin
  S := '';
  if QueryInput(GoToLineNum, EnterLineNum, S, frmMain) = mrOk then
  begin
    if (IsInteger(S) = False) or (Length(S) > 8) then
      MsgBox(ErrorMsg[06], BTN_OK, '', '', MB_ICONERROR, frmMain)
    else
      GoToLineNumber(StrToInt(S));
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuBatchConvertClick(Sender: TObject);
begin
  frmBatchConvert := TfrmBatchConvert.Create(Application);
  frmBatchConvert.ShowModal;
  frmBatchConvert.Free; 
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSwapClick(Sender: TObject);
begin
  SwapOrgTrans(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuExtendLengthClick(Sender: TObject);
var
  Node       : PVirtualNode;
  FinalTime  : Integer;
  UndoAction : PUndoAction;
begin
  ClearUndoList(RedoList);
  mnuRedo.Enabled := False;

  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    FinalTime := GetFinalTime(Node);
    New(UndoAction);
    UndoAction^.UndoActionType                 := uaTimeChange;
    UndoAction^.BufferSize                     := SizeOf(TTimeChange);
    UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node                           := Node;
    UndoAction^.LineNumber                     := Node.Index;
    PTimeChange(UndoAction^.Buffer)^.StartTime := -1;
    PTimeChange(UndoAction^.Buffer)^.FinalTime := FinalTime;

    if Node <> lstSubtitles.GetLast then
      SetFinalTime(Node, GetStartTime(Node.NextSibling)-Vars.GapBetweenSubs);

    if FinalTime <> GetFinalTime(Node) then
    begin
      UndoAction^.BindToNext := Assigned(lstSubtitles.GetNextSelected(Node));
      UndoList.Add(UndoAction);
    end;

    Node := lstSubtitles.GetNextSelected(Node);
  end;

  mnuUndo.Enabled := True;
  lstSubtitles.Refresh;
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuAutomaticDurationsClick(Sender: TObject);
begin
  frmAutomaticDurations := TfrmAutomaticDurations.Create(Application);
  frmAutomaticDurations.ShowModal;
  frmAutomaticDurations.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSplitSubtitleClick(Sender: TObject);
begin
  frmSplit := TfrmSplit.Create(Application);
  frmSplit.ShowModal;
  frmSplit.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuJoinSubtitleClick(Sender: TObject);
begin
  frmJoin := TfrmJoin.Create(Application);
  frmJoin.ShowModal;
  frmJoin.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuInformationAndErrorsClick(Sender: TObject);
begin
  if InfoErrorsFormOpened = False then
  begin
    frmInfoErrors := TfrmInfoErrors.Create(Application);
    frmInfoErrors.Show;
    AdjustFormOpened := True;
  end else
    frmInfoErrors.BringToFront;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuVariousInformationClick(Sender: TObject);
begin
  frmVariousInfo := TfrmVariousInfo.Create(Application);
  frmVariousInfo.ShowModal;
  frmVariousInfo.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuAddFPSfromAVIClick(Sender: TObject);
var
  FPS      : Single;
  Duration : Integer;
begin
  dlgLoadFile.Filter := 'AVI Files (*.avi)|*.avi';
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
  begin
    if GetVideoInfo(dlgLoadFile.FileName, FPS, Duration) = True then
      AddFPSItem(FPS, False, True, False) else
      MsgBox(Format(ErrorMsg[05], [dlgLoadFile.FileName]), BTN_OK, '', '', MB_ICONERROR, frmMain);
  end;
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.ProcessTag(Tag : TTagClass; WholeSubtitle: Boolean; Color: TColor = clBlack);
  function SetTag(Tag: TTagClass; Text: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; Color: TColor): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  begin
    Result := Text;
    case Tag of
      tagBold:      if Pos(OPEN_B, Text) = 0 then AddBold(Result);
      tagItalic:    if Pos(OPEN_I, Text) = 0 then AddItalic(Result);
      tagUnderline: if Pos(OPEN_U, Text) = 0 then AddUnderline(Result);
      tagBoldRemove:      Result := RemoveSWTags(Result, True  {B}, False {I}, False {U}, False {C}, True);
      tagItalicRemove:    Result := RemoveSWTags(Result, False {B}, True  {I}, False {U}, False {C}, True);
      tagUnderlineRemove: Result := RemoveSWTags(Result, False {B}, False {I}, True  {U}, False {C}, True);
      tagColor:       Result := SetColorTag(Result, Color);
      tagColorRemove: Result := RemoveSWTags(Result, False {B}, False {I}, False {U}, True {C}, True);
    end;
  end;
var
  Text         : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  Node         : PVirtualNode;
  UndoAction   : PUndoAction;
  OriginalOnly : Boolean; // True for original, false for both (translation and original)
begin
  ClearUndoList(RedoList);
  mnuRedo.Enabled := False;

  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := UndoAction^.Node.Index;
    UndoAction^.BindToNext     := lstSubtitles.SelectedCount > 1;

    Text := GetSubText(Node);
    PFullTextChange(UndoAction^.Buffer)^.OldText := Text;
    SetText(Node, SetTag(Tag, Text, Color));

    if mnuTranslatorMode.Checked then
    begin
      OriginalOnly := False;

      Text := GetSubTranslation(Node);
      PFullTextChange(UndoAction^.Buffer)^.OldTrans := Text;
      SetTranslation(Node, SetTag(Tag, Text, Color));
    end else
      OriginalOnly := True;

    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := OriginalOnly;

    Node := lstSubtitles.GetNextSelected(Node);

    if Assigned(Node) = False then UndoAction^.BindToNext := False;

    UndoList.Add(UndoAction);
  end;

  mnuUndo.Enabled := True;
  lstSubtitles.Refresh;
  RefreshTimes;

  HighlightTags(True);
  HighLightTags(False);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuBoldClick(Sender: TObject);
begin
  if mmoSubtitleText.Focused or mmoTranslation.Focused then
    SetPartialTag(OPEN_B, CLOSE_B) else
    if mnuBold.Checked = False then
      ProcessTag(tagBold, True) else
      ProcessTag(tagBoldRemove, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuItalicClick(Sender: TObject);
begin
  if mmoSubtitleText.Focused or mmoTranslation.Focused then
    SetPartialTag(OPEN_I, CLOSE_I) else
    if mnuItalic.Checked = False then
      ProcessTag(tagItalic, True) else
      ProcessTag(tagItalicRemove, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuUnderlineClick(Sender: TObject);
begin
  if mmoSubtitleText.Focused or mmoTranslation.Focused then
    SetPartialTag(OPEN_U, CLOSE_U) else
    if mnuUnderline.Checked = False then
      ProcessTag(tagUnderline, True) else
      ProcessTag(tagUnderlineRemove, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetColorClick(Sender: TObject);
begin
  if (dlgColor.Execute) then
    if mmoSubtitleText.Focused or mmoTranslation.Focused then
      SetPartialTag(OPEN_B, CLOSE_B) else
      ProcessTag(tagColor, True, dlgColor.Color);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuRemoveColorTagsClick(Sender: TObject);
begin
  ProcessTag(tagColorRemove, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuStylePopupPopup(Sender: TObject);
begin
  mnuBold.Checked      := Pos(OPEN_B, GetSubText(lstSubtitles.FocusedNode)) > 0;
  mnuItalic.Checked    := Pos(OPEN_I, GetSubText(lstSubtitles.FocusedNode)) > 0;
  mnuUnderline.Checked := Pos(OPEN_U, GetSubText(lstSubtitles.FocusedNode)) > 0;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.SetPartialTag(const OTag, CTag: String);
var
  re : TRichEdit;
begin
  re := nil;

  if mmoSubtitleText.Focused then     re := mmoSubtitleText
  else if mmoTranslation.Focused then re := mmoTranslation;

  if re <> nil then begin
    with re do begin
      if SelLength = 0 then
        Text := OTag + Text + CTag
      else
        Text := copy(Text, 1, SelStart) +
                OTag +
                copy(Text, SelStart+1, SelLength) +
                CTag +
                copy(Text, SelStart+SelLength+1, Length(Text)-(SelStart+SelLength));
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetTagBoldClick(Sender: TObject);
begin
  SetPartialTag(OPEN_B, CLOSE_B);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetTagItalicClick(Sender: TObject);
begin
  SetPartialTag(OPEN_I, CLOSE_I);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetTagUnderlineClick(Sender: TObject);
begin
  SetPartialTag(OPEN_U, CLOSE_U);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetTagColorClick(Sender: TObject);
begin
  if (dlgColor.Execute) then
    SetPartialTag(GetColorOpen(dlgColor.Color), CLOSE_C);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.tmrSaveWorkTimer(Sender: TObject);
begin
  if (lstSubtitles.RootNodeCount > 0) and (frmSaveAsExecuting = False) then
  begin
    // ------------------ //
    //    Save original   //
    // ------------------ //
    if OrgModified then
    begin
      SubtitleAPI.SetOutputSettingsEncoding(StrCharsetToInt(cmbOrgCharset.Items[cmbOrgCharset.ItemIndex]));

      if (OrgFile <> '') then
      begin
        UpdateArray;
        if SaveAsBackup = False then
        begin
          if SaveFile(OrgFile, OrgFormat, GetFPS) then // We save original file in it's original format
            OrgModified := False;
        end else
          SaveFile(OrgFile + '.bak', OrgFormat, GetFPS);
        SubtitleAPI.ClearSubtitles;
      end else
        mnuSaveFileAsClick(Sender);
    end;

    // -------------------- //
    //    Save translated   //
    // -------------------- //
    if TransModified then
    begin
      SubtitleAPI.SetOutputSettingsEncoding(StrCharsetToInt(cmbTransCharset.Items[cmbTransCharset.ItemIndex]));

      if (mnuTranslatorMode.Checked) then
      begin
        if (TransFile <> '') and (TransModified) then
        begin
          if SaveAsBackup = False then
          begin
            UpdateArray(True);
            if SaveFile(TransFile, TransFormat, GetFPS) then // We save translated file in it's original format
              TransModified := False;
          end else
            SaveFile(TransFile + '.bak', TransFormat, GetFPS);
          SubtitleAPI.ClearSubtitles;
        end else
          mnuSaveTranslatedAsClick(Sender);
      end;
    end;
    
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.cmbInputFPSKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) and (IsFloat(cmbInputFPS.Text)) then
    AddFPSItem(StrToFloat(cmbInputFPS.Text), True, True, True) else
  if (Key in ['0'..'9', DecimalSeparator, Chr(VK_RETURN), Chr(VK_BACK)]) = False then
    Key := #0;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.cmbFPSKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) and (IsFloat(cmbFPS.Text)) then
    AddFPSItem(StrToFloat(cmbFPS.Text), False, True, False) else
  if (Key in ['0'..'9', DecimalSeparator, Chr(VK_RETURN), Chr(VK_BACK)]) = False then
    Key := #0;
end;


// -----------------------------------------------------------------------------

procedure TfrmMain.mnuAdjustToSyncSubsClick(Sender: TObject);
var
  Sync: TClassicSyncPoints;
begin
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles);
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
  begin
    if SubtitleAPI.LoadSubtitle(dlgLoadFile.FileName, GetInputFPS, dlgLoadFile.FilterIndex - 1) then
    begin
      Sync.Point1Sub   := GetStartTime(lstSubtitles.GetFirst);
      Sync.Point2Sub   := GetStartTime(lstSubtitles.GetLast);
      Sync.Point1Movie := SubtitleAPI.GetInitialTime(0);
      Sync.Point2Movie := SubtitleAPI.GetInitialTime(SubtitleAPI.SubtitleCount-1);
      AdjustSubtitles(Sync);
    end else
    begin
      if ((dlgLoadFile.FilterIndex - 1) = 0) then
        MsgBox(Format(ErrorMsg[03],[dlgLoadFile.FileName]), BTN_OK, '', '', MB_ICONERROR, frmMain) else
        MsgBox(Format(ErrorMsg[04],[dlgLoadFile.FileName, SubtitleAPI.GetFormatName(dlgLoadFile.FilterIndex - 1)]), BTN_OK, '', '', MB_ICONERROR, frmMain);
    end;
  end;
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuTimeExpanderReducerClick(Sender: TObject);
begin
  frmTimeExpanderReducer := TfrmTimeExpanderReducer.Create(Application);
  frmTimeExpanderReducer.ShowModal;
  frmTimeExpanderReducer.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuReadTimesFromFileClick(Sender: TObject);
begin
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles);
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
    ReadFromFile(dlgLoadFile.FileName, dlgLoadFile.FilterIndex - 1, True, False);
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuReadTextsFromFileClick(Sender: TObject);
begin
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles);
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
    ReadFromFile(dlgLoadFile.FileName, dlgLoadFile.FilterIndex -1, False, True);
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.cmbInputFPSSelect(Sender: TObject);
var
  Node: PVirtualNode;
  Time1, Time2: Integer;
  UndoAction: PUndoAction;
begin
  if InterfaceEnabled = False then
    cmbFPS.ItemIndex := cmbInputFPS.ItemIndex;
  if SubtitleAPI.IsFrameBased(OrgFormat) = False then
  begin
    Node := lstSubtitles.GetFirst;
    while Assigned(Node) do
    begin
      // ------------ //
      // Initial time //
      // ------------ //
      Time1 := TimeToFrames(GetStartTime(Node), GetInputFPS);
      SetStartTime(Node, FramesToTime(Time1, OldInputFPS));

      // ---------- //
      // Final time //
      // ---------- //
      Time2 := TimeToFrames(GetFinalTime(Node), GetInputFPS);
      SetFinalTime(Node, FramesToTime(Time2, OldInputFPS));

      Node := Node.NextSibling;
    end;

    ClearUndoList(RedoList);
    mnuRedo.Enabled := False;
    New(UndoAction);
    UndoAction^.UndoActionType                 := uaFPSChange;
    UndoAction^.BindToNext                     := False;
    UndoAction^.BufferSize                     := SizeOf(TFPSChange);
    UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
    PFPSChange(UndoAction^.Buffer)^.InputOrFPS := True;
    PFPSChange(UndoAction^.Buffer)^.OldValue   := OldInputFPS;
    UndoList.Add(UndoAction);
    mnuUndo.Enabled := True;

    OldInputFPS := GetInputFPS;
    lstSubtitles.Refresh;
    RefreshTimes;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.cmbFPSSelect(Sender: TObject);
var
  Node: PVirtualNode;
  Time1, Time2: Integer;
  UndoAction: PUndoAction;
begin
  Node := lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    // ------------ //
    // Initial time //
    // ------------ //
    Time1 := TimeToFrames(GetStartTime(Node), OldFPS);
    SetStartTime(Node, FramesToTime(Time1, GetFPS));

    // ---------- //
    // Final time //
    // ---------- //
    Time2 := TimeToFrames(GetFinalTime(Node), OldFPS);
    SetFinalTime(Node, FramesToTime(Time2, GetFPS));

    Node := Node.NextSibling;
  end;

  ClearUndoList(RedoList);
  mnuRedo.Enabled := False;
  New(UndoAction);
  UndoAction^.UndoActionType                 := uaFPSChange;
  UndoAction^.BindToNext                     := False;
  UndoAction^.BufferSize                     := SizeOf(TFPSChange);
  UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
  PFPSChange(UndoAction^.Buffer)^.InputOrFPS := False;
  PFPSChange(UndoAction^.Buffer)^.OldValue   := OldFPS;
  UndoList.Add(UndoAction);
  mnuUndo.Enabled := True;  
  
  OldFPS          := GetFPS;
  tmeShow.FPS     := OldFPS;
  tmeHide.FPS     := OldFPS;
  tmeDuration.FPS := OldFPS;
  lstSubtitles.Refresh;
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuAboutSubtitleWorkshopClick(Sender: TObject);
begin
  frmAbout := TfrmAbout.Create(Application);
  frmAbout.ShowModal;
  frmAbout.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuExternalPreviewClick(Sender: TObject);
var
  Ini      : TIniFile;
  Params   : String;
  Video    : String;
  Ext      : String;
  FileName : String;
  Temp     : array[0..MAX_PATH]of Char;
  Format   : Integer;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    if (FileExists(Ini.ReadString('External Preview','Video player', '')) = False) then
    begin
      if MsgBox(QuestionMsg[07], BTN_YES, BTN_NO, '', MB_ICONWARNING, frmMain) = 1 then
      begin
        frmSettings := TfrmSettings.Create(Application);
        frmSettings.pgeCtrl.ActivePage:= frmSettings.pgeExternalPreviewGeneral;
        frmSettings.tvSettings.Items[9].Selected := True;
        frmSettings.ShowModal;
        frmSettings.Free;
      end;
      exit
    end;

    Params := Ini.ReadString('External Preview','Parameter','');

    if Ini.ReadBool('External Preview','Ask for different video',True) then
    begin
      dlgLoadFile.Filter := AllSupportedFiles + '|*.asf;*.avi;*.mp4;*.divx;*.mpg;*.mpeg;*.m1v;*.qt;*.wmv|ASF (*.asf)|*.asf|AVI (*.avi)|*.avi|DivX (*.mp4; *.divx)|*.mp4; *.divx|MPEG (*.mpg; *.mpeg; *.m1v)|*.mpg; *.mpeg; *.m1v|QuickTime 2.0 (*.qt)|*.qt|WMV (*.wmv)|*.wmv';
      if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
        Video := dlgLoadFile.FileName;
      dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
    end else
      Video := Ini.ReadString('External Preview','Video to test','');

    if Video = '' then exit;
    Params := ReplaceString(Params, 'VIDEO_FILE', Video);

    if Ini.ReadBool('External Preview', 'Save in original format', True) then
      Format := OrgFormat else
      Format := SubtitleAPI.GetFormatIndex(Ini.ReadString('External Preview', 'Custom format', 'SubRip'));

    Ext := GetFormatExt(Format);

    GetTempPath(MAX_PATH, Temp);

    if mnuTranslatorMode.Checked = False then
      FileName := ExtractFileName(OrgFile) else
      FileName := ExtractFileName(TransFile);
    if FileName = '' then
      FileName := 'TmpSubFile' + Ext else
      FileName := Copy(FileName, 1, LastDelimiter('.', ExtractFileName(FileName))-1) + Ext;

    UpdateArray(mnuTranslatorMode.Checked);
    SubtitleAPI.SaveSubtitle(String(Temp) + FileName, Format, GetFPS);
    SubtitleAPI.ClearSubtitles;

    Params := ReplaceString(Params, 'SUBT_FILE', String(Temp) + FileName);
    ShellExecute(handle,'open', PChar(Ini.ReadString('External Preview','Video player','')), PCHar(Params), nil, SW_SHOW);

  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSAMILangExtractorClick(Sender: TObject);
begin
  frmSAMILangExtractor := TfrmSAMILangExtractor.Create(Application);
  frmSAMILangExtractor.ShowModal;
  frmSAMILangExtractor.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.pnlVideoDisplayClick(Sender: TObject);
begin
  Pause;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.subSubtitleClick(Sender: TObject);
begin
  Pause;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu10PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.10, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu20PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.20, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu30PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.30, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu40PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.40, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu50PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.50, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu60PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.60, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu70PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.70, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu80PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.80, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu90PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.90, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu100PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(1, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu150PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(1.50, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu200PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(2, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu300PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(3, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu400PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(4, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuRecheckErrorsClick(Sender: TObject);
begin
  CheckMarkErrors;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFixAllErrorsClick(Sender: TObject);
begin
  FixErrors;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFixErrorsInSelSubsClick(Sender: TObject);
begin
  FixErrors(True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuJumpToNextErrorClick(Sender: TObject);
var
  Node : PVirtualNode;
  Data : PSubtitleItem;
begin
  if (Assigned(lstSubtitles.FocusedNode)) and (lstSubtitles.FocusedNode <> lstSubtitles.GetLast) then
    Node := lstSubtitles.FocusedNode.NextSibling else
    Node := lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    Data := lstSubtitles.GetNodeData(Node);
    if Data.ErrorType <> [] then
    begin
      lstSubtitles.ScrollIntoView(Node, True);
      lstSubtitles.Selected[lstSubtitles.FocusedNode] := False;
      lstSubtitles.FocusedNode := Node;
      lstSubtitles.Selected[Node] := True;
      RefreshTimes;
      Break;
    end;
    Node := Node.NextSibling;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuInfoErrorsSettingsClick(Sender: TObject);
begin
  frmInfoErrorsSettings := TfrmInfoErrorsSettings.Create(Application);
  frmInfoErrorsSettings.ShowModal;
  frmInfoErrorsSettings.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuDeleteUnnecessaryLinksClick(Sender: TObject);
var
  Node       : PVirtualNode;
  Text1      : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  Text2      : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  UndoAction1 : PUndoAction;
  UndoAction2 : PUndoAction;
  // Tags in first & second text
  StyleTag1 : TStyleTag;
  StyleTag2 : TStyleTag;
begin
  ClearUndoList(RedoList);
  frmMain.mnuRedo.Enabled := False;
  
  Node := lstSubtitles.GetFirst.NextSibling;
  while Assigned(Node) do
  begin
    Text1 := GetSubText(Node.PrevSibling);
    Text2 := GetSubText(Node);

    New(UndoAction1);
    UndoAction1^.UndoActionType := uaFullTextChange;
    UndoAction1^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction1^.Buffer         := AllocMem(UndoAction1^.BufferSize);
    UndoAction1^.Node           := Node.PrevSibling;
    UndoAction1^.LineNumber     := Node.PrevSibling.Index;
    UndoAction1^.BindToNext     := True;
    PFullTextChange(UndoAction1^.Buffer)^.OriginalOnly := True;
    PFullTextChange(UndoAction1^.Buffer)^.OldText := Text1;

    New(UndoAction2);
    UndoAction2^.UndoActionType := uaFullTextChange;
    UndoAction2^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction2^.Buffer         := AllocMem(UndoAction2^.BufferSize);
    UndoAction2^.Node           := Node;
    UndoAction2^.LineNumber     := Node.Index;
    UndoAction2^.BindToNext     := True;
    PFullTextChange(UndoAction2^.Buffer)^.OriginalOnly := True;
    PFullTextChange(UndoAction2^.Buffer)^.OldText := Text2;    

    StyleTag1 := StoreTags(Text1);
    Text1      := RemoveSWTags(Text1, True, True, True, True);

    StyleTag2 := StoreTags(Text2);
    Text2      := RemoveSWTags(Text2, True, True, True, True);

    if (Copy(Text1, Length(Text1)-2, 3) = '...') and
       (
       (Pos('...', Text2) = 1) or
       (Pos('-...', Text2) = 1) or
       (Pos('- ...', Text2) = 1)
       ) then
    begin
      Text1 := Copy(Text1, 1, Length(Text1)-3);
      if (Pos('...', Text2) = 1) then
        Text2 := Trim(Copy(Text2, 4, Length(Text2))) else
      if (Pos('-...', Text2) = 1) then
        Text2 := Trim(Copy(Text2, 5, Length(Text2))) else
      if (Pos('- ...', Text2) = 1) then
        Text2 := Trim(Copy(Text2, 6, Length(Text2)));

      if SubtitleAPI.NoInteractionWithTags = False then
      begin
        Text1 := RestoreSWTags(Text1, StyleTag1);
        Text2 := RestoreSWTags(Text2, StyleTag2);
      end;

      if mnuTranslatorMode.Checked = False then
      begin
        UndoList.Add(UndoAction1);
        UndoList.Add(UndoAction2);
      end;
      SetText(Node.PrevSibling, Text1);
      SetText(Node, Text2);
    end;
    if mnuTranslatorMode.Checked then
    begin
      Text1 := GetSubTranslation(Node.PrevSibling);
      Text2 := GetSubTranslation(Node);

      PFullTextChange(UndoAction1^.Buffer)^.OriginalOnly := False;
      PFullTextChange(UndoAction1^.Buffer)^.OldTrans     := Text1;
      PFullTextChange(UndoAction2^.Buffer)^.OriginalOnly := False;
      PFullTextChange(UndoAction2^.Buffer)^.OldTrans     := Text2;      

      StyleTag1 := StoreTags(Text1);
      Text1      := RemoveSWTags(Text1, True, True, True, True);

      StyleTag2 := StoreTags(Text2);
      Text2      := RemoveSWTags(Text2, True, True, True, True);

      if (Copy(Text1, Length(Text1)-2, 3) = '...') and
         (
         (Pos('...', Text2) = 1) or
         (Pos('-...', Text2) = 1) or
         (Pos('- ...', Text2) = 1)
         ) then
      begin
        Text1 := Copy(Text1, 1, Length(Text1)-3);
        if (Pos('...', Text2) = 1) then
          Text2 := Trim(Copy(Text2, 4, Length(Text2))) else
        if (Pos('-...', Text2) = 1) then
          Text2 := Trim(Copy(Text2, 5, Length(Text2))) else
        if (Pos('- ...', Text2) = 1) then
          Text2 := Trim(Copy(Text2, 6, Length(Text2)));

        if SubtitleAPI.NoInteractionWithTags = False then
        begin
          Text1 := RestoreSWTags(Text1, StyleTag1);
          Text2 := RestoreSWTags(Text2, StyleTag2);
        end;

        UndoList.Add(UndoAction1);
        UndoList.Add(UndoAction2);          

        SetTranslation(Node.PrevSibling, Text1);
        SetTranslation(Node, Text2);
      end;
    end;
    Node := Node.NextSibling;
  end;

  if UndoList.Count > 0 then
    PUndoAction(UndoList.Last)^.BindToNext := False;   

  mnuUndo.Enabled := True;
  lstSubtitles.Refresh;
  RefreshTimes;                 
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuCheckForNewVersionClick(Sender: TObject);
  function GetTempDir: String;
  var
    Temp: array[0..MAX_PATH] of Char;
  begin
    GetTempPath(MAX_PATH,Temp);
    Result := String(Temp);
  end;

  function DownloadFile(Source, Dest: String): Boolean;
  begin
    try
      Result := UrlDownloadToFile(nil, PChar(Source), PChar(Dest), 0, nil) = 0;
    except
      Result := False;
    end;
  end;
var
  Dir      : String;
  URL      : String;
  Language : String;
  Ini      : TIniFile;
  NewVer   : String;
begin
  Language := ExtractFileName(frmMain.ActualLangFile);
  Language := Copy(Language, 1, LastDelimiter('.', Language)-1);
  Dir      := GetTempDir + Copy(ID_UPDATEINI, LastDelimiter('/', ID_UPDATEINI)+1, Length(ID_UPDATEINI));
    
  // http://www.urusoft.net/inis/swupdate.ini
  // http://sw.binhoster.com/sw_update.ini
  if DownloadFile(ID_UPDATEINI, Dir) Then
  begin
    Ini := TIniFile.Create(Dir);
    try
      NewVer := Ini.ReadString('Update', 'CurrVer', ID_VERSION);
      if  NewVer > ID_VERSION Then
      begin // New version!
        if MsgBox(Format(QuestionMsg[08], [NewVer]), BTN_YES, BTN_NO, '', MB_ICONQUESTION, frmMain) = 1 Then
        begin
          if Ini.ValueExists('Update', Language) then
            URL := Ini.ReadString('Update', Language, ID_WEBPAGE) else
            URL := Ini.ReadString('Update', 'English', ID_WEBPAGE);
          ShellExecute(GetDesktopWindow, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
        end;
      end else // No new version available...
        MsgBox(InfoMsg[02], BTN_OK, '', '', MB_ICONINFORMATION, frmMain);
    finally
      Ini.Free;
      DeleteFile(Dir + ExtractFileName(ID_UPDATEINI));
    end;
  end else // Error!
    MsgBox(ErrorMsg[11], BTN_OK, '', '', MB_ICONERROR, frmMain);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.sbSeekBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked) then
    tmrVideo.Enabled := False;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.sbSeekBarMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked) then
  begin
    SetVideoPos(sbSeekBar.Position);
    if Playing = True then
      tmrVideo.Enabled := True;
  end; 
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.sbSeekBarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then
    SetTimeCounter(sbSeekBar.Position);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnAlterPlaybackRateClick(Sender: TObject);
begin
  if Player.Initialized then
  begin
    if GetPlaybackRate = 1 then
    begin
      mnu100P.Checked := False;
      case DefAltPlayRate of
        rate10: begin mnu10P.Checked := True; SetPlaybackRate(0.1); end;
        rate20: begin mnu20P.Checked := True; SetPlaybackRate(0.2); end;
        rate30: begin mnu30P.Checked := True; SetPlaybackRate(0.3); end;
        rate40: begin mnu40P.Checked := True; SetPlaybackRate(0.4); end;
        rate50: begin mnu50P.Checked := True; SetPlaybackRate(0.5); end;
        rate60: begin mnu60P.Checked := True; SetPlaybackRate(0.6); end;
        rate70: begin mnu70P.Checked := True; SetPlaybackRate(0.7); end;
        rate80: begin mnu80P.Checked := True; SetPlaybackRate(0.8); end;
        rate90: begin mnu90P.Checked := True; SetPlaybackRate(0.9); end;
        rate150: begin mnu150P.Checked := True; SetPlaybackRate(1.5); end;
        rate200: begin mnu200P.Checked := True; SetPlaybackRate(2.0); end;
        rate300: begin mnu300P.Checked := True; SetPlaybackRate(3.0); end;
        rate400: begin mnu400P.Checked := True; SetPlaybackRate(4.0); end; else
        mnu100P.Checked := True;
      end;
    end else
    begin
      SetPlaybackRate(1);
      mnu100P.Checked := True;
    end;
  end;   
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuRewindClick(Sender: TObject);
begin
  SetVideoPos(GetCurrentPos - RewFFTime);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuForwardClick(Sender: TObject);
begin
  SetVideoPos(GetCurrentPos + RewFFTime);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnScrollListClick(Sender: TObject);
begin
  ScrollList := not ScrollList;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSpellCheckClick(Sender: TObject);
var
  Node          : PVirtualNode;
  StringToCheck : TStringList;
  TextStrList   : TStringList;
  i, c          : Integer;
  Text          : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  UndoAction    : PUndoAction;
begin
  USSpellCheck.Connect;
  USSpellCheck.CheckGrammarWithSpelling := False;
  try
    ClearUndoList(RedoList);
    mnuRedo.Enabled := False;

    if USSpellCheck.Connected = True then
    begin
      StringToCheck := TStringList.Create;
      try
        Node := lstSubtitles.GetFirst;
        while Assigned(Node) do
        begin
          StringToCheck.Add(GetSubText(Node));
          StringToCheck.Add('');
          Node := Node.NextSibling;
        end;
        // Check spelling of the big string
        USSpellCheck.CheckSpelling(StringToCheck.Text);
        if Trim(USSpellCheck.ChangedText) <> '' then
        begin
          StringToCheck.Text := Trim(USSpellCheck.ChangedText);
          TextStrList := TStringList.Create;
          try
            for i := 0 to StringToCheck.Count-1 do
            begin
              if (StringToCheck[i] <> '') then
              begin
                Text := StringToCheck[i];
                if (i = 0) or ((i > 0) and (StringToCheck[i-1] = '')) then // Avoid lots of problems with subtitles that are more than one line
                begin
                  c := 1;
                  while (i+c < StringToCheck.Count) and (StringToCheck[i+c] <> '') do
                  begin
                    if (StringToCheck[i+c] <> '') then
                    begin
                      if Text <> '' then
                        Text := Text + #13#10 + StringToCheck[i+c] else
                        Text := StringToCheck[i+c];
                      Inc(c);
                    end else
                      break;
                  end;
                  if (Text <> '') then
                    TextStrList.Add(Text);
                end;
              end;
            end;

            // Update every node
            Node := lstSubtitles.GetFirst;
            while Assigned(Node) do
            begin
              if TextStrList[Node.Index] <> GetSubText(Node) then
              begin
                New(UndoAction);
                UndoAction^.UndoActionType := uaFullTextChange;
                UndoAction^.BufferSize     := SizeOf(TFullTextChange);
                UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
                UndoAction^.BindToNext     := True;
                PFullTextChange(UndoAction^.Buffer).OriginalOnly := True;
                UndoAction^.Node       := Node;
                UndoAction^.LineNumber := Node.Index;
                PFullTextChange(UndoAction^.Buffer)^.OldText := GetSubText(Node);
                SetText(Node, TextStrList[Node.Index]);
                UndoList.Add(UndoAction);
              end;
              Node := Node.NextSibling;
            end;
            mnuUndo.Enabled := True;
            lstSubtitles.Refresh;
            RefreshTimes;
          finally
            TextStrList.Free;
          end;
        end;
      finally
        MsgBox(Format(InfoMsg[03], [USSpellCheck.NumChanges]), BTN_OK, '', '', MB_ICONINFORMATION, frmMain);
        StringToCheck.Free;
      end;
    end else
      MsgBox(ErrorMsg[13], BTN_OK, '', '', MB_ICONERROR, frmMain);
  finally
    if UndoList.Count > 0 then
      PUndoAction(UndoList.Last)^.BindToNext := False;  
    USSpellCheck.Disconnect;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuHelpOfProgramClick(Sender: TObject);
var
  ManualFile: String;
begin
  ManualFile := ExtractFilePath(Application.ExeName) + 'Help\' + HelpFile;
  if FileExists(ManualFile) then
    ShellExecute(Handle, 'open', PChar(ManualFile), nil, nil, SW_MAXIMIZE) else
    ShellExecute(Handle, 'open', PChar(ExtractFilePath(Application.ExeName) + 'Help\Manual.html'), nil, nil, SW_MAXIMIZE);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuMarkSelectedSubsClick(Sender: TObject);
var
  Node       : PVirtualNode;
  Data       : PSubtitleItem;
  UndoAction : PUndoAction;
begin
  ClearUndoList(RedoList);
  mnuRedo.Enabled := False;
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    Data        := lstSubtitles.GetNodeData(Node);
    if Data.Marked <> True then
    begin
      Data.Marked := True;
      New(UndoAction);
      UndoAction^.UndoActionType := uaMarkSubtitle;
      UndoAction^.Node           := Node;
      UndoAction^.LineNumber     := Node.Index;
      UndoAction^.BufferSize     := 0;
      UndoAction^.Buffer         := nil;
      UndoAction^.BindToNext     := Assigned(lstSubtitles.GetNextSelected(Node));
      UndoList.Add(UndoAction);
    end;
    Node := lstSubtitles.GetNextSelected(Node);
  end;
  mnuUndo.Enabled := True;
  lstSubtitles.Refresh;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuUnMarkSelectedSubsClick(Sender: TObject);
var
  Node       : PVirtualNode;
  Data       : PSubtitleItem;
  UndoAction : PUndoAction;
begin
  ClearUndoList(RedoList);
  mnuRedo.Enabled := False;
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    Data        := lstSubtitles.GetNodeData(Node);
    if Data.Marked <> False then
    begin
      Data.Marked := False;
      New(UndoAction);
      UndoAction^.UndoActionType := uaMarkSubtitle;
      UndoAction^.Node           := Node;
      UndoAction^.LineNumber     := Node.Index;
      UndoAction^.BufferSize     := 0;
      UndoAction^.Buffer         := nil;
      UndoAction^.BindToNext     := Assigned(lstSubtitles.GetNextSelected(Node));
      UndoList.Add(UndoAction);
    end;
    Node := lstSubtitles.GetNextSelected(Node);
  end;
  mnuUndo.Enabled := True;
  lstSubtitles.Refresh;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnPrevSubClick(Sender: TObject);
var
  Node     : PVirtualNode;
  CurrTime : Integer;
begin
  CurrTime := GetCurrentPos;
  Node := lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    if GetStartTime(Node) > CurrTime then
    begin
      if Node <> lstSubtitles.GetFirst then
        SetVideoPos(GetStartTime(Node.PrevSibling.PrevSibling));
      exit;
    end;
    if Node = lstSubtitles.GetLast then
    begin
      if (CurrTime >= GetStartTime(Node)) and (CurrTime <= GetFinalTime(Node)) then
        SetVideoPos(GetStartTime(Node.PrevSibling)) else
        SetVideoPos(GetStartTime(Node));        
    end;
    Node := Node.NextSibling;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnNextSubClick(Sender: TObject);
var
  Node     : PVirtualNode;
  CurrTime : Integer;
begin
  CurrTime := GetCurrentPos;
  Node := lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    if GetStartTime(Node) > CurrTime then
    begin
      SetVideoPos(GetStartTime(Node));
      exit;
    end;
    Node := Node.NextSibling;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShowLeftPanelClick(Sender: TObject);
begin
  SetTranslationCtrlsPositions;
  UpdateVideoPos;
  frmMain.Refresh;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShowTimeControlsClick(Sender: TObject);
  procedure TimeControlsShow(f : Boolean);
  begin
    lblShow.Visible        := f;
    tmeShow.Visible        := f;
    lblHide.Visible        := f;
    tmeHide.Visible        := f;
    lblDuration.Visible    := f;
    tmeDuration.Visible    := f;
    lblCPS.Visible         := f;
    mdtSubtitleCPS.Visible := f;
    mdtTranslationCPS.Visible := f;
  end;
begin
  TimeControlsShow(mnuShowTimeControls.Checked);
  SetTranslationCtrlsPositions;
  frmMain.Refresh;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuUseInPlaceEditionClick(Sender: TObject);
begin
  if mnuUseInPlaceEdition.Checked = False then
    lstSubtitles.TreeOptions.MiscOptions := lstSubtitles.TreeOptions.MiscOptions - [toEditable] else
    lstSubtitles.TreeOptions.MiscOptions := lstSubtitles.TreeOptions.MiscOptions + [toEditable];    
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuTypeEffectClick(Sender: TObject);
begin
  TextEffect(EffectType, 0, 0);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFastFlashClick(Sender: TObject);
begin
  TextEffect(EffectFlash, 250, 100);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuMediumFlashClick(Sender: TObject);
begin
  TextEffect(EffectFlash, 500, 500);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSlowFlashClick(Sender: TObject);
begin
  TextEffect(EffectFlash, 1000, 1000);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.ShiftTimes(ShowShift: Integer; HideShift: Integer);
var
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
  StartTime  : Integer;
  FinalTime  : Integer;
begin
  ClearUndoList(RedoList);
  mnuRedo.Enabled := False;

  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    New(UndoAction);
    UndoAction^.UndoActionType := uaTimeChange;
    UndoAction^.BufferSize     := SizeOf(TTimeChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;

    StartTime := GetStartTime(Node);
    FinalTime := GetFinalTime(Node);
    PTimeChange(UndoAction^.Buffer)^.StartTime := StartTime;
    PTimeChange(UndoAction^.Buffer)^.FinalTime := FinalTime;
    SetStartTime(Node, StartTime + ShowShift);
    SetFinalTime(Node, FinalTime + HideShift);

    Node := lstSubtitles.GetNextSelected(Node);
    UndoAction^.BindToNext := Assigned(Node);
    UndoList.Add(UndoAction);
  end;

  mnuUndo.Enabled := True;
  lstSubtitles.Refresh;
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShiftPlusMSClick(Sender: TObject);
begin
  ShiftTimes(Vars.ShiftTime, Vars.ShiftTime);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShiftLessMSClick(Sender: TObject);
begin
  ShiftTimes(-Vars.ShiftTime, -Vars.ShiftTime);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShiftMoreMSShowClick(Sender: TObject);
begin
  ShiftTimes(Vars.ShiftTime, 0);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShiftLessMSShowClick(Sender: TObject);
begin
  ShiftTimes(-Vars.ShiftTime, 0);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShiftMoreMSHideClick(Sender: TObject);
begin
  ShiftTimes(0, Vars.ShiftTime);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShiftLessMSHideClick(Sender: TObject);
begin
  ShiftTimes(0, -Vars.ShiftTime);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuMovieInfoClick(Sender: TObject);
const
  AviHeaderStart = 32; // Needed for positioning in the avi file
var
  f : File;
  // Temporary values
  AviHeaderSize  : Integer;
  TempFormatTest : array[0..2] of Char; // should be "AVI"
  TempVideoCodec : array[0..4] of Char;
  TempMicroSec   : Integer;
  VHeaderStart   : Integer;
  // -------------
  Size           : Double;
  LengthInFrames : Integer;
begin
  if (Player.Initialized) and (FileExists(MovieFile)) then
  begin
    Size := 0;
    FileMode := fmOpenRead;
    AssignFile(f, MovieFile);
    try
      {$I-}
      Reset(f, 1);
      {$I+}

      if IOResult = 0 then
      begin
        // Get file size...
        Size := FileSize(f) / 1024 / 1024;
        Seek(f, 8);
        BlockRead(f, TempFormatTest, SizeOf(TempFormatTest));
      
        if TempFormatTest = 'AVI' then
        begin
          Seek(f, AviHeaderStart);
          BlockRead(f, TempMicroSec, 4);

          // AVI header size (needed to locate audio part)
          Seek(f, 28);
          BlockRead(f, AviHeaderSize, 4);

          // Length of movie in frames
          Seek(f, AviHeaderStart + 16);
          BlockRead(f, LengthInFrames, 4);

          VHeaderStart := AviHeaderStart + AviHeaderSize + 20;

          // Video codec
          Seek(f, VHeaderStart + 4);
          BlockRead(f, TempVideoCodec, SizeOf(TempVideoCodec));

        end else
        begin
          LengthInFrames := TimeToFrames(VideoDuration, MovieFPS);
          TempVideoCodec := '-';
        end;
                   
      end;
    finally
      CloseFile(f);
    end;

    MsgBox(Format(InfoMsg[09],
                  [
                  MovieFile,                      // File name
                  FormatFloat('0.## MB', Size),   // File size
                  FormatFloat('#.###', MovieFPS), // FPS
                  TimeToString(VideoDuration),    // Duration
                  LengthInFrames,                 // Total frames
                  Player.VideoWidth,              // Resolution (width)
                  Player.VideoHeight,             // Resolution (height)
                  TempVideoCodec                  // FourCC
                  ]),
           BTN_OK,
           '',
           '',
           MB_ICONINFORMATION,
           frmMain);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesCreateEditor(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; out EditLink: IVTEditLink);
begin
  EditLink := TTreeEditLink.Create;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesEditing(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
begin
  Allowed := (Column <> 0) and (toEditable in lstSubtitles.TreeOptions.MiscOptions);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSaveASXClick(Sender: TObject);
var
  Dir : String;
  FN  : String;
  ASX : TStringList;
begin
  if (OrgFile <> '') and (MovieFile <> '') then
  begin
    if SelectDirectory(SelectOutputDir, '', Dir) then
    begin
      FN := Copy(ExtractFileName(OrgFile), 1, LastDelimiter('.', ExtractFileName(OrgFile))-1);

      UpdateArray;
      SaveFile(Dir + '\' + FN + '.smi', SubtitleAPI.GetFormatIndex('SAMI Captioning'), GetFPS);
      SubtitleAPI.ClearSubtitles;

      ASX := TStringList.Create;
      try
        ASX.Add('<ASX version ="3.0">');
        ASX.Add(Format('<Title>%s</Title>', [FN]));
        ASX.Add('  <Entry>');
        ASX.Add('    ' + Format('<Ref href="%s?sami=%s"/>', [MovieFile, Dir + '\' + FN + '.smi']));
        ASX.Add('  </Entry>');
        ASX.Add('</ASX>');

        ASX.SaveToFile(Dir + '\' + FN + '.asx');
      finally
        ASX.Free;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSaveSMILClick(Sender: TObject);
var
  Dir  : String;
  FN   : String;
  SMIL : TStringList;
begin
  if (OrgFile <> '') and (MovieFile <> '') then
  begin
    if SelectDirectory(SelectOutputDir, '', Dir) then
    begin
      FN := Copy(ExtractFileName(OrgFile), 1, LastDelimiter('.', ExtractFileName(OrgFile))-1);

      UpdateArray;
      SaveFile(Dir + '\' + FN + '.rt', SubtitleAPI.GetFormatIndex('RealTime'), GetFPS);
      SubtitleAPI.ClearSubtitles;

      SMIL := TStringList.Create;
      try
        SMIL.Add('<smil>');
        SMIL.Add('  <head>');
        SMIL.Add('    <layout>');
        SMIL.Add('      <root-layout width="1080" height="350"/>');
        SMIL.Add('      <region id="video_left" width="480" height="304" left="0" top="0"/>');
        SMIL.Add('      <region id="video_center" width="480" height="304" left="480" top="0"/>');
        SMIL.Add('      <region id="video_right" width="480" height="304" left="960" top="0"/>');
        SMIL.Add('      <region id="text_subtitle" width="560" height="100" left="260" top="250"/>');
        SMIL.Add('    </layout>');
        SMIL.Add('  </head>');
        SMIL.Add('  <body>');
        SMIL.Add('    <par dur="7200">');
        SMIL.Add('      ' + Format('<video src="%s" begin="1s" clip-begin="0s" region="video_center"/>', [MovieFile]));
        SMIL.Add('      ' + Format('<textstream src="%s" region="text_subtitle"/>', [Dir + '\' + FN + '.rt']));
        SMIL.Add('    </par>');
        SMIL.Add('  </body>');
        SMIL.Add('</smil>');

        SMIL.SaveToFile(Dir + '\' + FN + '.smil');
      finally
        SMIL.Free;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuUndoClick(Sender: TObject);
begin
  if UndoList.Count > 0 then begin
    UndoActionSet(UndoList, RedoList);
    HighlightTags(True);
    HighLightTags(False);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuRedoClick(Sender: TObject);
begin
  if RedoList.Count > 0 then UndoActionSet(RedoList, UndoList);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuPascalScriptClick(Sender: TObject);
  procedure OutputMsg(s : String);
  var
    l          : LongInt;
    ErrorsText : String;
  begin
    ErrorsText := '';
    for l := 0 to psCompExec.CompilerMessageCount - 1 do
    begin
      ErrorsText := ErrorsText + #13#10 + psCompExec.CompilerErrorToStr(l);
    end;
    MsgBox(s + #13#10+#13#10+'Compiler errors:' + #13#10#13#10 + ErrorsText, BTN_OK, '', '', MB_ICONERROR, Self);
  end;
begin
//  psCompExecCompile(psCompExec);  // test script

  psCompExec.Script.LoadFromFile(ExtractFilePath(Application.ExeName) + 'PascalScripts\' + (Sender as TMenuItem).Caption + '.pas');

//  sleep(100);

  if psCompExec.Compile then
  begin
    if not psCompExec.Execute then
      OutputMsg('Can not execute script') else
    begin
      ClearUndoList(RedoList);
      mnuRedo.Enabled := False;
      mnuUndo.Enabled := True;
    end;
  end else
    OutputMsg('Can not compile script');

  RefreshTimes;
  lstSubtitles.Refresh;
end;


// -----------------------------------------------------------------------------

{$include _PascalFuncs}

// -----------------------------------------------------------------------------

procedure TfrmMain.psCompExecExecute(Sender: TIFPS3CompExec);
begin
  psCompExec.SetVarToInstance('Application', Application);
  //psCompExec.SetVarToInstance('Self', Self);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.psCompExecCompImport(Sender: TObject; x: TIFPSPascalCompiler);
begin
  SIRegister_Std(x);
  SIRegister_Classes(x, true);
  SIRegister_Graphics(x);
  SIRegister_Controls(x);
  SIRegister_stdctrls(x);
  SIRegister_extctrls(x);
  SIRegister_Forms(x);
  SIRegister_menus(x);
  RegisterDateTimeLibrary_C(x);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.psCompExecExecImport(Sender: TObject; se: TIFPSExec; x: TIFPSRuntimeClassImporter);
begin
  RIRegister_Std(x);
  RIRegister_Classes(x, true);
  RIRegister_Graphics(x);
  RIRegister_Controls(x);
  RIRegister_stdctrls(x);
  RIRegister_extctrls(x);
  RIRegister_Forms(x);
  RIRegister_menus(x);
  RegisterDateTimeLibrary_R(se);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.psCompExecAfterExecute(Sender: TIFPS3CompExec);
begin
  if UndoList.Count > 0 then
    PUndoAction(UndoList.Last)^.BindToNext := False;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.cmbOCRScriptsSelect(Sender: TObject);
begin
  OCRDefFile := ExtractFilePath(Application.ExeName) + 'OCRScripts\' + cmbOCRScripts.Items[cmbOCRScripts.ItemIndex] + ID_OCREXT;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShowInMainFormClick(Sender: TObject);
begin
  cmbOCRScripts.Visible := mnuShowInMainForm.Checked;
  OnResize(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShowSubtitlesClick(Sender: TObject);
begin
  subSubtitle.Visible := False;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MovieFile <> '' then
    FreeFile;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesGetHint(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var LineBreakStyle: TVTTooltipLineBreakStyle; var HintText: WideString);
  function CountUnTranslated: Integer;
  var
    Node  : PVirtualNode;
    Text  : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
    Trans : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  begin
    Result := 0;
    Node := lstSubtitles.GetFirst;
    while Assigned(Node) do
    begin
      Text  := GetSubText(Node);
      Trans := GetSubTranslation(Node);
      if (Text = Trans) or (Trans = '') or (Trans = UntranslatedSub) then
        Inc(Result);
      Node := Node.NextSibling;
    end;
  end;

var
  Data: PSubtitleItem;
begin
  Data     := lstSubtitles.GetNodeData(Node);
  HintText := '';

  if Data.ErrorType = [] then
  begin
    if Data.Marked = True then
      HintText := ErrorReports[20] else
      HintText := '';
  end;

  if etLinesWithoutLetters  in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[01];
  if etEmptySubtitle        in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[02];
  // ---
  if etOverlapping          in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[03];
  if etBadValues            in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[04];
  if etTooLongDuration      in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[05];
  if etTooShortDuration     in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[06];
  if etTooLongLine          in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[07];
  if etOverTwoLines         in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[08];
  // ---
  if etHearingImpaired      in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[09];
  if etTextBeforeColon      in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[10];
  if etUnnecessaryDots      in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[11];
  if etProhibitedCharacter  in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[12];
  if etRepeatedCharacter    in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[13];
  if etRepeatedSubtitle     in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[14];
  if etOCRErrors            in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[15];
  // ---
  if etOpnDlgSubsOneLine    in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[16];
  if etSpaceAfterCustChars  in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[17];
  if etSpaceBeforeCustChars in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[18];
  if etUnnecessarySpaces    in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[19];
  // ---
  if etTooSmallCPS          in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[21];
  if etTooBigCPS            in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[22];

  if (Data.ErrorType = []) and (Data.Marked = False) then
  begin
    if mnuTranslatorMode.Checked then
      HintText := Format(TransLeftLines, [CountUnTranslated]) else
      lstSubtitles.Hint := '';
  end;
//{$IFNDEF UNIOFF}
  HintText := StringToWideStringEx(Trim(HintText), CharsetToCodePage(frmMain.Font.Charset));
//{$ENDIF}
  HintText := Trim(HintText);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.GoToLineNumber(Line: Integer);
var
  Node : PVirtualNode;
  RootNodeCount: Integer;
begin
  dec(Line);
  RootNodeCount := lstSubtitles.RootNodeCount;

  if Line < 0 then
    Line := 0;
  if Line >= RootNodeCount then   // was Line > RootNodeCount
    Line := RootNodeCount-1;

  Node := GetNodeWithIndex(lstSubtitles, Line);
  UnSelectAll(lstSubtitles);
  lstSubtitles.ScrollIntoView(Node, True);
  lstSubtitles.Selected[Node] := True;
  lstSubtitles.FocusedNode    := Node;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.SetCurrentVolume;
  procedure SetVolume(v: Byte);
  begin
    if Player.Initialized then
      Player.BasicAudio.put_Volume((v + -100)*50);
  end;
begin
  SetVolume(100-scrVolume.Position);
  Vars.Volume := scrVolume.Position;
end;


// -----------------------------------------------------------------------------

procedure TfrmMain.FormActivate(Sender: TObject);
begin
//  scrVolume.Position := 100 - GetVolume;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.scrVolumeChange(Sender: TObject);
begin
  SetCurrentVolume;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mdtTranslationCPSKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  OldString: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  NewTime: Cardinal;
begin
  if (key = VK_RETURN) then
    begin
      if (lstSubtitles.SelectedCount = 1) then
      begin
        SetUndoTimeChange(False);
        OldString := GetSubTranslation(lstSubtitles.FocusedNode);
        NewTime := GetMSecPerChars(OldString, mdtTranslationCPS.Value);
        SetFinalTime(lstSubtitles.FocusedNode, Cardinal(GetStartTime(lstSubtitles.FocusedNode)) + NewTime);
        lstSubtitles.RepaintNode(lstSubtitles.FocusedNode);
        RefreshTimes;
      end;
    end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mdtSubtitleCPSKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  OldString: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  NewTime: Cardinal;
begin
  if (key = VK_RETURN) then
    begin
      if (lstSubtitles.SelectedCount = 1) then
      begin
        SetUndoTimeChange(False);
        OldString := GetSubText(lstSubtitles.FocusedNode);
        NewTime := GetMSecPerChars(OldString, mdtSubtitleCPS.Value);
        SetFinalTime(lstSubtitles.FocusedNode, Cardinal(GetStartTime(lstSubtitles.FocusedNode)) + NewTime);
        lstSubtitles.RepaintNode(lstSubtitles.FocusedNode);
        RefreshTimes;
      end;
    end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mmoTranslationKeyPress(Sender: TObject; var Key: Char);
var
  State: TKeyboardState;
begin
  // subtitle list is on another panel, so TAB order doesn't work
  if Key = Char(VK_TAB) then
  begin
    Key := #0;
    GetKeyboardState(State);

    if (State[VK_SHIFT] and 128) = 0 then  // Shift not pressed
      lstSubtitles.SetFocus
    else
      mmoSubtitleText.SetFocus;
  end;
end;

procedure TfrmMain.mmoSubtitleTextKeyPress(Sender: TObject; var Key: Char);
var
  State: TKeyboardState;
begin
  // subtitle list is on another panel, so TAB order doesn't work
  if Key = Chr(VK_TAB) then
  begin
    Key := #0;
    GetKeyboardState(State);

    if mnuTranslatorMode.Checked then
    begin
      if (State[VK_SHIFT] and 128) = 0 then  // Shift not pressed
        mmoTranslation.SetFocus
      else
      if mnuShowTimeControls.Checked = False then
        lstSubtitles.SetFocus
      else
        mdtTranslationCPS.SetFocus;
    end else begin
      if (State[VK_SHIFT] and 128) = 0 then  // Shift not pressed
        lstSubtitles.SetFocus
      else
        mdtSubtitleCPS.SetFocus;
    end;
  end;
end;

procedure TfrmMain.RepaintSubGraph;
var
  bmp: TBitmap;
  x, w : Integer;
  InitialTime : Integer;
  Duration    : Integer;
  Node        : PVirtualNode;
  mult : real;
begin
  if Vars <> nil then
  begin
    imgSubsGraph.Visible := (mnuVideoPreviewMode.Checked and Vars.ShowColorBar);

    if imgSubsGraph.Visible then
    begin
      try
        bmp := TBitmap.Create;
        bmp.Width := imgSubsGraph.Width;
        bmp.Height := imgSubsGraph.Height;

        imgSubsGraph.Picture.Graphic := bmp;

        imgSubsGraph.Picture.Bitmap.Canvas.Brush.Color := Vars.SubtitleAbsent;
        imgSubsGraph.Picture.Bitmap.Canvas.FillRect(Bounds(0, 0, bmp.Width-1, bmp.Height-1));

        if Player.Initialized then
        begin
          mult := VideoDuration / bmp.Width;

          with frmMain do
          begin
            Node := lstSubtitles.GetFirst;

            while Assigned(Node) do
            begin
              InitialTime := GetStartTime(Node);
              Duration    := GetFinalTime(Node) - InitialTime;

              x := round(InitialTime / mult);
              w := round(Duration / mult);

              imgSubsGraph.Picture.Bitmap.Canvas.Brush.Color := Vars.SubtitleOK;
              imgSubsGraph.Picture.Bitmap.Canvas.FillRect(Bounds(x, 0, w, bmp.Height-1));

              Node := Node.NextSibling;
            end;
          end;
        end;
      finally
        if bmp<>nil then FreeAndNil(bmp);
      end;
    end;
  end;
end;

procedure TfrmMain.lstSubtitlesKeyPress(Sender: TObject; var Key: Char);
var
  State: TKeyboardState;
begin
{
  // subtitle list is on another panel, so TAB order doesn't work
  if Key = Chr(VK_TAB) then
  begin
    GetKeyboardState(State);

    Key := #0;
    if (State[VK_SHIFT] and 128) <> 0 then  // Shift pressed
    begin

      if mnuTranslatorMode.Checked then
        mmoTranslation.SetFocus
      else
        mmoSubtitleText.SetFocus;
    end
    else
    begin
      if mnuShowTimeControls.Checked = False then
        mmoSubtitleText.SetFocus
      else
      begin
        tmeShow.SetFocus;
        RefreshTimes;
      end;
    end;
  end;
}
end;



procedure TfrmMain.ProcessRE(re : TRichEdit; TextCol, TagCol: TColor);
var
  i    : Integer;
  StoreStart  : Integer;
  StoreLength : Integer;
  TagStart : Integer;
begin
  if re.Visible and re.Enabled then begin
    StoreStart  := re.SelStart;
    StoreLength := re.SelLength;

    re.SelStart := 0;
    re.SelLength := Length(re.Text);
    re.SelAttributes.Color := TextCol;

    TagStart := -1;
    for i := 1 to Length(re.Text) do begin
      if re.Text[i] = '<' then
        TagStart := i else
      if re.Text[i] = '>' then begin
        re.SelStart := TagStart-1;
        re.SelLength := i - TagStart+1;
        re.SelAttributes.Color := TagCol;
        TagStart := -1;
      end;
    end;

    re.SelStart  := StoreStart;
    re.SelLength := StoreLength;
  end;
end;

procedure TfrmMain.HighlightTags(IsSubtitleText: Boolean);
begin
  if IsSubtitleText then begin
    SendMessage(mmoSubtitleText.Handle, WM_SETREDRAW, 0, 0);
    ProcessRE(mmoSubtitleText, clBlack, clRed);
    SendMessage(mmoSubtitleText.Handle, WM_SETREDRAW, 1, 0);
    InvalidateRect(mmoSubtitleText.Handle, nil, True);
  end else begin
    if mnuTranslatorMode.Checked then begin
      SendMessage(mmoTranslation.Handle, WM_SETREDRAW, 0, 0);
      ProcessRE(mmoTranslation, clBlack, clRed);
      SendMessage(mmoTranslation.Handle, WM_SETREDRAW, 1, 0);
      InvalidateRect(mmoTranslation.Handle, nil, True);
    end;
  end;
end;

procedure TfrmMain.RichDblClick(Sender: TObject);
begin
  if ((Sender = mmoTranslation) or (Sender = mmoSubtitleText)) then
  begin
    case Vars.DblClickBox of
    1: begin
         TRichEdit(Sender).SelStart := 0;
         TRichEdit(Sender).SelLength := 0;
       end;
    2: begin
         TRichEdit(Sender).SelStart := Length(TRichEdit(Sender).Text);
         TRichEdit(Sender).SelLength := 0;
       end;
    end;
  end;
end;

procedure TfrmMain.SetOrgModified(const Value: Boolean);
begin
  OrgFileModified := Value;
  SetFormCaption;
end;

procedure TfrmMain.SetTransModified(const Value: Boolean);
begin
  TransFileModified := Value;
  SetFormCaption;   // asterisk if Orig/Transa changed
end;

function TfrmMain.GetOrgModified(): Boolean;
begin
  Result := OrgFileModified;
end;

function TfrmMain.GetTransModified(): Boolean;
begin
  Result := TransFileModified;
end;

procedure TfrmMain.CMDialogKey(var Msg: TCMDialogKey);
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);

  if Msg.CharCode = VK_TAB then
  begin
    if (ActiveControl is TVirtualStringTree) then
    begin
      if (State[VK_SHIFT] and 128) <> 0 then  // Shift pressed
      begin
        if mnuTranslatorMode.Checked then mmoTranslation.SetFocus
        else mmoSubtitleText.SetFocus;
      end else begin
        if mnuShowTimeControls.Checked = False then mmoSubtitleText.SetFocus
        else tmeShow.SetFocus;
      end;
    end else if ActiveControl.Name = 'tmeShow' then
    begin
      if (State[VK_SHIFT] and 128) <> 0 then lstSubtitles.SetFocus
      else inherited;
    end
    else
      inherited;
  end
  else
    inherited;

end;


end.


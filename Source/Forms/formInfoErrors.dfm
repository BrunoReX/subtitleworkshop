object frmInfoErrors: TfrmInfoErrors
  Left = 517
  Top = 125
  Width = 513
  Height = 447
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'frmInfoErrors'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 513
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  DesignSize = (
    505
    420)
  PixelsPerInch = 96
  TextHeight = 13
  object bvlInfoErrors: TBevel
    Left = 8
    Top = 8
    Width = 489
    Height = 367
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object lblTotalErrors: TLabel
    Left = 418
    Top = 345
    Width = 69
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'Total errors: 0'
  end
  object btnCheck: TButton
    Left = 16
    Top = 16
    Width = 113
    Height = 25
    Caption = 'Check!'
    Default = True
    TabOrder = 0
    OnClick = btnCheckClick
  end
  object btnFixErrors: TButton
    Left = 16
    Top = 342
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Fix errors!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnFixErrorsClick
  end
  object chkConfirm: TCheckBox
    Left = 128
    Top = 345
    Width = 225
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Confirm each deletion'
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
  end
  object btnOk: TButton
    Left = 408
    Top = 382
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Ok'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 3
    OnClick = btnOkClick
  end
  object btnSettings: TButton
    Left = 8
    Top = 382
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Settings'
    TabOrder = 4
    OnClick = btnSettingsClick
  end
  object lstErrors: TVirtualStringTree
    Left = 16
    Top = 48
    Width = 473
    Height = 287
    Anchors = [akLeft, akTop, akRight, akBottom]
    DefaultPasteMode = amInsertAfter
    EditDelay = 100
    Header.AutoSizeIndex = 4
    Header.DefaultHeight = 17
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.Options = [hoColumnResize, hoDrag, hoRestrictDrag, hoVisible]
    Header.Style = hsPlates
    HintMode = hmHintAndDefault
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoTristateTracking, toAutoDeleteMovedNodes]
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toInitOnSave, toReportMode, toToggleOnDblClick, toWheelPanning]
    TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toFullRowSelect]
    OnColumnResize = lstErrorsColumnResize
    OnDblClick = lstErrorsDblClick
    OnFreeNode = lstErrorsFreeNode
    OnGetText = lstErrorsGetText
    OnPaintText = lstErrorsPaintText
    OnGetNodeDataSize = lstErrorsGetNodeDataSize
    OnInitNode = lstErrorsInitNode
    Columns = <
      item
        Position = 0
        WideText = 'Subtitle'
      end
      item
        Position = 1
        Width = 80
        WideText = 'Type'
      end
      item
        Position = 2
        Width = 310
        WideText = 'Description'
      end>
  end
  object btnReport: TButton
    Left = 140
    Top = 16
    Width = 113
    Height = 25
    Caption = 'Report to file'
    TabOrder = 6
    OnClick = btnReportClick
  end
  object dlgSave: TSaveDialog
    Left = 132
    Top = 384
  end
end

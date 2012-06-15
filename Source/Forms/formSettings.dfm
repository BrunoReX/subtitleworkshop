object frmSettings: TfrmSettings
  Left = 395
  Top = 182
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'frmSettings'
  ClientHeight = 404
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    552
    404)
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSeparate1: TBevel
    Left = 8
    Top = 355
    Width = 552
    Height = 9
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsBottomLine
  end
  object pgeCtrl: TPageControl
    Left = 185
    Top = 52
    Width = 365
    Height = 309
    ActivePage = pgeVideoPreview
    Style = tsButtons
    TabOrder = 4
    object pgeGeneral: TTabSheet
      Caption = 'pgeGeneral'
      TabVisible = False
      object bvlSeparate2: TBevel
        Left = 0
        Top = 152
        Width = 357
        Height = 9
        Shape = bsTopLine
      end
      object lblDoubleClickBox: TLabel
        Left = 0
        Top = 252
        Width = 187
        Height = 13
        Caption = 'Double click on Original/Translation box'
      end
      object chkAlwaysOnTop: TCheckBox
        Left = 0
        Top = 0
        Width = 305
        Height = 17
        Caption = 'Always on top'
        TabOrder = 0
      end
      object chkInstance: TCheckBox
        Left = 0
        Top = 16
        Width = 305
        Height = 17
        Caption = 'Allow more than one instance running'
        TabOrder = 1
      end
      object chkConfirmDelete: TCheckBox
        Left = 0
        Top = 32
        Width = 305
        Height = 17
        Caption = 'Confirm when deleting subtitles'
        TabOrder = 2
      end
      object chkInterpretInvalid: TCheckBox
        Left = 0
        Top = 48
        Width = 305
        Height = 17
        Caption = 'Interpret invalid files as plain text'
        TabOrder = 3
      end
      object chkAutosearchMovie: TCheckBox
        Left = 0
        Top = 64
        Width = 305
        Height = 17
        Caption = 'Autosearch for movie'
        TabOrder = 4
      end
      object chkForceWorkingTime: TCheckBox
        Left = 0
        Top = 80
        Width = 305
        Height = 17
        Caption = 'Force working in time mode'
        TabOrder = 5
      end
      object chkKeepOrderOfLines: TCheckBox
        Left = 0
        Top = 96
        Width = 305
        Height = 17
        Caption = 'Keep order of lines when reverse text'
        TabOrder = 6
      end
      object chkSelectTextNL: TCheckBox
        Left = 0
        Top = 112
        Width = 305
        Height = 17
        Caption = 'Select text on jump to next line'
        TabOrder = 7
      end
      object chkSelectTextPL: TCheckBox
        Left = 0
        Top = 128
        Width = 305
        Height = 17
        Caption = 'Select text on jump to previous line'
        TabOrder = 8
      end
      object chkWorkWithStyleTags: TCheckBox
        Left = 0
        Top = 176
        Width = 305
        Height = 17
        Caption = 'Work with style tags'
        TabOrder = 9
      end
      object edtRFLimit: TLabeledEdit
        Left = 0
        Top = 222
        Width = 41
        Height = 21
        EditLabel.Width = 81
        EditLabel.Height = 13
        EditLabel.Caption = 'Recent files limit:'
        ReadOnly = True
        TabOrder = 10
        Text = '0'
      end
      object udRFLimit: TUpDown
        Left = 41
        Top = 222
        Width = 15
        Height = 21
        Associate = edtRFLimit
        Max = 20
        TabOrder = 11
      end
      object chkNoInteractionWithTags: TCheckBox
        Left = 0
        Top = 160
        Width = 305
        Height = 17
        Caption = 'No interaction with tags'
        TabOrder = 12
      end
      object cmbDoubleClickBox: TComboBox
        Left = 0
        Top = 268
        Width = 357
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 13
      end
    end
    object pgeAdvanced: TTabSheet
      Caption = 'pgeAdvanced'
      ImageIndex = 12
      TabVisible = False
      object lblCharacters3: TLabel
        Left = 270
        Top = 28
        Width = 51
        Height = 13
        Caption = 'characters'
      end
      object lblMilliseconds: TLabel
        Left = 270
        Top = 76
        Width = 55
        Height = 13
        Caption = 'milliseconds'
      end
      object lblCPScoloring: TLabel
        Left = 0
        Top = 260
        Width = 59
        Height = 13
        Caption = 'CPS coloring'
      end
      object lblMilliseconds2: TLabel
        Left = 270
        Top = 121
        Width = 55
        Height = 13
        Caption = 'milliseconds'
      end
      object lblMilliseconds3: TLabel
        Left = 270
        Top = 169
        Width = 55
        Height = 13
        Caption = 'milliseconds'
      end
      object gbSmartLineAdjust: TGroupBox
        Left = 0
        Top = 0
        Width = 210
        Height = 89
        Caption = 'Smart line adjust'
        TabOrder = 0
        object lblCharacters1: TLabel
          Left = 54
          Top = 44
          Width = 51
          Height = 13
          Caption = 'characters'
        end
        object edtTwoLinesIfLongerThan: TLabeledEdit
          Left = 8
          Top = 36
          Width = 25
          Height = 21
          EditLabel.Width = 115
          EditLabel.Height = 13
          EditLabel.Caption = 'Two lines if longer than:'
          TabOrder = 0
          Text = '40'
        end
        object udTwoLinesIfLongerThan: TUpDown
          Left = 33
          Top = 36
          Width = 15
          Height = 21
          Associate = edtTwoLinesIfLongerThan
          Min = 20
          Max = 120
          Position = 40
          TabOrder = 1
        end
        object chkToggleBreakPoint: TCheckBox
          Left = 8
          Top = 64
          Width = 200
          Height = 17
          Caption = 'Toggle breakpoint'
          TabOrder = 2
        end
      end
      object gbDivideLines: TGroupBox
        Left = 0
        Top = 96
        Width = 210
        Height = 89
        Caption = 'Divide lines'
        TabOrder = 1
        object lblCharacters2: TLabel
          Left = 54
          Top = 44
          Width = 51
          Height = 13
          Caption = 'characters'
        end
        object edtBreakLineAfter: TLabeledEdit
          Left = 8
          Top = 36
          Width = 25
          Height = 21
          EditLabel.Width = 77
          EditLabel.Height = 13
          EditLabel.Caption = 'Break line after:'
          TabOrder = 0
          Text = '40'
        end
        object udBreakLineAfter: TUpDown
          Left = 33
          Top = 36
          Width = 15
          Height = 21
          Associate = edtBreakLineAfter
          Min = 20
          Max = 120
          Position = 40
          TabOrder = 1
        end
        object chkSLAAutomatically: TCheckBox
          Left = 8
          Top = 64
          Width = 200
          Height = 17
          Caption = 'Smart line adjust automatically'
          TabOrder = 2
        end
      end
      object edtMaxLineLength: TLabeledEdit
        Left = 216
        Top = 20
        Width = 33
        Height = 21
        EditLabel.Width = 100
        EditLabel.Height = 13
        EditLabel.Caption = 'Maximum line length:'
        TabOrder = 2
        Text = '45'
      end
      object udMaxLineLength: TUpDown
        Left = 249
        Top = 20
        Width = 15
        Height = 21
        Associate = edtMaxLineLength
        Min = 20
        Max = 120
        Position = 45
        TabOrder = 3
      end
      object edtShiftTime: TLabeledEdit
        Left = 216
        Top = 68
        Width = 33
        Height = 21
        EditLabel.Width = 49
        EditLabel.Height = 13
        EditLabel.Caption = 'Shift time:'
        TabOrder = 4
        Text = '100'
      end
      object udShiftTime: TUpDown
        Left = 249
        Top = 68
        Width = 16
        Height = 21
        Associate = edtShiftTime
        Min = 1
        Max = 9999
        Increment = 10
        Position = 100
        TabOrder = 5
        Thousands = False
      end
      object edCPSrange1: TIntegerEdit
        Left = 24
        Top = 276
        Width = 24
        Height = 21
        Alignment = taRightJustify
        ColorNormal = clBlack
        ColorWarning = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FormatString = '%d'
        ParentFont = False
        TabOrder = 6
        Validate = False
        MaxValue = 90
        MinValue = 1
        Value = 8
      end
      object edCPSrange2: TIntegerEdit
        Left = 90
        Top = 276
        Width = 24
        Height = 21
        Alignment = taRightJustify
        ColorNormal = clBlack
        ColorWarning = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FormatString = '%d'
        ParentFont = False
        TabOrder = 7
        Validate = False
        MaxValue = 91
        MinValue = 2
        Value = 18
      end
      object edCPSrange3: TIntegerEdit
        Left = 156
        Top = 276
        Width = 24
        Height = 21
        Alignment = taRightJustify
        ColorNormal = clBlack
        ColorWarning = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FormatString = '%d'
        ParentFont = False
        TabOrder = 8
        Validate = False
        MaxValue = 92
        MinValue = 3
        Value = 24
      end
      object udCPSrange1: TUpDown
        Left = 48
        Top = 276
        Width = 15
        Height = 21
        Associate = edCPSrange1
        Min = 1
        Max = 91
        Position = 8
        TabOrder = 9
      end
      object udCPSrange2: TUpDown
        Left = 114
        Top = 276
        Width = 15
        Height = 21
        Associate = edCPSrange2
        Min = 2
        Max = 92
        Position = 18
        TabOrder = 10
      end
      object udCPSrange3: TUpDown
        Left = 180
        Top = 276
        Width = 15
        Height = 21
        Associate = edCPSrange3
        Min = 3
        Max = 93
        Position = 24
        TabOrder = 11
      end
      object pnlCPSrange1: TPanel
        Left = 0
        Top = 276
        Width = 21
        Height = 21
        Cursor = crHandPoint
        Color = clBlue
        TabOrder = 12
        OnClick = pnlCPSrange1Click
      end
      object pnlCPSrange2: TPanel
        Left = 66
        Top = 276
        Width = 21
        Height = 21
        Cursor = crHandPoint
        Color = clBlack
        TabOrder = 13
        OnClick = pnlCPSrange2Click
      end
      object pnlCPSrange3: TPanel
        Left = 132
        Top = 276
        Width = 21
        Height = 21
        Cursor = crHandPoint
        Color = clOlive
        TabOrder = 14
        OnClick = pnlCPSrange3Click
      end
      object pnlCPSrange4: TPanel
        Left = 198
        Top = 276
        Width = 21
        Height = 21
        Cursor = crHandPoint
        Color = clRed
        TabOrder = 15
        OnClick = pnlCPSrange4Click
      end
      object edtNewSubDuration: TLabeledEdit
        Left = 216
        Top = 116
        Width = 33
        Height = 21
        EditLabel.Width = 61
        EditLabel.Height = 13
        EditLabel.Caption = 'Add subtitle:'
        TabOrder = 16
        Text = '1500'
      end
      object udNewSubDuration: TUpDown
        Left = 249
        Top = 116
        Width = 16
        Height = 21
        Associate = edtNewSubDuration
        Min = 100
        Max = 9000
        Position = 1500
        TabOrder = 17
        Thousands = False
      end
      object edtGapBetweenSubs: TLabeledEdit
        Left = 216
        Top = 164
        Width = 33
        Height = 21
        EditLabel.Width = 111
        EditLabel.Height = 13
        EditLabel.Caption = 'Gap between subtitles:'
        TabOrder = 18
        Text = '300'
      end
      object udGapBetweenSubs: TUpDown
        Left = 249
        Top = 164
        Width = 15
        Height = 21
        Associate = edtGapBetweenSubs
        Min = 1
        Max = 5000
        Position = 300
        TabOrder = 19
      end
    end
    object pgeCharsets: TTabSheet
      Caption = 'pgeCharsets'
      ImageIndex = 11
      TabVisible = False
      object lblOrgCharset: TLabel
        Left = 0
        Top = 32
        Width = 79
        Height = 13
        Caption = 'Original charset:'
      end
      object lblTransCharset: TLabel
        Left = 0
        Top = 80
        Width = 96
        Height = 13
        Caption = 'Translation charset:'
      end
      object chkShowInMainForm: TCheckBox
        Left = 0
        Top = 0
        Width = 305
        Height = 17
        Caption = 'Show in main form'
        TabOrder = 0
      end
      object cmbOrgCharset: TComboBox
        Left = 0
        Top = 48
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 1
      end
      object cmbTransCharset: TComboBox
        Left = 0
        Top = 98
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 2
      end
    end
    object pgeFormats: TTabSheet
      Caption = 'pgeFormats'
      ImageIndex = 1
      TabVisible = False
      object lblDefaultFormat: TLabel
        Left = 0
        Top = 0
        Width = 74
        Height = 13
        Caption = 'Default format:'
      end
      object lblFormatsToShow: TLabel
        Left = 0
        Top = 48
        Width = 162
        Height = 13
        Caption = 'Formats to show when "Save as":'
      end
      object cmbDefaultFormat: TComboBox
        Left = 0
        Top = 16
        Width = 241
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 0
      end
      object chkLstFormatsToShow: TCheckListBox
        Left = 0
        Top = 64
        Width = 353
        Height = 177
        Columns = 2
        ItemHeight = 13
        TabOrder = 1
      end
      object chkShowCustomFormats: TCheckBox
        Left = 0
        Top = 280
        Width = 305
        Height = 17
        Caption = 'Show custom formats'
        TabOrder = 2
      end
      object btnSelectAllFormat: TButton
        Left = 144
        Top = 248
        Width = 105
        Height = 25
        Caption = 'Select &all'
        TabOrder = 3
        OnClick = btnSelectAllFormatClick
      end
      object btnSelectZeroFormat: TButton
        Left = 248
        Top = 248
        Width = 105
        Height = 25
        Caption = 'Select &zero'
        TabOrder = 4
        OnClick = btnSelectZeroFormatClick
      end
    end
    object pgeFileTypes: TTabSheet
      Caption = 'pgeFileTypes'
      ImageIndex = 2
      TabVisible = False
      object chkRegExtOnStart: TCheckBox
        Left = 4
        Top = 4
        Width = 349
        Height = 17
        Caption = 'Register extensions on start'
        TabOrder = 0
        OnKeyUp = chkRegExtOnStartKeyUp
        OnMouseUp = chkRegExtOnStartMouseUp
      end
      object chkAssociateExtensions: TCheckBox
        Left = 4
        Top = 28
        Width = 349
        Height = 17
        Caption = 'Associate with most supported subtitle extensions'
        TabOrder = 1
        OnClick = chkAssociateExtensionsClick
        OnKeyUp = chkRegExtOnStartKeyUp
        OnMouseUp = chkRegExtOnStartMouseUp
      end
      object chklstExtensions: TCheckListBox
        Left = 4
        Top = 56
        Width = 351
        Height = 209
        OnClickCheck = chklstExtensionsClickCheck
        Columns = 3
        Enabled = False
        ItemHeight = 13
        Sorted = True
        TabOrder = 2
      end
      object btnSelectAllExt: TButton
        Left = 128
        Top = 272
        Width = 110
        Height = 25
        Caption = 'Select &all'
        TabOrder = 3
        OnClick = btnSelectAllExtClick
      end
      object btnSelectZeroExt: TButton
        Left = 240
        Top = 272
        Width = 110
        Height = 25
        Caption = 'Select &none'
        TabOrder = 4
        OnClick = btnSelectZeroExtClick
      end
    end
    object pgeSave: TTabSheet
      Caption = 'pgeSave'
      ImageIndex = 3
      TabVisible = False
      object lblMinutes: TLabel
        Left = 83
        Top = 39
        Width = 41
        Height = 13
        Caption = 'minutes.'
        Enabled = False
      end
      object chkAskToSave: TCheckBox
        Left = 0
        Top = 0
        Width = 305
        Height = 17
        Caption = 'Ask to save on exit program/close subtitle'
        TabOrder = 0
      end
      object chkSaveAutomatically: TCheckBox
        Left = 0
        Top = 16
        Width = 305
        Height = 17
        Caption = 'Save work automatically every'
        TabOrder = 1
        OnClick = chkSaveAutomaticallyClick
      end
      object edtMinutes: TEdit
        Left = 32
        Top = 32
        Width = 33
        Height = 21
        Enabled = False
        TabOrder = 2
        Text = '1'
      end
      object updMins: TUpDown
        Left = 65
        Top = 32
        Width = 15
        Height = 21
        Associate = edtMinutes
        Enabled = False
        Min = 1
        Max = 30
        Position = 1
        TabOrder = 3
      end
      object btnOutputSettings: TButton
        Left = 0
        Top = 96
        Width = 153
        Height = 33
        Caption = 'Output settings...'
        TabOrder = 4
        OnClick = btnOutputSettingsClick
      end
      object chkSaveAsBackup: TCheckBox
        Left = 16
        Top = 56
        Width = 289
        Height = 17
        Caption = 'Save as backup'
        TabOrder = 5
        OnClick = chkSaveAutomaticallyClick
      end
    end
    object pgeVideoPreview: TTabSheet
      Caption = 'pgeVideoPreview'
      ImageIndex = 4
      TabVisible = False
      object lblDoubleClickInSub: TLabel
        Left = 0
        Top = 0
        Width = 117
        Height = 13
        Caption = 'Double click in a subtitle:'
      end
      object lblShiftDoubleClickInSub: TLabel
        Left = 0
        Top = 96
        Width = 164
        Height = 13
        Caption = 'Shift-double click click in a subtitle:'
      end
      object Bevel2: TBevel
        Left = 0
        Top = 184
        Width = 357
        Height = 9
        Shape = bsBottomLine
      end
      object lblSeconds: TLabel
        Left = 56
        Top = 223
        Width = 43
        Height = 13
        Caption = 'seconds.'
      end
      object lblRewindAndForward: TLabel
        Left = 0
        Top = 200
        Width = 124
        Height = 13
        Caption = 'Rewind and forward time:'
      end
      object lblDefaultAltPlayRate: TLabel
        Left = 168
        Top = 200
        Width = 144
        Height = 13
        Caption = 'Default altered playback rate:'
      end
      object cmbDoubleClickInSub: TComboBox
        Left = 0
        Top = 16
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 2
        TabOrder = 0
        Text = 'Go N second(s) before subtitle in video'
        Items.Strings = (
          'Go subtitle'#39's time in video'
          'Focus text box'
          'Go N second(s) before subtitle in video')
      end
      object edtSecsToJump1: TLabeledEdit
        Left = 0
        Top = 64
        Width = 33
        Height = 21
        EditLabel.Width = 83
        EditLabel.Height = 13
        EditLabel.Caption = 'Seconds to jump:'
        TabOrder = 1
        Text = '1'
        OnChange = edtBorderWidthChange
      end
      object udSecsToJump1: TUpDown
        Left = 33
        Top = 64
        Width = 16
        Height = 21
        Associate = edtSecsToJump1
        Min = 1
        Max = 10
        Position = 1
        TabOrder = 2
      end
      object cmbShiftDoubleClickInSub: TComboBox
        Left = 0
        Top = 112
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 3
        Text = 'Go subtitle'#39's time in video'
        Items.Strings = (
          'Go subtitle'#39's time in video'
          'Focus text box'
          'Go N second(s) before subtitle in video')
      end
      object edtSecsToJump2: TLabeledEdit
        Left = 0
        Top = 160
        Width = 33
        Height = 21
        EditLabel.Width = 83
        EditLabel.Height = 13
        EditLabel.Caption = 'Seconds to jump:'
        TabOrder = 4
        Text = '1'
        OnChange = edtBorderWidthChange
      end
      object udSecsToJump2: TUpDown
        Left = 33
        Top = 160
        Width = 16
        Height = 21
        Associate = edtSecsToJump2
        Min = 1
        Max = 10
        Position = 1
        TabOrder = 5
      end
      object edtRewindAndForwardTime: TMaskEdit
        Left = 0
        Top = 216
        Width = 47
        Height = 21
        EditMask = '0,000;1;_'
        MaxLength = 5
        TabOrder = 6
        Text = ' ,   '
      end
      object cmbDefaultAltPlayRate: TComboBox
        Left = 168
        Top = 216
        Width = 97
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 7
        Items.Strings = (
          '10%'
          '20%'
          '30%'
          '40%'
          '50%'
          '60%'
          '70%'
          '80%'
          '90%'
          '150%'
          '200%'
          '300%'
          '400%')
      end
      object chkPlayVideoOnLoad: TCheckBox
        Left = 0
        Top = 248
        Width = 173
        Height = 17
        Caption = 'Play video on load'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
    end
    object pgeVideoPreviewSubs: TTabSheet
      Caption = 'pgeVideoPreviewSubs'
      ImageIndex = 5
      TabVisible = False
      object lblSubColor: TLabel
        Left = 26
        Top = 108
        Width = 37
        Height = 13
        Caption = 'Color...'
      end
      object lblSubBackground: TLabel
        Left = 26
        Top = 136
        Width = 68
        Height = 13
        Caption = 'Background...'
      end
      object lblSubTransparency: TLabel
        Left = 26
        Top = 164
        Width = 78
        Height = 13
        Caption = 'Transparency...'
      end
      object lblSubFont: TLabel
        Left = 26
        Top = 80
        Width = 34
        Height = 13
        Caption = 'Font...'
      end
      object chkDrawBorder: TCheckBox
        Left = 0
        Top = 0
        Width = 313
        Height = 17
        Caption = 'Draw border'
        TabOrder = 0
        OnClick = chkDrawBorderClick
      end
      object chkDrawShadow: TCheckBox
        Left = 0
        Top = 16
        Width = 313
        Height = 17
        Caption = 'Draw shadow'
        TabOrder = 1
        OnClick = chkDrawShadowClick
      end
      object chkTransparent: TCheckBox
        Left = 0
        Top = 32
        Width = 313
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'Try transparent background'
        ParentBiDiMode = False
        TabOrder = 2
        OnClick = chkTransparentClick
      end
      object btnSubFont: TButton
        Left = 0
        Top = 76
        Width = 21
        Height = 21
        Caption = '...'
        TabOrder = 3
        OnClick = btnSubFontClick
      end
      object edtBorderWidth: TLabeledEdit
        Left = 280
        Top = 136
        Width = 57
        Height = 21
        EditLabel.Width = 65
        EditLabel.Height = 13
        EditLabel.Caption = 'Border width:'
        LabelPosition = lpLeft
        TabOrder = 4
        Text = '1'
        OnChange = edtBorderWidthChange
      end
      object edtShadowWidth: TLabeledEdit
        Left = 280
        Top = 160
        Width = 57
        Height = 21
        EditLabel.Width = 71
        EditLabel.Height = 13
        EditLabel.Caption = 'Shadow width:'
        LabelPosition = lpLeft
        TabOrder = 5
        Text = '1'
        OnChange = edtShadowWidthChange
      end
      object udShadowWidth: TUpDown
        Left = 337
        Top = 160
        Width = 15
        Height = 21
        Associate = edtShadowWidth
        Min = 1
        Max = 5
        Position = 1
        TabOrder = 6
      end
      object udBorderWidth: TUpDown
        Left = 337
        Top = 136
        Width = 15
        Height = 21
        Associate = edtBorderWidth
        ArrowKeys = False
        Min = 1
        Max = 5
        Position = 1
        TabOrder = 7
      end
      object pnlSubSample: TPanel
        Left = 0
        Top = 224
        Width = 357
        Height = 73
        TabOrder = 8
        object subSample: TMiSubtitulo
          Left = 92
          Top = 16
          Width = 121
          Height = 33
          Text = 'subSAMPLE'
          Shadow = True
          Border = True
          UsarTags = False
          TextColor = clWhite
          BackgroundColor = clBtnFace
          BorderWidth = 1
          ShadowWidth = 1
          ForceTransparency = False
          TransparentColor = clFuchsia
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
      end
      object chkForceUsingRegions: TCheckBox
        Left = 16
        Top = 48
        Width = 297
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'Force using regions (may be slow)'
        ParentBiDiMode = False
        TabOrder = 9
      end
      object rgSubtitlePosition: TRadioGroup
        Left = 200
        Top = 72
        Width = 153
        Height = 57
        Caption = 'Position'
        ItemIndex = 0
        Items.Strings = (
          'Top'
          'Bottom')
        TabOrder = 10
      end
      object pnlSubColor: TPanel
        Left = 0
        Top = 104
        Width = 21
        Height = 21
        Cursor = crHandPoint
        TabOrder = 11
        OnClick = btnSubColorClick
      end
      object pnlSubBackground: TPanel
        Left = 0
        Top = 132
        Width = 21
        Height = 21
        Cursor = crHandPoint
        TabOrder = 12
        OnClick = btnBackgroundClick
      end
      object pnlSubTransparency: TPanel
        Left = 0
        Top = 160
        Width = 21
        Height = 21
        Cursor = crHandPoint
        TabOrder = 13
        OnClick = pnlSubTransparencyClick
      end
    end
    object pgeExternalPreviewGeneral: TTabSheet
      Caption = 'pgeExternalPreviewGeneral'
      ImageIndex = 6
      TabVisible = False
      object edtVidPlayer: TLabeledEdit
        Left = 0
        Top = 16
        Width = 357
        Height = 21
        EditLabel.Width = 116
        EditLabel.Height = 13
        EditLabel.Caption = 'Exe of the video player:'
        TabOrder = 0
      end
      object btnBrowse: TButton
        Left = 0
        Top = 40
        Width = 97
        Height = 25
        Caption = 'Browse'
        TabOrder = 1
        OnClick = btnBrowseClick
      end
      object btnDetect: TButton
        Left = 104
        Top = 40
        Width = 201
        Height = 25
        Caption = 'Detect associated program'
        TabOrder = 2
        OnClick = btnDetectClick
      end
      object rdoAskForDifferentVideo: TRadioButton
        Left = 0
        Top = 80
        Width = 313
        Height = 17
        Caption = 'Ask for a different video each time'
        Checked = True
        TabOrder = 3
        TabStop = True
        OnClick = rdoAskForDifferentVideoClick
      end
      object rdoTestWithVideo: TRadioButton
        Left = 0
        Top = 96
        Width = 313
        Height = 17
        Caption = 'Always test with video:'
        TabOrder = 4
        OnClick = rdoTestWithVideoClick
      end
      object edtAVIFile: TEdit
        Left = 0
        Top = 120
        Width = 357
        Height = 21
        Enabled = False
        TabOrder = 5
      end
      object btnBrowse2: TButton
        Left = 0
        Top = 144
        Width = 97
        Height = 25
        Caption = 'Browse'
        Enabled = False
        TabOrder = 6
        OnClick = btnBrowse2Click
      end
    end
    object pgeExternalPreviewAdvanced: TTabSheet
      Caption = 'pgeExternalPreviewAdvanced'
      ImageIndex = 7
      TabVisible = False
      object lblParamDescription: TLabel
        Left = 0
        Top = 128
        Width = 357
        Height = 137
        AutoSize = False
        Caption = 
          'VIDEO_FILE represents the video file in which you are going to t' +
          'est the subtitles. SUBT_FILE is the parameter in which the tempo' +
          'rary subtitle file will be sent to the video player. You may add' +
          ' other parameters like full screen, etc.'
        WordWrap = True
      end
      object lblSaveTempSubInFormat: TLabel
        Left = 0
        Top = 0
        Width = 165
        Height = 13
        Caption = 'Save temporary subtitle in format:'
      end
      object edtParameter: TLabeledEdit
        Left = 0
        Top = 104
        Width = 357
        Height = 21
        EditLabel.Width = 187
        EditLabel.Height = 13
        EditLabel.Caption = 'Parameter to send to the video player:'
        TabOrder = 0
      end
      object cmbFormats: TComboBox
        Left = 0
        Top = 49
        Width = 217
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 0
        Sorted = True
        TabOrder = 1
      end
      object rdoCustomFormat: TRadioButton
        Left = 0
        Top = 32
        Width = 313
        Height = 17
        Caption = 'Custom format:'
        TabOrder = 2
        OnClick = rdoCustomFormatClick
      end
      object rdoOriginalFormat: TRadioButton
        Left = 0
        Top = 16
        Width = 313
        Height = 17
        Caption = 'Original format'
        Checked = True
        TabOrder = 3
        TabStop = True
        OnClick = rdoOriginalFormatClick
      end
    end
    object pgeProgramLook: TTabSheet
      Caption = 'pgeProgramLook'
      ImageIndex = 8
      TabVisible = False
      object lblFontToUse: TLabel
        Left = 0
        Top = 0
        Width = 132
        Height = 13
        Caption = 'Font to use in the program:'
      end
      object lblFontSize: TLabel
        Left = 0
        Top = 48
        Width = 47
        Height = 13
        Caption = 'Font size:'
      end
      object lblTextAndTransFieldsAlign: TLabel
        Left = 0
        Top = 104
        Width = 172
        Height = 13
        Caption = '"Text" and "Translation" fields align:'
      end
      object cmbFonts: TComboBox
        Left = 0
        Top = 16
        Width = 281
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 0
        OnDrawItem = cmbFontsDrawItem
      end
      object edtFontSize: TEdit
        Left = 0
        Top = 64
        Width = 57
        Height = 21
        TabOrder = 1
        Text = '8'
      end
      object udFontSize: TUpDown
        Left = 57
        Top = 64
        Width = 15
        Height = 21
        Associate = edtFontSize
        Min = 6
        Max = 50
        Position = 8
        TabOrder = 2
      end
      object cmbTextAlign: TComboBox
        Left = 0
        Top = 120
        Width = 169
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 3
      end
      object chkShowColorBar: TCheckBox
        Left = 0
        Top = 152
        Width = 181
        Height = 17
        Caption = 'Show color bar'
        TabOrder = 4
      end
      object pnlSubtitleAbsent: TPanel
        Left = 0
        Top = 172
        Width = 21
        Height = 21
        Cursor = crHandPoint
        Color = clBlack
        TabOrder = 5
        OnClick = pnlSubtitleAbsentClick
      end
      object pnlSubtitleOK: TPanel
        Left = 28
        Top = 172
        Width = 21
        Height = 21
        Cursor = crHandPoint
        Color = clBlue
        TabOrder = 6
        OnClick = pnlSubtitleOKClick
      end
    end
    object pgeListLook: TTabSheet
      Caption = 'pgeListLook'
      ImageIndex = 9
      TabVisible = False
      object lblUntranslatedText: TLabel
        Left = 0
        Top = 116
        Width = 150
        Height = 13
        Caption = 'Text for untranslated subtitles:'
      end
      object chkMarkUnTransSubs: TCheckBox
        Left = 0
        Top = 32
        Width = 313
        Height = 17
        Caption = 'Mark untranslated subtitles with color:'
        TabOrder = 0
      end
      object chkApplyStyle: TCheckBox
        Left = 0
        Top = 16
        Width = 313
        Height = 17
        Caption = 'Apply style to subtitles'
        TabOrder = 1
      end
      object chkShowGridLines: TCheckBox
        Left = 0
        Top = 0
        Width = 313
        Height = 17
        Caption = 'Show grid lines'
        TabOrder = 2
      end
      object pnlUnTransColor: TPanel
        Left = 16
        Top = 52
        Width = 21
        Height = 21
        Cursor = crHandPoint
        Color = clRed
        TabOrder = 3
        OnClick = pnlUnTransColorClick
      end
      object chkShowHorzScrollBar: TCheckBox
        Left = 0
        Top = 88
        Width = 313
        Height = 17
        Caption = 'Show horizontal scrollbar'
        TabOrder = 4
      end
      object edtUntranslatedText: TEdit
        Left = 0
        Top = 132
        Width = 353
        Height = 21
        TabOrder = 5
        Text = '- Untranslated subtitle -'
      end
    end
    object pgeMenuLook: TTabSheet
      Caption = 'pgeMenuLook'
      ImageIndex = 10
      TabVisible = False
      object chkUseOfficeXPStyleMenu: TCheckBox
        Left = 0
        Top = 0
        Width = 313
        Height = 17
        Caption = 'Use Office XP style menu'
        TabOrder = 0
        OnClick = chkUseOfficeXPStyleMenuClick
      end
      object chkUseGradientMenu: TCheckBox
        Left = 0
        Top = 16
        Width = 313
        Height = 17
        Caption = 'Use gradient menu'
        TabOrder = 1
      end
    end
  end
  object pnlHeading: TPanel
    Left = 0
    Top = 0
    Width = 552
    Height = 49
    Align = alTop
    Color = clWhite
    TabOrder = 0
    DesignSize = (
      552
      49)
    object lblTitle: TLabel
      Left = 16
      Top = 8
      Width = 47
      Height = 13
      Caption = 'Settings'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescription: TLabel
      Left = 26
      Top = 24
      Width = 431
      Height = 21
      AutoSize = False
      Caption = 'Modify the program configuration'
      WordWrap = True
    end
    object bvlSeparator: TBevel
      Left = -8
      Top = 46
      Width = 560
      Height = 4
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
  end
  object tvSettings: TTreeView
    Left = 4
    Top = 60
    Width = 180
    Height = 295
    Anchors = [akLeft, akTop, akBottom]
    HideSelection = False
    HotTrack = True
    Indent = 19
    ReadOnly = True
    ShowButtons = False
    TabOrder = 1
    OnClick = tvSettingsClick
    OnCollapsing = tvSettingsCollapsing
    OnKeyUp = tvSettingsKeyUp
  end
  object btnOk: TButton
    Left = 376
    Top = 372
    Width = 84
    Height = 25
    Caption = '&Ok'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 467
    Top = 372
    Width = 81
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object dlgBrowse: TOpenDialog
    Left = 8
    Top = 368
  end
  object dlgSetColor: TColorDialog
    Left = 72
    Top = 368
  end
  object dlgSetFont: TFontDialog
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = []
    Left = 40
    Top = 368
  end
end

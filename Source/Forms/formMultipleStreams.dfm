object frmMultipleStreams: TfrmMultipleStreams
  Left = 217
  Top = 125
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 122
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblStreams1: TLabel
    Left = 8
    Top = 8
    Width = 152
    Height = 13
    Caption = 'Multiple audio streams detected.'
  end
  object lblStreams2: TLabel
    Left = 8
    Top = 28
    Width = 162
    Height = 13
    Caption = 'Please choose audio to work with.'
  end
  object cmbStreams: TComboBox
    Left = 8
    Top = 48
    Width = 45
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 252
    Top = 88
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOKClick
  end
end

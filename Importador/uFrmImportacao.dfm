object frmImportacao: TfrmImportacao
  Left = 0
  Top = 0
  Caption = 'Importador'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 353
    Height = 89
    BevelOuter = bvNone
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 319
      Top = 16
      Width = 23
      Height = 22
      OnClick = SpeedButton1Click
    end
    object edtCaminhoArquivo: TLabeledEdit
      Left = 0
      Top = 17
      Width = 313
      Height = 21
      EditLabel.Width = 99
      EditLabel.Height = 13
      EditLabel.Caption = 'Caminho do arquivo:'
      TabOrder = 0
    end
    object Button1: TButton
      Left = 0
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 267
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object Button3: TButton
    Left = 288
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 1
    OnClick = Button3Click
  end
end

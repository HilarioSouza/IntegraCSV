object frmImportacao: TfrmImportacao
  Left = 0
  Top = 0
  Caption = 'Importador'
  ClientHeight = 508
  ClientWidth = 822
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 353
    Height = 89
    BevelOuter = bvNone
    TabOrder = 0
    object sbtCaminhoArquivo: TSpeedButton
      Left = 319
      Top = 16
      Width = 23
      Height = 22
      OnClick = sbtCaminhoArquivoClick
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
    object btnImportar: TButton
      Left = 0
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 1
      OnClick = btnImportarClick
    end
    object btnSair: TButton
      Left = 267
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 2
      OnClick = btnSairClick
    end
  end
  object Button3: TButton
    Left = 384
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 1
    OnClick = Button3Click
  end
  object dgrImportacao: TDBGrid
    Left = 8
    Top = 103
    Width = 721
    Height = 397
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 735
    Top = 0
    Width = 87
    Height = 508
    Align = alRight
    Caption = 'Panel2'
    TabOrder = 3
    object Button1: TButton
      Left = 8
      Top = 103
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 664
    Top = 48
  end
  object FDQuery1: TFDQuery
    Connection = dmConnect.fdConn
    SQL.Strings = (
      'select * from imp')
    Left = 736
    Top = 40
  end
end

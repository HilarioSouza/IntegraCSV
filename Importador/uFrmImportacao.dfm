object frmImportacao: TfrmImportacao
  Left = 0
  Top = 0
  Caption = 'Importador'
  ClientHeight = 508
  ClientWidth = 793
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
    Left = 0
    Top = 0
    Width = 706
    Height = 97
    BevelOuter = bvNone
    TabOrder = 0
    object sbtCaminhoArquivo: TSpeedButton
      Left = 335
      Top = 16
      Width = 23
      Height = 22
      OnClick = sbtCaminhoArquivoClick
    end
    object edtCaminhoArquivo: TLabeledEdit
      Left = 16
      Top = 17
      Width = 313
      Height = 21
      EditLabel.Width = 99
      EditLabel.Height = 13
      EditLabel.Caption = 'Caminho do arquivo:'
      TabOrder = 0
    end
    object btnImportar: TButton
      Left = 16
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 1
      OnClick = btnImportarClick
    end
    object Button3: TButton
      Left = 254
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Teste'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Panel2: TPanel
    Left = 706
    Top = 0
    Width = 87
    Height = 508
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 735
    object btnDesfazerIMP: TButton
      Left = 8
      Top = 103
      Width = 75
      Height = 25
      Caption = 'Desfazer'
      TabOrder = 0
      OnClick = btnDesfazerIMPClick
    end
    object btnSair: TButton
      Left = 8
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnSairClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 103
    Width = 706
    Height = 405
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 706
      Height = 405
      ActivePage = tshIMP
      Align = alClient
      TabOrder = 0
      object tshIMP: TTabSheet
        Caption = 'tshIMP'
        ExplicitWidth = 281
        ExplicitHeight = 165
        object dgrIMP: TDBGrid
          Left = 0
          Top = 0
          Width = 698
          Height = 377
          Align = alClient
          DataSource = ddsIMP
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object tshREG: TTabSheet
        Caption = 'tshREG'
        ImageIndex = 1
        ExplicitWidth = 281
        ExplicitHeight = 165
        object dgrREG: TDBGrid
          Left = 0
          Top = 0
          Width = 698
          Height = 377
          Align = alClient
          DataSource = ddsREG
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
  end
  object ddsIMP: TDataSource
    DataSet = fqrIMP
    Left = 704
    Top = 32
  end
  object fqrIMP: TFDQuery
    Connection = dmConnect.fdConn
    SQL.Strings = (
      'select * from imp')
    Left = 712
    Top = 24
  end
  object ddsREG: TDataSource
    DataSet = fqrREG
    Left = 488
    Top = 32
  end
  object fqrREG: TFDQuery
    Connection = dmConnect.fdConn
    SQL.Strings = (
      'select * from reg')
    Left = 496
    Top = 40
  end
end

object frmImportacao: TfrmImportacao
  Left = 0
  Top = 0
  Caption = 'Importador'
  ClientHeight = 597
  ClientWidth = 882
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
    Width = 795
    Height = 597
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 778
    ExplicitHeight = 97
    object sbtCaminhoArquivo: TSpeedButton
      Left = 335
      Top = 25
      Width = 23
      Height = 21
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555FFFFFFFFFF55555000000000055555577777777775FFFF00B8B8B8B8B0
        0000775F5555555777770B0B8B8B8B8B0FF07F75F555555575F70FB0B8B8B8B8
        B0F07F575FFFFFFFF7F70BFB0000000000F07F557777777777570FBFBF0FFFFF
        FFF07F55557F5FFFFFF70BFBFB0F000000F07F55557F777777570FBFBF0FFFFF
        FFF075F5557F5FFFFFF750FBFB0F000000F0575FFF7F777777575700000FFFFF
        FFF05577777F5FF55FF75555550F00FF00005555557F775577775555550FFFFF
        0F055555557F55557F755555550FFFFF00555555557FFFFF7755555555000000
        0555555555777777755555555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = sbtCaminhoArquivoClick
    end
    object edtCaminhoArquivo: TLabeledEdit
      Left = 16
      Top = 25
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
    object dcbEMP: TDBLookupComboBox
      Left = 364
      Top = 25
      Width = 145
      Height = 21
      KeyField = 'CODIGO'
      ListField = 'NOME'
      ListSource = ddsEMP
      TabOrder = 2
    end
    object Panel3: TPanel
      Left = 0
      Top = 94
      Width = 795
      Height = 503
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      ExplicitLeft = -1
      ExplicitTop = 103
      ExplicitWidth = 778
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 503
        ActivePage = tshIMP
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 706
        ExplicitHeight = 405
        object tshIMP: TTabSheet
          Caption = 'tshIMP'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 770
          ExplicitHeight = 0
          object dgrIMP: TDBGrid
            Left = 0
            Top = 0
            Width = 787
            Height = 475
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
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 770
          ExplicitHeight = 0
          object dgrREG: TDBGrid
            Left = 0
            Top = 0
            Width = 787
            Height = 475
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
  end
  object Panel2: TPanel
    Left = 795
    Top = 0
    Width = 87
    Height = 597
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 706
    ExplicitHeight = 508
    object btnDesfazerIMP: TButton
      Left = 8
      Top = 127
      Width = 75
      Height = 25
      Caption = 'Desfazer'
      TabOrder = 0
      OnClick = btnDesfazerIMPClick
    end
    object btnSair: TButton
      Left = 8
      Top = 160
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnSairClick
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
    Left = 576
    Top = 32
  end
  object fqrREG: TFDQuery
    Connection = dmConnect.fdConn
    SQL.Strings = (
      'select * from reg')
    Left = 584
    Top = 40
  end
  object fqrEMP: TFDQuery
    Connection = dmConnect.fdConn
    SQL.Strings = (
      'select * from emp')
    Left = 424
    Top = 72
  end
  object ddsEMP: TDataSource
    DataSet = fqrEMP
    Left = 456
    Top = 80
  end
end

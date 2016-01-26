inherited frmCrudbasic: TfrmCrudbasic
  Caption = 'frmCrudbasic'
  ClientHeight = 395
  ClientWidth = 617
  OnCreate = FormCreate
  ExplicitWidth = 623
  ExplicitHeight = 424
  PixelsPerInch = 96
  TextHeight = 13
  object pnCaptionTela: TPanel
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 607
    Height = 50
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    BevelInner = bvSpace
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 5
      Width = 93
      Height = 20
      Caption = 'Nome da Tela'
    end
    object Label2: TLabel
      Left = 10
      Top = 28
      Width = 87
      Height = 13
      Caption = 'Descri'#231#227'o da Tela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnTop: TPanel
    AlignWithMargins = True
    Left = 5
    Top = 61
    Width = 607
    Height = 32
    Margins.Left = 5
    Margins.Top = 1
    Margins.Right = 5
    Margins.Bottom = 1
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 607
      Height = 32
      Align = alClient
      BevelEdges = [beLeft, beTop, beBottom]
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitHeight = 47
      object btnIncluir: TButton
        Left = 0
        Top = 0
        Width = 59
        Height = 27
        Caption = 'Incluir'
        TabOrder = 0
        OnClick = btnIncluirClick
      end
      object btnEditar: TButton
        Left = 60
        Top = 0
        Width = 59
        Height = 27
        Caption = 'Editar'
        TabOrder = 1
        OnClick = btnEditarClick
      end
      object btnCancelar: TButton
        Left = 182
        Top = 0
        Width = 59
        Height = 27
        Caption = 'Cancelar'
        TabOrder = 2
        OnClick = btnCancelarClick
      end
      object btnExcluir: TButton
        Left = 243
        Top = 0
        Width = 59
        Height = 27
        Caption = 'Excluir'
        TabOrder = 3
        OnClick = btnExcluirClick
      end
      object btnSair: TButton
        Left = 304
        Top = 0
        Width = 59
        Height = 27
        Caption = 'Sair'
        TabOrder = 4
        OnClick = btnSairClick
      end
      object btnSalvar: TButton
        Left = 121
        Top = 0
        Width = 59
        Height = 27
        Caption = 'Salvar'
        TabOrder = 5
        OnClick = btnSalvarClick
      end
    end
  end
  object pgCrud: TPageControl
    Left = 0
    Top = 94
    Width = 617
    Height = 301
    ActivePage = tsCad
    Align = alClient
    TabOrder = 2
    ExplicitTop = 108
    ExplicitHeight = 287
    object tsPsq: TTabSheet
      Caption = 'Pesquisa'
      ExplicitHeight = 259
      object gridPsq: TDBGrid
        Left = 0
        Top = 0
        Width = 609
        Height = 273
        Align = alClient
        DataSource = dsDados
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tsCad: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitHeight = 259
      object lblCodigo: TLabel
        Left = 3
        Top = 7
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object edtID: TDBEdit
        Left = 3
        Top = 22
        Width = 46
        Height = 21
        DataSource = dsDados
        TabOrder = 0
      end
    end
  end
  object qryMain: TFDQuery
    Left = 88
    Top = 192
  end
  object dsDados: TDataSource
    AutoEdit = False
    DataSet = qryMain
    Left = 208
    Top = 152
  end
end

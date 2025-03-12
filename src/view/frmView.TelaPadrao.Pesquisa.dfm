object frmViewTelaPadraoPesquisa: TfrmViewTelaPadraoPesquisa
  Left = 0
  Top = 0
  Caption = 'frmViewTelaPadraoPesquisa'
  ClientHeight = 318
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Pnl_Superior: TPanel
    Left = 0
    Top = 0
    Width = 474
    Height = 43
    Margins.Bottom = 0
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Lbl_Titulo: TLabel
      AlignWithMargins = True
      Left = 11
      Top = 11
      Width = 452
      Height = 21
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      Alignment = taCenter
      Caption = 'Titulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 45
    end
  end
  object Pnl_Inferior: TPanel
    Left = 0
    Top = 269
    Width = 474
    Height = 49
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Btn_Confirmar: TButton
      Left = 392
      Top = 6
      Width = 70
      Height = 35
      Caption = 'Confirmar'
      TabOrder = 1
      OnClick = Btn_ConfirmarClick
    end
    object Btn_Cancelar: TButton
      Left = 306
      Top = 5
      Width = 70
      Height = 35
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = Btn_CancelarClick
    end
  end
  object Pnl_Central: TPanel
    Left = 0
    Top = 43
    Width = 474
    Height = 226
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 472
      Height = 224
      Align = alClient
      DataSource = DataSource_Padrao
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnKeyDown = DBGrid1KeyDown
    end
  end
  object DataSource_Padrao: TDataSource
    Left = 400
    Top = 211
  end
end

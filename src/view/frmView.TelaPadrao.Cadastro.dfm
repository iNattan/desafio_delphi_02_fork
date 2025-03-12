object frmViewTelaPadraoCadastro: TfrmViewTelaPadraoCadastro
  Left = 0
  Top = 0
  Caption = 'Tela Padr'#227'o Cadastro'
  ClientHeight = 441
  ClientWidth = 545
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
    Width = 545
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
      Width = 523
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
    Top = 392
    Width = 545
    Height = 49
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Btn_Inserir: TButton
      Left = 101
      Top = 6
      Width = 70
      Height = 35
      Caption = 'Inserir'
      TabOrder = 1
    end
    object Btn_Editar: TButton
      Left = 191
      Top = 6
      Width = 70
      Height = 35
      Caption = 'Editar'
      Enabled = False
      TabOrder = 2
    end
    object Btn_Deletar: TButton
      Left = 280
      Top = 6
      Width = 70
      Height = 35
      Caption = 'Deletar'
      Enabled = False
      TabOrder = 3
    end
    object Btn_Gravar: TButton
      Left = 460
      Top = 6
      Width = 70
      Height = 35
      Caption = 'Gravar'
      Enabled = False
      TabOrder = 5
    end
    object Btn_Limpar: TButton
      Left = 370
      Top = 6
      Width = 70
      Height = 35
      Caption = 'Limpar'
      Enabled = False
      TabOrder = 4
    end
    object Btn_Consultar: TButton
      Left = 11
      Top = 6
      Width = 70
      Height = 35
      Caption = 'Consultar'
      TabOrder = 0
    end
  end
  object Pnl_Central: TPanel
    Left = 0
    Top = 43
    Width = 545
    Height = 349
    Align = alClient
    Color = clWhite
    Enabled = False
    ParentBackground = False
    TabOrder = 2
  end
end

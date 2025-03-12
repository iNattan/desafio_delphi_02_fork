inherited frmViewCliente: TfrmViewCliente
  Caption = 'Cadastro de Clientes'
  ClientHeight = 214
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  ExplicitHeight = 253
  TextHeight = 15
  inherited Pnl_Superior: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Lbl_Titulo: TLabel
      Width = 523
      Caption = 'Cadastro de Clientes'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 155
    end
  end
  inherited Pnl_Inferior: TPanel
    Top = 165
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 165
    inherited Btn_Inserir: TButton
      OnClick = Btn_InserirClick
    end
    inherited Btn_Editar: TButton
      OnClick = Btn_EditarClick
    end
    inherited Btn_Deletar: TButton
      OnClick = Btn_DeletarClick
    end
    inherited Btn_Gravar: TButton
      OnClick = Btn_GravarClick
    end
    inherited Btn_Limpar: TButton
      OnClick = Btn_LimparClick
    end
    inherited Btn_Consultar: TButton
      OnClick = Btn_ConsultarClick
    end
  end
  inherited Pnl_Central: TPanel
    Height = 122
    StyleElements = [seFont, seClient, seBorder]
    ExplicitHeight = 122
    object Lbl_CPF: TLabel
      Left = 431
      Top = 61
      Width = 29
      Height = 15
      Caption = 'CPF *'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Lbl_ID: TLabel
      Left = 11
      Top = 16
      Width = 11
      Height = 15
      Caption = 'ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Lbl_Nome: TLabel
      Left = 11
      Top = 64
      Width = 41
      Height = 15
      Caption = 'Nome *'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Edt_ID: TEdit
      Left = 11
      Top = 34
      Width = 70
      Height = 23
      Enabled = False
      NumbersOnly = True
      TabOrder = 0
    end
    object Edt_Nome: TEdit
      Left = 11
      Top = 82
      Width = 406
      Height = 23
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 1
    end
    object Edt_CPF: TMaskEdit
      Left = 431
      Top = 82
      Width = 98
      Height = 23
      EditMask = '999.999.999-99;0;_'
      MaxLength = 14
      TabOrder = 2
      Text = ''
    end
  end
end

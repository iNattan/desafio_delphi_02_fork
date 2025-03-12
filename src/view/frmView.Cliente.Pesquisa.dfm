inherited frmViewClientePesquisa: TfrmViewClientePesquisa
  Caption = 'Consulta de Clientes'
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  TextHeight = 15
  inherited Pnl_Superior: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Lbl_Titulo: TLabel
      Width = 452
      Caption = 'Consulta de Clientes'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 155
    end
  end
  inherited Pnl_Inferior: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Btn_Confirmar: TButton
      Enabled = True
    end
    inherited Btn_Cancelar: TButton
      Enabled = True
    end
  end
  inherited Pnl_Central: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
end

unit frmView.Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TfrmViewMenu = class(TForm)
    Pnl_Menu: TPanel;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    Venda1: TMenuItem;
    PedidosdeVenda1: TMenuItem;
    SolicitaesdeReceita1: TMenuItem;
    Image1: TImage;
    procedure Clientes1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure PedidosdeVenda1Click(Sender: TObject);
    procedure SolicitaesdeReceita1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewMenu: TfrmViewMenu;

implementation

uses
  frmView.Cliente, frmView.Produto, frmView.PedidoVenda,
  frmView.SolicitacaoReceita;

{$R *.dfm}

procedure TfrmViewMenu.Clientes1Click(Sender: TObject);
var
  frmCliente: TfrmViewCliente;
begin
  frmCliente := TfrmViewCliente.Create(Self);
  try
    frmCliente.ShowModal;
  finally
    frmCliente.Free;
  end;
end;

procedure TfrmViewMenu.PedidosdeVenda1Click(Sender: TObject);
var
  frmPedidoVenda: TfrmViewPedidoVenda;
begin
  frmPedidoVenda := TfrmViewPedidoVenda.Create(Self);
  try
    frmPedidoVenda.ShowModal;
  finally
    frmPedidoVenda.Free;
  end;
end;

procedure TfrmViewMenu.Produtos1Click(Sender: TObject);
var
  frmProduto: TfrmViewProduto;
begin
  frmProduto := TfrmViewProduto.Create(Self);
  try
    frmProduto.ShowModal;
  finally
    frmProduto.Free;
  end;
end;

procedure TfrmViewMenu.SolicitaesdeReceita1Click(Sender: TObject);
var
  frmSolicitacaoReceita: TfrmViewSolicitacaoReceita;
begin
  frmSolicitacaoReceita := TfrmViewSolicitacaoReceita.Create(Self);
  try
    frmSolicitacaoReceita.ShowModal;
  finally
    frmSolicitacaoReceita.Free;
  end;
end;

end.

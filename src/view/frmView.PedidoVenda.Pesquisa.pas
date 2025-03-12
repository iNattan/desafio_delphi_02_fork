unit frmView.PedidoVenda.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmView.TelaPadrao.Pesquisa, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmViewPedidoVendaPesquisa = class(TfrmViewTelaPadraoPesquisa)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewPedidoVendaPesquisa: TfrmViewPedidoVendaPesquisa;

implementation

uses
  uController.PedidoVenda.Interfaces, uController.PedidoVenda;

{$R *.dfm}

procedure TfrmViewPedidoVendaPesquisa.FormCreate(Sender: TObject);
var
  PedidoVendaController: iPedidoVendaController;
begin
  inherited;
  PedidoVendaController := TPedidoVendaController.New;
  PedidoVendaController.Listar(DataSource_Padrao);
end;

end.

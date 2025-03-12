unit uController.PedidoVenda;

interface

uses
  uModel.PedidoVenda.Interfaces, uDAO.PedidoVenda.Interfaces, uDAO.PedidoVendaItem.Interfaces,
  uDAO.PedidoVenda, uController.PedidoVenda.Interfaces, Data.DB, uDTO.PedidoVenda.Interfaces,
  System.Generics.Collections;

type
  TPedidoVendaController = class (TInterfacedObject, iPedidoVendaController)
  private
    FPedidoVendaDTO: iDTOPedidoVenda;
    FPedidoVendaDAO: iPedidoVendaDAO;
    FPedidoVendaItemDAO: iPedidoVendaItemDAO;
  public
    constructor Create;
    class function New: iPedidoVendaController;
    function NovoPedidoVenda: iDTOPedidoVenda;
    function Inserir: Boolean;
    function Listar(DataSource: TDataSource): Boolean;
    function ListarPedidosAguardandoReceita(DataSource: TDataSource;
      Filtro: String): Boolean;
    function BuscarPorId(Id: Integer): iDTOPedidoVenda;
    procedure ValidaStatusPedido;
    function Assinar(Id, IdTecnico: Integer): Boolean;
  end;

implementation

uses
  uModel.PedidoVenda, System.SysUtils, uDTO.PedidoVenda, uDAO.PedidoVendaItem,
  uModel.PedidoVendaItem.Interfaces, uController.Produto.Interfaces,
  uController.Produto, uModel.Produto.Interfaces;

constructor TPedidoVendaController.Create;
begin
  FPedidoVendaDTO := TDTOPedidoVenda.New;
  FPedidoVendaDAO := TPedidoVendaDAO.New;
  FPedidoVendaItemDAO := TPedidoVendaItemDAO.New;
end;

class function TPedidoVendaController.New: iPedidoVendaController;
begin
  Result := Self.Create;
end;

function TPedidoVendaController.NovoPedidoVenda: iDTOPedidoVenda;
begin
  Result := FPedidoVendaDTO;
end;

function TPedidoVendaController.Inserir: Boolean;
var
  IdPedidoVenda: Integer;
  PedidoVendaItem: iPedidoVendaItem;
begin
  ValidaStatusPedido;
  IdPedidoVenda := FPedidoVendaDAO.Inserir(FPedidoVendaDTO.PedidoVenda);

  for PedidoVendaItem in FPedidoVendaDTO.PedidoVendaItems do
    FPedidoVendaItemDAO.Inserir(PedidoVendaItem, IdPedidoVenda);

  Result := True;
end;

function TPedidoVendaController.Listar(DataSource: TDataSource): Boolean;
begin
  Result := FPedidoVendaDAO.Listar(DataSource);
end;

function TPedidoVendaController.ListarPedidosAguardandoReceita(
  DataSource: TDataSource; Filtro: string): Boolean;
begin
  Result := FPedidoVendaDAO.ListarPedidosAguardandoReceita(DataSource, Filtro);
end;

function TPedidoVendaController.BuscarPorId(Id: Integer): iDTOPedidoVenda;
var
  PedidoVenda: iPedidoVenda;
  Itens: TList<iPedidoVendaItem>;
begin
  PedidoVenda := FPedidoVendaDAO.BuscarPorId(Id);
  Itens := FPedidoVendaItemDAO.BuscarPorIdPedidoVenda(PedidoVenda.Id);

  Result := FPedidoVendaDTO.PedidoVenda(PedidoVenda);
  Result := FPedidoVendaDTO.PedidoVendaItems(Itens);
end;

procedure TPedidoVendaController.ValidaStatusPedido;
var
  ProdutoController: iProdutoController;
  PedidoVendaItem: iPedidoVendaItem;
  Produto: iProduto;
  NecessitaReceita: Boolean;
begin
  ProdutoController := TProdutoController.New;

  NecessitaReceita := False;
  for PedidoVendaItem in FPedidoVendaDTO.PedidoVendaItems do
  begin
    Produto := ProdutoController.BuscarPorId(PedidoVendaItem.IdProduto);
    if Produto.ControleEspecial = 'S' then
    begin
      NecessitaReceita := True;
      Break;
    end;
  end;

  if NecessitaReceita then
    FPedidoVendaDTO.PedidoVenda.Status(2)
  else
    FPedidoVendaDTO.PedidoVenda.Status(1);
end;

function TPedidoVendaController.Assinar(Id, IdTecnico: Integer): Boolean;
begin
  Result := FPedidoVendaDAO.Assinar(Id, IdTecnico);
end;

end.


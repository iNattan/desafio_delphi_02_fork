unit uController.PedidoVendaItem;

interface

uses
  uDAO.PedidoVendaItem.Interfaces, uController.PedidoVendaItem.Interfaces,
  Data.DB;


type
  TPedidoVendaItemController = class (TInterfacedObject, iPedidoVendaItemController)
  private
    FPedidoVendaItemDAO: iPedidoVendaItemDAO;
  public
    constructor Create;
    class function New: iPedidoVendaItemController;
    function ListarItensControleEspecialPorIdPedidoVenda(DataSource: TDataSource;
      IdPedidoVenda: Integer): Boolean;
  end;

implementation

uses
  uDAO.PedidoVendaItem;

constructor TPedidoVendaItemController.Create;
begin
  FPedidoVendaItemDAO := TPedidoVendaItemDAO.New;
end;

class function TPedidoVendaItemController.New: iPedidoVendaItemController;
begin
  Result := Self.Create;
end;

function TPedidoVendaItemController.ListarItensControleEspecialPorIdPedidoVenda(
  DataSource: TDataSource; IdPedidoVenda: Integer): Boolean;
begin
  Result := FPedidoVendaItemDAO.ListarItensControleEspecialPorIdPedidoVenda(
    DataSource, IdPedidoVenda
  );
end;
end.


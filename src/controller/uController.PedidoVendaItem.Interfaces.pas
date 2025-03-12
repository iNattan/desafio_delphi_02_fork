unit uController.PedidoVendaItem.Interfaces;

interface

uses
  Data.DB;

type
  iPedidoVendaItemController = interface
    function ListarItensControleEspecialPorIdPedidoVenda(DataSource: TDataSource;
      IdPedidoVenda: Integer): Boolean;
  end;

implementation

end.
interface

implementation

end.

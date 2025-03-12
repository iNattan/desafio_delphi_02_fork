unit uDAO.PedidoVendaItem.Interfaces;

interface

uses
  uModel.PedidoVendaItem.Interfaces, Data.DB, System.Generics.Collections;

type

  iPedidoVendaItemDAO = interface
    function Inserir(PedidoVendaItem: iPedidoVendaItem; IdPedidoVenda: Integer): Boolean;
    function ListarItensControleEspecialPorIdPedidoVenda(DataSource: TDataSource;
      IdPedidoVenda: Integer): Boolean;
    function BuscarPorIdPedidoVenda(IdPedidoVenda: Integer): TList<iPedidoVendaItem>;
  end;

implementation

end.

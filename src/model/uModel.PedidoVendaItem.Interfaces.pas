unit uModel.PedidoVendaItem.Interfaces;

interface

type

  iPedidoVendaItem = interface
    function Id(Value: Integer): iPedidoVendaItem; overload;
    function Id: Integer; overload;
    function IdPedidoVenda(Value: Integer): iPedidoVendaItem; overload;
    function IdPedidoVenda: Integer; overload;
    function IdProduto(Value: Integer): iPedidoVendaItem; overload;
    function IdProduto: Integer; overload;
    function Quantidade(Value: Currency): iPedidoVendaItem; overload;
    function Quantidade: Currency; overload;
    function ValorUnitario(Value: Currency): iPedidoVendaItem; overload;
    function ValorUnitario: Currency; overload;
    function ValorTotal(Value: Currency): iPedidoVendaItem; overload;
    function ValorTotal: Currency; overload;
  end;

implementation

end.

unit uDTO.PedidoVenda.Interfaces;

interface

uses
  uModel.PedidoVenda.Interfaces, uModel.PedidoVendaItem.Interfaces, System.Generics.Collections;

type

  iDTOPedidoVenda = interface
    function PedidoVenda(Value: iPedidoVenda): iDTOPedidoVenda; overload;
    function PedidoVenda: iPedidoVenda; overload;

    function PedidoVendaItems(Value: TList<iPedidoVendaItem>): iDTOPedidoVenda; overload;
    function PedidoVendaItems: TList<iPedidoVendaItem>; overload;
  end;

implementation

end.


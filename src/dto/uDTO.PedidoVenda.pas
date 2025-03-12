unit uDTO.PedidoVenda;

interface

uses
  uDTO.PedidoVenda.Interfaces, uModel.PedidoVenda.Interfaces,
  uModel.PedidoVendaItem.Interfaces, System.Generics.Collections;

type
  TDTOPedidoVenda = class(TInterfacedObject, iDTOPedidoVenda)
  private
    FPedidoVenda: iPedidoVenda;
    FItens: TList<iPedidoVendaItem>;

    function PedidoVenda(Value: iPedidoVenda): iDTOPedidoVenda; overload;
    function PedidoVenda: iPedidoVenda; overload;
    function PedidoVendaItems(Value: TList<iPedidoVendaItem>): iDTOPedidoVenda; overload;
    function PedidoVendaItems: TList<iPedidoVendaItem>; overload;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDTOPedidoVenda;
  end;

implementation

uses
  uModel.PedidoVenda;

constructor TDTOPedidoVenda.Create;
begin
  FItens := TList<iPedidoVendaItem>.Create;
  FPedidoVenda := TModelPedidoVenda.New;
end;

class function TDTOPedidoVenda.New: iDTOPedidoVenda;
begin
  Result := Self.Create;
end;

destructor TDTOPedidoVenda.Destroy;
begin
  FItens.Free;
  inherited;
end;

function TDTOPedidoVenda.PedidoVenda(Value: iPedidoVenda): iDTOPedidoVenda;
begin
  Result := Self;
  FPedidoVenda := Value;
end;

function TDTOPedidoVenda.PedidoVenda: iPedidoVenda;
begin
  Result := FPedidoVenda;
end;

function TDTOPedidoVenda.PedidoVendaItems(Value: TList<iPedidoVendaItem>): iDTOPedidoVenda;
begin
  Result := Self;
  FItens := Value;
end;

function TDTOPedidoVenda.PedidoVendaItems: TList<iPedidoVendaItem>;
begin
  Result := FItens;
end;

end.


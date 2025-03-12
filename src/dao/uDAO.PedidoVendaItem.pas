unit uDAO.PedidoVendaItem;

interface

uses
  uDAO.PedidoVendaItem.Interfaces, uConexao.Query.Interfaces, uModel.PedidoVendaItem.Interfaces,
  Data.DB, uModel.PedidoVendaItem, System.Generics.Collections;

type
  TPedidoVendaItemDAO = class (TInterfacedObject, iPedidoVendaItemDAO)
  private
    FQuery: iQuery;
  public
    constructor Create;
    class function New: TPedidoVendaItemDAO;
    function Inserir(PedidoVendaItem: iPedidoVendaItem; IdPedidoVenda: Integer): Boolean;
    function ListarItensControleEspecialPorIdPedidoVenda(DataSource: TDataSource;
      IdPedidoVenda: Integer): Boolean;
    function BuscarPorIdPedidoVenda(IdPedidoVenda: Integer): TList<iPedidoVendaItem>;
  end;

implementation

uses
  uConexao.Query.Firedac, FireDAC.Comp.Client, System.SysUtils;

constructor TPedidoVendaItemDAO.Create;
begin
  FQuery := TModelQueryFiredac.New(nil);
end;

class function TPedidoVendaItemDAO.New: TPedidoVendaItemDAO;
begin
  Result := Self.Create;
end;

function TPedidoVendaItemDAO.Inserir(PedidoVendaItem: iPedidoVendaItem; IdPedidoVenda: Integer): Boolean;
begin
  try
    FQuery.SQL('INSERT INTO PEDIDO_VENDA_ITENS (ID, ID_PEDIDO_VENDA, ID_PRODUTO, '+
               'QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL) VALUES '+
               '(GEN_ID(GEN_PEDIDO_VENDA_ITENS_ID, 1), :Id_Pedido_Venda, :Id_Produto, '+
               ':Quantidade, :Valor_Unitario, :Valor_Total)');

    with TFDQuery(FQuery.DataSet) do
    begin
      ParamByName('Id_Pedido_Venda').AsInteger := IdPedidoVenda;
      ParamByName('Id_Produto').AsInteger := PedidoVendaItem.IdProduto;
      ParamByName('Quantidade').AsCurrency := PedidoVendaItem.Quantidade;
      ParamByName('Valor_Unitario').AsCurrency := PedidoVendaItem.ValorUnitario;
      ParamByName('Valor_Total').AsCurrency := PedidoVendaItem.ValorTotal;
    end;

    Result := FQuery.ExecSQL;
  except
    on E: Exception do
    begin
      Result := False;
      raise;
    end;
  end;
end;

function TPedidoVendaItemDAO.ListarItensControleEspecialPorIdPedidoVenda(
  DataSource: TDataSource; IdPedidoVenda: Integer): Boolean;
begin
  try
    FQuery.SQL('SELECT '+
               'pdvi.ID, pdvi.ID_PEDIDO_VENDA, pdvi.ID_PRODUTO, p.NOME, '+
               'pdvi.QUANTIDADE, pdvi.VALOR_UNITARIO, pdvi.VALOR_TOTAL '+
               'FROM PEDIDO_VENDA_ITENS pdvi '+
               'INNER JOIN PRODUTOS p ON (pdvi.ID_PRODUTO = p.ID) '+
               'WHERE pdvi.ID_PEDIDO_VENDA = :Id_Pedido_Venda AND '+
               'p.CONTROLE_ESPECIAL = ''S''');
    TFDQuery(FQuery.DataSet).ParamByName('Id_Pedido_Venda').AsInteger := IdPedidoVenda;
    FQuery.DataSet.Active := True;

    DataSource.DataSet := FQuery.DataSet;

    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      raise;
    end;
  end;
end;

function TPedidoVendaItemDAO.BuscarPorIdPedidoVenda(IdPedidoVenda: Integer): TList<iPedidoVendaItem>;
var
  PedidoVendaItem: iPedidoVendaItem;
begin
  Result := TList<iPedidoVendaItem>.Create;

  try
    FQuery.SQL(
      'SELECT ID_PRODUTO, QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL ' +
      'FROM PEDIDO_VENDA_ITENS WHERE ID_PEDIDO_VENDA = :Id_Pedido_Venda');

    TFDQuery(FQuery.DataSet).ParamByName('Id_Pedido_Venda').AsInteger := IdPedidoVenda;
    FQuery.DataSet.Active := True;

    while not FQuery.DataSet.Eof do
    begin
      PedidoVendaItem := TModelPedidoVendaItem.New;
      PedidoVendaItem.IdProduto(FQuery.DataSet.FieldByName('ID_PRODUTO').AsInteger);
      PedidoVendaItem.Quantidade(FQuery.DataSet.FieldByName('QUANTIDADE').AsCurrency);
      PedidoVendaItem.ValorUnitario(FQuery.DataSet.FieldByName('VALOR_UNITARIO').AsCurrency);
      PedidoVendaItem.ValorTotal(FQuery.DataSet.FieldByName('VALOR_TOTAL').AsCurrency);

      Result.Add(PedidoVendaItem);
      FQuery.DataSet.Next;
    end;
  except
    on E: Exception do
    begin
      Result.Free;
      raise;
    end;
  end;
end;

end.

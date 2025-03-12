unit uDAO.PedidoVenda;

interface

uses
  uDAO.PedidoVenda.Interfaces, uConexao.Query.Interfaces, uModel.PedidoVenda.Interfaces,
  Data.DB, uModel.PedidoVenda;

type
  TPedidoVendaDAO = class (TInterfacedObject, iPedidoVendaDAO)
  private
    FQuery: iQuery;
  public
    constructor Create;
    class function New: TPedidoVendaDAO;
    function Inserir(PedidoVenda: iPedidoVenda): Integer;
    function Listar(DataSource: TDataSource): Boolean;
    function ListarPedidosAguardandoReceita(DataSource: TDataSource; Filtro: String): Boolean;
    function BuscarPorId(Id: Integer): iPedidoVenda;
    function Assinar(Id, IdTecnico: Integer): Boolean;
  end;

implementation

uses
  uConexao.Query.Firedac, FireDAC.Comp.Client, System.SysUtils;

constructor TPedidoVendaDAO.Create;
begin
  FQuery := TModelQueryFiredac.New(nil);
end;

class function TPedidoVendaDAO.New: TPedidoVendaDAO;
begin
  Result := Self.Create;
end;

function TPedidoVendaDAO.Inserir(PedidoVenda: iPedidoVenda): Integer;
begin
  try
    FQuery.SQL('INSERT INTO PEDIDOS_VENDAS (ID, DATA_PEDIDO, STATUS, ID_CLIENTE, '+
               'VALOR_TOTAL, EXCLUIDO) VALUES (GEN_ID(GEN_PEDIDOS_VENDAS_ID, 1), '+
               ':Data_Pedido, :Status, :Id_Cliente, :Valor_Total, :Excluido) '+
               'RETURNING ID');

    with TFDQuery(FQuery.DataSet) do
    begin
      ParamByName('Data_Pedido').AsDateTime := PedidoVenda.DataPedido;
      ParamByName('Status').AsInteger := PedidoVenda.Status;
      ParamByName('Id_Cliente').AsInteger := PedidoVenda.IdCliente;
      ParamByName('Valor_Total').AsCurrency := PedidoVenda.ValorTotal;
      ParamByName('Excluido').AsString := 'N';
    end;

    FQuery.DataSet.Open;
    Result := FQuery.DataSet.FieldByName('ID').AsInteger;
  except
    on E: Exception do
    begin
      Result := 0;
      raise;
    end;
  end;
end;

function TPedidoVendaDAO.Listar(DataSource: TDataSource): Boolean;
begin
  try
    FQuery.SQL('SELECT '+
               'pdv.ID, pdv.DATA_PEDIDO, '+
               'CASE pdv.STATUS '+
               '  WHEN 1 THEN ''CONCLUÍDO'' '+
               '  ELSE ''AGUARDANDO RECEITA'' '+
               'END AS STATUS, '+
               'pdv.ID_CLIENTE, c.NOME, pdv.VALOR_TOTAL '+
               'FROM PEDIDOS_VENDAS pdv '+
               'INNER JOIN CLIENTES c ON (pdv.ID_CLIENTE = c.ID) '+
               'WHERE pdv.EXCLUIDO = ''N''');
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

function TPedidoVendaDAO.ListarPedidosAguardandoReceita(DataSource: TDataSource;
  Filtro: string): Boolean;
var
  Query: String;
begin
  try
    Query := 'SELECT '+
             'pdv.ID, pdv.DATA_PEDIDO, '+
             'CASE pdv.STATUS '+
             '  WHEN 1 THEN ''CONCLUÍDO'' '+
             '  ELSE ''AGUARDANDO RECEITA'' '+
             'END AS STATUS, '+
             'pdv.ID_CLIENTE, c.NOME, pdv.VALOR_TOTAL '+
             'FROM PEDIDOS_VENDAS pdv '+
             'INNER JOIN CLIENTES c ON (pdv.ID_CLIENTE = c.ID) '+
             'WHERE pdv.EXCLUIDO = ''N'' AND pdv.STATUS = 2';

    if Filtro <> '' then
      Query := Query + Filtro;

    FQuery.SQL(Query);
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

function TPedidoVendaDAO.BuscarPorId(Id: Integer): iPedidoVenda;
begin
  Result := nil;
  try
    FQuery.SQL('SELECT ID, DATA_PEDIDO, STATUS, ID_CLIENTE, ID_TECNICO_RESPONSAVEL, VALOR_TOTAL, EXCLUIDO ' +
               'FROM PEDIDOS_VENDAS WHERE ID = :ID');
    TFDQuery(FQuery.DataSet).ParamByName('ID').AsInteger := Id;
    FQuery.DataSet.Open;

    if not FQuery.DataSet.IsEmpty then
    begin
      Result := TModelPedidoVenda.New;
      Result.ID(FQuery.DataSet.FieldByName('ID').AsInteger);
      Result.DataPedido(FQuery.DataSet.FieldByName('DATA_PEDIDO').AsDateTime);
      Result.Status(FQuery.DataSet.FieldByName('STATUS').AsInteger);
      Result.IdCliente(FQuery.DataSet.FieldByName('ID_CLIENTE').AsInteger);
      Result.IdTecnicoResponsavel(FQuery.DataSet.FieldByName('ID_TECNICO_RESPONSAVEL').AsInteger);
      Result.ValorTotal(FQuery.DataSet.FieldByName('VALOR_TOTAL').AsCurrency);
      Result.Excluido(FQuery.DataSet.FieldByName('EXCLUIDO').AsString);
    end;
  except
    on E: Exception do
      raise Exception.Create('Erro ao buscar produto: ' + E.Message);
  end;
end;

function TPedidoVendaDAO.Assinar(Id, IdTecnico: Integer): Boolean;
begin
  try
    FQuery.SQL('UPDATE PEDIDOS_VENDAS SET STATUS = 1, '+
               'ID_TECNICO_RESPONSAVEL = :ID_TECNICO WHERE ID = :ID');
    TFDQuery(FQuery.DataSet).ParamByName('ID').AsInteger := Id;
    TFDQuery(FQuery.DataSet).ParamByName('ID_TECNICO').AsInteger := IdTecnico;

    Result := FQuery.ExecSQL;
  except
    on E: Exception do
    begin
      Result := False;
      raise;
    end;
  end;
end;

end.

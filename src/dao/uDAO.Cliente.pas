unit uDAO.Cliente;

interface

uses
  uDAO.Cliente.Interfaces, uConexao.Query.Interfaces, uModel.Cliente.Interfaces,
  Data.DB, uModel.Cliente;

type
  TClienteDAO = class (TInterfacedObject, iClienteDAO)
  private
    FQuery: iQuery;
  public
    constructor Create;
    class function New: TClienteDAO;
    function Inserir(Cliente: iCliente): Boolean;
    function Atualizar(Cliente: iCliente): Boolean;
    function Deletar(Id: Integer): Boolean;
    function Listar(DataSource: TDataSource): Boolean;
    function BuscarPorId(Id: Integer): iCliente;
    function BuscarPorCPF(CPF: String): iCliente;
  end;

implementation

uses
  uConexao.Query.Firedac, FireDAC.Comp.Client, System.SysUtils;

constructor TClienteDAO.Create;
begin
  FQuery := TModelQueryFiredac.New(nil);
end;

class function TClienteDAO.New: TClienteDAO;
begin
  Result := Self.Create;
end;

function TClienteDAO.Inserir(Cliente: iCliente): Boolean;
begin
  try
    FQuery.SQL('INSERT INTO CLIENTES (ID, NOME, CPF, EXCLUIDO) '+
               'VALUES (GEN_ID(GEN_CLIENTES_ID, 1), :Nome, :CPF, :Excluido)');

    with TFDQuery(FQuery.DataSet) do
    begin
      ParamByName('Nome').AsString := Cliente.Nome;
      ParamByName('CPF').AsString := Cliente.CPF;
      ParamByName('Excluido').AsString := 'N';
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

function TClienteDAO.Atualizar(Cliente: iCliente): Boolean;
begin
  try
    FQuery.SQL('UPDATE CLIENTES SET NOME = :Nome, CPF = :CPF WHERE ID = :ID');

    with TFDQuery(FQuery.DataSet) do
    begin
      ParamByName('Nome').AsString := Cliente.Nome;
      ParamByName('CPF').AsString := Cliente.CPF;
      ParamByName('ID').AsInteger := Cliente.ID;
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

function TClienteDAO.Deletar(Id: Integer): Boolean;
begin
  try
    FQuery.SQL('UPDATE CLIENTES SET EXCLUIDO = :Excluido WHERE ID = :ID');

    with TFDQuery(FQuery.DataSet) do
    begin
      ParamByName('Excluido').AsString := 'S';
      ParamByName('ID').AsInteger := Id;
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

function TClienteDAO.Listar(DataSource: TDataSource): Boolean;
begin
  try
    FQuery.SQL('SELECT ID, NOME, CPF FROM CLIENTES WHERE EXCLUIDO = ''N''');
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

function TClienteDAO.BuscarPorId(Id: Integer): iCliente;
begin
  Result := nil;
  try
    FQuery.SQL('SELECT ID, NOME, CPF FROM CLIENTES WHERE ID = :ID');
    TFDQuery(FQuery.DataSet).ParamByName('ID').AsInteger := Id;
    FQuery.DataSet.Open;

    if not FQuery.DataSet.IsEmpty then
    begin
      Result := TModelCliente.New;
      Result.ID(FQuery.DataSet.FieldByName('ID').AsInteger);
      Result.Nome(FQuery.DataSet.FieldByName('NOME').AsString);
      Result.CPF(FQuery.DataSet.FieldByName('CPF').AsString);
    end;
  except
    on E: Exception do
      raise Exception.Create('Erro ao buscar cliente: ' + E.Message);
  end;
end;

function TClienteDAO.BuscarPorCPF(CPF: string): iCliente;
begin
  Result := nil;
  try
    FQuery.SQL('SELECT ID, NOME, CPF FROM CLIENTES WHERE CPF = :CPF');
    TFDQuery(FQuery.DataSet).ParamByName('CPF').AsString := CPF;
    FQuery.DataSet.Open;

    if not FQuery.DataSet.IsEmpty then
    begin
      Result := TModelCliente.New;
      Result.ID(FQuery.DataSet.FieldByName('ID').AsInteger);
      Result.Nome(FQuery.DataSet.FieldByName('NOME').AsString);
      Result.CPF(FQuery.DataSet.FieldByName('CPF').AsString);
    end;
  except
    on E: Exception do
      raise Exception.Create('Erro ao buscar cliente: ' + E.Message);
  end;
end;

end.

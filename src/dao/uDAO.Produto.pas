unit uDAO.Produto;

interface

uses
  uDAO.Produto.Interfaces, uConexao.Query.Interfaces, uModel.Produto.Interfaces,
  Data.DB, uModel.Produto;

type
  TProdutoDAO = class (TInterfacedObject, iProdutoDAO)
  private
    FQuery: iQuery;
  public
    constructor Create;
    class function New: TProdutoDAO;
    function Inserir(Produto: iProduto): Boolean;
    function Atualizar(Produto: iProduto): Boolean;
    function Deletar(Id: Integer): Boolean;
    function Listar(DataSource: TDataSource): Boolean;
    function BuscarPorId(Id: Integer): iProduto;
  end;

implementation

uses
  uConexao.Query.Firedac, FireDAC.Comp.Client, System.SysUtils;

constructor TProdutoDAO.Create;
begin
  FQuery := TModelQueryFiredac.New(nil);
end;

class function TProdutoDAO.New: TProdutoDAO;
begin
  Result := Self.Create;
end;

function TProdutoDAO.Inserir(Produto: iProduto): Boolean;
begin
  try
    FQuery.SQL('INSERT INTO PRODUTOS (ID, NOME, VALOR, CONTROLE_ESPECIAL, EXCLUIDO) '+
               'VALUES (GEN_ID(GEN_PRODUTOS_ID, 1), :Nome, :Valor, :Controle_Especial, :Excluido)');

    with TFDQuery(FQuery.DataSet) do
    begin
      ParamByName('Nome').AsString := Produto.Nome;
      ParamByName('Valor').AsCurrency := Produto.Valor;
      ParamByName('Controle_Especial').AsString := Produto.ControleEspecial;
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

function TProdutoDAO.Atualizar(Produto: iProduto): Boolean;
begin
  try
    FQuery.SQL('UPDATE PRODUTOS SET NOME = :Nome, VALOR = :Valor, ' +
      'CONTROLE_ESPECIAL = :Controle_Especial WHERE ID = :ID');

    with TFDQuery(FQuery.DataSet) do
    begin
      ParamByName('Nome').AsString := Produto.Nome;
      ParamByName('Valor').AsCurrency := Produto.Valor;
      ParamByName('Controle_Especial').AsString := Produto.ControleEspecial;
      ParamByName('ID').AsInteger := Produto.ID;
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

function TProdutoDAO.Deletar(Id: Integer): Boolean;
begin
  try
    FQuery.SQL('UPDATE PRODUTOS SET EXCLUIDO = :Excluido WHERE ID = :ID');

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

function TProdutoDAO.Listar(DataSource: TDataSource): Boolean;
begin
  try
    FQuery.SQL('SELECT ID, NOME, VALOR, CONTROLE_ESPECIAL FROM PRODUTOS WHERE EXCLUIDO = ''N''');
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

function TProdutoDAO.BuscarPorId(Id: Integer): iProduto;
begin
  Result := nil;
  try
    FQuery.SQL('SELECT ID, NOME, VALOR, CONTROLE_ESPECIAL FROM PRODUTOS WHERE ID = :ID');
    TFDQuery(FQuery.DataSet).ParamByName('ID').AsInteger := Id;
    FQuery.DataSet.Open;

    if not FQuery.DataSet.IsEmpty then
    begin
      Result := TModelProduto.New;
      Result.ID(FQuery.DataSet.FieldByName('ID').AsInteger);
      Result.Nome(FQuery.DataSet.FieldByName('NOME').AsString);
      Result.Valor(FQuery.DataSet.FieldByName('VALOR').AsCurrency);
      Result.ControleEspecial(FQuery.DataSet.FieldByName('CONTROLE_ESPECIAL').AsString);
    end;
  except
    on E: Exception do
      raise Exception.Create('Erro ao buscar produto: ' + E.Message);
  end;
end;

end.

unit uDAO.TecnicoAgricola;

interface

uses
  uDAO.TecnicoAgricola.Interfaces, uConexao.Query.Interfaces, uModel.TecnicoAgricola.Interfaces,
  Data.DB, uModel.TecnicoAgricola;

type
  TTecnicoAgricolaDAO = class (TInterfacedObject, iTecnicoAgricolaDAO)
  private
    FQuery: iQuery;
  public
    constructor Create;
    class function New: TTecnicoAgricolaDAO;
    function Listar(DataSource: TDataSource): Boolean;
    function BuscarPorId(Id: Integer): iTecnicoAgricola;
  end;

implementation

uses
  uConexao.Query.Firedac, FireDAC.Comp.Client, System.SysUtils;

constructor TTecnicoAgricolaDAO.Create;
begin
  FQuery := TModelQueryFiredac.New(nil);
end;

class function TTecnicoAgricolaDAO.New: TTecnicoAgricolaDAO;
begin
  Result := Self.Create;
end;

function TTecnicoAgricolaDAO.Listar(DataSource: TDataSource): Boolean;
begin
  try
    FQuery.SQL('SELECT ID, NOME, CPF, NUMERO_REGISTRO FROM TECNICOS_AGRICOLAS WHERE EXCLUIDO = ''N''');
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

function TTecnicoAgricolaDAO.BuscarPorId(Id: Integer): iTecnicoAgricola;
begin
  Result := nil;
  try
    FQuery.SQL('SELECT ID, NOME, CPF, NUMERO_REGISTRO FROM TECNICOS_AGRICOLAS WHERE ID = :ID');
    TFDQuery(FQuery.DataSet).ParamByName('ID').AsInteger := Id;
    FQuery.DataSet.Open;

    if not FQuery.DataSet.IsEmpty then
    begin
      Result := TModelTecnicoAgricola.New;
      Result.ID(FQuery.DataSet.FieldByName('ID').AsInteger);
      Result.Nome(FQuery.DataSet.FieldByName('NOME').AsString);
      Result.CPF(FQuery.DataSet.FieldByName('CPF').AsString);
      Result.NumeroRegistro(FQuery.DataSet.FieldByName('NUMERO_REGISTRO').AsString);
    end;
  except
    on E: Exception do
      raise Exception.Create('Erro ao buscar técnico agrícola: ' + E.Message);
  end;
end;

end.

unit uController.TecnicoAgricola;

interface

uses
  uModel.TecnicoAgricola.Interfaces, uDAO.TecnicoAgricola.Interfaces, uDAO.TecnicoAgricola,
  uController.TecnicoAgricola.Interfaces, Data.DB;

type
  TTecnicoAgricolaController = class (TInterfacedObject, iTecnicoAgricolaController)
  private
    FTecnicoAgricolaDAO: iTecnicoAgricolaDAO;
  public
    constructor Create;
    class function New: iTecnicoAgricolaController;
    function Listar(DataSource: TDataSource): Boolean;
    function BuscarPorId(Id: Integer): iTecnicoAgricola;
  end;

implementation

uses
  uModel.TecnicoAgricola, System.SysUtils;

constructor TTecnicoAgricolaController.Create;
begin
  FTecnicoAgricolaDAO := TTecnicoAgricolaDAO.New;
end;


class function TTecnicoAgricolaController.New: iTecnicoAgricolaController;
begin
  Result := Self.Create;
end;

function TTecnicoAgricolaController.Listar(DataSource: TDataSource): Boolean;
begin
  Result := FTecnicoAgricolaDAO.Listar(DataSource);
end;

function TTecnicoAgricolaController.BuscarPorId(Id: Integer): iTecnicoAgricola;
begin
  Result := FTecnicoAgricolaDAO.BuscarPorId(Id);
end;

end.


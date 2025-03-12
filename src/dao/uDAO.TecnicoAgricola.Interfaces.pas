unit uDAO.TecnicoAgricola.Interfaces;

interface

uses
  uModel.TecnicoAgricola.Interfaces, Data.DB;

type

  iTecnicoAgricolaDAO = interface
    function Listar(DataSource: TDataSource): Boolean;
    function BuscarPorId(Id: Integer): iTecnicoAgricola;
  end;

implementation

end.

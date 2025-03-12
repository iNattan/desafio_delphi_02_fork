unit uController.TecnicoAgricola.Interfaces;

interface

uses
  uModel.TecnicoAgricola.Interfaces, Data.DB;

type
  iTecnicoAgricolaController = interface
    function Listar(DataSource: TDataSource): Boolean;
    function BuscarPorId(Id: Integer): iTecnicoAgricola;
  end;

implementation

end.


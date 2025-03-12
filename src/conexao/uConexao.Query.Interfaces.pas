unit uConexao.Query.Interfaces;

interface

uses
  Data.DB;

type
  iQuery = interface
    function SQL(Value: String): iQuery;
    function ExecSQL: Boolean;
    function DataSet: TDataSet;
  end;

implementation

end.

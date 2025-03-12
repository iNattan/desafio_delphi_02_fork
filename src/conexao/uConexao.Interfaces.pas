unit uConexao.Interfaces;

interface

uses
  Data.DB;

type
  iConexao = interface
    function Connection: TCustomConnection;
  end;

implementation

end.

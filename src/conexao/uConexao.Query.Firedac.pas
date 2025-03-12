unit uConexao.Query.Firedac;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uConexao.Interfaces, uConexao.Query.Interfaces;

type
  TModelQueryFiredac = class(TInterfacedObject, iQuery)
  private
    FParent: iConexao;
    FQuery: TFDQuery;
  public
    constructor Create(Parent: iConexao);
    class function New(Parent: iConexao): iQuery;
    function SQL(Value: String): iQuery;
    function ExecSQL: Boolean;
    function DataSet: TDataSet;
  end;

implementation

uses
  System.SysUtils, uConexao.Firedac;

constructor TModelQueryFiredac.Create(Parent: iConexao);
begin
  FParent := Parent;
  FQuery := TFDQuery.Create(nil);

  if not Assigned(FParent) then
    FParent := TModelConexaoFiredac.New;

  FQuery.Connection := TFDConnection(FParent.Connection);
end;

function TModelQueryFiredac.DataSet: TDataSet;
begin
  Result := FQuery;
end;

class function TModelQueryFiredac.New(Parent: iConexao): iQuery;
begin
  Result := Self.Create(Parent);
end;

function TModelQueryFiredac.SQL(Value: String): iQuery;
begin
  Result := Self;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
end;

function TModelQueryFiredac.ExecSQL: Boolean;
begin
  try
    FQuery.ExecSQL;
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      raise;
    end;
  end;
end;

end.


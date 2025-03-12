unit frmView.Cliente.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmView.TelaPadrao.Pesquisa, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  uController.Cliente.Interfaces, Datasnap.DBClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmViewClientePesquisa = class(TfrmViewTelaPadraoPesquisa)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewClientePesquisa: TfrmViewClientePesquisa;

implementation

uses
  uController.Cliente;

{$R *.dfm}

procedure TfrmViewClientePesquisa.FormCreate(Sender: TObject);
var
  ClienteController: iClienteController;
begin
  inherited;
  ClienteController := TClienteController.New;
  ClienteController.Listar(DataSource_Padrao);
end;


end.

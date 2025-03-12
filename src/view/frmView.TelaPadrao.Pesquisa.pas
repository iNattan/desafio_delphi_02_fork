unit frmView.TelaPadrao.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmViewTelaPadraoPesquisa = class(TForm)
    Pnl_Superior: TPanel;
    Lbl_Titulo: TLabel;
    Pnl_Inferior: TPanel;
    Btn_Confirmar: TButton;
    Btn_Cancelar: TButton;
    Pnl_Central: TPanel;
    DataSource_Padrao: TDataSource;
    DBGrid1: TDBGrid;
    procedure Btn_CancelarClick(Sender: TObject);
    procedure Btn_ConfirmarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FId: Integer;
    { Private declarations }
  public
    { Public declarations }
    procedure Cancelar;
    procedure Confirmar;
    procedure SetId(Id: Integer);
    function GetId: Integer;
  end;

var
  frmViewTelaPadraoPesquisa: TfrmViewTelaPadraoPesquisa;

implementation


{$R *.dfm}

procedure TfrmViewTelaPadraoPesquisa.Btn_ConfirmarClick(Sender: TObject);
begin
  Confirmar;
end;

procedure TfrmViewTelaPadraoPesquisa.Cancelar;
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmViewTelaPadraoPesquisa.Confirmar;
begin
  SetId(DataSource_Padrao.DataSet.FieldByName('ID').AsInteger);
  ModalResult := mrOk;
end;

procedure TfrmViewTelaPadraoPesquisa.DBGrid1DblClick(Sender: TObject);
begin
  Confirmar;
end;

procedure TfrmViewTelaPadraoPesquisa.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Confirmar;
end;

procedure TfrmViewTelaPadraoPesquisa.SetId(Id: Integer);
begin
  FId := Id;
end;

function TfrmViewTelaPadraoPesquisa.GetId: Integer;
begin
  Result := FId;
end;

procedure TfrmViewTelaPadraoPesquisa.Btn_CancelarClick(Sender: TObject);
begin
  Cancelar;
end;

end.

unit frmView.SolicitacaoReceita;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList,
  uController.PedidoVenda.Interfaces, uController.PedidoVendaItem.Interfaces,
  Vcl.ComCtrls, uController.Cliente.Interfaces, Vcl.Mask,
  uController.TecnicoAgricola.Interfaces;

type
  TfrmViewSolicitacaoReceita = class(TForm)
    Pnl_Central: TPanel;
    Pnl_Inferior: TPanel;
    Btn_Gravar: TButton;
    Btn_Cancelar: TButton;
    Btn_Assinar: TButton;
    Pnl_Superior: TPanel;
    Lbl_Titulo: TLabel;
    Pnl_Tecnico: TPanel;
    Pnl_Filtro: TPanel;
    Pnl_Grids: TPanel;
    GroupBox_PedidoItens: TGroupBox;
    DBGrid_PedidoItens: TDBGrid;
    GroupBox_Pedidos: TGroupBox;
    DBGrid_Pedidos: TDBGrid;
    Lbl_Produto: TLabel;
    BtnEdt_TecnicoResponsavel: TButtonedEdit;
    Edt_NomeTecnicoResponsavel: TEdit;
    ImageList1: TImageList;
    DS_Pedidos: TDataSource;
    DS_PedidoItens: TDataSource;
    GroupBox_Filtros: TGroupBox;
    Btn_LimparFiltro: TButton;
    Btn_Pesquisar: TButton;
    Edt_IdPedido: TEdit;
    Lbl_IdPedido: TLabel;
    Lbl_DataPedido: TLabel;
    BtnEdt_ClientePedido: TButtonedEdit;
    Edt_NomeClientePedido: TEdit;
    Lbl_ClientePedido: TLabel;
    Edt_DataPedido: TMaskEdit;
    procedure Btn_LimparFiltroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DS_PedidosDataChange(Sender: TObject; Field: TField);
    procedure Btn_PesquisarClick(Sender: TObject);
    procedure BtnEdt_ClientePedidoChange(Sender: TObject);
    procedure BtnEdt_ClientePedidoExit(Sender: TObject);
    procedure BtnEdt_ClientePedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_AssinarClick(Sender: TObject);
    procedure BtnEdt_TecnicoResponsavelChange(Sender: TObject);
    procedure BtnEdt_TecnicoResponsavelExit(Sender: TObject);
    procedure BtnEdt_TecnicoResponsavelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnEdt_ClientePedidoRightButtonClick(Sender: TObject);
    procedure BtnEdt_TecnicoResponsavelRightButtonClick(Sender: TObject);
    procedure Btn_CancelarClick(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
  private
    { Private declarations }
    PedidoVendaController: iPedidoVendaController;
    PedidoVendaItemController: iPedidoVendaItemController;
    ClienteController: iClienteController;
    TecnicoAgricolaController: iTecnicoAgricolaController;

    procedure Pesquisar;
    procedure Assinar;
    procedure Cancelar;
    procedure Gravar;
    procedure ConsultarCliente;    
    procedure ConsultarClientePorId(IdCliente: Integer);
    procedure ConsultarTecnicoAgricola;    
    procedure ConsultarTecnicoAgricolaPorId(IdTecnico: Integer);
    procedure PopulaGridPedidos(Filtro: String);
    procedure PopulaGridPedidoItens(IdPedidoVenda: Integer);
    procedure LimpaFiltro;
    procedure HabilitaBotoesEnquantoAssina(bHabilita: Boolean);
    function ValidaCamposObrigatorios: Boolean;
  public
    { Public declarations }
  end;

var
  frmViewSolicitacaoReceita: TfrmViewSolicitacaoReceita;

implementation

uses
  uController.PedidoVenda, uController.PedidoVendaItem, 
  frmView.Cliente.Pesquisa, uModel.Cliente.Interfaces, uController.Cliente,
  frmView.TecnicoAgricola.Pesquisa, uModel.TecnicoAgricola.Interfaces,
  uController.TecnicoAgricola;

{$R *.dfm}

procedure TfrmViewSolicitacaoReceita.BtnEdt_ClientePedidoChange(
  Sender: TObject);
begin
  Edt_NomeClientePedido.Clear;
end;

procedure TfrmViewSolicitacaoReceita.BtnEdt_ClientePedidoExit(Sender: TObject);
begin
  if BtnEdt_ClientePedido.Text <> '' then
    ConsultarClientePorId(StrToInt(BtnEdt_ClientePedido.Text));
end;

procedure TfrmViewSolicitacaoReceita.BtnEdt_ClientePedidoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ConsultarCliente;
end;

procedure TfrmViewSolicitacaoReceita.BtnEdt_ClientePedidoRightButtonClick(
  Sender: TObject);
begin
  ConsultarCliente;
end;

procedure TfrmViewSolicitacaoReceita.BtnEdt_TecnicoResponsavelChange(
  Sender: TObject);
begin
  Edt_NomeTecnicoResponsavel.Clear;
end;

procedure TfrmViewSolicitacaoReceita.BtnEdt_TecnicoResponsavelExit(
  Sender: TObject);
begin
  if BtnEdt_TecnicoResponsavel.Text <> '' then
    ConsultarTecnicoAgricolaPorId(StrToInt(BtnEdt_TecnicoResponsavel.Text));
end;

procedure TfrmViewSolicitacaoReceita.BtnEdt_TecnicoResponsavelKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ConsultarTecnicoAgricola;
end;

procedure TfrmViewSolicitacaoReceita.BtnEdt_TecnicoResponsavelRightButtonClick(
  Sender: TObject);
begin
  ConsultarTecnicoAgricola;
end;

procedure TfrmViewSolicitacaoReceita.ConsultarCliente;
var
  frmClientePesquisa: TfrmViewClientePesquisa;
  IdClientePesquisado: Integer;
begin
  frmClientePesquisa := TfrmViewClientePesquisa.Create(Self);
  try
    frmClientePesquisa.ShowModal;
    if frmClientePesquisa.ModalResult = mrOk then
    begin
      IdClientePesquisado := frmClientePesquisa.GetId;
      ConsultarClientePorId(IdClientePesquisado);
    end;
  finally
    frmClientePesquisa.Free;
  end;
end;

procedure TfrmViewSolicitacaoReceita.ConsultarTecnicoAgricola;
var
  frmTecnicoAgricolaPesquisa: TfrmViewTecnicoAgricolaPesquisa;
  IdTecnicoPesquisado: Integer;
begin
  frmTecnicoAgricolaPesquisa := TfrmViewTecnicoAgricolaPesquisa.Create(Self);
  try
    frmTecnicoAgricolaPesquisa.ShowModal;
    if frmTecnicoAgricolaPesquisa.ModalResult = mrOk then
    begin
      IdTecnicoPesquisado := frmTecnicoAgricolaPesquisa.GetId;
      ConsultarTecnicoAgricolaPorId(IdTecnicoPesquisado);
    end;
  finally
    frmTecnicoAgricolaPesquisa.Free;
  end;
end;

procedure TfrmViewSolicitacaoReceita.ConsultarClientePorId(IdCliente: Integer);
var
  ClienteObj: iCliente;
begin
  ClienteObj := ClienteController.BuscarPorId(IdCliente);

  BtnEdt_ClientePedido.Text := ClienteObj.Id.ToString;
  Edt_NomeClientePedido.Text := ClienteObj.Nome;
end;

procedure TfrmViewSolicitacaoReceita.ConsultarTecnicoAgricolaPorId(IdTecnico: Integer);
var
  TecnicoAgricolaObj: iTecnicoAgricola;
begin
  TecnicoAgricolaObj := TecnicoAgricolaController.BuscarPorId(IdTecnico);

  BtnEdt_TecnicoResponsavel.Text := TecnicoAgricolaObj.Id.ToString;
  Edt_NomeTecnicoResponsavel.Text := TecnicoAgricolaObj.Nome;
end;

procedure TfrmViewSolicitacaoReceita.Btn_AssinarClick(Sender: TObject);
begin
  Assinar;
end;

procedure TfrmViewSolicitacaoReceita.Btn_CancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmViewSolicitacaoReceita.Btn_GravarClick(Sender: TObject);
begin
  if ValidaCamposObrigatorios then
    Gravar;
end;

procedure TfrmViewSolicitacaoReceita.Gravar;
var
  Resposta: Integer;
begin
  Resposta := MessageDlg('Deseja realmente assinar esse pedido?', mtConfirmation, [mbYes, mbNo], 0);

  if Resposta = mrYes then
  begin
    try
      PedidoVendaController.Assinar(
        DBGrid_Pedidos.DataSource.DataSet.FieldByName('ID').AsInteger,
        StrToInt(BtnEdt_TecnicoResponsavel.Text)
        );
      ShowMessage('Pedido de venda assinado com sucesso!');
      Cancelar;
      Pesquisar;
    except
      on E: Exception do
        ShowMessage('Erro ao gravar: ' + E.Message);
    end;
  end;
end;

procedure TfrmViewSolicitacaoReceita.Cancelar;
begin
  DBGrid_Pedidos.Enabled := True;
  Pnl_Tecnico.Enabled := False;
  BtnEdt_TecnicoResponsavel.Text := '';
  Edt_NomeTecnicoResponsavel.Text := '';
  HabilitaBotoesEnquantoAssina(False);
end;

procedure TfrmViewSolicitacaoReceita.Assinar;
var
  IdPedidoVenda: Integer;
begin
  IdPedidoVenda := DBGrid_Pedidos.DataSource.DataSet.FieldByName('ID').AsInteger;
  if IdPedidoVenda <> 0 then
  begin
    Pnl_Tecnico.Enabled := True;
    BtnEdt_TecnicoResponsavel.SetFocus;
    HabilitaBotoesEnquantoAssina(True);
    DBGrid_Pedidos.Enabled := False;
  end;
end;

procedure TfrmViewSolicitacaoReceita.HabilitaBotoesEnquantoAssina(bHabilita: Boolean);
begin
  Btn_Cancelar.Enabled := bHabilita;
  Btn_Gravar.Enabled := bHabilita;

  Btn_Assinar.Enabled := not(bHabilita);
end;

procedure TfrmViewSolicitacaoReceita.Btn_LimparFiltroClick(Sender: TObject);
begin
  LimpaFiltro;
end;

procedure TfrmViewSolicitacaoReceita.Btn_PesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmViewSolicitacaoReceita.Pesquisar;
var
  Filtro: String;
begin
  Filtro := '';

  if Edt_IdPedido.Text <> '' then   
    Filtro := ' AND pdv.ID = ' + Edt_IdPedido.Text;

  if Edt_DataPedido.Text <> '  /  /    ' then   
    Filtro := Filtro + ' AND CAST(pdv.DATA_PEDIDO AS DATE) = CAST(''' +
      FormatDateTime('yyyy-mm-dd', StrToDate(Edt_DataPedido.Text)) + ''' AS DATE)';

  if BtnEdt_ClientePedido.Text <> '' then   
    Filtro := Filtro + ' AND pdv.ID_CLIENTE = ' + BtnEdt_ClientePedido.Text;
    
  PopulaGridPedidos(Filtro);
end;

procedure TfrmViewSolicitacaoReceita.DS_PedidosDataChange(Sender: TObject;
  Field: TField);
begin
  PopulaGridPedidoItens(DS_Pedidos.DataSet.FieldByName('ID').AsInteger);
end;

procedure TfrmViewSolicitacaoReceita.FormCreate(Sender: TObject);
begin
  PedidoVendaController := TPedidoVendaController.New;
  PedidoVendaItemController := TPedidoVendaItemController.New;
  ClienteController := TClienteController.New;
  TecnicoAgricolaController := TTecnicoAgricolaController.New;

  PopulaGridPedidos('');
end;

procedure TfrmViewSolicitacaoReceita.PopulaGridPedidos(Filtro: String);
begin
  PedidoVendaController.ListarPedidosAguardandoReceita(DS_Pedidos, Filtro);
end;

procedure TfrmViewSolicitacaoReceita.PopulaGridPedidoItens(IdPedidoVenda: Integer);
begin
  PedidoVendaItemController.ListarItensControleEspecialPorIdPedidoVenda(
    DS_PedidoItens, IdPedidoVenda
  );
end;

procedure TfrmViewSolicitacaoReceita.LimpaFiltro;
begin
  Edt_IdPedido.Text := '';
  Edt_DataPedido.Text := '  /  /    ';
  BtnEdt_ClientePedido.Text := '';
  Edt_NomeClientePedido.Text := '';
end;

function TfrmViewSolicitacaoReceita.ValidaCamposObrigatorios: Boolean;
begin
  Result := True;

  if BtnEdt_TecnicoResponsavel.Text  = '' then
  begin
    ShowMessage('Técnico Responsável é obrigatório!');
    Result := False;
    Exit;
  end;
end;

end.

unit frmView.PedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmView.TelaPadrao.Cadastro,
  Vcl.StdCtrls, Vcl.ExtCtrls, uController.Cliente.Interfaces, System.ImageList,
  Vcl.ImgList, uController.Produto.Interfaces, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, uController.PedidoVenda.Interfaces, System.Classes,
  System.Generics.Collections, uUtils;

type
  TfrmViewPedidoVenda = class(TfrmViewTelaPadraoCadastro)
    Edt_ID: TEdit;
    Lbl_ID: TLabel;
    Lbl_Data_Pedido: TLabel;
    Edt_Data_Pedido: TEdit;
    Lbl_Status: TLabel;
    Edt_Status: TEdit;
    BtnEdt_Cliente: TButtonedEdit;
    Lbl_Cliente: TLabel;
    Edt_NomeCliente: TEdit;
    GroupBox_Itens: TGroupBox;
    Pnl_ItemCampos: TPanel;
    Pnl_ItemBotoes: TPanel;
    Btn_ItemInserir: TButton;
    Btn_ItemEditar: TButton;
    Btn_ItemDeletar: TButton;
    ImageList1: TImageList;
    BtnEdt_Produto: TButtonedEdit;
    Lbl_Produto: TLabel;
    Edt_NomeProduto: TEdit;
    Lbl_ValorUnitarioItem: TLabel;
    Edt_ValorUnitarioItem: TEdit;
    Lbl_QuantidadeItem: TLabel;
    Edt_QuantidadeItem: TEdit;
    Edt_ValorTotalItem: TEdit;
    Lbl_ValorTotalItem: TLabel;
    Btn_ItemGravar: TButton;
    StringGrid1: TStringGrid;
    Btn_ItemLimpar: TButton;
    Lbl_ValorTotal: TLabel;
    Edt_ValorTotal: TEdit;
    procedure BtnEdt_ClienteRightButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_InserirClick(Sender: TObject);
    procedure BtnEdt_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnEdt_PrdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnEdt_ProdutoRightButtonClick(Sender: TObject);
    procedure Btn_ItemInserirClick(Sender: TObject);
    procedure Edt_QuantidadeItemExit(Sender: TObject);
    procedure Btn_ItemGravarClick(Sender: TObject);
    procedure Btn_ItemLimparClick(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure Btn_ItemEditarClick(Sender: TObject);
    procedure Btn_ItemDeletarClick(Sender: TObject);
    procedure Btn_LimparClick(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
    procedure BtnEdt_ClienteChange(Sender: TObject);
    procedure BtnEdt_ProdutoChange(Sender: TObject);
    procedure BtnEdt_ClienteExit(Sender: TObject);
    procedure BtnEdt_ProdutoExit(Sender: TObject);
    procedure Btn_ConsultarClick(Sender: TObject);
    procedure Edt_QuantidadeItemKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    ClienteController: iClienteController;
    ProdutoController: iProdutoController;
    PedidoVendaController: iPedidoVendaController;
    FSelectedRow: Integer;

    procedure Inserir;
    procedure Gravar;
    procedure Consultar;
    procedure ConsultarPorId(Id: Integer);
    procedure InserirItem;
    procedure EditarItem;
    procedure DeletarItem;
    procedure GravarItem;
    procedure ConsultarCliente;
    procedure ConsultarClientePorId(IdCliente: Integer);
    procedure ConsultarProduto;
    procedure ConsultarProdutoPorId(IdProduto: Integer);
    function ValidaCamposObrigatorios: Boolean;
    function ValidaCamposObrigatoriosItem: Boolean;
    procedure LimpaTela;
    procedure LimpaCamposItem;
    procedure CalculaTotalItem;
    procedure CalculaTotalPedido;
    procedure CriaCamposGrid;
    procedure HabilitaEdicaoItem(bHabilita: Boolean);
  public
    { Public declarations }
  end;

var
  frmViewPedidoVenda: TfrmViewPedidoVenda;

implementation

uses
  frmView.Cliente.Pesquisa, uModel.Cliente.Interfaces, uController.Cliente,
  frmView.Produto.Pesquisa, uModel.Produto.Interfaces, uController.Produto,
  uModel.PedidoVenda.Interfaces, uController.PedidoVenda,
  uModel.PedidoVendaItem.Interfaces, uModel.PedidoVenda, uModel.PedidoVendaItem,
  frmView.PedidoVenda.Pesquisa, uDTO.PedidoVenda.Interfaces;

procedure TfrmViewPedidoVenda.Inserir;
begin
  LimpaTela;
  HabilitaEdicao(True);
  HabilitaBotoesEnquantoEdita(True);
  SetAcao(aInserir);

  Edt_Data_Pedido.Text := DateTimeToStr(Now);
  Edt_Status.Text := 'Em Andamento';
  Edt_ValorTotal.Text := FormatarMoeda('0');
  BtnEdt_Cliente.SetFocus;
end;

procedure TfrmViewPedidoVenda.Gravar;
var
  Pedido: iPedidoVenda;
  Itens: TList<iPedidoVendaItem>;
  Item: iPedidoVendaItem;
begin
  Pedido := TModelPedidoVenda.New;

  Pedido
    .DataPedido(Now)
    .IdCliente(StrToInt(BtnEdt_Cliente.Text))
    .ValorTotal(StrToCurr(Edt_ValorTotal.Text));


  Itens := TList<iPedidoVendaItem>.Create;

  for var i := 1 to StringGrid1.RowCount - 1 do
  begin
    Item := TModelPedidoVendaItem.New;
    Item.IdProduto(StrToInt(StringGrid1.Cells[0, i]))
        .Quantidade(StrToCurr(StringGrid1.Cells[2, i]))
        .ValorUnitario(StrToCurr(StringGrid1.Cells[3, i]))
        .ValorTotal(StrToCurr(StringGrid1.Cells[4, i]));

    Itens.Add(Item);
  end;

  PedidoVendaController.NovoPedidoVenda
    .PedidoVenda(Pedido)
    .PedidoVendaItems(Itens);
  try
    PedidoVendaController.Inserir;
    ShowMessage('Pedido cadastrado com sucesso!');

    LimpaTela;
  except
    on E: Exception do
      ShowMessage('Erro ao gravar: ' + E.Message);
  end;
end;

procedure TfrmViewPedidoVenda.Consultar;
var
  frmPedidoVendaPesquisa: TfrmViewPedidoVendaPesquisa;
  IdPesquisado: Integer;
begin
  frmPedidoVendaPesquisa := TfrmViewPedidoVendaPesquisa.Create(Self);
  try
    frmPedidoVendaPesquisa.ShowModal;
    if frmPedidoVendaPesquisa.ModalResult = mrOk then
    begin
      IdPesquisado := frmPedidoVendaPesquisa.GetId;
      ConsultarPorId(IdPesquisado);
    end;
  finally
    frmPedidoVendaPesquisa.Free;
  end;
end;

procedure TfrmViewPedidoVenda.ConsultarPorId(Id: Integer);
var
  DTOPedidoVendaObj: iDTOPedidoVenda;
  PedidoVendaItem: iPedidoVendaItem;
  ProdutoObj: iProduto;
  RowIndex: Integer;
  NomeProduto: String;
begin
  DTOPedidoVendaObj := PedidoVendaController.BuscarPorId(Id);

  Edt_ID.Text := DTOPedidoVendaObj.PedidoVenda.Id.ToString;
  Edt_Data_Pedido.Text := DateTimeToStr(DTOPedidoVendaObj.PedidoVenda.DataPedido);
  if DTOPedidoVendaObj.PedidoVenda.Status = 1 then
    Edt_Status.Text := 'Concluído'
  else
    Edt_Status.Text := 'Aguardando Receita';
  Edt_ValorTotal.Text := FormatarMoeda(CurrToStr(DTOPedidoVendaObj.PedidoVenda.ValorTotal));
  BtnEdt_Cliente.Text := IntToStr(DTOPedidoVendaObj.PedidoVenda.IdCliente);
  ConsultarClientePorId(DTOPedidoVendaObj.PedidoVenda.IdCliente);

  RowIndex := 1;
  for PedidoVendaItem in DTOPedidoVendaObj.PedidoVendaItems do
  begin
    ProdutoObj := ProdutoController.BuscarPorId(PedidoVendaItem.IdProduto);
    NomeProduto := ProdutoObj.Nome;

    StringGrid1.RowCount := RowIndex + 1;

    StringGrid1.Cells[0, RowIndex] := PedidoVendaItem.IdProduto.ToString;
    StringGrid1.Cells[1, RowIndex] := NomeProduto;
    StringGrid1.Cells[2, RowIndex] := CurrToStr(PedidoVendaItem.Quantidade);
    StringGrid1.Cells[3, RowIndex] := CurrToStr(PedidoVendaItem.ValorUnitario);
    StringGrid1.Cells[4, RowIndex] := CurrToStr(PedidoVendaItem.ValorTotal);
    Inc(RowIndex);
  end;

  Btn_Limpar.Enabled := True;
end;

procedure TfrmViewPedidoVenda.InserirItem;
begin
  LimpaCamposItem;
  HabilitaEdicaoItem(True);
  BtnEdt_Produto.SetFocus;
  FSelectedRow := -1;
end;

procedure TfrmViewPedidoVenda.EditarItem;
begin
  if FSelectedRow > 0 then
  begin
    BtnEdt_Produto.Text := StringGrid1.Cells[0, FSelectedRow];
    Edt_NomeProduto.Text := StringGrid1.Cells[1, FSelectedRow];
    Edt_QuantidadeItem.Text := FormatarMoeda(StringGrid1.Cells[2, FSelectedRow]);
    Edt_ValorUnitarioItem.Text := FormatarMoeda(StringGrid1.Cells[3, FSelectedRow]);
    Edt_ValorTotalItem.Text := FormatarMoeda(StringGrid1.Cells[4, FSelectedRow]);

    HabilitaEdicaoItem(True);
    BtnEdt_Produto.SetFocus;
  end;
end;

procedure TfrmViewPedidoVenda.DeletarItem;
begin
  if FSelectedRow > 0 then
  begin
    if MessageDlg('Tem certeza que deseja excluir este item?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      for var i := FSelectedRow to StringGrid1.RowCount - 2 do
        StringGrid1.Rows[i] := StringGrid1.Rows[i + 1];

      StringGrid1.RowCount := StringGrid1.RowCount - 1;

      if StringGrid1.RowCount > 1 then
        StringGrid1.Row := FSelectedRow
      else
        StringGrid1.Row := 0;

      FSelectedRow := -1;
      CalculaTotalPedido;
    end;
  end;
end;

procedure TfrmViewPedidoVenda.GravarItem;
var
  NovaLinha: Integer;
begin
  if FSelectedRow > 0 then
  begin
    StringGrid1.Cells[0, FSelectedRow] := BtnEdt_Produto.Text;
    StringGrid1.Cells[1, FSelectedRow] := Edt_NomeProduto.Text;
    StringGrid1.Cells[2, FSelectedRow] := Edt_QuantidadeItem.Text;
    StringGrid1.Cells[3, FSelectedRow] := Edt_ValorUnitarioItem.Text;
    StringGrid1.Cells[4, FSelectedRow] := Edt_ValorTotalItem.Text;
  end
  else
  begin
    NovaLinha := StringGrid1.RowCount;
    StringGrid1.RowCount := NovaLinha + 1;

    StringGrid1.Cells[0, NovaLinha] := BtnEdt_Produto.Text;
    StringGrid1.Cells[1, NovaLinha] := Edt_NomeProduto.Text;
    StringGrid1.Cells[2, NovaLinha] := Edt_QuantidadeItem.Text;
    StringGrid1.Cells[3, NovaLinha] := Edt_ValorUnitarioItem.Text;
    StringGrid1.Cells[4, NovaLinha] := Edt_ValorTotalItem.Text;
  end;

  LimpaCamposItem;
  CalculaTotalPedido;
end;

procedure TfrmViewPedidoVenda.BtnEdt_ClienteChange(Sender: TObject);
begin
  inherited;
  Edt_NomeCliente.Clear;
end;

procedure TfrmViewPedidoVenda.BtnEdt_ClienteExit(Sender: TObject);
begin
  inherited;
  if BtnEdt_Cliente.Text <> '' then
    ConsultarClientePorId(StrToInt(BtnEdt_Cliente.Text));
end;

procedure TfrmViewPedidoVenda.BtnEdt_ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    ConsultarCliente;
end;

procedure TfrmViewPedidoVenda.BtnEdt_ClienteRightButtonClick(Sender: TObject);
begin
  inherited;
  ConsultarCliente;
end;

procedure TfrmViewPedidoVenda.BtnEdt_PrdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    ConsultarProduto;
end;

procedure TfrmViewPedidoVenda.BtnEdt_ProdutoChange(Sender: TObject);
begin
  inherited;
  Edt_NomeProduto.Clear;
end;

procedure TfrmViewPedidoVenda.BtnEdt_ProdutoExit(Sender: TObject);
begin
  inherited;
  if BtnEdt_Produto.Text <> '' then
    ConsultarProdutoPorId(StrToInt(BtnEdt_Produto.Text));
end;

procedure TfrmViewPedidoVenda.BtnEdt_ProdutoRightButtonClick(Sender: TObject);
begin
  inherited;
  ConsultarProduto;
end;

procedure TfrmViewPedidoVenda.Btn_ConsultarClick(Sender: TObject);
begin
  inherited;
  Consultar;
end;

procedure TfrmViewPedidoVenda.Btn_GravarClick(Sender: TObject);
begin
  inherited;
  if ValidaCamposObrigatorios then
    Gravar;
end;

procedure TfrmViewPedidoVenda.Btn_InserirClick(Sender: TObject);
begin
  inherited;
  Inserir;
end;

procedure TfrmViewPedidoVenda.Btn_ItemInserirClick(Sender: TObject);
begin
  inherited;
  InserirItem;
end;

procedure TfrmViewPedidoVenda.Btn_ItemLimparClick(Sender: TObject);
begin
  inherited;
  LimpaCamposItem;
end;

procedure TfrmViewPedidoVenda.Btn_LimparClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;

procedure TfrmViewPedidoVenda.Btn_ItemDeletarClick(Sender: TObject);
begin
  inherited;
  DeletarItem;
end;

procedure TfrmViewPedidoVenda.Btn_ItemEditarClick(Sender: TObject);
begin
  inherited;
  EditarItem;
end;

procedure TfrmViewPedidoVenda.Btn_ItemGravarClick(Sender: TObject);
begin
  inherited;
  if ValidaCamposObrigatoriosItem then
    GravarItem;
end;

procedure TfrmViewPedidoVenda.ConsultarCliente;
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

procedure TfrmViewPedidoVenda.ConsultarProduto;
var
  frmProdutoPesquisa: TfrmViewProdutoPesquisa;
  IdProdutoPesquisado: Integer;
begin
  frmProdutoPesquisa := TfrmViewProdutoPesquisa.Create(Self);
  try
    frmProdutoPesquisa.ShowModal;
    if frmProdutoPesquisa.ModalResult = mrOk then
    begin
      IdProdutoPesquisado := frmProdutoPesquisa.GetId;
      ConsultarProdutoPorId(IdProdutoPesquisado);
    end;
  finally
    frmProdutoPesquisa.Free;
  end;
end;

procedure TfrmViewPedidoVenda.ConsultarClientePorId(IdCliente: Integer);
var
  ClienteObj: iCliente;
begin
  ClienteObj := ClienteController.BuscarPorId(IdCliente);

  BtnEdt_Cliente.Text := ClienteObj.Id.ToString;
  Edt_NomeCliente.Text := ClienteObj.Nome;
end;

procedure TfrmViewPedidoVenda.ConsultarProdutoPorId(IdProduto: Integer);
var
  ProdutoObj: iProduto;
begin
  ProdutoObj := ProdutoController.BuscarPorId(IdProduto);

  BtnEdt_Produto.Text := ProdutoObj.Id.ToString;
  Edt_NomeProduto.Text := ProdutoObj.Nome;
  Edt_ValorUnitarioItem.Text := FormatarMoeda(CurrToStr(ProdutoObj.Valor));
  Edt_QuantidadeItem.Text := FormatarMoeda('0');
  Edt_ValorTotalItem.Text := FormatarMoeda('0');
end;

procedure TfrmViewPedidoVenda.Edt_QuantidadeItemExit(Sender: TObject);
begin
  inherited;
  Edt_QuantidadeItem.Text := FormatarMoeda(Edt_QuantidadeItem.Text);

  CalculaTotalItem;
end;

procedure TfrmViewPedidoVenda.Edt_QuantidadeItemKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ApenasNumerosComPonto(Sender, Key);
end;

procedure TfrmViewPedidoVenda.FormCreate(Sender: TObject);
begin
  inherited;
  CriaCamposGrid;

  ClienteController := TClienteController.New;
  ProdutoController := TProdutoController.New;
  PedidoVendaController := TPedidoVendaController.New;
end;

procedure TfrmViewPedidoVenda.CalculaTotalItem;
var
  Quantidade, Unitario, Total: Currency;
begin
  Quantidade := StringParaMoeda(Edt_QuantidadeItem.Text);
  Unitario := StringParaMoeda(Edt_ValorUnitarioItem.Text);
  Total := Quantidade * Unitario;

  Edt_ValorTotalItem.Text := FormatarMoeda(CurrToStr(Total));
end;

procedure TfrmViewPedidoVenda.CalculaTotalPedido;
var
  Total: Currency;
begin
  Total := 0;

  for var i := 1 to StringGrid1.RowCount - 1 do
  begin
    if (StringGrid1.Cells[1, i] <> '') and (StringGrid1.Cells[2, i] <> '') then
      Total := Total + (StrToCurr(StringGrid1.Cells[4, i]));
  end;

  Edt_ValorTotal.Text := FormatarMoeda(CurrToStr(Total));
end;

procedure TfrmViewPedidoVenda.LimpaTela;
begin
  Edt_ID.Clear;
  Edt_Data_Pedido.Clear;
  Edt_Status.Clear;
  BtnEdt_Cliente.Clear;;
  Edt_NomeCliente.Clear;
  StringGrid1.RowCount := 1;
  LimpaCamposItem;

  HabilitaEdicao(False);
  HabilitaBotoesEnquantoEdita(False);
end;

procedure TfrmViewPedidoVenda.LimpaCamposItem;
begin
  BtnEdt_Produto.Clear;
  Edt_NomeProduto.Clear;
  Edt_ValorUnitarioItem.Text := FormatarMoeda('0');
  Edt_QuantidadeItem.Text := FormatarMoeda('0');
  Edt_ValorTotalItem.Text := FormatarMoeda('0');

  HabilitaEdicaoItem(False);
end;

function TfrmViewPedidoVenda.ValidaCamposObrigatorios: Boolean;
begin
  Result := True;

  if BtnEdt_Cliente.Text  = '' then
  begin
    ShowMessage('Cliente é obrigatório!');
    Result := False;
    Exit;
  end;

  if StringGrid1.RowCount = 1 then
  begin
    ShowMessage('É obrigatório ter pelo menos um produto!');
    Result := False;
    Exit;
  end;
end;

function TfrmViewPedidoVenda.ValidaCamposObrigatoriosItem: Boolean;
begin
  Result := True;

  if BtnEdt_Produto.Text  = '' then
  begin
    ShowMessage('Produto é obrigatório!');
    Result := False;
    Exit;
  end;

  if Edt_QuantidadeItem.Text = '0' then
  begin
    ShowMessage('Quantidade do produto é obrigatória!');
    Result := False;
    Exit;
  end;
end;

procedure TfrmViewPedidoVenda.CriaCamposGrid;
begin
  StringGrid1.RowCount := 1;
  StringGrid1.ColCount := 5;

  StringGrid1.Cells[0, 0] := 'ID';
  StringGrid1.Cells[1, 0] := 'Produto';
  StringGrid1.Cells[2, 0] := 'Quantidade';
  StringGrid1.Cells[3, 0] := 'Valor Unitário';
  StringGrid1.Cells[4, 0] := 'Valor Total';


  StringGrid1.ColWidths[0] := 50;
  StringGrid1.ColWidths[1] := 150;
  StringGrid1.ColWidths[2] := 80;
  StringGrid1.ColWidths[3] := 100;
  StringGrid1.ColWidths[4] := 100;
end;

procedure TfrmViewPedidoVenda.StringGrid1Click(Sender: TObject);
begin
  inherited;
  FSelectedRow := StringGrid1.Row;
end;

procedure TfrmViewPedidoVenda.HabilitaEdicaoItem(bHabilita: Boolean);
begin
  Pnl_ItemCampos.Enabled := bHabilita;
end;

{$R *.dfm}

end.

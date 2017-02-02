unit uFornecedorMain;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, DBXOracle, StdCtrls, DB, SqlExpr, uFornecedorDAO,uFornecedorService,
  ComCtrls, Buttons, Grids, DBGrids, uFornecedorModel, Generics.Collections;

type
  TfrmFornec = class(TForm)
    tabControlFornec: TPageControl;
    ConsultaFornec: TTabSheet;
    DBGrid1: TDBGrid;
    edtConsulta: TEdit;
    btnConsultar: TBitBtn;
    cbConsulta: TComboBox;
    CadFornec: TTabSheet;
    btnSalvar: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    edtEndereco: TEdit;
    edtCGC: TEdit;
    btnEditar: TButton;
    btnExcluir: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure limparCampos;
    procedure btnExcluirClick(Sender: TObject);
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFornec: TfrmFornec;
  fornecedor : TFornecedor;


implementation

uses uDmDados;

{$R *.dfm}

procedure TfrmFornec.btnConsultarClick(Sender: TObject);
var
  fornecedorService : TFornecedorService;
  fornecedor : TFornecedor;
  ListFornc : TList<TFornecedor>;
begin
  if (edtConsulta.Text <> EmptyStr) and (cbConsulta.ItemIndex = 0) then // posição 0 = codigo
  begin
    try
      fornecedorService := TFornecedorService.create;
      fornecedor :=  fornecedorService.ConsultarFornecedor(StrToInt(edtConsulta.Text));
      if fornecedor = nil then
      begin
        ShowMessage('Código não encontrado!');
        abort;
      end;
      dmdados.cdsFornecedor.EmptyDataSet;

      dmdados.cdsFornecedor.Append;
      dmDados.cdsFornecedorCodFornec.AsInteger := fornecedor.CodFornec;
      dmDados.cdsFornecedorNome.AsString := fornecedor.Nome;
      dmDados.cdsFornecedorEndereço.AsString := fornecedor.Endereco;
      dmDados.cdsFornecedorCGC.AsFloat := fornecedor.cgc;
      dmDados.cdsFornecedorDataCadastro.AsDateTime := fornecedor.DataCadastro;
      dmdados.cdsFornecedor.Post;
    except
      ShowMessage('Código não encontrado');
    end;
    fornecedorService.Destroy;
  end;

  if (edtConsulta.Text <> EmptyStr) and (cbConsulta.ItemIndex = 1) then // 1 = Nome
  begin

    fornecedorService := TFornecedorService.create;
    ListFornc := fornecedorService.ConsultarFornec(UpperCase(edtConsulta.Text));
    if ListFornc = nil then
    begin
      ShowMessage('Fornecedor não encontrado!');
      abort;
    end;
    dmDados.cdsFornecedor.EmptyDataSet;
    dmDados.cdsFornecedor.DisableControls;
    dmDados.cdsFornecedor.First;

    for fornecedor in ListFornc do
    begin
      dmdados.cdsFornecedor.Append;
      dmDados.cdsFornecedorCodFornec.AsInteger := fornecedor.CodFornec;
      dmDados.cdsFornecedorNome.AsString := fornecedor.Nome;
      dmDados.cdsFornecedorEndereço.AsString := fornecedor.Endereco;
      dmDados.cdsFornecedorCGC.AsFloat := fornecedor.cgc;
      dmDados.cdsFornecedorDataCadastro.AsDateTime := fornecedor.DataCadastro;
      dmDados.cdsFornecedor.Post;


    end;
    dmDados.cdsFornecedor.EnableControls;
    fornecedorService.Destroy;

  end;

  if (edtConsulta.Text <> EmptyStr) and (cbConsulta.ItemIndex = 2) then //2 = cgc
  begin
    fornecedorService := TFornecedorService.create;
    fornecedor := fornecedorService.ConsultarFornecCGC(StrToFloat(edtConsulta.Text));
    if fornecedor = nil then
    begin
      ShowMessage('Fornecedor não encontrado!');
      abort;
    end;

    dmDados.cdsFornecedor.EmptyDataSet;

    dmDados.cdsFornecedor.Append;
    dmDados.cdsFornecedorCodFornec.AsInteger := fornecedor.CodFornec;
    dmDados.cdsFornecedorNome.AsString := fornecedor.Nome;
    dmDados.cdsFornecedorEndereço.AsString := fornecedor.Endereco;
    dmDados.cdsFornecedorCGC.AsFloat := fornecedor.cgc;
    dmDados.cdsFornecedorDataCadastro.AsDateTime := fornecedor.DataCadastro;
    dmDados.cdsFornecedor.Post;
    fornecedorService.Destroy;
  end;

  if (edtConsulta.Text <> EmptyStr) and (cbConsulta.ItemIndex = 3) then  //Endereço
  begin
    fornecedorService := TFornecedorService.create;
    fornecedor := fornecedorService.ConsultarFornecEnd(edtConsulta.Text);
    if fornecedor = nil then
    begin
      ShowMessage('Fornecedor não encontrado!');
      abort;
    end;
    dmDados.cdsFornecedor.EmptyDataSet;

    dmDados.cdsFornecedor.Append;
    dmDados.cdsFornecedorCodFornec.AsInteger := fornecedor.CodFornec;
    dmDados.cdsFornecedorNome.AsString := fornecedor.Nome;
    dmDados.cdsFornecedorEndereço.AsString := fornecedor.Endereco;
    dmDados.cdsFornecedorCGC.AsFloat := fornecedor.cgc;
    dmDados.cdsFornecedorDataCadastro.AsDateTime := fornecedor.DataCadastro;
    dmDados.cdsFornecedor.Post;
    fornecedorService.Destroy;
  end;

  if (edtConsulta.Text <> EmptyStr) and (cbConsulta.ItemIndex = 4) then  //Data
  begin
    fornecedorService := TFornecedorService.create;
    fornecedor := fornecedorService.ConsultarFornecDat(StrToDateTime(edtConsulta.Text));
    if fornecedor = nil then
    begin
      ShowMessage('Fornecedor não encontrado');
      abort;
    end;

    dmDados.cdsFornecedor.EmptyDataSet;

    dmDados.cdsFornecedor.append;
    dmDados.cdsFornecedorCodFornec.AsInteger := fornecedor.CodFornec;
    dmDados.cdsFornecedorEndereço.AsString := fornecedor.Endereco;
    dmDados.cdsFornecedorCGC.AsInteger := fornecedor.cgc;
    dmDados.cdsFornecedorDataCadastro.AsDateTime := fornecedor.DataCadastro;
    dmDados.cdsFornecedor.Post;
    fornecedorService.Destroy;
  end;


  if edtConsulta.Text = EmptyStr then
  begin
    dmDados.cdsFornecedor.EmptyDataSet;
    fornecedorService := TFornecedorService.create;
    ListFornc:= fornecedorService.ConsultarTodos;
    dmDados.cdsFornecedor.DisableControls;
    for fornecedor in ListFornc do
    begin
      dmDados.cdsFornecedor.Append;
      dmDados.cdsFornecedorNome.AsString := fornecedor.Nome;
      dmDados.cdsFornecedorEndereço.AsString := fornecedor.Endereco;
      dmDados.cdsFornecedorCGC.AsInteger := fornecedor.cgc;
      dmDados.cdsFornecedorCodFornec.AsInteger := fornecedor.CodFornec;
      dmDados.cdsFornecedorDataCadastro.AsDateTime := fornecedor.DataCadastro;
      dmDados.cdsFornecedor.Post;
    end;
    dmDados.cdsFornecedor.EnableControls;
    fornecedorService.Destroy;
  end;



end;

procedure TfrmFornec.btnEditarClick(Sender: TObject);
begin
  edtCodigo.Text := IntToStr(dmDados.cdsFornecedorCodFornec.AsInteger);
  edtNome.Text := dmDados.cdsFornecedorNome.AsString;
  edtEndereco.Text := dmDados.cdsFornecedorEndereço.AsString;
  edtCGC.Text := IntToStr(dmDados.cdsFornecedorCGC.AsInteger);
  edtCodigo.Enabled := False;
  CadFornec.Show;
end;

procedure TfrmFornec.btnExcluirClick(Sender: TObject);
var
  fornecedorService : TFornecedorService;
  ListFornc : TList<TFornecedor>;
begin
  if Application.MessageBox ('Deseja realmente excluir este Fornecedor?','Confirmação ?',MB_Iconexclamation+MB_YESNO) = ID_NO then
  begin
    abort;
  end;

  fornecedorService := TFornecedorService.create;
  fornecedorService.DeletarFornecedor(dmDados.cdsFornecedorCodFornec.Value);

  dmDados.cdsFornecedor.EmptyDataSet;
  fornecedorService := TFornecedorService.create;
  ListFornc:= fornecedorService.ConsultarTodos;
  dmDados.cdsFornecedor.DisableControls;

  for fornecedor in ListFornc do
  begin
    dmDados.cdsFornecedor.Append;
    dmDados.cdsFornecedorNome.AsString := fornecedor.Nome;
    dmDados.cdsFornecedorEndereço.AsString := fornecedor.Endereco;
    dmDados.cdsFornecedorCGC.AsInteger := fornecedor.cgc;
    dmDados.cdsFornecedorCodFornec.AsInteger := fornecedor.CodFornec;
    dmDados.cdsFornecedorDataCadastro.AsDateTime := fornecedor.DataCadastro;
    dmDados.cdsFornecedor.Post;
  end;

  dmDados.cdsFornecedor.EnableControls;
end;

procedure TfrmFornec.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DELETE then
  begin
    btnExcluir.Click;
  end;
end;

procedure TfrmFornec.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
  begin
    btnConsultar.Click;
  end;
end;

procedure TfrmFornec.FormCreate(Sender: TObject);
begin
  fornecedor := TFornecedor.Create;
end;

procedure TfrmFornec.limparCampos;
begin
  edtCodigo.Text := EmptyStr;
  edtNome.Text := EmptyStr;
  edtEndereco.Text := EmptyStr;
  edtCGC.Text := EmptyStr;
end;

procedure TfrmFornec.btnSalvarClick(Sender: TObject);
var
  FornecedorService : TFornecedorService;
begin

 // destruir esse objeto
  FornecedorService := TFornecedorService.Create;
  if (edtNome.Text = EmptyStr) or (edtEndereco.Text = EmptyStr) or (edtCGC.Text = EmptyStr) then
  begin
    ShowMessage('Por favor, preencha todos os campos!');
    abort;
  end;
  if edtCodigo.Text = EmptyStr then
  begin
    FornecedorService.salvarFornecedor((UpperCase(edtNome.Text)),StrToInt(edtCGC.Text),(UpperCase(edtEndereco.Text)));
    limparCampos;
    ShowMessage('Fornecedor cadastrado com suscesso!');
  end;

  if edtCodigo.text <> EmptyStr  then
  begin
    FornecedorService.EditarFornecedor(StrToInt(edtCodigo.Text),(UpperCase(edtNome.Text)),(UpperCase(edtEndereco.Text)),StrToInt(edtCGC.Text));
    ShowMessage('Fornecedor Salvo com suscesso!');
    edtCodigo.Enabled := True;
    limparCampos;
  end;
  FornecedorService.Destroy;

 end;

end.

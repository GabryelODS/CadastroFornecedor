unit uProdutoMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ComCtrls,uProdutoService,uProdutoModel, Generics.Collections,
  uFornecedorService, uFornecedorModel,uFOrnecedoRDAO;

type
  TfrmProduto = class(TForm)
    tabControlFornec: TPageControl;
    ConsultaFornec: TTabSheet;
    DBGrid1: TDBGrid;
    edtConsulta: TEdit;
    btnConsultar: TBitBtn;
    cbConsulta: TComboBox;
    btnEditar: TButton;
    btnExcluir: TButton;
    CadFornec: TTabSheet;
    btnSalvar: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    edtCGC: TEdit;
    cbCategoria: TComboBox;
    btnAdd: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;
  Categoria : Tcategoria;

implementation

uses uSalvarCategoria;

{$R *.dfm}

procedure TfrmProduto.btnAddClick(Sender: TObject);
begin
  frmSalvar.Show;
end;

procedure TfrmProduto.FormCreate(Sender: TObject);
begin
  categoria := TCategoria.Create;

end;

procedure TfrmProduto.FormShow(Sender: TObject);
var
  ListCategoria : TList<TCategoria>;
  ProdutoService : TProdutoService;
  categoria : TCategoria;
begin
  categoria := TCategoria.Create;
  ProdutoService := TProdutoService.create;
  ListCategoria := TLIST<TCategoria>.Create;
  ListCategoria := ProdutoService.ConsultarCategoria;
  for categoria in ListCategoria do
  begin
    cbCategoria.Items.Append(categoria.Descricao);
  end;
end;
end.

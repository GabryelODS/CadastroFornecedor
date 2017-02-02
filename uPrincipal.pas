unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uFornecedorMain,uProdutoMain, ExtCtrls, jpeg;

type
  TfrmPrincipal = class(TForm)
    edtRotina: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    linkProduto: TLinkLabel;
    linkFornecedor: TLinkLabel;
    lbldat: TLabel;
    Image1: TImage;
    procedure btnFornecClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure linkFornecedorClick(Sender: TObject);
    procedure linkProdutoClick(Sender: TObject);
    procedure edtRotinaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnFornecClick(Sender: TObject);
begin
  frmFornec.Show;
end;
procedure TfrmPrincipal.btnProdutoClick(Sender: TObject);
begin
  frmProduto.ShowModal;
end;
procedure TfrmPrincipal.edtRotinaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    begin
    if (edtRotina.Text <> '1000') and (edtRotina.Text <> '2000')  then
    begin
      ShowMessage('Rotina não encontrada!');
      edtRotina.Clear;
      abort;
    end;
    if edtRotina.Text = '1000' then
    begin
      frmFornec.ShowModal;
      edtRotina.Clear;
    end;
    if edtRotina.Text = '2000' then
    begin
      frmProduto.ShowModal;
      edtRotina.Clear;
    end;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  linkFornecedor.Caption := '<a href="1000 - Fornecedor">1000 - Fornecedor</a>';
  linkProduto.Caption := '<a href="2000 - Produto">2000 - Produto</a>';
  lbldat.Caption := dateToStr(Now);
end;

procedure TfrmPrincipal.linkFornecedorClick(Sender: TObject);
begin
  frmFornec.ShowModal;
end;

procedure TfrmPrincipal.linkProdutoClick(Sender: TObject);
begin
  frmProduto.ShowModal;
end;

end.



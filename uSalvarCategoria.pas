unit uSalvarCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uProdutoMain, Buttons, StdCtrls;

type
  TfrmSalvar = class(TForm)
    edtCategoria: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnSalvar: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSalvar: TfrmSalvar;

implementation

{$R *.dfm}

end.

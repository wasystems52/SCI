unit frmMenuPrin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ActnList, Menus, ToolWin, ComCtrls, ExtCtrls, AppEvnts,
  DB, IBCustomDataSet, IBQuery;

type
  TmenuPrin = class(TForm)
    ImageList1: TImageList;
    ActionList1: TActionList;
    Cad_CliFor: TAction;
    Cad_Prof: TAction;
    Cad_Transp: TAction;
    Cad_Autor: TAction;
    Cad_Autoria: TAction;
    Logoff: TAction;
    Sair: TAction;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Estoque1: TMenuItem;
    UtilitrioseFerramentas1: TMenuItem;
    Ferramentas1: TMenuItem;
    ClientesFornecedores1: TMenuItem;
    Professores1: TMenuItem;
    ransportadoras1: TMenuItem;
    Autores1: TMenuItem;
    Autoria1: TMenuItem;
    mnuPriLinha1: TMenuItem;
    Vendedores1: TMenuItem;
    abelasAuxiliares1: TMenuItem;
    mnuPriLinha2: TMenuItem;
    Logoffde1: TMenuItem;
    SairdoPrograma1: TMenuItem;
    Cad_VendInt: TAction;
    Cad_VendExt: TAction;
    Tab_Ativ: TAction;
    Tab_Categ: TAction;
    Tab_Ufs: TAction;
    Cad_Livro: TAction;
    Cad_EntLiv: TAction;
    Ut_Calc: TAction;
    Ut_Calend: TAction;
    Ut_BlocNot: TAction;
    Ut_WE: TAction;
    Ut_IE: TAction;
    Ft_Usuarios: TAction;
    Ft_Perfil: TAction;
    VendedoresExternos1: TMenuItem;
    VendedoresInternos1: TMenuItem;
    abeladeAtividades1: TMenuItem;
    abeladeCategorias1: TMenuItem;
    abeladeUnidadesFederativas1: TMenuItem;
    CadastrodeLivros1: TMenuItem;
    EntradadelivrosnoEstoque1: TMenuItem;
    Calculadora1: TMenuItem;
    Calendrio1: TMenuItem;
    BlocodeNotas1: TMenuItem;
    WindowsExplorer1: TMenuItem;
    InternetExplorer1: TMenuItem;
    Usuarios1: TMenuItem;
    PerfisdeUsuarios1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ImageList2: TImageList;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    ApplicationEvents1: TApplicationEvents;
    QueryLogin: TIBQuery;
    DataSource1: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure SairExecute(Sender: TObject);
    procedure LogoffExecute(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  menuPrin: TmenuPrin;

implementation

uses frmLogin;

{$R *.dfm}

procedure TmenuPrin.FormActivate(Sender: TObject);
begin
     statusbar1.Panels[0].Text:=' '+ formatdatetime(' hh:nn', Now);
     statusbar1.Panels[1].Text:=formatdateTime(' dddd" , "dd" de "mmmm" de "yyyy', Now);
     Login.ShowModal;
end;

procedure TmenuPrin.Timer1Timer(Sender: TObject);
begin
     statusbar1.Panels[0].Text:=' ' + formatdateTime(' hh:nn', Now);
end;

procedure TmenuPrin.ApplicationEvents1Hint(Sender: TObject);
begin
     statusbar1.Panels[3].Text:=' ' + Application.Hint;
end;

procedure TmenuPrin.SairExecute(Sender: TObject);
begin
     close;
end;

procedure TmenuPrin.LogoffExecute(Sender: TObject);
begin
     QueryLogin.Close;
     QueryLogin.SQL.Clear;
     Login.ValorNome.Text:='';
     Login.ValorSenha.Text:='';
     Login.ShowModal;
end;

procedure TmenuPrin.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
var
   mensagemerro: string;
   P1, P2: integer;
begin
     if pos(upperCase('violation of primary or unique key constraint'), UpperCase(E.Message)) > 0 then
     begin
          beep;
          showmessage('O valor digitado para o campo já existe nesta tabela.');
     end;

     if pos(upperCase('must have a value'), UpperCase(E.Message)) > 0 then
     begin
          beep;
          P1:=Pos('''', E.Message);
          mensagemerro:= E.Message;
          delete(mensagemerro, p1, 1);
          P2:=Pos('''',mensagemerro);
          mensagemerro:=copy(e.Message, p1 + 1, p2 - p1);
          showmessage('O campo ['+ mensagemerro + '] é de preenchimento obrigatório.');
     end;
end;

procedure TmenuPrin.FormCreate(Sender: TObject);
begin
     ShortDateFormat:= 'dd/mm/yyyy';
     DecimalSeparator:= ',';
     ThousandSeparator:= '.';
end;

end.

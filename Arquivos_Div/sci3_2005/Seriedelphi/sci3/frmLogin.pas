unit frmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TLogin = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ValorNome: TEdit;
    ValorSenha: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ValorNomeKeyPress(Sender: TObject; var Key: Char);
    procedure ValorSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Login: TLogin;

implementation

uses frmMenuPrin;

{$R *.dfm}

procedure TLogin.Button2Click(Sender: TObject);
  begin
        menuPrin.Close;
  end;

procedure TLogin.Button1Click(Sender: TObject);
var
strSqlLog: string;
mensagem: string;
  begin
        strSqlLog:='SELECT * FROM usuario, perfil WHERE usuario.nivel=perfil.id ';
        strSqlLog:=strSqlLog + 'AND fantasia = ' + #39 + (valorNome.Text) + #39 ;
        strSqlLog:=strSqlLog + 'AND senha = ' + #39 + (valorSenha.Text) + #39 ;
        menuPrin.QueryLogin.Close;
        menuPrin.QueryLogin.SQL.Clear;
        menuPrin.QueryLogin.SQL.Add(strSqlLog);
        menuPrin.QueryLogin.Open;
        if(menuPrin.QueryLogin.FieldByName('status').AsString='N') then
            begin
                mensagem:='Você está cadastrado no sistema mas não ' + #13
                + 'possui autorização para usá-lo neste momento. ' + #13 + #13
                + 'Consulte o administrador do sistema.';
                Application.MessageBox(PChar(mensagem), 'Login não autorizado', MB_Ok+mb_IconError);
                menuPrin.Close;
            end
        else
        begin
            if(menuPrin.QueryLogin.RecordCount)=1 then
                begin
                    menuPrin.StatusBar1.Panels[2].Text:=' '+'Usuário: '+ login.ValorNome.Text +
                    ' - ' + menuPrin.QueryLogin.FieldByName('dpto').AsString;
                    menuPrin.Logoff.Caption:='Logoff de: '+ menuPrin.QueryLogin.FieldByName('fantasia').AsString;
                    menuPrin.Logoff.Hint:='Logoff de: '+ menuPrin.QueryLogin.FieldByName('fantasia').AsString;
                    login.Close;
                end;
            if(menuPrin.QueryLogin.RecordCount)=0 then
                begin
                    mensagem:='Nome ou senha do usuário inválidos.' + #13 + #13
                    + 'Se você esqueceu sua senha, consulte ' + #13
                    + 'o administrador do sistema.';
                    Application.MessageBox(PChar(mensagem), 'Login não autorizado', MB_Ok+mb_IconError);
                    ValorSenha.Text:='';
                    ValorSenha.SetFocus;
                end;
        end;
  end;

procedure TLogin.ValorNomeKeyPress(Sender: TObject; var Key: Char);
  begin
        if key = #13 then
        begin
            selectnext(activecontrol, true, true);
            key:=#0;
        end;
  end;

procedure TLogin.ValorSenhaKeyPress(Sender: TObject; var Key: Char);
  begin
        if key = #13 then
        begin
            selectnext(activecontrol, true, true);
            key:=#0;
        end;
  end;
  
procedure TLogin.FormActivate(Sender: TObject);
  begin
         valorNome.SetFocus;
  end;

end.



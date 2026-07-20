unit frmFormPadrao1;

interface

    uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ImgList, ToolWin, ComCtrls, Menus, ExtCtrls, DB, IBCustomDataSet,
    StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids;

    type
    TExecutar = (navegacao, sentencaSQL, exibePanels, desabilitabotoes, habilitaBotoes, exibeBotoes);
    TFormPadrao1 = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    ToolBar1: TToolBar;
    btn_AutoFiltrar: TToolButton;
    ToolButton2: TToolButton;
    btn_Inicio: TToolButton;
    btn_Anterior: TToolButton;
    btn_Proximo: TToolButton;
    btn_Final: TToolButton;
    ToolButton7: TToolButton;
    btn_Incluir: TToolButton;
    btn_Alterar: TToolButton;
    btn_Excluir: TToolButton;
    btn_Marcar: TToolButton;
    separador3: TToolButton;
    btn_Gravar: TToolButton;
    btn_Reverter: TToolButton;
    separador4: TToolButton;
    btn_Ajuda: TToolButton;
    btn_Sair: TToolButton;
    PopupMenu1: TPopupMenu;
    m11: TMenuItem;
    m12: TMenuItem;
    Linha1: TMenuItem;
    m13: TMenuItem;
    m14: TMenuItem;
    Linha2: TMenuItem;
    m15: TMenuItem;
    m16: TMenuItem;
    PopupMenu2: TPopupMenu;
    m21: TMenuItem;
    Linha3: TMenuItem;
    m22: TMenuItem;
    PopupMenu3: TPopupMenu;
    m31: TMenuItem;
    m32: TMenuItem;
    Linha4: TMenuItem;
    m33: TMenuItem;
    m34: TMenuItem;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheetFicha: TTabSheet;
    TabSheetTabela: TTabSheet;
    TabSheetImprimir: TTabSheet;
    PanelEntrada: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Image1: TImage;
    IBDataSet1: TIBDataSet;
    DataSource1: TDataSource;
    Label8: TLabel;
    ValorCampo: TEdit;
    btnOk: TSpeedButton;
    CheckHabilita: TDBCheckBox;
    CheckMarca: TDBCheckBox;
    LabelStatus: TLabel;
    DBGrid1: TDBGrid;
    btn_habilitaTodos: TButton;
    PanelFicha: TPanel;
    btn_Ordenar: TToolButton;
    PopupMenu4: TPopupMenu;
    m41: TMenuItem;
    m42: TMenuItem;
    m43: TMenuItem;
    m44: TMenuItem;
    procedure btn_SairClick(Sender: TObject);
    procedure btn_InicioClick(Sender: TObject);
    procedure btn_AnteriorClick(Sender: TObject);
    procedure btn_ProximoClick(Sender: TObject);
    procedure btn_FinalClick(Sender: TObject);
    procedure btn_IncluirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure m21Click(Sender: TObject);
    procedure btn_GravarClick(Sender: TObject);
    procedure btn_ReverterClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure m12Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure ValorCampoKeyPress(Sender: TObject; var Key: Char);
    procedure m22Click(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure m31Click(Sender: TObject);
    procedure m32Click(Sender: TObject);
    procedure m33Click(Sender: TObject);
    procedure m34Click(Sender: TObject);
    procedure TabSheetTabelaShow(Sender: TObject);
    procedure TabSheetFichaShow(Sender: TObject);
    procedure TabSheetImprimirShow(Sender: TObject);
    procedure m11Click(Sender: TObject);
    procedure m15Click(Sender: TObject);
    procedure m16Click(Sender: TObject);
    procedure btn_habilitaTodosClick(Sender: TObject);
    procedure TabSheetTabelaEnter(Sender: TObject);
    procedure m13Click(Sender: TObject);
    procedure m14Click(Sender: TObject);
    procedure m41Click(Sender: TObject);
    procedure m42Click(Sender: TObject);
    procedure m43Click(Sender: TObject);
    procedure m44Click(Sender: TObject);
  private
    FExecutar: TExecutar;
    procedure SetExecutar(const Value: TExecutar);
    { Private declarations }
  public
    { Public declarations }
    property Executar: TExecutar read FExecutar write SetExecutar;
  end;

var
  FormPadrao1: TFormPadrao1;

  {armazena sentença SQL atual}
  strSqlAtual: string;
  {define o tipo do campo ID}
  tipoId: Integer;
  {guarda mensagens}
  mensagem: string;
  {armazena a sentença SQL}
  strSql: string;
  {define o nome da tabela em uso}
  nomeTabela: string;
  {define uma operação de inclusão}
  operacaoIncluir: Integer;
  {define as opções de inclusão, alteração e exclusão}
  modoEdicao: string;
  {define o titulo de janelas filhas}
  nomeJanela: string;
  {armazena datas no formato string}
  valdata1, valdata2, val1, val2: string;
  {armazena o nome de uma tarefa em andamento}
  tarefa: string;
  {controle do botão pesquisar da janela pesqData}
  tarefaClick: integer;
  {Menu escolhido pelo usuário}
  tipoMenu: string;


implementation

uses frmDM, frmMenuPrin, frmPesqData;

{$R *.dfm}

procedure TFormPadrao1.btn_SairClick(Sender: TObject);
begin
     IBDataSet1.Close;
     valorCampo.Text:= '';
     btn_Ordenar.Hint:= '';
     executar:= exibePanels;
     WindowState:=wsNormal;
     close;
end;

procedure TFormPadrao1.btn_InicioClick(Sender: TObject);
begin
     IBDataSet1.First;
     Executar:= navegacao;
     Executar:= exibePanels;
end;

procedure TFormPadrao1.btn_AnteriorClick(Sender: TObject);
begin
     IBDataSet1.Prior;
     Executar:= navegacao;
     Executar:= exibePanels;
end;

procedure TFormPadrao1.btn_ProximoClick(Sender: TObject);
begin
     IBDataSet1.Next;
     Executar:=navegacao;
     Executar:=exibePanels;
end;

procedure TFormPadrao1.btn_FinalClick(Sender: TObject);
begin
     IBDataSet1.Last;
     Executar:=navegacao;
     Executar:=exibePanels;
end;

procedure TFormPadrao1.btn_IncluirClick(Sender: TObject);
begin
     operacaoIncluir:=1;
     {Execução da sentença SQL}
     if IBDataSet1.RecordCount = 0 then
     begin
          strSql:= 'SELECT * FROM ' +  nometabela  + ' WHERE ID = 0';
          Executar:= sentencaSQL;
     end;

     IBDataSet1.Insert;

     {Habilitação e exibição de objetos}
     valorCampo.Enabled:= False;
     btnOk.Visible:= False;
     checkHabilita.Enabled:= False;
     checkMarca.Enabled:= False;
     LabelStatus.Visible:= False;
     PanelFicha.Enabled:= True;

     {Inclusão de registro}
     IBDataSet1.FieldByName('status').AsString:= 'N';
     IBDataSet1.FieldByName('marca').AsString:= 'N';
     IBDataSet1.FieldByName('data_inc').AsDateTime:= date;

     {Botões e barra de status}
     Executar:= desabilitaBotoes;
     statusbar1.Panels[2].text:= ' Inclusão de novo registro';
     Executar:= exibePanels;
     operacaoIncluir:=0;
     pageControl1.ActivePage:= TabSheetFicha;
end;

procedure TFormPadrao1.btn_AlterarClick(Sender: TObject);
begin
     IBDataSet1.Edit;

     {Habilitação e exibição de objetos}
     valorCampo.Enabled:= False;
     btnOk.Visible:= False;
     checkHabilita.Enabled:= True;
     checkMarca.Enabled:= True;
     PanelFicha.Enabled:= True;

     {Alteração de registro}
     IBDataSet1.FieldByName('data_alt').AsDateTime:= date;

     {Botões e barra de status}
     Executar:= desabilitaBotoes;
     statusbar1.Panels[2].text:= ' Alteração de registro';
     Executar:= exibePanels;
end;

procedure TFormPadrao1.m21Click(Sender: TObject);
var
   confExcl: Integer;
begin
     beep;
     confExcl:= Application.MessageBox('Confirma a exclusão deste registro?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
     if confExcl = IDYes then
     begin
          IBDataSet1.Delete;
          dm.trans.CommitRetaining;
          mensagem:= 'O registro foi excluido com sucesso.  ';
          Application.MessageBox(PChar(mensagem), 'Informação', MB_Ok+mb_IconInformation);
     end;
     if confExcl = IDNo then
     begin
          dm.trans.RollbackRetaining;
          mensagem:= 'A exclusão deste registro foi abortada.  ';
          Application.MessageBox(PChar(mensagem), 'Informação', MB_Ok+mb_IconInformation);
     end;
     if pageControl1.ActivePageIndex = 0 then
     begin
          valorCampo.Text:= '';
          valorCampo.SetFocus;
     end;
     Executar:= habilitabotoes;
     Executar:= exibePanels;
end;

procedure TFormPadrao1.btn_GravarClick(Sender: TObject);
begin
     IBDataSet1.Post;
     DM.Trans.CommitRetaining;
     mensagem:= 'O registro foi incluido ou alterado com sucesso. ';
     Application.MessageBox(PChar(mensagem), 'Informação', MB_Ok+mb_IconInformation);

     Executar:= habilitaBotoes;

     {Habilitação e exibição de objetos}
     valorCampo.Text:= '';
     valorCampo.Enabled:= True;
     btnOk.Visible:= True;
     checkHabilita.Enabled:= False;
     checkMarca.Enabled:= False;
     PanelFicha.Enabled:= False;

     if IBDataSet1.FieldByName('status').AsString = 'N' then
        labelstatus.Visible:= True
        else
            labelstatus.Visible:= False;
end;

procedure TFormPadrao1.btn_ReverterClick(Sender: TObject);
begin
     IBDataSet1.Cancel;
     DM.Trans.RollbackRetaining;
     Mensagem:= 'A inclusão ou alteração deste registro foi abortada.  ';
     Application.MessageBox(PChar(mensagem), 'Atenção', MB_Ok+mb_IconError);

     Executar:= habilitaBotoes;

     {Habilitação e exibição de objetos}
     valorCampo.Text:= '';
     valorCampo.Enabled:= True;
     btnOk.Visible:= True;
     checkHabilita.Enabled:= False;
     checkMarca.Enabled:= False;
     PanelFicha.Enabled:= False;

     if IBDataSet1.FieldByName('status').AsString = 'N' then
        labelstatus.Visible:= True
        else
            labelstatus.Visible:= False;
end;

procedure TFormPadrao1.FormActivate(Sender: TObject);
begin
     pageControl1.ActivePageIndex:= 0;
     executar:= exibeBotoes;
     btn_AutoFiltrar.Enabled:= True;
     btn_Inicio.Enabled:= False;
     btn_Anterior.Enabled:= False;
     btn_proximo.Enabled:= False;
     btn_Final.Enabled:= False;
     btn_Incluir.Enabled:= True;
     btn_Alterar.Enabled:= False;
     btn_Excluir.Enabled:= False;
     btn_Marcar.Enabled:= False;
     btn_Gravar.Enabled:= False;
     btn_Reverter.Enabled:= False;
     btn_Ajuda.Enabled:= False;
     btn_Sair.Enabled:= True;
     btn_Ordenar.Enabled:= False;

     valorCampo.Enabled:= True;
     valorCampo.SetFocus;
     btnOk.Visible:= True;
     checkHabilita.Enabled:= False;
     checkMarca.Enabled:= False;
     panelFicha.Enabled:= False;
end;

procedure TFormPadrao1.m12Click(Sender: TObject);
begin
     strSql:= 'SELECT * FROM ' + nomeTabela;
     statusbar1.Panels[2].text:= ' Todos os registros selecionados';
     Executar:= SentencaSQL;
     Executar:= exibePanels;
     Executar:= navegacao;
     Executar:= habilitaBotoes;
end;

procedure TFormPadrao1.SetExecutar(const Value: TExecutar);
begin
     FExecutar := Value;
     case value of
     // Habilita os botões de navegação
     navegacao:
     begin
          if IBDataSet1.Eof=true then
          begin
               btn_Proximo.Enabled:=false;
               btn_Final.Enabled:=false;
          end
          else
          begin
               btn_Proximo.Enabled:=true;
               btn_Final.Enabled:=true;
          end;
          if IBDataSet1.Bof=true then
          begin
               btn_Inicio.Enabled:=false;
               btn_Anterior.Enabled:=false;
          end
          else
          begin
               btn_Inicio.Enabled:=true;
               btn_Anterior.Enabled:=true;
          end;
     end;
     { Executa sentença SQL }
     sentencaSQL:
     begin
          IBDataSet1.Close;
          IBDataSet1.SelectSQL.Clear;
          IBDataSet1.SelectSQL.Add(strSql);
          IBDataSet1.Open;
          if (IBDataSet1.RecordCount=0) and (operacaoIncluir=0) then
          begin
               mensagem:='Não foi encontrado nenhum registro que ' + #13
               + 'satisfaça a sua pesquisa. ';
               Application.MessageBox(PChar(mensagem), 'Informação', MB_Ok+mb_IconInformation);
          end;
     end;
     { Exibe os textos nos paineis da barra de status }
     exibePanels:
     begin
          statusbar1.Panels[0].Text:= ' INC: ' +
          IBDataSet1.FieldByName('data_inc').AsString;
          statusbar1.Panels[1].Text:= ' ALT: ' +
          IBDataSet1.FieldByName('data_alt').AsString;
          statusbar1.Panels[3].Text:=  ' ' + IBDataSet1.FieldByName('ID').AsString;
          if (IBDataSet1.RecordCount=0) and (operacaoIncluir=0) then
          begin
               statusbar1.Panels[0].Text:='';
               statusbar1.Panels[1].Text:='';
               statusbar1.Panels[2].Text:='';
               statusbar1.Panels[3].Text:='';
          end;
          if IBDataSet1.FieldByName('status').AsString='N' then
             Labelstatus.Visible:=true
             else
                 Labelstatus.Visible:=false;
     end;
     { Desabilita botões ao incluir ou alterar um registro }
     desabilitaBotoes:
     begin
          btn_AutoFiltrar.Enabled:= False;
          btn_Inicio.Enabled:= False;
          btn_Anterior.Enabled:= False;
          btn_proximo.Enabled:= False;
          btn_Final.Enabled:= False;
          btn_Incluir.Enabled:= False;
          btn_Alterar.Enabled:= False;
          btn_Excluir.Enabled:= False;
          btn_Marcar.Enabled:= False;
          btn_Gravar.Enabled:= True;
          btn_Reverter.Enabled:= True;
          btn_Ajuda.Enabled:= False;
          btn_Sair.Enabled:= False;
          btn_Ordenar.Enabled:= False;
     end;
     {Habilita botões ao Gravar ou Reverter uma inclusão ou alteração}
     habilitaBotoes:
     begin
          btn_AutoFiltrar.Enabled:= True;
          btn_Inicio.Enabled:= True;
          btn_Anterior.Enabled:= True;
          btn_proximo.Enabled:= True;
          btn_Final.Enabled:= True;
          btn_Incluir.Enabled:= True;

          if IBDataSet1.RecordCount > 0 then
             btn_Ordenar.Enabled:= True
             else
                 btn_Ordenar.Enabled:= False;

          if IBDataSet1.RecordCount = 0 then
          begin
               btn_Alterar.Enabled:= False;
               btn_Excluir.Enabled:= False;
               btn_Marcar.Enabled:= False;
          end
          else
          begin
               btn_Alterar.Enabled:= True;
               btn_Excluir.Enabled:= True;
               btn_Marcar.Enabled:= True;
          end;

          btn_Gravar.Enabled:= False;
          btn_Reverter.Enabled:= False;
          btn_Ajuda.Enabled:= False;
          btn_Sair.Enabled:= True;
     end;
     {Exibe botoes de edição conforme perfil do usuário}
     exibebotoes:
     begin
          if modoEdicao = 'NNN' then
          begin
               btn_Incluir.Visible:= False;
               btn_Alterar.Visible:= False;
               btn_Excluir.Visible:= False;
               btn_Marcar.Visible:= False;
               btn_Gravar.Visible:= False;
               btn_Reverter.Visible:= False;
               separador3.Visible:= False;
               separador4.Visible:= False;
          end;

          if modoEdicao = 'NNS' then
          begin
               btn_Incluir.Visible:= False;
               btn_Alterar.Visible:= False;
               btn_Excluir.Visible:= True;
               btn_Marcar.Visible:= False;
               btn_Gravar.Visible:= True;
               btn_Reverter.Visible:= True;
               separador3.Visible:= False;
               separador4.Visible:= False;
          end;

          if modoEdicao = 'NSN' then
          begin
               btn_Incluir.Visible:= False;
               btn_Alterar.Visible:= True;
               btn_Excluir.Visible:= False;
               btn_Marcar.Visible:= True;
               btn_Gravar.Visible:= True;
               btn_Reverter.Visible:= True;
               separador3.Visible:= False;
               separador4.Visible:= False;
          end;

          if modoEdicao = 'NSS' then
          begin
               btn_Incluir.Visible:= False;
               btn_Alterar.Visible:= True;
               btn_Excluir.Visible:= True;
               btn_Marcar.Visible:= True;
               btn_Gravar.Visible:= True;
               btn_Reverter.Visible:= True;
               separador3.Visible:= False;
               separador4.Visible:= False;
          end;

          if modoEdicao = 'SNN' then
          begin
               btn_Incluir.Visible:= True;
               btn_Alterar.Visible:= False;
               btn_Excluir.Visible:= False;
               btn_Marcar.Visible:= False;
               btn_Gravar.Visible:= True;
               btn_Reverter.Visible:= True;
               separador3.Visible:= False;
               separador4.Visible:= False;
          end;

          if modoEdicao = 'SNS' then
          begin
               btn_Incluir.Visible:= True;
               btn_Alterar.Visible:= False;
               btn_Excluir.Visible:= True;
               btn_Marcar.Visible:= False;
               btn_Gravar.Visible:= True;
               btn_Reverter.Visible:= True;
               separador3.Visible:= False;
               separador4.Visible:= False;
          end;

          if modoEdicao = 'SSN' then
          begin
               btn_Incluir.Visible:= True;
               btn_Alterar.Visible:= True;
               btn_Excluir.Visible:= False;
               btn_Marcar.Visible:= True;
               btn_Gravar.Visible:= True;
               btn_Reverter.Visible:= True;
               separador3.Visible:= False;
               separador4.Visible:= False;
          end;

          if modoEdicao = 'SSS' then
          begin
               btn_Incluir.Visible:= True;
               btn_Alterar.Visible:= True;
               btn_Excluir.Visible:= True;
               btn_Marcar.Visible:= True;
               btn_Gravar.Visible:= True;
               btn_Reverter.Visible:= True;
               separador3.Visible:= False;
               separador4.Visible:= False;
          end;
     end;
     end;
end;

procedure TFormPadrao1.btnOkClick(Sender: TObject);
var
  converte: string;
  x: integer;
begin
     strSql:= 'SELECT * FROM ' + nomeTabela;
     strSql:= strSql + ' WHERE ID = ' + #39 + valorCampo.Text + #39;
     if tipoId=0 then
     begin
          converte:='';
          for x:=1 to length(valorCampo.Text) do
          begin
               if (valorCampo.Text[x] in ['0'..'9'])then
                  converte:= converte + copy(valorCampo.Text, x, 1);
          end;
          valorCampo.Text:=converte;
     end;
     if valorCampo.Text<>'' then
     begin
          statusbar1.Panels[2].Text:=' Pesquisa por ID do registro';
          Executar:= SentencaSQL;
          Executar:= exibePanels;
          Executar:= navegacao;
          Executar:= habilitaBotoes;
          valorCampo.Text:= '';
     end;
end;

procedure TFormPadrao1.ValorCampoKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #13 then
        btnOk.Click;
end;

procedure TFormPadrao1.m22Click(Sender: TObject);
var
   confExcl: Integer;
begin
     beep;
     confExcl:= Application.MessageBox('Você optou em Excluir todos os registros atualmente selecionados. ' + #13
     + 'Uma vez executada esta tarefa, você não mais poderá recuperar tais registros. ' + #13 + #13
     + 'Confirma a exclusão destes registros?',  'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

     if confExcl = IDYes then
     begin
          IBDataSet1.First;
          while not IBDataSet1.Eof do
                IBDataSet1.Delete;
          dm.trans.CommitRetaining;
          mensagem:= 'Os registros selecionados foram excluidos com sucesso. ';
          Application.MessageBox(PChar(mensagem), 'Informação', MB_Ok+mb_IconInformation);
     end;
     if confExcl = IDNo then
     begin
          dm.trans.RollbackRetaining;
          mensagem:= 'A exclusão dos registros selecionados foi abortada.  ';
          Application.MessageBox(PChar(mensagem), 'Informação', MB_Ok+mb_IconInformation);
     end;
     if pageControl1.ActivePageIndex = 0 then
     begin
          valorCampo.Text:= '';
          valorCampo.SetFocus;
     end;
     Executar:= habilitabotoes;
     Executar:= exibePanels;
end;

procedure TFormPadrao1.btn_ExcluirClick(Sender: TObject);
begin
     m21.Click;
end;

procedure TFormPadrao1.m31Click(Sender: TObject);
begin
     IBDataSet1.First;
     while not IBDataSet1.Eof do
     begin
          IBDataSet1.Edit;
          IBDataSet1.FieldByName('marca').asstring:= 'S';
          IBDataSet1.Next;
     end;
     dm.Trans.CommitRetaining;
end;

procedure TFormPadrao1.m32Click(Sender: TObject);
begin
     IBDataSet1.First;
     while not IBDataSet1.Eof do
     begin
          IBDataSet1.Edit;
          IBDataSet1.FieldByName('marca').asstring:= 'N';
          IBDataSet1.Next;
     end;
     dm.Trans.CommitRetaining;
end;

procedure TFormPadrao1.m33Click(Sender: TObject);
begin
     strSql:= 'SELECT * FROM ' + nomeTabela;
     statusbar1.Panels[2].text:= ' Todos os registros selecionados';
     Executar:= SentencaSQL;
     valorCampo.Text:= '';
     IBDataSet1.First;
     while not IBDataSet1.Eof do
     begin
          IBDataSet1.Edit;
          IBDataSet1.FieldByName('marca').asstring:= 'S';
          IBDataSet1.Next;
     end;
     dm.Trans.CommitRetaining;
end;

procedure TFormPadrao1.m34Click(Sender: TObject);
begin
     strSql:= 'SELECT * FROM ' + nomeTabela;
     statusbar1.Panels[2].text:= ' Todos os registros selecionados';
     Executar:= SentencaSQL;
     valorCampo.Text:= '';
     IBDataSet1.First;
     while not IBDataSet1.Eof do
     begin
          IBDataSet1.Edit;
          IBDataSet1.FieldByName('marca').asstring:= 'N';
          IBDataSet1.Next;
     end;
     dm.Trans.CommitRetaining;
end;

procedure TFormPadrao1.TabSheetTabelaShow(Sender: TObject);
begin
     WindowState:=wsMaximized;
end;

procedure TFormPadrao1.TabSheetFichaShow(Sender: TObject);
begin
     WindowState:=wsNormal;
end;


procedure TFormPadrao1.TabSheetImprimirShow(Sender: TObject);
begin
     WindowState:=wsNormal;
end;

procedure TFormPadrao1.m11Click(Sender: TObject);
begin
     WindowState:=wsNormal;
     pagecontrol1.ActivePageIndex:= 0;
     valorCampo.Text:= '';
     valorCampo.SetFocus;
end;

procedure TFormPadrao1.m15Click(Sender: TObject);
begin
     strSql:= 'SELECT * FROM ' + nomeTabela;
     strSql:= strSql + ' WHERE marca = ' + #39 + 'S' + #39;
     statusbar1.Panels[2].text:= ' Seleção de registros marcados';
     Executar:= SentencaSQL;
     Executar:= exibePanels;
     Executar:= navegacao;
     Executar:= habilitaBotoes;
end;

procedure TFormPadrao1.m16Click(Sender: TObject);
begin
     strSql:= 'SELECT * FROM ' + nomeTabela;
     strSql:= strSql + ' WHERE status = ' + #39 + 'N' + #39;
     statusbar1.Panels[2].text:= ' Seleção de registros bloqueados';

     Executar:= SentencaSQL;
     Executar:= exibePanels;
     Executar:= navegacao;
     Executar:= habilitaBotoes;
end;

procedure TFormPadrao1.btn_habilitaTodosClick(Sender: TObject);
begin
     if IBDataSet1.RecordCount <> 0 then
     begin
         IBDataSet1.First;
         while not IBDataSet1.Eof do
         begin
             IBDataSet1.Edit;
             IBDataSet1.FieldByName('status').asstring:= 'S';
             IBDataSet1.FieldByName('data_hab').AsDateTime:= date;
             IBDataSet1.Next;
         end;
         dm.Trans.CommitRetaining;
     end;
end;

procedure TFormPadrao1.TabSheetTabelaEnter(Sender: TObject);
begin
     if copy(modoEdicao,2,1) = 'N' then
        btn_habilitaTodos.Enabled:= False
        else
            btn_habilitaTodos.Enabled:= True;
end;

procedure TFormPadrao1.m13Click(Sender: TObject);
begin
     tarefa:= 'Pesquisa de registros incluídos no período';
     pesqData.showmodal;

     if tarefaClick = 1 then
     begin
          statusbar1.Panels[2].text:= ' Registros incluidos entre: ' + valdata1 + '  e ' + valdata2;
          strSql:= 'SELECT * FROM ' + nomeTabela;
          strSql:= strSql + ' WHERE data_INC >= ' + #39 + val1 + #39;
          strSql:= strSql + ' AND data_INC <= ' + #39 + val2 + #39;

          Executar:= SentencaSQL;
          Executar:= exibePanels;
          Executar:= navegacao;
          Executar:= habilitaBotoes;
     end;
end;

procedure TFormPadrao1.m14Click(Sender: TObject);
begin
     tarefa:= 'Pesquisa de registros alterados no período';
     pesqData.showmodal;

     if tarefaClick = 1 then
     begin
          statusbar1.Panels[2].text:= ' Registros alterados entre: ' + valdata1 + '  e ' + valdata2;
          strSql:= 'SELECT * FROM ' + nomeTabela;
          strSql:= strSql + ' WHERE data_ALT >= ' + #39 + val1 + #39;
          strSql:= strSql + ' AND data_ALT <= ' + #39 + val2 + #39;

          Executar:= SentencaSQL;
          Executar:= exibePanels;
          Executar:= navegacao;
          Executar:= habilitaBotoes;
     end;
end;

procedure TFormPadrao1.m41Click(Sender: TObject);
begin
     IBDataSet1.Close;
     IBDataSet1.SelectSQL.Clear;
     IBDataSet1.SelectSQL.Add(strSql);
     IBDataSet1.SelectSQL.Add('ORDER BY ID');
     IBDataset1.Open;
     btn_Ordenar.Hint:= 'Ordenar registros [ID-Código]';
end;

procedure TFormPadrao1.m42Click(Sender: TObject);
begin
     IBDataSet1.Close;
     IBDataSet1.SelectSQL.Clear;
     IBDataSet1.SelectSQL.Add(strSql);
     IBDataSet1.SelectSQL.Add('ORDER BY DATA_INC');
     IBDataset1.Open;
     btn_Ordenar.Hint:= 'Ordenar registros [Data de inclusão]';
end;

procedure TFormPadrao1.m43Click(Sender: TObject);
begin
     IBDataSet1.Close;
     IBDataSet1.SelectSQL.Clear;
     IBDataSet1.SelectSQL.Add(strSql);
     IBDataSet1.SelectSQL.Add('ORDER BY DATA_ALT');
     IBDataset1.Open;
     btn_Ordenar.Hint:= 'Ordenar registros [Data de alteração]';
end;

procedure TFormPadrao1.m44Click(Sender: TObject);
begin
     IBDataSet1.Close;
     IBDataSet1.SelectSQL.Clear;
     IBDataSet1.SelectSQL.Add(strSql);
     IBDataSet1.SelectSQL.Add('ORDER BY DATA_HAB');
     IBDataset1.Open;
     btn_Ordenar.Hint:= 'Ordenar registros [Data de habilitação]';
end;

end.

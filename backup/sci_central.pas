unit Sci_Central;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ActnList,
  Menus, Process, Calendario;

type

  { TmenuPrin }

  TmenuPrin = class(TForm)
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    Ut_Explorer: TAction;
    Ut_IExplorer: TAction;
    Ft_Perfil: TAction;
    Ft_Usuario: TAction;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    Ut_Calend: TAction;
    Ut_Calc: TAction;
    Cad_EntLiv: TAction;
    Tab_Ufs: TAction;
    Tab_Categ: TAction;
    Tab_Ativ: TAction;
    Cad_Livro: TAction;
    Ut_BlocNot: TAction;
    Cad_VendExt: TAction;
    Cad_VendInt: TAction;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    Separator2: TMenuItem;
    Separator1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Sair: TAction;
    Logoff: TAction;
    Cad_Autoria: TAction;
    Cad_Autor: TAction;
    Cad_Transp: TAction;
    Cad_Prof: TAction;
    Cad_CliFor: TAction;
    ActionList1: TActionList;
    ImageList1: TImageList;
    procedure Image1Click(Sender: TObject);
    procedure Ut_BlocNotExecute(Sender: TObject);
    procedure Ut_CalcExecute(Sender: TObject);
    procedure Ut_CalendExecute(Sender: TObject);
    procedure Ut_ExplorerExecute(Sender: TObject);
    procedure Ut_IExplorerExecute(Sender: TObject);
  private

  public

  end;

var
  menuPrin: TmenuPrin;

implementation

{$R *.lfm}

{ TmenuPrin }

procedure TmenuPrin.Image1Click(Sender: TObject);
var
  Processo: TProcess;
begin
  Processo:=TProcess.Create(nil);
  try
    Processo.Executable:= 'C:\Windows\notepad.exe';
    Processo.Options := [poNoConsole];
    Processo.Execute;
  finally
    Processo.Free;
  end;

end;

procedure TmenuPrin.Ut_BlocNotExecute(Sender: TObject);
var
  Processo: TProcess;
begin
  Processo:=TProcess.Create(nil);
  try
    Processo.Executable:= 'C:\Windows\notepad.exe';
    Processo.Options := [poNoConsole];
    Processo.Execute;
  finally
    Processo.Free;
  end;

end;

procedure TmenuPrin.Ut_CalcExecute(Sender: TObject);
var
  Processo: TProcess;
begin
  Processo:=TProcess.Create(nil);
  try
    Processo.Executable:= 'C:\Windows\System32\calc.exe';
    Processo.Options := [poNoConsole];
    Processo.Execute;
  finally
    Processo.Free;
  end;

end;

procedure TmenuPrin.Ut_CalendExecute(Sender: TObject);
begin
  // Correção: Adicionado o 'T' antes de frmcalendario (se o nome da classe for Tfrmcalendario)
  Application.CreateForm(TCalendario, Calendario);
  try
    calendario.ShowModal;
  finally
    calendario.Free;
    calendario := nil;
  end;
end;


procedure TmenuPrin.Ut_ExplorerExecute(Sender: TObject);
var
  Processo: TProcess;
begin
  Processo:=TProcess.Create(nil);
  try
    Processo.Executable:= 'C:\Windows\explorer.exe';
    Processo.Options := [poNoConsole];
    Processo.Execute;
  finally
    Processo.Free;
  end;
end;

procedure TmenuPrin.Ut_IExplorerExecute(Sender: TObject);
var
  Processo: TProcess;
begin
  Processo:=TProcess.Create(nil);
  try
    Processo.Executable:= 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe' ;
    Processo.Options := [poNoConsole];
    Processo.Execute;
  finally
    Processo.Free;
  end;

end;


end.


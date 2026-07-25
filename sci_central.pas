unit Sci_Central;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ActnList,
  Menus;

type

  { TmenuPrin }

  TmenuPrin = class(TForm)
    Action1: TAction;
    Cad_EntLiv: TAction;
    Tab_Ufs: TAction;
    Tab_Categ: TAction;
    Tab_Ativ: TAction;
    Cad_Livro: TAction;
    Action3: TAction;
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
  private

  public

  end;

var
  menuPrin: TmenuPrin;

implementation

{$R *.lfm}

{ TmenuPrin }

procedure TmenuPrin.Image1Click(Sender: TObject);
begin

end;

end.


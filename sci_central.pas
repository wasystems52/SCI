unit Sci_Central;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ActnList;

type

  { TmenuPrin }

  TmenuPrin = class(TForm)
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


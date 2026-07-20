unit Sci_Central;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TmenuPrin }

  TmenuPrin = class(TForm)
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


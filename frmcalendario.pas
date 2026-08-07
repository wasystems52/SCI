unit frmcalendario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Calendar,
  DateTimePicker;

type

  { TCalendario }

  TCalendario = class(TForm)
    Calendar1: TCalendar;
    procedure FormActivate(Sender: TObject);
  private

  public

  end;

var
  Calendario: TCalendario;

implementation

{$R *.lfm}

{ TCalendario }

procedure TCalendario.FormActivate(Sender: TObject);
begin
  //Calendar1.Date := Date;
end;

end.


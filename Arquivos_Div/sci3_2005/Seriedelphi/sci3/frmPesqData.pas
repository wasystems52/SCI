unit frmPesqData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TpesqData = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    pesqData1: TDateTimePicker;
    pesqData2: TDateTimePicker;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pesqData: TpesqData;

implementation

uses frmFormPadrao1;

{$R *.dfm}

procedure TpesqData.FormActivate(Sender: TObject);
  begin
        pesqData.Caption:= tarefa;
        Label1.Caption:= nomeJanela;
        pesqData1.Date:= date;
        pesqData2.Date:= date;
        pesqData1.SetFocus;
  end;

procedure TpesqData.Button1Click(Sender: TObject);
  begin
        tarefaClick:= 0;
        Close;
  end;

procedure TpesqData.Button2Click(Sender: TObject);
  begin
        tarefaclick:= 1;

        valdata1:= dateToStr(pesqData1.Date);
        valdata2:= dateToStr(pesqData2.Date);

        val1:= copy(valData1,4,2) + '/' + copy(valData1,1,2) + '/' + copy(valData1,7,4);
        val2:= copy(valData2,4,2) + '/' + copy(valData2,1,2) + '/' + copy(valData2,7,4);
 
        close;
  end;

end.

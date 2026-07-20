unit frmDM;

interface

uses
  SysUtils, Classes, IBDatabase, DB;

type
  TDM = class(TDataModule)
    IBDatabase1: TIBDatabase;
    Trans: TIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.

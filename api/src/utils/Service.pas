unit Service;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs,
  ApiHorse;

type
  TService2 = class(TService)
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceDestroy(Sender: TObject);
  private
    { Private declarations }
    FApiHorse: TApiHorse;
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  Service2: TService2;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  Service2.Controller(CtrlCode);
end;

function TService2.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TService2.ServiceCreate(Sender: TObject);
begin
  FApiHorse := TApiHorse.Create;

  FApiHorse.IniciarHorse;
end;

procedure TService2.ServiceDestroy(Sender: TObject);
begin
  FreeAndNil(FApiHorse);
end;

procedure TService2.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  FApiHorse.PararHorse;
end;

end.

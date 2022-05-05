program DocumentosFiscaisApi;

uses
  Forms,
  Vcl.SvcMgr,
  UFormServiceTester in 'utils\UFormServiceTester.pas' {FormServiceTester},
  Service in 'utils\Service.pas' {Service2: TService};

{$R *.RES}

begin

  if DebugHook <> 0 then
  begin
    Forms.Application.Initialize;
    FormServiceTester := TFormServiceTester.Create(TService2);
    Application.CreateForm(TFormServiceTester, FormServiceTester);
  Application.CreateForm(TService2, Service2);
  Application.Run;
  end
  else
  begin
    if not Vcl.SvcMgr.Application.DelayInitialize or Vcl.SvcMgr.Application.Installing then
      Vcl.SvcMgr.Application.Initialize;

    Vcl.SvcMgr.Application.CreateForm(TService2, Service2);
    Vcl.SvcMgr.Application.Run;
  end;


end.

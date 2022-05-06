program DocumentosFiscaisApi;

uses
  Forms,
  Vcl.SvcMgr,
  UFormServiceTester in 'utils\UFormServiceTester.pas' {FormServiceTester},
  Service in 'utils\Service.pas' {Service2: TService},
  ACBr in 'shared\infra\acbr\ACBr.pas',
  ApiHorse in 'shared\infra\horse\ApiHorse.pas',
  Logger in 'shared\logger\Logger.pas';

{$R *.RES}

begin
  {$WARN SYMBOL_PLATFORM OFF}
  if DebugHook <> 0 then
  begin
    Forms.Application.Initialize;
    FormServiceTester := TFormServiceTester.Create(TService2);
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

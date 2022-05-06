unit ApiHorse;

interface

uses
  Horse,
  Horse.Core,
  Horse.Jhonson,
  Horse.Compression,
  Horse.JWT, Logger;

type
  TApiHorse = class
  private
    FHorse: THorseCore;
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    procedure IniciarHorse;
    procedure PararHorse;

    property Horse: THorseCore read FHorse;
  end;

implementation

{ TApiHorse }

procedure TApiHorse.IniciarHorse;
begin
  TLogger.GravarLog(tplGeral, 'Iniciando servidor na porta 9000', 'IniciarHorse');

  FHorse := THorse.GetInstance;

  THorse
    .Use(Compression())
    .Use(Jhonson)
    .Use(HorseJWT('5351fe3ab8bcb695f57b9e8178a720797ea2675d33b34db6d1e69a6adea80c52'));
  THorse.Listen(9500);
end;

procedure TApiHorse.PararHorse;
begin
  THorse.StopListen;
end;

end.

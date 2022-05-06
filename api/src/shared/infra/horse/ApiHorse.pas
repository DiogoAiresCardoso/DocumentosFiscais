unit ApiHorse;

interface

uses
  Horse,
  Horse.Core,
  Horse.Jhonson,
  Horse.Compression,
  Horse.JWT;

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
  FHorse := THorse.GetInstance;

  THorse
    .Use(Compression())
    .Use(Jhonson)
    .Use(HorseJWT('5351fe3ab8bcb695f57b9e8178a720797ea2675d33b34db6d1e69a6adea80c52'));
  THorse.Listen;
end;

procedure TApiHorse.PararHorse;
begin
  THorse.StopListen;
end;

end.

unit Logger;

interface

type
  TTipoLog = (tplAviso, tplErro, tplGeral);

  TLogger = class
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    class procedure GravarLog(pTipoLog: TTipoLog; psMsg: string; psMetodo: string = '');
  end;

implementation

uses SysUtils;

{ TLogger }

class procedure TLogger.GravarLog(pTipoLog: TTipoLog; psMsg, psMetodo: string);
var
  FArquivo: TextFile;
  FDiretorio: String;
  FNomeArquivo: String;
  callStack: string;
begin
  try
    FNomeArquivo := 'DAC_Api_' + FormatDateTime('DD_MM_YYYY', Now) + '.log';
    FDiretorio :=  ExtractFileDir(GetCurrentDir) + '\log';

    if not DirectoryExists(FDiretorio) then
      ForceDirectories(FDiretorio);

    AssignFile(FArquivo, FDiretorio + '\' + FNomeArquivo);
    ReWrite(FArquivo);

    WriteLn(FArquivo, psMetodo + ' (' + FormatDateTime('HH:MM:SS', Now) + ') - ' + psMsg);
  finally
    CloseFile(FArquivo);
  end;
end;

end.

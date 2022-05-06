unit ACBr;

interface

uses

  ACBrMDFeDAMDFeClass, ACBrMDFeDAMDFEFR, ACBrMDFe, ACBrDFeReport, ACBrDFeDANFeReport,
  ACBrNFeDANFEClass, ACBrNFeDANFEFR, ACBrBase, ACBrDFe, ACBrNFe, ACBrCTeDACTEClass, ACBrCTeDACTEFR, ACBrCTe;

type

  TTipoACBR = (taNFe, taMDFe, taCTe);

  TApiACBr = class
  private
    { private declarations }
    FAcbrNFe: TACBrNFe;
    FAcbrMDFe: TACBrMDFe;
    FAcbrCTe: TACBrCTe;
  protected
    { protected declarations }
    FTipoACBR: TTipoACBR;
  public
    { public declarations }
    constructor Create(pTipoACBR: TTipoACBR);
    destructor Destroy; override;

    property NFe: TACBrNFe read FAcbrNFe;
    property MDFe: TACBrMDFe read FAcbrMDFe;
    property CTe: TACBrCTe read FAcbrCTe;
  end;


implementation

uses SysUtils;


{ TApiACBr }

constructor TApiACBr.Create(pTipoACBR: TTipoACBR);
begin
  case pTipoACBR of
    taNFe: FAcbrNFe := TACBrNFe.Create(nil);
    taMDFe: FAcbrMDFe := TACBrMDFe.Create(nil);
    taCTe: FAcbrCTe := TACBrCTe.Create(nil);
  end;
end;

destructor TApiACBr.Destroy;
begin
  case FTipoACBR of
    taNFe: FreeAndNil(FAcbrNFe);
    taMDFe: FreeAndNil(FAcbrMDFe);
    taCTe: FreeAndNil(FAcbrCTe);
  end;
  inherited Destroy;
end;

end.

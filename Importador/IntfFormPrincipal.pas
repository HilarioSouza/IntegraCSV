unit IntfFormPrincipal;

interface

uses uFTDI;

type
  IFormPrincipal = Interface
  ['{AC29D232-1F50-407C-86B7-EDF3162364C2}']
    procedure SetFTDI(const Value:TFTDI);
    function GetFTDI: TFTDI;
    //
    property FTDI: TFTDI read GetFTDI write SetFTDI;
  End;

implementation

end.

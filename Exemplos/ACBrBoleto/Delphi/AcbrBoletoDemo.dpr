program AcbrBoletoDemo;

uses
  Forms,
  uDemoBoleto in 'uDemoBoleto.pas' {frmDemoBoleto};

{$R *.res}
begin
  Application.Initialize;
  Application.CreateForm(TfrmDemo, frmDemo);
  Application.Run;
end.

{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit ACBr_NFSeX;

{$warn 5023 off : no warning about unused units}
interface

uses
  ACBrNFSeXReg, ACBrNFSeX, ACBrNFSeXConfiguracoes, ACBrNFSeXNotasFiscais, ACBrNFSeXParametros, 
  ACBrNFSeXWebservices, ACBrNFSeXClass, ACBrNFSeXConsts, ACBrNFSeXConversao, ACBrNFSeXInterface, 
  ACBrNFSeXGravarXml, ACBrNFSeXGravarXml_ABRASFv1, ACBrNFSeXGravarXml_ABRASFv2, ACBrNFSeXLerXml, 
  ACBrNFSeXLerXml_ABRASFv1, ACBrNFSeXLerXml_ABRASFv2, ACBrNFSeXProviderABRASFv1, ACBrNFSeXProviderABRASFv2, 
  ACBrNFSeXProviderBase, ACBrNFSeXProviderManager, ACBrNFSeXProviderProprio, ACBrNFSeXWebserviceBase, 
  ACBrNFSeXWebservicesResponse, ACBrNFSeXDANFSeClass, Abaco.GravarXml, Abaco.LerXml, Abaco.Provider, 
  ABase.GravarXml, ABase.LerXml, ABase.Provider, Actcon.GravarXml, Actcon.LerXml, Actcon.Provider, 
  Adm.GravarXml, Adm.LerXml, Adm.Provider, ADPM.GravarXml, ADPM.LerXml, ADPM.Provider, AEG.GravarXml, 
  AEG.LerXml, AEG.Provider, Agili.GravarXml, Agili.LerXml, Agili.Provider, AssessorPublico.GravarXml, 
  AssessorPublico.LerXml, AssessorPublico.Provider, Asten.GravarXml, Asten.LerXml, Asten.Provider, 
  Bauhaus.GravarJson, Bauhaus.LerJson, Bauhaus.Provider, Betha.GravarXml, Betha.LerXml, Betha.Provider, 
  BHISS.GravarXml, BHISS.LerXml, BHISS.Provider, Centi.GravarXml, Centi.LerXml, Centi.Provider, 
  CIGA.GravarXml, CIGA.LerXml, CIGA.Provider, Citta.GravarXml, Citta.LerXml, Citta.Provider, 
  Conam.GravarXml, Conam.LerXml, Conam.Provider, Contass.GravarXml, Contass.LerXml, Contass.Provider, 
  Coplan.GravarXml, Coplan.LerXml, Coplan.Provider, CTA.GravarXml, CTA.LerXml, CTA.Provider, 
  CTAConsult.GravarXml, CTAConsult.LerXml, CTAConsult.Provider, DataSmart.GravarXml, DataSmart.LerXml, 
  DataSmart.Provider, DBSeller.GravarXml, DBSeller.LerXml, DBSeller.Provider, DeISS.GravarXml, DeISS.LerXml, 
  DeISS.Provider, Desenvolve.GravarXml, Desenvolve.LerXml, Desenvolve.Provider, Digifred.GravarXml, 
  Digifred.LerXml, Digifred.Provider, DSF.GravarXml, DSF.LerXml, DSF.Provider, eGoverneISS.GravarXml, 
  eGoverneISS.LerXml, eGoverneISS.Provider, eISS.GravarJson, eISS.LerJson, eISS.Provider, EL.GravarXml, 
  EL.LerXml, EL.Provider, EloTech.GravarXml, EloTech.LerXml, EloTech.Provider, Equiplano.GravarXml, 
  Equiplano.LerXml, Equiplano.Provider, eReceita.GravarXml, eReceita.LerXml, eReceita.Provider, 
  Etherium.GravarXml, Etherium.LerXml, Etherium.Provider, Facundo.GravarXml, Facundo.LerXml, 
  Facundo.Provider, FGMaiss.GravarXml, FGMaiss.LerXml, FGMaiss.Provider, fintelISS.GravarXml, 
  fintelISS.LerXml, fintelISS.Provider, Fiorilli.GravarXml, Fiorilli.LerXml, Fiorilli.Provider, 
  Fisco.GravarXml, Fisco.LerXml, Fisco.Provider, FISSLex.GravarXml, FISSLex.LerXml, FISSLex.Provider, 
  Futurize.GravarXml, Futurize.LerXml, Futurize.Provider, GeisWeb.GravarXml, GeisWeb.LerXml, 
  GeisWeb.Provider, geNFe.GravarXml, geNFe.LerXml, geNFe.Provider, GestaoISS.GravarXml, GestaoISS.LerXml, 
  GestaoISS.Provider, Giap.GravarXml, Giap.LerXml, Giap.Provider, Ginfes.GravarXml, Ginfes.LerXml, 
  Ginfes.Provider, Giss.GravarXml, Giss.LerXml, Giss.Provider, GovBr.GravarXml, GovBr.LerXml, 
  GovBr.Provider, GovDigital.GravarXml, GovDigital.LerXml, GovDigital.Provider, Governa.GravarXml, 
  Governa.LerXml, Governa.Provider, Horus.GravarXml, Horus.LerXml, Horus.Provider, iiBrasil.GravarXml, 
  iiBrasil.LerXml, iiBrasil.Provider, Infisc.GravarXml, Infisc.LerXml, Infisc.Provider, Intertec.GravarXml, 
  Intertec.LerXml, Intertec.Provider, IPM.GravarXml, IPM.LerXml, IPM.Provider, ISSBarueri.GravarXml, 
  ISSBarueri.LerXml, ISSBarueri.Provider, ISSCamacari.GravarXml, ISSCamacari.LerXml, ISSCamacari.Provider, 
  ISSCambe.GravarXml, ISSCambe.LerXml, ISSCambe.Provider, ISSCuritiba.GravarXml, ISSCuritiba.LerXml, 
  ISSCuritiba.Provider, ISSDigital.GravarXml, ISSDigital.LerXml, ISSDigital.Provider, ISSDSF.GravarXml, 
  ISSDSF.LerXml, ISSDSF.Provider, ISSe.GravarXml, ISSe.LerXml, ISSe.Provider, ISSFortaleza.GravarXml, 
  ISSFortaleza.LerXml, ISSFortaleza.Provider, ISSGoiania.GravarXml, ISSGoiania.LerXml, ISSGoiania.Provider, 
  ISSIntel.GravarXml, ISSIntel.LerXml, ISSIntel.Provider, ISSJoinville.GravarXml, ISSJoinville.LerXml, 
  ISSJoinville.Provider, ISSLegal.GravarXml, ISSLegal.LerXml, ISSLegal.Provider, ISSLencois.GravarXml, 
  ISSLencois.LerXml, ISSLencois.Provider, ISSNatal.GravarXml, ISSNatal.LerXml, ISSNatal.Provider, 
  ISSNet.GravarXml, ISSNet.LerXml, ISSNet.Provider, ISSPortoVelho.GravarXml, ISSPortoVelho.LerXml, 
  ISSPortoVelho.Provider, ISSRecife.GravarXml, ISSRecife.LerXml, ISSRecife.Provider, ISSRio.GravarXml, 
  ISSRio.LerXml, ISSRio.Provider, ISSSalvador.GravarXml, ISSSalvador.LerXml, ISSSalvador.Provider, 
  ISSSaoPaulo.GravarXml, ISSSaoPaulo.LerXml, ISSSaoPaulo.Provider, ISSSJP.GravarXml, ISSSJP.LerXml, 
  ISSSJP.Provider, ISSVitoria.GravarXml, ISSVitoria.LerXml, ISSVitoria.Provider, Lexsom.GravarXml, 
  Lexsom.LerXml, Lexsom.Provider, Libre.GravarXml, Libre.LerXml, Libre.Provider, Link3.GravarXml, 
  Link3.LerXml, Link3.Provider, MegaSoft.GravarXml, MegaSoft.LerXml, MegaSoft.Provider, 
  MetropolisWeb.GravarXml, MetropolisWeb.LerXml, MetropolisWeb.Provider, Mitra.GravarXml, Mitra.LerXml, 
  Mitra.Provider, ModernizacaoPublica.GravarXml, ModernizacaoPublica.LerXml, ModernizacaoPublica.Provider, 
  NEAInformatica.GravarXml, NEAInformatica.LerXml, NEAInformatica.Provider, NFSeBrasil.GravarXml, 
  NFSeBrasil.LerXml, NFSeBrasil.Provider, NotaInteligente.GravarXml, NotaInteligente.LerXml, 
  NotaInteligente.Provider, PadraoNacional.GravarXml, PadraoNacional.LerXml, PadraoNacional.Provider, 
  Prescon.GravarJson, Prescon.LerJson, Prescon.Provider, PriMax.GravarXml, PriMax.LerXml, PriMax.Provider, 
  Prodata.GravarXml, Prodata.LerXml, Prodata.Provider, Pronim.GravarXml, Pronim.LerXml, Pronim.Provider, 
  Publica.GravarXml, Publica.LerXml, Publica.Provider, PublicSoft.GravarXml, PublicSoft.LerXml, 
  PublicSoft.Provider, RLZ.GravarXml, RLZ.LerXml, RLZ.Provider, Saatri.GravarXml, Saatri.LerXml, 
  Saatri.Provider, SafeWeb.GravarXml, SafeWeb.LerXml, SafeWeb.Provider, SH3.GravarXml, SH3.LerXml, 
  SH3.Provider, Siam.GravarXml, Siam.LerXml, Siam.Provider, SiapNet.GravarXml, SiapNet.LerXml, 
  SiapNet.Provider, Siappa.GravarXml, Siappa.LerXml, Siappa.Provider, SiapSistemas.GravarXml, 
  SiapSistemas.LerXml, SiapSistemas.Provider, Siat.GravarXml, Siat.LerXml, Siat.Provider, SigCorp.GravarXml, 
  SigCorp.LerXml, SigCorp.Provider, Sigep.GravarXml, Sigep.LerXml, Sigep.Provider, SigISS.GravarXml, 
  SigISS.LerXml, SigISS.Provider, SigISSWeb.GravarXml, SigISSWeb.LerXml, SigISSWeb.Provider, 
  SilTecnologia.GravarXml, SilTecnologia.LerXml, SilTecnologia.Provider, Simple.GravarXml, Simple.LerXml, 
  Simple.Provider, SimplISS.GravarXml, SimplISS.LerXml, SimplISS.Provider, Sintese.GravarXml, 
  Sintese.LerXml, Sintese.Provider, SisPMJP.GravarXml, SisPMJP.LerXml, SisPMJP.Provider, 
  Sistemas4R.GravarXml, Sistemas4R.LerXml, Sistemas4R.Provider, SmarAPD.GravarXml, SmarAPD.LerXml, 
  SmarAPD.Provider, SoftPlan.GravarXml, SoftPlan.LerXml, SoftPlan.Provider, SpeedGov.GravarXml, 
  SpeedGov.LerXml, SpeedGov.Provider, SSInformatica.GravarXml, SSInformatica.LerXml, SSInformatica.Provider, 
  Sudoeste.GravarXml, Sudoeste.LerXml, Sudoeste.Provider, SysISS.GravarXml, SysISS.LerXml, SysISS.Provider, 
  SystemPro.GravarXml, SystemPro.LerXml, SystemPro.Provider, TcheInfo.GravarXml, TcheInfo.LerXml, 
  TcheInfo.Provider, Tecnos.GravarXml, Tecnos.LerXml, Tecnos.Provider, Thema.GravarXml, Thema.LerXml, 
  Thema.Provider, Tinus.GravarXml, Tinus.LerXml, Tinus.Provider, Tiplan.GravarXml, Tiplan.LerXml, 
  Tiplan.Provider, Tributus.GravarXml, Tributus.LerXml, Tributus.Provider, VersaTecnologia.GravarXml, 
  VersaTecnologia.LerXml, VersaTecnologia.Provider, Virtual.GravarXml, Virtual.LerXml, Virtual.Provider, 
  WebFisco.GravarXml, WebFisco.LerXml, WebFisco.Provider, WebISS.GravarXml, WebISS.LerXml, WebISS.Provider, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('ACBrNFSeXReg', @ACBrNFSeXReg.Register);
end;

initialization
  RegisterPackage('ACBr_NFSeX', @Register);
end.

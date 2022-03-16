{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:  Rafael Teno Dias                               }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida - daniel@projetoacbr.com.br - www.projetoacbr.com.br}
{       Rua Coronel Aureliano de Camargo, 963 - Tatu� - SP - 18270-170         }
{******************************************************************************}

{$I ACBr.inc}

unit ACBrXmlBase;

interface

uses
  Classes, SysUtils,
  ACBrXmlDocument;

type
  TACBrTipoAmbiente = (taProducao, taHomologacao);

  TACBrTipoEmissao = (teNormal, teContingencia, teSCAN, teDPEC, teFSDA, teSVCAN,
                      teSVCRS, teSVCSP, teOffLine);

  TACBrTagAssinatura = (taSempre, taNunca, taSomenteSeAssinada,
                        taSomenteParaNaoAssinada);

  TACBrTipoCampo = (tcStr, tcInt, tcInt64, tcDat, tcDatHor, tcEsp, tcDe2, tcDe3,
                    tcDe4, tcDe5, tcDe6, tcDe7, tcDe8, tcDe10, tcHor, tcDatCFe,
                    tcHorCFe, tcDatVcto, tcDatHorCFe, tcBool, tcStrOrig, tcNumStr);

const
  LineBreak = #13#10;

function FiltrarTextoXML(const RetirarEspacos: boolean; aTexto: String;
  RetirarAcentos: boolean = True; SubstituirQuebrasLinha: Boolean = True;
  const QuebraLinha: String = ';'): String;

function StrToEnumerado(out ok: boolean; const s: string; const AString: array of string;
  const AEnumerados: array of variant): variant;

function EnumeradoToStr(const t: variant; const AString:
  array of string; const AEnumerados: array of variant): variant;

function RemoverIdentacao(const AXML: string): string;
function XmlToStr(const AXML: string): string;
function StrToXml(const AXML: string): string;
function IncluirCDATA(const aXML: string): string;
function RemoverCDATA(const aXML: string): string;
function RemoverPrefixos(const aXML: string; APrefixo: array of string): string;
function RemoverPrefixosDesnecessarios(const aXML: string): string;
function RemoverCaracteresDesnecessarios(const aXML: string): string;

function ObterConteudoTag(const AAtt: TACBrXmlAttribute): string; overload;
function ObterConteudoTag(const ANode: TACBrXmlNode; const Tipo: TACBrTipoCampo): variant; overload;

function EncodeDataHora(const DataStr: string;
  const FormatoData: string = 'YYYY/MM/DD'): TDateTime;

function TipoEmissaoToStr(const t: TACBrTipoEmissao): string;
function StrToTipoEmissao(out ok: boolean; const s: string): TACBrTipoEmissao;

function TipoAmbienteToStr(const t: TACBrTipoAmbiente): string;
function StrToTipoAmbiente(out ok: boolean; const s: string): TACBrTipoAmbiente;

implementation

uses
  StrUtilsEx, ACBrUtil, DateUtils, MaskUtils;

function FiltrarTextoXML(const RetirarEspacos: boolean; aTexto: String;
  RetirarAcentos: boolean; SubstituirQuebrasLinha: Boolean;
  const QuebraLinha: String): String;
begin
  if RetirarAcentos then
     aTexto := TiraAcentos(aTexto);

  aTexto := ParseText(AnsiString(aTexto), False );

  if RetirarEspacos then
  begin
    while pos('  ', aTexto) > 0 do
      aTexto := FaststringReplace(aTexto, '  ', ' ', [rfReplaceAll]);
  end;

  if SubstituirQuebrasLinha then
    aTexto := ChangeLineBreak( aTexto, QuebraLinha);

  Result := Trim(aTexto);
end;

function StrToEnumerado(out ok: boolean; const s: string; const AString:
  array of string; const AEnumerados: array of variant): variant;
var
  i: integer;
begin
  result := -1;
  for i := Low(AString) to High(AString) do
    if AnsiSameText(s, AString[i]) then
      result := AEnumerados[i];
  ok := result <> -1;
  if not ok then
    result := AEnumerados[0];
end;

function EnumeradoToStr(const t: variant; const AString:
  array of string; const AEnumerados: array of variant): variant;
var
  i: integer;
begin
  result := '';
  for i := Low(AEnumerados) to High(AEnumerados) do
    if t = AEnumerados[i] then
      result := AString[i];
end;

function RemoverIdentacao(const AXML: string): string;
var
  XMLe, XMLs: string;
begin
  XMLe := AXML;
  XMLs := '';

  while XMLe <> XMLs do
  begin
    if XMLs <> '' then
      XMLe := XMLs;

    XMLs := FaststringReplace(XMLe, ' <', '<', [rfReplaceAll]);
    XMLs := FaststringReplace(XMLs, #13 + '<', '<', [rfReplaceAll]);
    XMLs := FaststringReplace(XMLs, '> ', '>', [rfReplaceAll]);
    XMLs := FaststringReplace(XMLs, '>' + #13, '>', [rfReplaceAll]);
    XMLs := FaststringReplace(XMLs, #$D, '', [rfReplaceAll]);
  end;

  Result := XMLs;
end;

function XmlToStr(const AXML: string): string;
begin
  Result := FaststringReplace(AXML, '<', '&lt;', [rfReplaceAll]);
  Result := FaststringReplace(Result, '>', '&gt;', [rfReplaceAll]);
end;


function StrToXml(const AXML: string): string;
begin
  Result := FaststringReplace(AXML, '&lt;', '<', [rfReplaceAll]);
  Result := FaststringReplace(Result, '&gt;', '>', [rfReplaceAll]);
  Result := FaststringReplace(Result, '&quot;', '"', [rfReplaceAll]);
end;

function IncluirCDATA(const aXML: string): string;
begin
  Result := '<![CDATA[' + aXML + ']]>';
end;

function RemoverCDATA(const aXML: string): string;
begin
  Result := FaststringReplace(aXML, '<![CDATA[', '', [rfReplaceAll]);
  Result := FaststringReplace(Result, ']]>', '', [rfReplaceAll]);
end;

function RemoverPrefixos(const aXML: string; APrefixo: array of string): string;
var
  i: Integer;
begin
  Result := aXML;

  if (Result = '') or (Length(APrefixo) = 0) then
    exit ;

  for i := Low(APrefixo) to High(APrefixo) do
    Result := FaststringReplace(FaststringReplace(Result, '<' + APrefixo[i], '<', [rfReplaceAll]),
                          '</' + APrefixo[i], '</', [rfReplaceAll]);
end;

function RemoverPrefixosDesnecessarios(const aXML: string): string;
begin
  Result := RemoverPrefixos(aXML, ['ns1:', 'ns2:', 'ns3:', 'ns4:', 'ns5:', 'tc:',
              'ii:', 'p1:']);
end;

function RemoverCaracteresDesnecessarios(const aXML: string): string;
begin
  Result := FaststringReplace(aXML, ''#$A'', '', [rfReplaceAll]);
  Result := FaststringReplace(Result, ''#$A#$A'', '', [rfReplaceAll]);
  Result := FaststringReplace(Result, '<br >', ';', [rfReplaceAll]);
  Result := FaststringReplace(Result, '<br>', ';', [rfReplaceAll]);
  Result := FaststringReplace(Result, '&#xD;', '', [rfReplaceAll]);
  Result := FaststringReplace(Result, '&#xd;', '', [rfReplaceAll]);
  Result := FaststringReplace(Result, '&amp;lt;', '', [rfReplaceAll]);
  Result := FaststringReplace(Result, '&amp;gt;', '', [rfReplaceAll]);
  Result := FaststringReplace(Result, '&#13;', '', [rfReplaceAll]);
  Result := FaststringReplace(Result, #9, '', [rfReplaceAll]);
  Result := FaststringReplace(Result, #10, '', [rfReplaceAll]);
  Result := FaststringReplace(Result, #13, '', [rfReplaceAll]);
end;

function ObterConteudoTag(const AAtt: TACBrXmlAttribute): string; overload;
begin
  if not Assigned(AAtt) or (AAtt = nil) then
    Result := ''
  else
    Result := Trim(AAtt.Content);
end;

function ObterConteudoTag(const ANode: TACBrXmlNode; const Tipo: TACBrTipoCampo): variant;
var
  ConteudoTag: string;
  iDecimais: Integer;
  aFloatIsIntString: Boolean;
begin
  if not Assigned(ANode) or (ANode = nil) then
  begin
    ConteudoTag := '';
    aFloatIsIntString := False;
  end
  else
  begin
    ConteudoTag := Trim(ANode.Content);
    aFloatIsIntString := ANode.FloatIsIntString;
  end;

  case Tipo of
    tcStr,
    tcEsp:
      result := ConteudoTag;

    tcDat,
    tcDatHor,
    tcDatCFe,
    tcDatHorCFe:
      begin
        if length(ConteudoTag) > 0 then
          result := EncodeDataHora(ConteudoTag, 'YYYY/MM/DD')
        else
          result := 0;
      end;

    tcDatVcto:
      begin
        if length(ConteudoTag) > 0 then
          result := EncodeDataHora(ConteudoTag, 'DD/MM/YYYY')
        else
          result := 0;
      end;

    tcHor:
      begin
        if length(ConteudoTag) > 0 then
          result := EncodeTime(StrToInt(copy(ConteudoTag, 1, 2)),
                               StrToInt(copy(ConteudoTag, 4, 2)),
                               StrToInt(copy(ConteudoTag, 7, 2)), 0)
        else
          result := 0;
      end;

    tcHorCFe:
      begin
        if length(ConteudoTag) > 0 then
          result := EncodeTime(StrToInt(copy(ConteudoTag, 1, 2)),
                               StrToInt(copy(ConteudoTag, 3, 2)),
                               StrToInt(copy(ConteudoTag, 5, 2)), 0)
        else
          result := 0;
      end;

    tcDe2, tcDe3, tcDe4, tcDe5, tcDe6, tcDe7, tcDe8, tcDe10:
      begin
        if aFloatIsIntString then
        begin
          case Tipo of
            tcDe2:  iDecimais := 2;
            tcDe3:  iDecimais := 3;
            tcDe4:  iDecimais := 4;
            tcDe5:  iDecimais := 5;
            tcDe6:  iDecimais := 6;
            tcDe7:  iDecimais := 7;
            tcDe8:  iDecimais := 8;
            tcDe10: iDecimais := 10;
          else
            iDecimais := 2;
          end;

          Result := StringDecimalToFloat(ConteudoTag, iDecimais);
        end
        else
          Result := StringToFloatDef(ConteudoTag, 0);
      end;

    tcInt:
      begin
        if length(ConteudoTag) > 0 then
          result := StrToIntDef(OnlyNumber(ConteudoTag), 0)
        else
          result := 0;
      end;

    tcInt64:
      begin
        if length(ConteudoTag) > 0 then
          result := StrToInt64Def(OnlyNumber(ConteudoTag), 0)
        else
          result := 0;
      end;

    tcBool:
      begin
        if length(ConteudoTag) > 0 then
          result := StrToBool(ConteudoTag)
        else
          result := False;
      end;

    tcStrOrig:
      begin
        // Falta implementar
        Result := '';
      end;

    tcNumStr:
      begin
        // Falta implementar
        Result := '';
      end

  else
    raise Exception.Create('Node <' + ANode.Name + '> com conte�do inv�lido. ' +
                           ConteudoTag);
  end;
end;

function EncodeDataHora(const DataStr: string;
  const FormatoData: string = 'YYYY/MM/DD'): TDateTime;
var
  xData, xFormatoData: string;
begin
  xData := Trim(StringReplace(DataStr, '-', '/', [rfReplaceAll]));

  if xData = '' then
    Result := 0
  else
  begin
    xFormatoData := FormatoData;

    if xFormatoData = '' then
      xFormatoData := 'YYYY/MM/DD';

    case Length(xData) of
      6: xData := FormatMaskText('!0000\/00;0;_', xData) + '/01';
      8: xData := FormatMaskText('!0000\/00\/00;0;_', xData);
    end;

    Result := StringToDateTime(xData, xFormatoData);
  end;
end;

function TipoEmissaoToStr(const t: TACBrTipoEmissao): string;
begin
  result := EnumeradoToStr(t, ['1', '2', '3', '4', '5', '6', '7', '8', '9'],
                              [teNormal, teContingencia, teSCAN, teDPEC, teFSDA,
                               teSVCAN, teSVCRS, teSVCSP, teOffLine]);
end;

function StrToTipoEmissao(out ok: boolean; const s: string): TACBrTipoEmissao;
begin
  result := StrToEnumerado(ok, s, ['1', '2', '3', '4', '5', '6', '7', '8', '9'],
                              [teNormal, teContingencia, teSCAN, teDPEC, teFSDA,
                               teSVCAN, teSVCRS, teSVCSP, teOffLine]);
end;

function TipoAmbienteToStr(const t: TACBrTipoAmbiente): string;
begin
  result := EnumeradoToStr(t, ['1', '2'], [taProducao, taHomologacao]);
end;

function StrToTipoAmbiente(out ok: boolean; const s: string): TACBrTipoAmbiente;
begin
  result := StrToEnumerado(ok, s, ['1', '2'], [taProducao, taHomologacao]);
end;

end.

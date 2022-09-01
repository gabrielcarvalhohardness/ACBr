{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2022 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:  Gabriel Baltazar                               }
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

unit ACBrOpenDeliveryException;

interface

uses
  ACBrBase,
  Classes,
  SysUtils;

type
  EACBrOpenDeliveryException = class(EACBrException)
  public
    constructor Create(const AMsg: string);
    constructor CreateDef(const AMsg: string; ADummy: Integer = 0);
  end;

  EACBrOpenDeliveryHTTPException = class(EACBrOpenDeliveryException)
  private
    FStatus: Integer;
    FTitle: string;
  public
    constructor Create(const AStatus: Integer; const ATitle: string); reintroduce;

    property Status: Integer read FStatus;
    property Title: string read FTitle;
  end;

implementation

uses
  ACBrUtil.Strings;

{ EACBrOpenDeliveryException }

constructor EACBrOpenDeliveryException.Create(const AMsg: string);
begin
  inherited Create(ACBrStr(AMsg));
end;

constructor EACBrOpenDeliveryException.CreateDef(const AMsg: string; ADummy: Integer);
begin
  inherited Create(AMsg);
end;

{ EACBrOpenDeliveryHTTPException }

constructor EACBrOpenDeliveryHTTPException.Create(const AStatus: Integer; const ATitle: string);
var
  LMsg: string;
begin
  LMsg := Format('%d: %s', [AStatus, ATitle]);
  inherited Create(LMsg);
  FStatus := AStatus;
  FTitle := ATitle;
end;

end.


﻿using ACBrLib.Core.DFe;

namespace ACBrLib.NFe
{
    public sealed class EventoCCe : EventoNFeBase
    {
        #region Constructor

        public EventoCCe()
        {
            tpEvento = TipoEvento.teCCe;
        }

        #endregion Constructor

        #region Properties

        public string xCorrecao { get; set; }

        #endregion Properties
    }
}
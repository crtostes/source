using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Acto.Gratificacao.Entity
{ 
    public class entGratificacao
    {
        public int id_cotacao { get; set; }
        public string ds_logo { get; set; }
        public string ds_nome { get; set; }
        public string vl_premio { get; set; }
        public string nr_porcentagem_comissao { get; set; }
        public string vl_comissao { get; set; }
        public string nr_porcentagem_gratificacao { get; set; }
        public string vl_gratificacao { get; set; }
        public string fl_status_gratificacao { get; set; }
        public string dt_emissao { get; set; }
        public string bt_cotacao { get; set; }

    }
    public class entGratificacaoPagamento
    {
        public int id_cliente_indicado { get; set; }
        public string nr_mes_gratificacao { get; set; }
        public string ds_ano_gratificacao { get; set; }
        public string ds_mes_gratificacao { get; set; }
        public string vl_gratificacao { get; set; }
        public string dt_pagamento { get; set; }
        public string ds_comprovante_pdf { get; set; }
        public string bt_comprovante_pdf { get; set; }
        public string ds_status_gratificacao { get; set; }
        public string bt_emissoes { get; set; }
    }
}

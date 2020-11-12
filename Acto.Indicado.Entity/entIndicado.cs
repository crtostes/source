using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Acto.Indicado.Entity
{
    public class entIndicado
    {
        public int id_cliente { get; set; }
        public string ds_nome { get; set; }
        public DateTime dt_nascimento { get; set; }
        public DateTime dt_inclusao { get; set; }
        public string nr_cpf_cnpj { get; set; }
        public string tp_pessoa { get; set; }
        public string ds_email { get; set; }
        public string ds_rg { get; set; }
        public string ds_emissao { get; set; }
        public DateTime dt_emissao_rg { get; set; }
        public string ds_telefone_celular { get; set; }
        public string ds_telefone_comercial { get; set; }
        public int id_estado_civil { get; set; }
        public int id_genero { get; set; }
        public int id_usuario { get; set; }
        public int id_cliente_pj { get; set; }
        public int id_cliente_indicado { get; set; }
    }

    public class entIndicadoTexto
    {
        public string id_cliente { get; set; }
        public string ds_nome { get; set; }
        public string dt_nascimento { get; set; }
        public string dt_inclusao { get; set; }
        public string nr_cpf_cnpj { get; set; }
        public string tp_pessoa { get; set; }
        public string ds_email { get; set; }
        public string ds_rg { get; set; }
        public string ds_emissao { get; set; }
        public string dt_emissao_rg { get; set; }
        public string ds_telefone_celular { get; set; }
        public string ds_telefone_comercial { get; set; }
        public string id_estado_civil { get; set; }
        public string id_genero { get; set; }
        public string id_usuario { get; set; }
        public string id_cliente_pj { get; set; }
        public string id_cliente_indicado { get; set; }
    }
}

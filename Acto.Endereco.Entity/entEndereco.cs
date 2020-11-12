using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Acto.Endereco.Entity
{
    public class entEndereco
    {
        public int id_endereco { get; set; }
        public int id_cliente { get; set; }
        public int id_tipo_endereco { get; set; }
        public string ds_tipo_endereco { get; set; }
        public string ds_cep { get; set; }
        public string ds_endereco { get; set; }
        public string ds_numero { get; set; }
        public string ds_complemento { get; set; }
        public string ds_bairro { get; set; }
        public string ds_cidade { get; set; }
        public string ds_estado { get; set; }
        public DateTime dt_atualizacao { get; set; }
    }
    public class entEnderecoTexto
    {
        public string id_endereco { get; set; }
        public string id_cliente { get; set; }
        public string id_tipo_endereco { get; set; }
        public string ds_tipo_endereco { get; set; }
        public string ds_cep { get; set; }
        public string ds_endereco { get; set; }
        public string ds_numero { get; set; }
        public string ds_complemento { get; set; }
        public string ds_bairro { get; set; }
        public string ds_cidade { get; set; }
        public string ds_estado { get; set; }
        public string dt_atualizacao { get; set; }
    }
}

﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Acto.Empresa.Entity
{
    public class entEmpresa

    {
        public entEmpresa()
        {
            nr_cnpj = string.Empty;
            ds_nome_empresa = string.Empty;
            ds_endereco = string.Empty;
            ds_cidade = string.Empty;
            ds_estado = string.Empty;
        }
        public int id_empresa { get; set; }
        public int id_cliente { get; set; }
        public string nr_cnpj { get; set; }
        public string ds_nome_empresa { get; set; }
        public string ds_endereco { get; set; }
        public string ds_cidade { get; set; }
        public string ds_estado { get; set; }
        public DateTime dt_atualizacao { get; set; }

    }
    public class entEmpresaTexto
    {
        public string nr_cnpj { get; set; }
        public string ds_nome_empresa { get; set; }
        public string ds_endereco { get; set; }
        public string ds_cidade { get; set; }
        public string ds_estado { get; set; }      

    }
}

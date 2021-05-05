using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Acto.Usuario.Entity
{

    public class entUsuario
    {
        public string Nome { get; set; }
        public string Email { get; set; }
        public string CPF { get; set; }
        public string Senha { get; set; }

    }

    public class entFuncao
    {
        public int id_funcao { get; set; }
        public string cd_funcao { get; set; }
        public string ds_funcao { get; set; }
        

    }

}

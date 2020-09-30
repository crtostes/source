using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Usuario.Entity;
using Acto.Cliente.Entity;

namespace Acto.Infra.Contexto
{
    public class ActoContexto
    {
        public entUsuario Usuario { get; set; }
        public entCliente Cliente { get; set; }
    }
}

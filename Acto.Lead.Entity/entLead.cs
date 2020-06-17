using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Acto.Lead.Entity
{
    public class entLead
    {

        private string _nome;
        private string _telefone;
        private string _email;
        private string _assunto;
        public string Nome
        {
            get { return _nome; }
            set { _nome = value; }
        }

        public string Telefone
        {
            get { return _telefone ; }
            set { _telefone = value; }
        }

        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }

        public string Assunto
        {
            get { return _assunto; }
            set { _assunto = value; }
        }
    }
}

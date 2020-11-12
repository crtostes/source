using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acto.Indicado.Busines;
using Acto.Indicado.Entity;
using Acto.Infra.Contexto;
using Acto.Cliente.Busines;
using Acto.Cliente.Entity;
using Acto.Endereco.Busines;
using Acto.Endereco.Entity;


namespace actoseg.main.pages
{
    public partial class EnderecoIndicado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];

            //txtEmail.Text = objContexto.Usuario.Email;
            busCliente objBusCliente = new busCliente();
            entCliente objEntcliente = objBusCliente.ConsultarClienteEmail(objContexto.Usuario.Email);
            objContexto.Cliente = objEntcliente;
            HttpContext.Current.Session["contexto"] = objContexto;

            txtIdClienteIndicador.Text = objEntcliente.id_cliente.ToString();
        }
        [System.Web.Services.WebMethod]
        public static entEnderecoTexto wmConsultarEnderecoIndicado(int id_cliente)
        {
            //ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];
            ////txtEmail.Text = objContexto.Usuario.Email;
            busEndereco objBusEndereco = new busEndereco();
            entEnderecoTexto objEntEnderecoTexto = objBusEndereco.ConsultarEnderecoClienteTexto(id_cliente, 1);
            if (objEntEnderecoTexto is null)
            {
                return new entEnderecoTexto();
            }
            
            
            return objEntEnderecoTexto;            
        }
    }

}
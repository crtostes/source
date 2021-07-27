using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acto.Cotacao.Busines;
using Acto.Cotacao.Entity;
using Acto.Cliente.Busines;
using Acto.Cliente.Entity;
using Acto.Infra.Contexto;

namespace actoseg.main.pages
{
    public partial class GestaoCotacao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];
            if (objContexto == null) Response.Redirect("Login.aspx");
            
            //txtEmail.Text = objContexto.Usuario.Email;
            //busCliente objBusCliente = new busCliente();
            //entCliente objEntcliente = objBusCliente.ConsultarClienteEmail(objContexto.Usuario.Email);
            //objContexto.Cliente = objEntcliente;
            //HttpContext.Current.Session["contexto"] = objContexto;

            txtIdClienteIndicador.Text = objContexto.Cliente.id_cliente.ToString();
        }
        [System.Web.Services.WebMethod]
        public static string wmListaCotacoes(int pid_cliente)
        {
            ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];
            if (objContexto.TemPermissao("LSTTODCOT")) pid_cliente = 0;

            busCotacao objBus = new busCotacao();
            List<entCotacaoAutomovelGrid> objLst = objBus.ListarCotacoes(pid_cliente);
            var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return oSerializer.Serialize(objLst);
            //return objLstIndicado;
        }
    }
}
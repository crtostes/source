using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acto.Gratificacao.Busines;
using Acto.Gratificacao.Entity;
using Acto.Cliente.Busines;
using Acto.Cliente.Entity;
using Acto.Infra.Contexto;

namespace actoseg.main.pages
{
    public partial class Gratificacao : System.Web.UI.Page
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
        public static string wmListaGratificacaoPagamento(int pid_cliente_indicado)
        {
            busGratificacao objBus = new busGratificacao();
            List<entGratificacaoPagamento> objLst = objBus.ListarGratificacaoPagamento(pid_cliente_indicado);
            var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return oSerializer.Serialize(objLst);
            //return objLstIndicado;
        }
        [System.Web.Services.WebMethod]
        public static string wmListarGratificacaoMes(int pid_cliente_indicado, int pnr_mes_gratificacao)
        {
            busGratificacao objBus = new busGratificacao();
            List<entGratificacao> objLst = objBus.ListarGratificacaoMes(pid_cliente_indicado, pnr_mes_gratificacao);
            var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return oSerializer.Serialize(objLst);
            
        }
    }
}
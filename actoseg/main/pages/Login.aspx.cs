using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acto.Usuario.Busines;
using Acto.Usuario.Entity;
using Acto.Cliente.Busines;
using Acto.Cliente.Entity;
using Acto.Infra.Contexto;

namespace actoseg.main
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogar_Click(object sender, EventArgs e)
        {
           if (ValidaCamposLogin())
           {
                if (AutorizarAcesso())
                {


                   
                    Response.Redirect("Default.aspx");

                    

                }
                else
                {
                    lblMensagem.Text = "Usuário e Senha Incorretos!";

                }



           }

        }

        private bool ValidaCamposLogin()
        {
            if (txtLogin.Text == string.Empty)
            { 
                lblMensagem.Text = "Digite seu E-mail";
                return false;
            }

            if (string.IsNullOrEmpty(txtSenha.Text))
            {
                lblMensagem.Text = "Digite a sua Senha";
                return false;
            }

            return true;

        }

        private bool AutorizarAcesso()
        {
            #region Verificar USUARIO e SENHA
            busUsuario objBusUsuario = new busUsuario();
            entUsuario objEntUsuario = new entUsuario();

            objEntUsuario.Email = txtLogin.Text;
            objEntUsuario.Senha = txtSenha.Text;

            ActoContexto objContexto = new ActoContexto();
            objContexto.Usuario = objEntUsuario;

            busCliente objBusCliente = new busCliente();
            entCliente objEntcliente = objBusCliente.ConsultarClienteEmail(objEntUsuario.Email);
            if (objEntcliente != null)
            {
                objContexto.Cliente = objEntcliente;
                
            }

            HttpContext.Current.Session.Add("contexto", objContexto);

            if (objBusUsuario.ConsultarAcesso(objEntUsuario))
            { 
                
                return true;
            }
            #endregion

            return false;

        }



    }
}
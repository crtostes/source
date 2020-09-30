using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acto.Usuario.Busines;
using Acto.Usuario.Entity;

namespace actoseg.main.pages
{
    public partial class IncluirLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bntCadastrarLogin_Click(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static string wmIncluirLogin(string nome, string cpf, string email, string confirmar_email, string senha, string conf_senha)

        {

            busUsuario objBusUsuario = new busUsuario();
            entUsuario objEntUsuario = new entUsuario();

            #region Veriicar Dados Tela

            if (cpf.IsNullOrWhiteSpace()) return "CPF em branco!";
            
            if (objBusUsuario.ValidarCpf(cpf) != true) return "CPF Inválido, digito não confere!";

            if (nome.IsNullOrWhiteSpace()) return "Nome em branco!";
           
            if (email.IsNullOrWhiteSpace()) return "E-mail em branco!";

            if (objBusUsuario.ValidarEmail(email) != true) return "E-mail Inválido!";

            if (confirmar_email.IsNullOrWhiteSpace()) return "E-mail em branco!";
            
            if (email != confirmar_email) return "E-mail diferente do confirmado";
            
            if (senha.IsNullOrWhiteSpace()) return "Senha em branco!";
            
            if (conf_senha.IsNullOrWhiteSpace()) return "Confirmar Senha em branco!";
            
            if (senha != conf_senha) return "Senha diferente do confirmado";

            #endregion

            #region Gravar Novo USUARIO

            objEntUsuario.Nome = nome;
            objEntUsuario.Email = email;
            objEntUsuario.CPF = cpf.Replace(".","").Replace("-","");
            objEntUsuario.Senha = senha;

            if (objBusUsuario.ConsultarUsuarioCPF(objEntUsuario)) return "CPF já cadastrado!";

            
            if (objBusUsuario.ConsultarUsuarioEmail(objEntUsuario)) return "E-mail já cadastrado!";

            
            objBusUsuario.IncluirUsuario(objEntUsuario);
            
            #endregion

            return "OK";


        }
    }
}
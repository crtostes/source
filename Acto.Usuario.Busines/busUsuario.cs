using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Usuario.Data;
using Acto.Usuario.Entity;
using Acto.Cliente.Data;
using Acto.Cliente.Entity;
using Acto.Infra.Mail;

namespace Acto.Usuario.Busines
{
    public class busUsuario
    {
        public void IncluirUsuario(entUsuario pEntUsuario)
        {
            try
            {
                daoUsuario objDaoUsuario = new daoUsuario();
                objDaoUsuario.IncluirUsuario(pEntUsuario);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
            }
            finally
            {

            }

        }

        public bool ConsultarAcesso(entUsuario pEntUsuario)
        {
            try
            {
                daoUsuario objDaoUsuario = new daoUsuario();
                return objDaoUsuario.ConsultarAcesso(pEntUsuario);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return false;
            }

        }

        public bool ConsultarUsuarioEmail(entUsuario pEntUsuario)
        {
            try
            {
                daoUsuario objDaoUsuario = new daoUsuario();
                return objDaoUsuario.ConsultarUsuarioEmail(pEntUsuario);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return false;
            }

        }
        public string ConsultarRecuperarSenha(string pemail)
        {
            try
            {
                CaixaEmail objMail = new CaixaEmail();
                daoUsuario objDaoUsuario = new daoUsuario();
                daoCliente objdaoCliente = new daoCliente();
                string senha = objDaoUsuario.ConsultarRecuperarSenha(pemail);

                if (senha == "")
                {
                    throw new InvalidOperationException("E-mail informado não cadastrado!");
                };

                entCliente objEntCliente = objdaoCliente.ConsultarClienteEmail(pemail);
                
                objMail.EnviaEmailACTOSEG(pemail, objEntCliente.ds_nome,"ACTO ONLINE - RECUPERAÇÃO DE SENHA", RetornaBodyRecuperarSenha(objEntCliente.ds_nome,senha));
                return "OK";
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return ex.Message;
            }

        }

        public bool ConsultarUsuarioCPF(entUsuario pEntUsuario)
        {
            try
            {
                daoUsuario objDaoUsuario = new daoUsuario();
                return objDaoUsuario.ConsultarUsuarioCPF(pEntUsuario);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return false;
            }

        }
        public bool ValidarCpf(string cpf)
        {
            int[] multiplicador1 = new int[9] { 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] multiplicador2 = new int[10] { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            string tempCpf;
            string digito;
            int soma;
            int resto;
            cpf = cpf.Trim();
            cpf = cpf.Replace(".", "").Replace("-", "");
            if (cpf.Length != 11)
                return false;
            tempCpf = cpf.Substring(0, 9);
            soma = 0;

            for (int i = 0; i < 9; i++)
                soma += int.Parse(tempCpf[i].ToString()) * multiplicador1[i];
            resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;
            digito = resto.ToString();
            tempCpf = tempCpf + digito;
            soma = 0;
            for (int i = 0; i < 10; i++)
                soma += int.Parse(tempCpf[i].ToString()) * multiplicador2[i];
            resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;
            digito = digito + resto.ToString();
            return cpf.EndsWith(digito);
        }

        public bool ValidarEmail(String email)
        {
            bool emailValido = false;

            //Expressão regular retirada de
            //https://msdn.microsoft.com/pt-br/library/01escwtf(v=vs.110).aspx
            string emailRegex = string.Format("{0}{1}",
                @"^(?("")("".+?(?<!\\)""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))",
                @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9][\-a-z0-9]{0,22}[a-z0-9]))$");

            try
            {
                emailValido = System.Text.RegularExpressions.Regex.IsMatch(
                    email,
                    emailRegex);
            }
            catch (System.Text.RegularExpressions.RegexMatchTimeoutException)
            {
                emailValido = false;
            }

            return emailValido;
        }

        public List<entFuncao> PermissoesUsuario(entUsuario pEntUsuario) {

            
            List<entFuncao> lstFuncoes = new List<entFuncao>();
            if (pEntUsuario.CPF == "16252708879")
            {
                entFuncao objFuncao = new entFuncao();
                objFuncao.id_funcao = 1;
                objFuncao.cd_funcao = "ADMRESCAL";
                objFuncao.ds_funcao = "Administração do Resultado do Cálculo";
                lstFuncoes.Add(objFuncao);  
            }
            if (pEntUsuario.CPF == "16252708879")
            {
                entFuncao objFuncao = new entFuncao();
                objFuncao.id_funcao = 2;
                objFuncao.cd_funcao = "CONTODCOT";
                objFuncao.ds_funcao = "Consulta Todas Cotações";
                lstFuncoes.Add(objFuncao);
            }
            if (pEntUsuario.CPF == "16252708879")
            {
                entFuncao objFuncao = new entFuncao();
                objFuncao.id_funcao = 3;
                objFuncao.cd_funcao = "LSTTODCOT";
                objFuncao.ds_funcao = "Lista Todas Cotações";
                lstFuncoes.Add(objFuncao);
            }
            if (pEntUsuario.CPF == "16252708879")
            {
                entFuncao objFuncao = new entFuncao();
                objFuncao.id_funcao = 4;
                objFuncao.cd_funcao = "LSTTODCLI";
                objFuncao.ds_funcao = "Lista Todos Clientes";
                lstFuncoes.Add(objFuncao);
            }
            if (pEntUsuario.CPF == "16252708879")
            {
                entFuncao objFuncao = new entFuncao();
                objFuncao.id_funcao = 5;
                objFuncao.cd_funcao = "CANCOTCLI";
                objFuncao.ds_funcao = "Cancela Cotacao do Cliente";
                lstFuncoes.Add(objFuncao);
            }
            return lstFuncoes;
        }
        private string RetornaBodyRecuperarSenha(string pnome, string psenha)
        {

            
            string testestr = "<!DOCTYPE html> " +
"<html lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\"> " +
            "<head> " +
"   <meta charset=\"utf-8\" /> " +
"   <title></title> " +
//"   <style type=\"text/css\"> " +
////"      body { " +
////"         margin: 20px 20px; " +
////"         font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; " +
////"      } " +
//"   </style> " +
"   <style> " +
"       * table, tr, td { " +
"            border: 1px solid white; " +
"            background-color: white; " +
"            font-family: Arial, Helvetica, sans-serif; " +
"        } " +
"        td.label { " +
"            border: 5px solid lightgray; " +
"            background-color: lightgray; " +
"            font-family: Arial, Helvetica, sans-serif; " +
"            font-weight: bold; " +
"        } " +
"        td.texto { " +
"             " +
"            border: 1px solid lightgray; " +
"            background-color: white; " +
"            font-family: Arial, Helvetica, sans-serif; " +

"        } " +
"        td.cabecalho { " +
"            color:white; " +
"            border: 5px solid royalblue; " +
"            background-color: royalblue; " +
"            font-family: Arial, Helvetica, sans-serif; " +
"            font-weight: bold; " +
"        } " +
"    </style> " +
"</head> " +
"<body> " +
"   Prezado(a) " + pnome + ", " +
"   <p> " +
"   Conforme requisição no site, segue a senha cadastrada no momento:" +
"   </p> " +
"  <p> " +
"    " + psenha + "  " +
"   </p> " +
"   <p> " +
//"      <a href=\"#Url#\">Clique aqui para resolver sua pendência.</a> " +
"   </p> " +
"   Atenciosamente,<br /><br /> " +
"   ACTOSEG CORRETORA - ACTO ONLINE " +
"</body> " +
"</html> ";

            //string strRet = testestr + "DADOS CLIENTE:<br/>" +
            //                "Nome:  " + objCot.ds_nome + " <br/> " + 
            //                "Email : " + objCot.ds_email + " <br/> " +
            //                "Telefone : " + objCot.ds_telefone_celular + " <br/> " +
            //                "Tipo Cotação : " + objCot.ds_tipo_cotacao; 







            return testestr;

        }

    }
}

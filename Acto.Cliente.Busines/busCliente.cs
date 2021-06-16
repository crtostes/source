using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Cliente.Data;
using Acto.Cliente.Entity;
using Acto.Empresa.Entity;
using Acto.Empresa.Busines;
using Acto.Usuario.Entity;
using Acto.Usuario.Busines;

namespace Acto.Cliente.Busines
{
    public class busCliente
    {
        public string IncluirCliente(entCliente pEntCliente)
        {
            try
            {
                if (ConsultarClienteCPFCNPJ(pEntCliente)) return "CPF do Indicado já cadastrado!";
                if (ConsultarClienteEmail(pEntCliente.ds_email) != null) return "E-mail do Indicado já cadastrado!";

                daoCliente objDaoCliente = new daoCliente();
                return objDaoCliente.IncluirCliente(pEntCliente).ToString();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return "0";
            }
            finally
            {

            }

        }
        public Boolean AtualizarCliente(entCliente pentCliente, string pEmpresaSimNao, entEmpresa pentEmpresa)
        {
            try
            {
                daoCliente objDaoCliente = new daoCliente();
                busEmpresa objBusEmpresa = new busEmpresa();
                objBusEmpresa.IncluirAlterarEmpresa(pentEmpresa);
                return objDaoCliente.AtualizarCliente(pentCliente);

            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return false;
            }

        }

        public entCliente ConsultarClienteEmail(string pds_Email)
        {
            try
            {
                daoCliente objDaoCliente = new daoCliente();
                return objDaoCliente.ConsultarClienteEmail(pds_Email);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public entCliente ConsultarClienteIdCliente(int pid_cliente)
        {
            try
            {
                daoCliente objDaoCliente = new daoCliente();
                return objDaoCliente.ConsultarClienteIdCliente(pid_cliente);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public bool ConsultarClienteCPFCNPJ(entCliente pEntCliente)
        {
            try
            {
                daoCliente objDaoCliente = new daoCliente();
                return objDaoCliente.ConsultarClienteCPFCNPJ(pEntCliente);
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

        public List<entCliente> ListarClientesIndicados(int pid_cliente)
        {
            try
            {
                daoCliente objDaoCliente = new daoCliente();
                return objDaoCliente.ListarClientesIndicados(pid_cliente);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        //public entIndicado ConsultarIndicado(int pid_cliente)
        //{
        //    try
        //    {
        //        daoCliente objDaoIndicado = new daoCliente();
        //        return objDaoIndicado.ConsultarCliente(pid_cliente);
        //    }
        //    catch (Exception ex)
        //    {
        //        MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
        //        return null;
        //    }

        //}

    }
}

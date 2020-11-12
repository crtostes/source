using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Indicado.Data;
using Acto.Indicado.Entity;

namespace Acto.Indicado.Busines
{
    public class busIndicado
    {
        public Int32 IncluirIndicado(entIndicado pEntIndicado)
        {
            try
            {
                daoIndicado objDaoIndicado = new daoIndicado();
                return objDaoIndicado.IncluirIndicado(pEntIndicado);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return 0;
            }
            finally
            {

            }

        }

        public bool ConsultarIndicadoEmail(entIndicado pEntIndicado)
        {
            try
            {
                daoIndicado objDaoIndicado = new daoIndicado();
                return objDaoIndicado.ConsultarIndicadoEmail(pEntIndicado);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return false;
            }

        }

        public bool ConsultarIndicadoCPFCNPJ(entIndicado pEntIndicado)
        {
            try
            {
                daoIndicado objDaoIndicado = new daoIndicado();
                return objDaoIndicado.ConsultarIndicadoCPFCNPJ(pEntIndicado);
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

        public List<entIndicado> ListarIndicadosCliente(int pid_cliente)
        {
            try
            {
                daoIndicado objDaoIndicado = new daoIndicado();
                return objDaoIndicado.ListarIndicadosCliente(pid_cliente);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public entIndicado ConsultarIndicado(int pid_cliente)
        {
            try
            {
                daoIndicado objDaoIndicado = new daoIndicado();
                return objDaoIndicado.ConsultarIndicado(pid_cliente);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
    }
}

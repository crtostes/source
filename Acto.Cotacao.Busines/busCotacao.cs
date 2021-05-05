using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Cotacao.Data;
using Acto.Cotacao.Entity;
using Acto.Infra.Mail;
using Acto.Cliente.Busines;
using Acto.Cliente.Entity;
namespace Acto.Cotacao.Busines
{
    public class busCotacao
    {
        public List<entUtilizacao> ListarUtilizacoes()
        {
            try
            {
                daoCotacao objDao = new daoCotacao();
                return objDao.ListarUtilizacoes();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public List<entMoraEm> ListarentMoraEm()
        {
            try
            {
                daoCotacao objDao = new daoCotacao();
                return objDao.ListarMoraEm();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public List<entLocalPernoite> ListarLocalPernoites()
        {
            try
            {
                daoCotacao objDao = new daoCotacao();
                return objDao.ListarLocalPernoites();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public List<entSeguradora> ListarSeguradoras()
        {
            try
            {
                daoCotacao objDao = new daoCotacao();
                return objDao.ListarSeguradoras();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public int AtualizarCotacaoAutomovel(entCotacaoAutomovel pentCotacaoAutomovel)
        {
            try
            {
                CaixaEmail objMail = new CaixaEmail();
                busCliente objBusCliente = new busCliente();
                entCliente objentCliente = objBusCliente.ConsultarClienteIdCliente(pentCotacaoAutomovel.id_cliente);
                daoCotacao objDaoCotacao = new daoCotacao();

                int ret_id_cotacao = objDaoCotacao.AtualizarCotacao(pentCotacaoAutomovel);

                objMail.EnviaEmailGmail(ret_id_cotacao, objentCliente.ds_nome, objentCliente.ds_email, objentCliente.ds_telefone_celular, "NOVO");

                return ret_id_cotacao;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return 0;
            }

        }
        public int AtualizarStatusCotacao(int pid_cotacao, int pid_cliente, string pcd_status_cotacao)
        {
            try
            {
                CaixaEmail objMail = new CaixaEmail();
                busCliente objBusCliente = new busCliente();
                entCliente objentCliente = objBusCliente.ConsultarClienteIdCliente(pid_cliente);
                daoCotacao objDaoCotacao = new daoCotacao();

                int ret_id_cotacao = objDaoCotacao.AtualizarStatusCotacao(pid_cotacao, pcd_status_cotacao);

                objMail.EnviaEmailGmail(ret_id_cotacao, objentCliente.ds_nome, objentCliente.ds_email, objentCliente.ds_telefone_celular, pcd_status_cotacao);

                return pid_cotacao;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return 0;
            }

        }
        public int AprovarCotacaoAutomovel(int pid_cotacao, int pid_seguradora, string pflg_aprovacao, int pid_cliente_aprovador, int pid_cliente_cotacao)
        {
            try
            {
                CaixaEmail objMail = new CaixaEmail();
                busCliente objBusCliente = new busCliente();
                entCliente objentCliente = objBusCliente.ConsultarClienteIdCliente(pid_cliente_cotacao);
                daoCotacao objDaoCotacao = new daoCotacao();

                int ret_id_cotacao = objDaoCotacao.AprovarCotacaoAutomovel(pid_cotacao, pid_seguradora, pflg_aprovacao, pid_cliente_aprovador);

                objMail.EnviaEmailGmail(ret_id_cotacao, objentCliente.ds_nome, objentCliente.ds_email, objentCliente.ds_telefone_celular, "AP");

                return pid_cotacao;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return 0;
            }

        }
        public List<entCotacaoAutomovelGrid> ListarCotacoes(int pdi_cliente)
        {
            try
            {
                daoCotacao objDao = new daoCotacao();
                return objDao.ListarCotacoes(pdi_cliente);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public entCotacaoAutomovel ConsultarCotacaoAutomovel(int pid_cotacao)
        {
            try
            {
                daoCotacao objDaoCotacao = new daoCotacao();
                return objDaoCotacao.ConsultarCotacaoAutomovel(pid_cotacao);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }


        public int IncluirCotacaoAutomovelItem(entCotacaoAutomovelItem pobjentCotacaoAutomovelItem)
        {
            try
            {
                //CaixaEmail objMail = new CaixaEmail();
                //busCliente objBusCliente = new busCliente();
                //entCliente objentCliente = objBusCliente.ConsultarClienteIdCliente(pentCotacaoAutomovel.id_cliente);
                daoCotacao objDaoCotacao = new daoCotacao();

                int ret_id_cotacao = objDaoCotacao.IncluirCotacaoAutomovelItem(pobjentCotacaoAutomovelItem);

                //objMail.EnviaEmailGmail(ret_id_cotacao, objentCliente.ds_nome, objentCliente.ds_email, objentCliente.ds_telefone_celular);

                return ret_id_cotacao;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return 0;
            }
        }
        public int ExcluirItensCotacao(int pid_cotacao)
        {
            try
            {
                daoCotacao objDaoCotacao = new daoCotacao();

                int ret_id_cotacao = objDaoCotacao.ExcluirItensCotacao(pid_cotacao);

                return ret_id_cotacao;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return 0;
            }
        }
        public List<entCotacaoAutomovelItemGrid> ListarCotacaoAutomovelItens(int pid_cotacao)
        {
            try
            {
                daoCotacao objDao = new daoCotacao();
                return objDao.ListarCotacaoAutomovelItens(pid_cotacao);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public string GeraChave()
        {
            int Tamanho = 20; // Numero de digitos da senha
            string senha = string.Empty;
            for (int i = 0; i < Tamanho; i++)
            {
                Random random = new Random();
                int codigo = Convert.ToInt32(random.Next(48, 122).ToString());

                if ((codigo >= 48 && codigo <= 57) || (codigo >= 97 && codigo <= 122))
                {
                    string _char = ((char)codigo).ToString();
                    if (!senha.Contains(_char))
                    {
                        senha += _char;
                    }
                    else
                    {
                        i--;
                    }
                }
                else
                {
                    i--;
                }
            }
            return senha;
        }

        public int AtualizarPDFCotacao(int pid_cotacao, string pds_pdf)
        {
            try
            {
                daoCotacao objDaoCotacao = new daoCotacao();

                return objDaoCotacao.AtualizarPDFCotacao(pid_cotacao, pds_pdf); ;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return 0;
            }

        }
    }

   
}

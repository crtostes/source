using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Gratificacao.Data;
using Acto.Gratificacao.Entity;

namespace Acto.Gratificacao.Busines
{
    public class busGratificacao
    {
        public List<entGratificacaoPagamento> ListarGratificacaoPagamento(int pid_cliente_indicado)
        {
            try
            {
                daoGratificacao objDaoGratificacao = new daoGratificacao();
                return objDaoGratificacao.ListarGratificacaoPagamento(pid_cliente_indicado);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return null;
            }
        }
        public List<entGratificacao> ListarGratificacaoMes(int pid_cliente_indicado, int pnr_mes_gratificacao)
        {
            try
            {
                daoGratificacao objDaoGratificacao = new daoGratificacao();
                return objDaoGratificacao.ListarGratificacaoMes(pid_cliente_indicado, pnr_mes_gratificacao);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return null;
            }
        }
    }
}
              
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Cliente.Data;
using Acto.Cliente.Entity;
using Acto.Empresa.Entity;
using Acto.Empresa.Busines;

namespace Acto.Cliente.Busines
{
    public class busCliente
    {
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
        public Boolean AtualizarCliente(entCliente pentCliente, string pEmpresaSimNao, entEmpresa pentEmpresa)
        {
            try
            {
                daoCliente objDaoCliente = new daoCliente();
                busEmpresa objBusEmpresa = new busEmpresa();
                if (pEmpresaSimNao == "S") objBusEmpresa.IncluirAlterarEmpresa(pentEmpresa);
                return objDaoCliente.AtualizarCliente(pentCliente);

            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return false;
            }

        }
    }
}

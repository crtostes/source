using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Empresa.Data;
using Acto.Empresa.Entity;


namespace Acto.Empresa.Busines
{
    public class busEmpresa
    {

        public bool IncluirAlterarEmpresa(entEmpresa pEntEmpresa)
        {
            try
            {
                daoEmpresa objDaoEmpresa = new daoEmpresa();
                return objDaoEmpresa.IncluirAlterarEmpresa(pEntEmpresa);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return false;
            }
            finally
            {

            }

        }

        public entEmpresa ConsultarEmpresa(int ídCliente)
        {
            try
            {
                daoEmpresa objDaoEmpresa = new daoEmpresa();
                return objDaoEmpresa.ConsultarEmpresa(ídCliente);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
    }
}

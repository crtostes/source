using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Fipe.Data;
using Acto.Fipe.Entity;

namespace Acto.Fipe.Busines
{
    public class busFipe
    {
        public List<entMarca> ListarMarcas(int ptipo)
        {
            try
            {
                daoFipe objDao = new daoFipe();
                return objDao.ListarMarcas(ptipo);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public List<entModelo> ListarModelo(int pcodigo_marca, int pano)
        {
            try
            {
                daoFipe objDao = new daoFipe();
                return objDao.ListarModelos(pcodigo_marca, pano);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }

        public entMarca ConsultarMarcaModelo(string pcd_fipe)
        {
            try
            {
                daoFipe objDao = new daoFipe();
                return objDao.ConsultarMarcaModelo(pcd_fipe);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
    }
}

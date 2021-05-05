using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Fipe.Entity;
using Acto.Infra.Db;
using MySql.Data.MySqlClient;
using MySql.Data.Types;
using System.Data;

namespace Acto.Fipe.Data
{
    public class daoFipe
    {
        public List<entMarca> ListarMarcas(int ptipo)
        {

            List<entMarca> objResp = new List<entMarca>();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_fp_marca_listar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?ptipo", ptipo));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {

                        entMarca objEnt = new entMarca();
                        objEnt.cd_marca = Convert.ToString(myReader["cd_marca"]);
                        objEnt.ds_marca = Convert.ToString(myReader["ds_marca"]);
                        
                        objResp.Add(objEnt);

                    }

                    
                }
                catch (Exception ex)
                {
                    //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                    return null;
                }
                finally
                {
                    /* se a conexão esta aberta, a fechamos */
                    if (conn.State == ConnectionState.Open) conn.Close();
                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();
            }
            return objResp;
        }
        public List<entModelo> ListarModelos(int pcodigo_marca, int pano)
        {

            List<entModelo> objResp = new List<entModelo>();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_fp_modelo_listar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pcodigo_marca", pcodigo_marca));
                cmd.Parameters.Add(new MySqlParameter("?pano", pano));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {

                        entModelo objEnt = new entModelo();
                        objEnt.cd_fipe = Convert.ToString(myReader["cd_fipe"]);
                        objEnt.ds_modelo = Convert.ToString(myReader["ds_modelo"]);

                        objResp.Add(objEnt);

                    }


                }
                catch (Exception ex)
                {
                    //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                    return null;
                }
                finally
                {
                    /* se a conexão esta aberta, a fechamos */
                    if (conn.State == ConnectionState.Open) conn.Close();
                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();
            }
            return objResp;
        }

        public entMarca ConsultarMarcaModelo(string pcd_fipe)
        {
            entMarca objEnt = new entMarca();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                
                MySqlCommand cmd = new MySqlCommand("sp_fipe_marca_modelo_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pcd_fipe", pcd_fipe));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {
                        objEnt.cd_marca = Convert.ToString(myReader["codigo_marca"]);
                        objEnt.ds_marca = Convert.ToString(myReader["marca"]).ToUpper();
                        objEnt.cd_tipo = Convert.ToString(myReader["tipo"]);
                    }


                }
                catch (Exception ex)
                {
                    //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                    return null;
                }
                finally
                {
                    /* se a conexão esta aberta, a fechamos */
                    if (conn.State == ConnectionState.Open) conn.Close();
                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();
            }
            return objEnt;
        }
    }
}

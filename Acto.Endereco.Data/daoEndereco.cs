using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Infra.Db;
using MySql.Data.MySqlClient;
using MySql.Data.Types;
using System.Data;
using Acto.Endereco.Entity;

namespace Acto.Endereco.Data
{
    public class daoEndereco
    {

        public entEndereco ConsultarEnderecoCliente(int pid_Cliente, int pid_Endereco)
        {
            entEndereco objResp = new entEndereco();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_endereco_consultar_cliente", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cliente", pid_Cliente));
                cmd.Parameters.Add(new MySqlParameter("?pid_endereco", pid_Endereco));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    if (myReader.Read())
                    {
                        objResp.id_endereco = Convert.ToInt32(myReader["id_endereco"]);
                        objResp.id_cliente = Convert.ToInt32(myReader["id_cliente"]);
                        objResp.id_tipo_endereco  = Convert.ToInt32(myReader["id_tipo_endereco"]);
                        objResp.ds_cep = Convert.ToString(myReader["ds_cep"]);
                        objResp.ds_endereco = Convert.ToString(myReader["ds_endereco"]);
                        objResp.ds_numero = Convert.ToString(myReader["ds_numero"]);
                        objResp.ds_complemento = Convert.ToString(myReader["ds_complemento"]);
                        objResp.ds_bairro = Convert.ToString(myReader["ds_bairro"]);
                        objResp.ds_cidade = Convert.ToString(myReader["ds_cidade"]);
                        objResp.ds_estado = Convert.ToString(myReader["ds_estado"]);
                        objResp.dt_atualizacao = Convert.ToDateTime(myReader["dt_atualizacao"]);
                    }
                }
                catch (Exception ex)
                {
                    //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                    Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                    objError.TrataErro(ex.Message + " - " + ex.StackTrace);
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
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                return null;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();
            }
            return objResp;
        }
        public Boolean AtualizarEndereco(entEndereco pobjentEndereco)
        {
            entEndereco objResp = new entEndereco();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_endereco_atualizar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_endereco", pobjentEndereco.id_endereco));
                cmd.Parameters.Add(new MySqlParameter("?pid_cliente", pobjentEndereco.id_cliente));
                cmd.Parameters.Add(new MySqlParameter("?pid_tipo_endereco", pobjentEndereco.id_tipo_endereco));
                cmd.Parameters.Add(new MySqlParameter("?pds_cep", pobjentEndereco.ds_cep));
                cmd.Parameters.Add(new MySqlParameter("?pds_endereco", pobjentEndereco.ds_endereco));
                cmd.Parameters.Add(new MySqlParameter("?pds_numero", pobjentEndereco.ds_numero));
                cmd.Parameters.Add(new MySqlParameter("?pds_complemento", pobjentEndereco.ds_complemento));
                cmd.Parameters.Add(new MySqlParameter("?pds_bairro", pobjentEndereco.ds_bairro));
                cmd.Parameters.Add(new MySqlParameter("?pds_cidade", pobjentEndereco.ds_cidade));
                cmd.Parameters.Add(new MySqlParameter("?pds_estado", pobjentEndereco.ds_estado));

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                return false;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return true;
        }
    }
}

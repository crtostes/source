using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Infra.Db;
using MySql.Data.MySqlClient;
using MySql.Data.Types;
using System.Data;
using Acto.Cliente.Entity;

namespace Acto.Cliente.Data
{
    public class daoCliente
    {
        public entCliente ConsultarClienteEmail(string pds_Email)
        {
            entCliente objResp = new entCliente(); 
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cliente_consultar_email", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pds_email", pds_Email));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    if (myReader.Read())
                    {
                        objResp.id_cliente = Convert.ToInt32(myReader["id_cliente"]);
                        objResp.ds_nome = Convert.ToString(myReader["ds_nome"]);
                        objResp.dt_inclusao = Convert.ToDateTime(myReader["dt_inclusao"]);
                        objResp.nr_cpf_cnpj = Convert.ToString(myReader["nr_cpf_cnpj"]);
                        objResp.ds_email = Convert.ToString(myReader["ds_email"]);
                        if (myReader["dt_nascimento"].ToString() != "") objResp.dt_nascimento = Convert.ToDateTime(myReader["dt_nascimento"]);
                        if (myReader["tp_pessoa"].ToString() != "") objResp.tp_pessoa = Convert.ToString(myReader["tp_pessoa"]);
                        if (myReader["ds_rg"].ToString() != "") objResp.ds_rg = Convert.ToString(myReader["ds_rg"]);
                        if (myReader["ds_emissao"].ToString() != "") objResp.ds_emissao = Convert.ToString(myReader["ds_emissao"]);
                        if (myReader["dt_emissao_rg"].ToString() != "") objResp.dt_emissao_rg = Convert.ToDateTime(myReader["dt_emissao_rg"]);
                        if (myReader["ds_telefone_celular"].ToString() != "") objResp.ds_telefone_celular = Convert.ToString(myReader["ds_telefone_celular"]);
                        if (myReader["ds_telefone_comercial"].ToString() != "") objResp.ds_telefone_comercial = Convert.ToString(myReader["ds_telefone_comercial"]);
                        if (myReader["id_estado_civil"].ToString() != "") objResp.id_estado_civil = Convert.ToInt32(myReader["id_estado_civil"]);
                        if (myReader["id_genero"].ToString() != "") objResp.id_genero = Convert.ToInt32(myReader["id_genero"]);

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

        public Boolean AtualizarCliente(entCliente pobjentCliente)
        {
            entCliente objResp = new entCliente();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cliente_atualizar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pds_nome", pobjentCliente.ds_nome));
                cmd.Parameters.Add(new MySqlParameter("?pdt_nascimento",pobjentCliente.dt_nascimento ));
                cmd.Parameters.Add(new MySqlParameter("?ptp_pessoa", pobjentCliente.tp_pessoa));
                cmd.Parameters.Add(new MySqlParameter("?pds_rg", pobjentCliente.ds_rg ));
                cmd.Parameters.Add(new MySqlParameter("?pds_emissao", pobjentCliente.ds_emissao ));
                cmd.Parameters.Add(new MySqlParameter("?pdt_emissao_rg", pobjentCliente.dt_emissao_rg));
                cmd.Parameters.Add(new MySqlParameter("?pds_telefone_celular", pobjentCliente.ds_telefone_celular ));
                cmd.Parameters.Add(new MySqlParameter("?pds_telefone_comercial", pobjentCliente.ds_telefone_comercial ));
                cmd.Parameters.Add(new MySqlParameter("?pid_estado_civil", pobjentCliente.id_estado_civil));
                cmd.Parameters.Add(new MySqlParameter("?pid_genero", pobjentCliente.id_genero));
                cmd.Parameters.Add(new MySqlParameter("?pid_cliente", pobjentCliente.id_cliente));

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

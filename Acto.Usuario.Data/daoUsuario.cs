using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Usuario.Entity;
using Acto.Infra.Db;
using MySql.Data.MySqlClient;
using MySql.Data.Types;
using System.Data;
namespace Acto.Usuario.Data
{
    public class daoUsuario
    {
        public void IncluirUsuario(entUsuario pEntUsuario)
        {
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                
                MySqlCommand cmd = new MySqlCommand("sp_usuario_incluir", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("pds_nome", pEntUsuario.Nome);
                cmd.Parameters.AddWithValue("pds_email", pEntUsuario.Email);
                cmd.Parameters.AddWithValue("pds_cpf", pEntUsuario.CPF);
                cmd.Parameters.AddWithValue("pds_senha", pEntUsuario.Senha);
                //string retorno = cmd.ExecuteScalar().ToString();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();
            }

        }

        public bool ConsultarAcesso(entUsuario pEntUsuario)
        {
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_usuario_acesso_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pds_email", pEntUsuario.Email));
                cmd.Parameters.Add(new MySqlParameter("?pds_senha", pEntUsuario.Senha));
                cmd.Parameters.Add(new MySqlParameter("?pds_resultado", MySqlDbType.VarChar));
                cmd.Parameters["?pds_resultado"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();

                string retorno = (string)cmd.Parameters["?pds_resultado"].Value;
                if (retorno == "OK")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return false;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();
            }

        }

        public bool ConsultarUsuarioEmail(entUsuario pEntUsuario)
        {
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_usuario_email_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pds_email", pEntUsuario.Email));
                cmd.Parameters.Add(new MySqlParameter("?pds_resultado", MySqlDbType.VarChar));
                cmd.Parameters["?pds_resultado"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();

                string retorno = (string)cmd.Parameters["?pds_resultado"].Value;
                if (retorno == "OK")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return false;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();
            }

        }

        public bool ConsultarUsuarioCPF(entUsuario pEntUsuario)
        {
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_usuario_cpf_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pds_cpf", pEntUsuario.CPF));
                cmd.Parameters.Add(new MySqlParameter("?pds_resultado", MySqlDbType.VarChar));
                cmd.Parameters["?pds_resultado"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                
                string retorno = (string)cmd.Parameters["?pds_resultado"].Value;

                if (retorno == "OK")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return false;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();
            }

        }
    }
}

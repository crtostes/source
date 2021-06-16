using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Empresa.Entity;
using Acto.Infra.Db;
using MySql.Data.MySqlClient;
using MySql.Data.Types;
using System.Data;

namespace Acto.Empresa.Data
{
    public class daoEmpresa
    {
        public bool IncluirAlterarEmpresa(entEmpresa pEntEmpresa)
        {
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_empresa_incluir_alterar", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cliente", pEntEmpresa.id_cliente));
                cmd.Parameters.Add(new MySqlParameter("?pnr_cnpj", pEntEmpresa.nr_cnpj.Trim()));
                cmd.Parameters.Add(new MySqlParameter("?pds_nome_empresa", pEntEmpresa.ds_nome_empresa.ToString().ToUpper()));
                cmd.Parameters.Add(new MySqlParameter("?pds_endereco", pEntEmpresa.ds_endereco));
                cmd.Parameters.Add(new MySqlParameter("?pds_cidade", pEntEmpresa.ds_cidade));
                cmd.Parameters.Add(new MySqlParameter("?pds_estado", pEntEmpresa.ds_estado));
                cmd.ExecuteNonQuery();
                return true;
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

        public entEmpresa ConsultarEmpresa(int pid_cliente)
        {
            entEmpresa objEmpresa = new entEmpresa();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_empresa_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cliente", pid_cliente));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {
                        //objEmpresa.id_empresa = Convert.ToInt32(myReader["id_empresa"]);
                        //objEmpresa.id_cliente = Convert.ToInt32(myReader["id_cliente"]);
                        objEmpresa.nr_cnpj = Convert.ToString(myReader["nr_cnpj"]);
                        objEmpresa.ds_nome_empresa = Convert.ToString(myReader["ds_nome_empresa"]);
                        objEmpresa.ds_endereco = Convert.ToString(myReader["ds_endereco"]);
                        objEmpresa.ds_cidade = Convert.ToString(myReader["ds_cidade"]);
                        objEmpresa.ds_estado = Convert.ToString(myReader["ds_estado"]);
                        //objEmpresa.dt_atualizacao = Convert.ToDateTime(myReader["dt_cadastro"]);
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
            return objEmpresa;
        }
    }
}

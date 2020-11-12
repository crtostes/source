using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Indicado.Entity;
using Acto.Infra.Db;
using MySql.Data.MySqlClient;
using MySql.Data.Types;
using System.Data;

namespace Acto.Indicado.Data
{
    public class daoIndicado
    {
        public int IncluirIndicado(entIndicado pEntIndicado)
        {
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {

                MySqlCommand cmd = new MySqlCommand("sp_indicado_incluir", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("pds_nome", pEntIndicado.ds_nome);
                //cmd.Parameters.AddWithValue("pds_email", pEntIndicado.ds_email);
                //cmd.Parameters.AddWithValue("pds_cpf", pEntIndicado.nr_cpf_cnpj);
                //cmd.Parameters.AddWithValue("pid_cliente_indicado", pEntIndicado.id_cliente_indicado);
                //cmd.Parameters.AddWithValue("pid_cliente", pEntIndicado.id_cliente_indicado);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pds_nome", pEntIndicado.ds_nome));
                cmd.Parameters.Add(new MySqlParameter("?pds_email", pEntIndicado.ds_email));
                cmd.Parameters.Add(new MySqlParameter("?pds_cpf", pEntIndicado.nr_cpf_cnpj));
                cmd.Parameters.Add(new MySqlParameter("?pid_cliente_indicado", pEntIndicado.id_cliente_indicado));
                cmd.Parameters.Add(new MySqlParameter("?pid_cliente", MySqlDbType.Int32));
                cmd.Parameters["?pid_cliente"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                Int32 retorno = (Int32)cmd.Parameters["?pid_cliente"].Value;

                //string retorno = cmd.ExecuteScalar().ToString();
                

                return retorno;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return 0;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();
            }

        }

        public bool ConsultarIndicadoEmail(entIndicado pEntIndicado)
        {
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_indicado_email_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pds_email", pEntIndicado.ds_email));
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

        public bool ConsultarIndicadoCPFCNPJ(entIndicado pEntIndicado)
        {
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_indicado_cpf_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pnr_cpf_cnpj", pEntIndicado.nr_cpf_cnpj));
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
        public List<entIndicado> ListarIndicadosCliente(int pid_cliente)
        {

            List<entIndicado> objResp = new List<entIndicado>();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_indicado_listar_cliente", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cliente", pid_cliente));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {
                        
                        entIndicado objIndicdo = new entIndicado();
                        objIndicdo.id_cliente = Convert.ToInt32(myReader["id_cliente"]);
                        objIndicdo.ds_nome = Convert.ToString(myReader["ds_nome"]);
                        objIndicdo.dt_inclusao = Convert.ToDateTime(myReader["dt_inclusao"]);
                        objIndicdo.nr_cpf_cnpj = Convert.ToString(myReader["nr_cpf_cnpj"]);
                        objIndicdo.ds_email = Convert.ToString(myReader["ds_email"]);
                        if (myReader["dt_nascimento"].ToString() != "") objIndicdo.dt_nascimento = Convert.ToDateTime(myReader["dt_nascimento"]);
                        if (myReader["tp_pessoa"].ToString() != "") objIndicdo.tp_pessoa = Convert.ToString(myReader["tp_pessoa"]);
                        if (myReader["ds_rg"].ToString() != "") objIndicdo.ds_rg = Convert.ToString(myReader["ds_rg"]);
                        if (myReader["ds_emissao"].ToString() != "") objIndicdo.ds_emissao = Convert.ToString(myReader["ds_emissao"]);
                        if (myReader["dt_emissao_rg"].ToString() != "") objIndicdo.dt_emissao_rg = Convert.ToDateTime(myReader["dt_emissao_rg"]);
                        if (myReader["ds_telefone_celular"].ToString() != "") objIndicdo.ds_telefone_celular = Convert.ToString(myReader["ds_telefone_celular"]);
                        if (myReader["ds_telefone_comercial"].ToString() != "") objIndicdo.ds_telefone_comercial = Convert.ToString(myReader["ds_telefone_comercial"]);
                        if (myReader["id_estado_civil"].ToString() != "") objIndicdo.id_estado_civil = Convert.ToInt32(myReader["id_estado_civil"]);
                        if (myReader["id_genero"].ToString() != "") objIndicdo.id_genero = Convert.ToInt32(myReader["id_genero"]);
                        objResp.Add(objIndicdo);

                    } 

                    //if (myReader.Read())
                    //{
                    //    objResp.id_cliente = Convert.ToInt32(myReader["id_cliente"]);
                    //    objResp.ds_nome = Convert.ToString(myReader["ds_nome"]);
                    //    objResp.dt_inclusao = Convert.ToDateTime(myReader["dt_inclusao"]);
                    //    objResp.nr_cpf_cnpj = Convert.ToString(myReader["nr_cpf_cnpj"]);
                    //    objResp.ds_email = Convert.ToString(myReader["ds_email"]);
                    //    if (myReader["dt_nascimento"].ToString() != "") objResp.dt_nascimento = Convert.ToDateTime(myReader["dt_nascimento"]);
                    //    if (myReader["tp_pessoa"].ToString() != "") objResp.tp_pessoa = Convert.ToString(myReader["tp_pessoa"]);
                    //    if (myReader["ds_rg"].ToString() != "") objResp.ds_rg = Convert.ToString(myReader["ds_rg"]);
                    //    if (myReader["ds_emissao"].ToString() != "") objResp.ds_emissao = Convert.ToString(myReader["ds_emissao"]);
                    //    if (myReader["dt_emissao_rg"].ToString() != "") objResp.dt_emissao_rg = Convert.ToDateTime(myReader["dt_emissao_rg"]);
                    //    if (myReader["ds_telefone_celular"].ToString() != "") objResp.ds_telefone_celular = Convert.ToString(myReader["ds_telefone_celular"]);
                    //    if (myReader["ds_telefone_comercial"].ToString() != "") objResp.ds_telefone_comercial = Convert.ToString(myReader["ds_telefone_comercial"]);
                    //    if (myReader["id_estado_civil"].ToString() != "") objResp.id_estado_civil = Convert.ToInt32(myReader["id_estado_civil"]);
                    //    if (myReader["id_genero"].ToString() != "") objResp.id_genero = Convert.ToInt32(myReader["id_genero"]);

                    //}
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
        public entIndicado ConsultarIndicado(int pid_cliente)
        {
            entIndicado objIndicado = new entIndicado();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_indicado_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cliente", pid_cliente));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {
                        objIndicado.id_cliente = Convert.ToInt32(myReader["id_cliente"]);
                        objIndicado.ds_nome = Convert.ToString(myReader["ds_nome"]);
                        objIndicado.dt_inclusao = Convert.ToDateTime(myReader["dt_inclusao"]);
                        objIndicado.nr_cpf_cnpj = Convert.ToString(myReader["nr_cpf_cnpj"]);
                        objIndicado.ds_email = Convert.ToString(myReader["ds_email"]);
                        if (myReader["dt_nascimento"].ToString() != "") objIndicado.dt_nascimento = Convert.ToDateTime(myReader["dt_nascimento"]);
                        if (myReader["tp_pessoa"].ToString() != "") objIndicado.tp_pessoa = Convert.ToString(myReader["tp_pessoa"]);
                        if (myReader["ds_rg"].ToString() != "") objIndicado.ds_rg = Convert.ToString(myReader["ds_rg"]);
                        if (myReader["ds_emissao"].ToString() != "") objIndicado.ds_emissao = Convert.ToString(myReader["ds_emissao"]);
                        if (myReader["dt_emissao_rg"].ToString() != "") objIndicado.dt_emissao_rg = Convert.ToDateTime(myReader["dt_emissao_rg"]);
                        if (myReader["ds_telefone_celular"].ToString() != "") objIndicado.ds_telefone_celular = Convert.ToString(myReader["ds_telefone_celular"]);
                        if (myReader["ds_telefone_comercial"].ToString() != "") objIndicado.ds_telefone_comercial = Convert.ToString(myReader["ds_telefone_comercial"]);
                        if (myReader["id_estado_civil"].ToString() != "") objIndicado.id_estado_civil = Convert.ToInt32(myReader["id_estado_civil"]);
                        if (myReader["id_genero"].ToString() != "") objIndicado.id_genero = Convert.ToInt32(myReader["id_genero"]);
                        //objResp.Add(objIndicdo);

                    }

                    //if (myReader.Read())
                    //{
                    //    objResp.id_cliente = Convert.ToInt32(myReader["id_cliente"]);
                    //    objResp.ds_nome = Convert.ToString(myReader["ds_nome"]);
                    //    objResp.dt_inclusao = Convert.ToDateTime(myReader["dt_inclusao"]);
                    //    objResp.nr_cpf_cnpj = Convert.ToString(myReader["nr_cpf_cnpj"]);
                    //    objResp.ds_email = Convert.ToString(myReader["ds_email"]);
                    //    if (myReader["dt_nascimento"].ToString() != "") objResp.dt_nascimento = Convert.ToDateTime(myReader["dt_nascimento"]);
                    //    if (myReader["tp_pessoa"].ToString() != "") objResp.tp_pessoa = Convert.ToString(myReader["tp_pessoa"]);
                    //    if (myReader["ds_rg"].ToString() != "") objResp.ds_rg = Convert.ToString(myReader["ds_rg"]);
                    //    if (myReader["ds_emissao"].ToString() != "") objResp.ds_emissao = Convert.ToString(myReader["ds_emissao"]);
                    //    if (myReader["dt_emissao_rg"].ToString() != "") objResp.dt_emissao_rg = Convert.ToDateTime(myReader["dt_emissao_rg"]);
                    //    if (myReader["ds_telefone_celular"].ToString() != "") objResp.ds_telefone_celular = Convert.ToString(myReader["ds_telefone_celular"]);
                    //    if (myReader["ds_telefone_comercial"].ToString() != "") objResp.ds_telefone_comercial = Convert.ToString(myReader["ds_telefone_comercial"]);
                    //    if (myReader["id_estado_civil"].ToString() != "") objResp.id_estado_civil = Convert.ToInt32(myReader["id_estado_civil"]);
                    //    if (myReader["id_genero"].ToString() != "") objResp.id_genero = Convert.ToInt32(myReader["id_genero"]);

                    //}
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
            return objIndicado;
        }
    }

}

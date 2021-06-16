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
                    else
                    {
                        return null;
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

        public entCliente ConsultarClienteIdCliente(int pid_cliente)
        {
            entCliente objResp = new entCliente();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cliente_consultar_id_cliente", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cliente", pid_cliente));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    if (myReader.Read())
                    {
                        objResp.id_cliente = Convert.ToInt32(myReader["id_cliente"]);
                        objResp.ds_nome = Convert.ToString(myReader["ds_nome"]);
                        objResp.dt_inclusao = Convert.ToDateTime(myReader["dt_inclusao"]);
                        
                        objResp.nr_cpf_cnpj = Convert.ToUInt64(Convert.ToString(myReader["nr_cpf_cnpj"])).ToString(@"000\.000\.000\-00");  //Convert.ToString(myReader["nr_cpf_cnpj"]);
                        objResp.ds_email = Convert.ToString(myReader["ds_email"]);
                        if (myReader["dt_nascimento"].ToString() != "") objResp.dt_nascimento = Convert.ToDateTime(myReader["dt_nascimento"]);
                        if (myReader["tp_pessoa"].ToString() != "") objResp.tp_pessoa = Convert.ToString(myReader["tp_pessoa"]);
                        if (myReader["ds_rg"].ToString() != "") objResp.ds_rg = Convert.ToString(myReader["ds_rg"]);
                        if (myReader["ds_emissao"].ToString() != "") objResp.ds_emissao = Convert.ToString(myReader["ds_emissao"]);
                        if (myReader["dt_emissao_rg"].ToString() != "") objResp.dt_emissao_rg = Convert.ToDateTime(myReader["dt_emissao_rg"]);
                        if (myReader["ds_telefone_celular"].ToString() != "") objResp.ds_telefone_celular = Convert.ToString(myReader["ds_telefone_celular"]);
                        if (myReader["ds_telefone_comercial"].ToString() != "") objResp.ds_telefone_comercial = Convert.ToString(myReader["ds_telefone_comercial"]);
                        if (myReader["id_estado_civil"].ToString() != "") objResp.id_estado_civil = Convert.ToInt32(myReader["id_estado_civil"]);
                        if (myReader["ds_estado_civil"].ToString() != "") objResp.ds_estado_civil = Convert.ToString(myReader["ds_estado_civil"]);
                        if (myReader["id_genero"].ToString() != "") objResp.id_genero = Convert.ToInt32(myReader["id_genero"]);
                        if (myReader["ds_genero"].ToString() != "") objResp.ds_genero = Convert.ToString(myReader["ds_genero"]);

                        //id_usuario
                        //id_cliente_pj
                        if (myReader["ds_cnh"].ToString() != "") objResp.ds_cnh = myReader["ds_cnh"].ToString();
                        if (myReader["dt_1_habilitacao"].ToString() != "") objResp.dt_1_habilitacao = myReader["dt_1_habilitacao"].ToString();
                        if (myReader["ds_profissao"].ToString() != "") objResp.ds_profissao = myReader["ds_profissao"].ToString();
                        if (myReader["ds_profissao_complemento"].ToString() != "") objResp.ds_profissao_complemento = myReader["ds_profissao_complemento"].ToString();
                        if (myReader["ds_nome_pai"].ToString() != "") objResp.ds_nome_pai = myReader["ds_nome_pai"].ToString();
                        if (myReader["ds_nome_mae"].ToString() != "") objResp.ds_nome_mae = myReader["ds_nome_mae"].ToString();
                        if (myReader["ds_nome_conjuge"].ToString() != "") objResp.ds_nome_conjuge = myReader["ds_nome_conjuge"].ToString();
                        if (myReader["ds_tipo_endereco"].ToString() != "") objResp.ds_tipo_endereco = myReader["ds_tipo_endereco"].ToString();
                        if (myReader["ds_cep"].ToString() != "") objResp.ds_cep = myReader["ds_cep"].ToString();
                        if (myReader["ds_endereco"].ToString() != "") objResp.ds_endereco = myReader["ds_endereco"].ToString();
                        if (myReader["ds_numero"].ToString() != "") objResp.ds_numero = myReader["ds_numero"].ToString();
                        if (myReader["ds_complemento"].ToString() != "") objResp.ds_complemento = myReader["ds_complemento"].ToString();
                        if (myReader["ds_bairro"].ToString() != "") objResp.ds_bairro = myReader["ds_bairro"].ToString();
                        if (myReader["ds_cidade"].ToString() != "") objResp.ds_cidade = myReader["ds_cidade"].ToString();
                        if (myReader["ds_estado"].ToString() != "") objResp.ds_estado = myReader["ds_estado"].ToString();
                        if (myReader["dt_atualizacao"].ToString() != "") objResp.dt_atualizacao = Convert.ToDateTime(myReader["dt_atualizacao"]).ToString();
                        if (myReader["tp_tem_empresa"].ToString() != "") objResp.tp_tem_empresa = myReader["tp_tem_empresa"].ToString();
                        
                        

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
                cmd.Parameters.Add(new MySqlParameter("?pds_cnh", pobjentCliente.ds_cnh));
                cmd.Parameters.Add(new MySqlParameter("?pdt_1_habilitacao", pobjentCliente.dt_1_habilitacao));
                cmd.Parameters.Add(new MySqlParameter("?pds_profissao", pobjentCliente.ds_profissao));
                cmd.Parameters.Add(new MySqlParameter("?pds_profissao_complemento", pobjentCliente.ds_profissao_complemento));
                cmd.Parameters.Add(new MySqlParameter("?pds_nome_pai", pobjentCliente.ds_nome_pai));
                cmd.Parameters.Add(new MySqlParameter("?pds_nome_mae", pobjentCliente.ds_nome_mae));
                cmd.Parameters.Add(new MySqlParameter("?pds_nome_conjuge", pobjentCliente.ds_nome_conjuge));
                cmd.Parameters.Add(new MySqlParameter("?pds_tipo_endereco", pobjentCliente.ds_tipo_endereco));
                cmd.Parameters.Add(new MySqlParameter("?pds_cep", pobjentCliente.ds_cep));
                cmd.Parameters.Add(new MySqlParameter("?pds_endereco", pobjentCliente.ds_endereco));
                cmd.Parameters.Add(new MySqlParameter("?pds_numero", pobjentCliente.ds_numero));
                cmd.Parameters.Add(new MySqlParameter("?pds_complemento", pobjentCliente.ds_complemento));
                cmd.Parameters.Add(new MySqlParameter("?pds_bairro", pobjentCliente.ds_bairro));
                cmd.Parameters.Add(new MySqlParameter("?pds_cidade", pobjentCliente.ds_cidade));
                cmd.Parameters.Add(new MySqlParameter("?pds_estado", pobjentCliente.ds_estado));

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

        public int IncluirCliente(entCliente pEntCliente)
        {
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {

                MySqlCommand cmd = new MySqlCommand("sp_cliente_incluir", conn);
                cmd.CommandType = CommandType.StoredProcedure;
               
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pds_nome", pEntCliente.ds_nome));
                cmd.Parameters.Add(new MySqlParameter("?pds_email", pEntCliente.ds_email));
                cmd.Parameters.Add(new MySqlParameter("?pds_cpf", pEntCliente.nr_cpf_cnpj));
                cmd.Parameters.Add(new MySqlParameter("?pid_cliente_indicado", pEntCliente.id_cliente_indicado));
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
        
        public bool ConsultarClienteCPFCNPJ(entCliente pEntCliente)
        {
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cliente_cpf_cnpj_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pnr_cpf_cnpj", pEntCliente.nr_cpf_cnpj));
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
        public List<entCliente> ListarClientesIndicados(int pid_cliente)
        {
            bool cadcliente;
            List<entCliente> objResp = new List<entCliente>();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cliente_indicados_listar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cliente", pid_cliente));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {
                        cadcliente = true;
                        entCliente obj = new entCliente();
                        obj.id_cliente = Convert.ToInt32(myReader["id_cliente"]);
                        obj.ds_nome = Convert.ToString(myReader["ds_nome"]);
                        obj.dt_inclusao = Convert.ToDateTime(myReader["dt_inclusao"]);
                        obj.nr_cpf_cnpj = Convert.ToUInt64(Convert.ToString(myReader["nr_cpf_cnpj"])).ToString(@"000\.000\.000\-00");  //Convert.ToString(myReader["nr_cpf_cnpj"]); Convert.ToString(myReader["nr_cpf_cnpj"]);
                        obj.ds_email = Convert.ToString(myReader["ds_email"]);
                        if (myReader["dt_nascimento"].ToString() != "") { obj.dt_nascimento = Convert.ToDateTime(myReader["dt_nascimento"]); } else { cadcliente = false; }
                        if (myReader["tp_pessoa"].ToString() != "") { obj.tp_pessoa = Convert.ToString(myReader["tp_pessoa"]);} else { cadcliente = false; }
                        if (myReader["ds_rg"].ToString() != "") { obj.ds_rg = Convert.ToString(myReader["ds_rg"]);} else { cadcliente = false; }
                        if (myReader["ds_emissao"].ToString() != "") {obj.ds_emissao = Convert.ToString(myReader["ds_emissao"]);} else { cadcliente = false; }
                        if (myReader["dt_emissao_rg"].ToString() != "") {obj.dt_emissao_rg = Convert.ToDateTime(myReader["dt_emissao_rg"]);} else { cadcliente = false; }
                        if (myReader["ds_telefone_celular"].ToString() != "") {obj.ds_telefone_celular = Convert.ToString(myReader["ds_telefone_celular"]);} else { cadcliente = false; }
                        if (myReader["ds_telefone_comercial"].ToString() != "") {obj.ds_telefone_comercial = Convert.ToString(myReader["ds_telefone_comercial"]);} else { }
                        if (myReader["id_estado_civil"].ToString() != "") {obj.id_estado_civil = Convert.ToInt32(myReader["id_estado_civil"]);} else { cadcliente = false; }
                        if (myReader["id_genero"].ToString() != "") {obj.id_genero = Convert.ToInt32(myReader["id_genero"]);} else { cadcliente = false; }
                        
                        if (myReader["ds_cnh"].ToString() == "") cadcliente = false;
                        if (myReader["dt_1_habilitacao"].ToString() == "") cadcliente = false; 
                        if (myReader["ds_profissao"].ToString() == "") cadcliente = false;
                        if (myReader["ds_profissao_complemento"].ToString() == "") cadcliente = false;
                        if (myReader["ds_nome_pai"].ToString() == "") cadcliente = false;
                        if (myReader["ds_nome_mae"].ToString() == "") cadcliente = false;
                        if (myReader["ds_nome_conjuge"].ToString() == "") cadcliente = false;
                        if (myReader["ds_tipo_endereco"].ToString() == "") cadcliente = false;
                        if (myReader["ds_cep"].ToString() == "") cadcliente = false;
                        if (myReader["ds_endereco"].ToString() == "") cadcliente = false;
                        if (myReader["ds_numero"].ToString() == "") cadcliente = false;
                        if (myReader["ds_complemento"].ToString() == "") cadcliente = false;
                        if (myReader["ds_bairro"].ToString() == "") cadcliente = false;
                        if (myReader["ds_cidade"].ToString() == "") cadcliente = false;
                        if (myReader["ds_estado"].ToString() == "") cadcliente = false;
                        if (myReader["dt_atualizacao"].ToString() == "") cadcliente = false;
                        
                        if (cadcliente)
                        {
                            obj.img_CadOK = "<img src='images/cadcliente_ok.jpg' style = 'width: 20px; height: 20px; '/>";
                            obj.bt_atualizar = "<button type=\"button\" class='btn btn-xs btn-success pull-right' title=\"Cadastro completo, pode alterar.\" onclick=\"CarregarCliente('" + Convert.ToString(myReader["id_cliente"]) + "')\">Detalhes</button>";
                            obj.bt_NovaCotacao = "<button type=\"button\" class='btn btn-xs btn-success pull-right' title=\"Clique para criar nova cotação para este cliente.\" onclick=\"CarregarNovaCotacao('" + Convert.ToString(myReader["id_cliente"]) + "')\">NOVA COTAÇÃO</button>";
                        }
                        else
                        {
                            obj.bt_atualizar = "<button type=\"button\" class='btn btn-xs btn-danger pull-right' title=\"Cadastro INCOMPLETO, necessário complementar o cadastro para incluir cotação.\" onclick=\"CarregarCliente('" + Convert.ToString(myReader["id_cliente"]) + "')\">Atualizar</button>";
                        }
                        objResp.Add(obj);

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
        //public entIndicado ConsultarIndicado(int pid_cliente)
        //{
        //    entIndicado objIndicado = new entIndicado();
        //    InfraDb ActoDb = new InfraDb();
        //    MySqlConnection conn = ActoDb.ActoConn();
        //    try
        //    {
        //        MySqlCommand cmd = new MySqlCommand("sp_indicado_consultar", conn);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.Add(new MySqlParameter("?pid_cliente", pid_cliente));
        //        MySqlDataReader myReader;
        //        myReader = cmd.ExecuteReader();
        //        try
        //        {
        //            while (myReader.Read())
        //            {
        //                objIndicado.id_cliente = Convert.ToInt32(myReader["id_cliente"]);
        //                objIndicado.ds_nome = Convert.ToString(myReader["ds_nome"]);
        //                objIndicado.dt_inclusao = Convert.ToDateTime(myReader["dt_inclusao"]);
        //                objIndicado.nr_cpf_cnpj = Convert.ToString(myReader["nr_cpf_cnpj"]);
        //                objIndicado.ds_email = Convert.ToString(myReader["ds_email"]);
        //                if (myReader["dt_nascimento"].ToString() != "") objIndicado.dt_nascimento = Convert.ToDateTime(myReader["dt_nascimento"]);
        //                if (myReader["tp_pessoa"].ToString() != "") objIndicado.tp_pessoa = Convert.ToString(myReader["tp_pessoa"]);
        //                if (myReader["ds_rg"].ToString() != "") objIndicado.ds_rg = Convert.ToString(myReader["ds_rg"]);
        //                if (myReader["ds_emissao"].ToString() != "") objIndicado.ds_emissao = Convert.ToString(myReader["ds_emissao"]);
        //                if (myReader["dt_emissao_rg"].ToString() != "") objIndicado.dt_emissao_rg = Convert.ToDateTime(myReader["dt_emissao_rg"]);
        //                if (myReader["ds_telefone_celular"].ToString() != "") objIndicado.ds_telefone_celular = Convert.ToString(myReader["ds_telefone_celular"]);
        //                if (myReader["ds_telefone_comercial"].ToString() != "") objIndicado.ds_telefone_comercial = Convert.ToString(myReader["ds_telefone_comercial"]);
        //                if (myReader["id_estado_civil"].ToString() != "") objIndicado.id_estado_civil = Convert.ToInt32(myReader["id_estado_civil"]);
        //                if (myReader["id_genero"].ToString() != "") objIndicado.id_genero = Convert.ToInt32(myReader["id_genero"]);
        //                if (myReader["ds_genero"].ToString() != "") objIndicado.ds_genero = Convert.ToString(myReader["ds_genero"]);
        //                if (myReader["ds_estado_civil"].ToString() != "") objIndicado.ds_estado_civil = Convert.ToString(myReader["ds_estado_civil"]);
        //                //objResp.Add(objIndicdo);

        //            }

        //            //if (myReader.Read())
        //            //{
        //            //    objResp.id_cliente = Convert.ToInt32(myReader["id_cliente"]);
        //            //    objResp.ds_nome = Convert.ToString(myReader["ds_nome"]);
        //            //    objResp.dt_inclusao = Convert.ToDateTime(myReader["dt_inclusao"]);
        //            //    objResp.nr_cpf_cnpj = Convert.ToString(myReader["nr_cpf_cnpj"]);
        //            //    objResp.ds_email = Convert.ToString(myReader["ds_email"]);
        //            //    if (myReader["dt_nascimento"].ToString() != "") objResp.dt_nascimento = Convert.ToDateTime(myReader["dt_nascimento"]);
        //            //    if (myReader["tp_pessoa"].ToString() != "") objResp.tp_pessoa = Convert.ToString(myReader["tp_pessoa"]);
        //            //    if (myReader["ds_rg"].ToString() != "") objResp.ds_rg = Convert.ToString(myReader["ds_rg"]);
        //            //    if (myReader["ds_emissao"].ToString() != "") objResp.ds_emissao = Convert.ToString(myReader["ds_emissao"]);
        //            //    if (myReader["dt_emissao_rg"].ToString() != "") objResp.dt_emissao_rg = Convert.ToDateTime(myReader["dt_emissao_rg"]);
        //            //    if (myReader["ds_telefone_celular"].ToString() != "") objResp.ds_telefone_celular = Convert.ToString(myReader["ds_telefone_celular"]);
        //            //    if (myReader["ds_telefone_comercial"].ToString() != "") objResp.ds_telefone_comercial = Convert.ToString(myReader["ds_telefone_comercial"]);
        //            //    if (myReader["id_estado_civil"].ToString() != "") objResp.id_estado_civil = Convert.ToInt32(myReader["id_estado_civil"]);
        //            //    if (myReader["id_genero"].ToString() != "") objResp.id_genero = Convert.ToInt32(myReader["id_genero"]);

        //            //}
        //        }
        //        catch (Exception ex)
        //        {
        //            //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
        //            return null;
        //        }
        //        finally
        //        {
        //            /* se a conexão esta aberta, a fechamos */
        //            if (conn.State == ConnectionState.Open) conn.Close();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
        //        return null;
        //    }
        //    finally
        //    {
        //        /* se a conexão esta aberta, a fechamos */
        //        if (conn.State == ConnectionState.Open) conn.Close();
        //    }
        //    return objIndicado;
        //}
    }
}

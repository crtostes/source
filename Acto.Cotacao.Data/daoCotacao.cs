using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Cotacao.Entity;
using Acto.Infra.Db;
using MySql.Data.MySqlClient;
using MySql.Data.Types;
using System.Data;
using Dapper;
namespace Acto.Cotacao.Data
{
    public class daoCotacao
    {
        public List<entMoraEm> ListarMoraEm()
        {

            List<entMoraEm> objResp = new List<entMoraEm>();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_mora_em_listar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add(new MySqlParameter("?ptipo", ptipo));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {

                        entMoraEm objEnt = new entMoraEm();
                        objEnt.id_mora_em = Convert.ToInt16(myReader["id_mora_em"]);
                        objEnt.ds_mora_em = Convert.ToString(myReader["ds_mora_em"]);

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
        public List<entUtilizacao> ListarUtilizacoes()
        {

            List<entUtilizacao> objResp = new List<entUtilizacao>();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_utilizacao_listar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add(new MySqlParameter("?ptipo", ptipo));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {

                        entUtilizacao objEnt = new entUtilizacao();
                        objEnt.id_utilizacao = Convert.ToInt16(myReader["id_utilizacao"]);
                        objEnt.ds_utilizacao = Convert.ToString(myReader["ds_utilizacao"]);

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
        public List<entLocalPernoite> ListarLocalPernoites()
        {

            List<entLocalPernoite> objResp = new List<entLocalPernoite>();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_fp_local_pernoite_listar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add(new MySqlParameter("?ptipo", ptipo));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {

                        entLocalPernoite objEnt = new entLocalPernoite();
                        objEnt.id_local_pernoite = Convert.ToInt16(myReader["id_local_pernoite"]);
                        objEnt.ds_local_pernoite = Convert.ToString(myReader["ds_local_pernoite"]);

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
        public List<entSeguradora> ListarSeguradoras()
        {

            List<entSeguradora> objResp = new List<entSeguradora>();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_seguradoras_listar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add(new MySqlParameter("?ptipo", ptipo));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {

                        entSeguradora objEnt = new entSeguradora();
                        objEnt.id_seguradora = Convert.ToInt16(myReader["id_seguradora"]);
                        objEnt.ds_seguradora = Convert.ToString(myReader["ds_seguradora"]);

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
        public List<entCotacaoInteracao> ListarCotacaoInteracao(int pid_cotacao)
        {

            List<entCotacaoInteracao> objResp = new List<entCotacaoInteracao>();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cotacao_interacao_listar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cotacao", pid_cotacao));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {

                        entCotacaoInteracao objEnt = new entCotacaoInteracao();
                        objEnt.dt_interacao = Convert.ToDateTime(myReader["dt_interacao"]).ToString();
                        objEnt.ds_mensagem = Convert.ToString(myReader["ds_mensagem"]);
                        objEnt.ds_pdf_cotacao_concorrente = Convert.ToString(myReader["ds_pdf_cotacao_concorrente"]);
                        if (Convert.ToString(myReader["ds_pdf_cotacao_concorrente"]).Trim() != string.Empty) objEnt.bt_pdf_cotacao_concorrente = "<img src='../../images/dl_pdf.png' style='width: 40px; height: 40px; ' onclick=\"CarregaPDF('A','" + Convert.ToString(myReader["ds_pdf_cotacao_concorrente"]) + "')\">";
                        objEnt.id_forma_pagamento = Convert.ToInt32(myReader["id_forma_pagamento"]);
                        objEnt.ds_forma_pagamento = Convert.ToString(myReader["ds_forma_pagamento"]);

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
        public int AtualizarCotacao(entCotacaoAutomovel pobjentCotacaoAutomovel)
        {
            Int32 retorno = 0;
            entCotacaoAutomovel  objResp = new entCotacaoAutomovel();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cotacao_automovel_atualizar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cotacaoIn", pobjentCotacaoAutomovel.id_cotacao));
                cmd.Parameters.Add(new MySqlParameter("?pid_cliente", pobjentCotacaoAutomovel.id_cliente));

                cmd.Parameters.Add(new MySqlParameter("?pds_tipo_cotacao", pobjentCotacaoAutomovel.ds_tipo_cotacao));
                cmd.Parameters.Add(new MySqlParameter("?pds_data_vigencia_inicial", pobjentCotacaoAutomovel.ds_data_vigencia_inicial));
                cmd.Parameters.Add(new MySqlParameter("?pds_data_vigencia_final", pobjentCotacaoAutomovel.ds_data_vigencia_final));

                cmd.Parameters.Add(new MySqlParameter("?pds_ano_fabricao", pobjentCotacaoAutomovel.ds_ano_fabricao));
                cmd.Parameters.Add(new MySqlParameter("?pds_ano_modelo", pobjentCotacaoAutomovel.ds_ano_modelo));
                cmd.Parameters.Add(new MySqlParameter("?pcd_fipe" , pobjentCotacaoAutomovel.cd_fipe));
                cmd.Parameters.Add(new MySqlParameter("?pds_marca", pobjentCotacaoAutomovel.ds_marca));
                cmd.Parameters.Add(new MySqlParameter("?pds_modelo",pobjentCotacaoAutomovel.ds_modelo));
                cmd.Parameters.Add(new MySqlParameter("?pds_versao",pobjentCotacaoAutomovel.ds_versao));
                cmd.Parameters.Add(new MySqlParameter("?pds_chassi",pobjentCotacaoAutomovel.ds_chassi));
                cmd.Parameters.Add(new MySqlParameter("?pds_zero_km",pobjentCotacaoAutomovel.ds_zero_km));
                cmd.Parameters.Add(new MySqlParameter("?pds_estado_veiculo" ,pobjentCotacaoAutomovel.ds_estado_veiculo));
                cmd.Parameters.Add(new MySqlParameter("?pds_placa" ,pobjentCotacaoAutomovel.ds_placa));
                cmd.Parameters.Add(new MySqlParameter("?pds_combustivel" ,pobjentCotacaoAutomovel.ds_combustivel));
                cmd.Parameters.Add(new MySqlParameter("?pds_portas" ,pobjentCotacaoAutomovel.ds_portas));
                cmd.Parameters.Add(new MySqlParameter("?pds_utilizacao_veiculo"  ,pobjentCotacaoAutomovel.ds_utilizacao_veiculo));
                cmd.Parameters.Add(new MySqlParameter("?pds_cep_pernoite",pobjentCotacaoAutomovel.ds_cep_pernoite));
                cmd.Parameters.Add(new MySqlParameter("?pds_financiado",pobjentCotacaoAutomovel.ds_financiado));
                cmd.Parameters.Add(new MySqlParameter("?pds_kit_gas",pobjentCotacaoAutomovel.ds_kit_gas));
                cmd.Parameters.Add(new MySqlParameter("?pds_taxi"  ,pobjentCotacaoAutomovel.ds_taxi));
                cmd.Parameters.Add(new MySqlParameter("?pds_aplicativo" ,pobjentCotacaoAutomovel.ds_aplicativo));
                cmd.Parameters.Add(new MySqlParameter("?pds_blindado"  ,pobjentCotacaoAutomovel.ds_blindado));
                cmd.Parameters.Add(new MySqlParameter("?pds_pcd"  ,pobjentCotacaoAutomovel.ds_pcd));
                cmd.Parameters.Add(new MySqlParameter("?pds_cep_circulacao" ,pobjentCotacaoAutomovel.ds_cep_circulacao));
                cmd.Parameters.Add(new MySqlParameter("?pds_cep_residencia" ,pobjentCotacaoAutomovel.ds_cep_residencia));
                cmd.Parameters.Add(new MySqlParameter("?pds_proprietario" ,pobjentCotacaoAutomovel.ds_proprietario));
                cmd.Parameters.Add(new MySqlParameter("?pds_principal_condutor" ,pobjentCotacaoAutomovel.ds_principal_condutor));
                cmd.Parameters.Add(new MySqlParameter("?pds_relacao_proprietario" ,pobjentCotacaoAutomovel.ds_relacao_proprietario));
                cmd.Parameters.Add(new MySqlParameter("?pds_18_a_25_dirige" ,pobjentCotacaoAutomovel.ds_18_a_25_dirige));
                cmd.Parameters.Add(new MySqlParameter("?pds_mora_em" , pobjentCotacaoAutomovel.ds_mora_em));
                cmd.Parameters.Add(new MySqlParameter("?pds_local_pernoite"  , pobjentCotacaoAutomovel.ds_local_pernoite));
                cmd.Parameters.Add(new MySqlParameter("?pds_utilizacao" , pobjentCotacaoAutomovel.ds_utilizacao));
                cmd.Parameters.Add(new MySqlParameter("?pds_garagem_residencia" ,pobjentCotacaoAutomovel.ds_garagem_residencia));
                cmd.Parameters.Add(new MySqlParameter("?pds_garagem_trabalho" ,pobjentCotacaoAutomovel.ds_garagem_trabalho));
                cmd.Parameters.Add(new MySqlParameter("?pds_garagem_escola" ,pobjentCotacaoAutomovel.ds_garagem_escola));
                cmd.Parameters.Add(new MySqlParameter("?pds_km_media_mensal" ,pobjentCotacaoAutomovel.ds_km_media_mensal));
                cmd.Parameters.Add(new MySqlParameter("?pnr_idade_habilitacao" ,pobjentCotacaoAutomovel.nr_idade_habilitacao));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_relacao_com_segurado" ,pobjentCotacaoAutomovel.ds_condutor_relacao_com_segurado));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_data_nascimento" ,pobjentCotacaoAutomovel.ds_condutor_data_nascimento));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_cpf" ,pobjentCotacaoAutomovel.ds_condutor_cpf));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_nome" ,pobjentCotacaoAutomovel.ds_condutor_nome));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_idade_p_habilitacao" ,pobjentCotacaoAutomovel.ds_condutor_idade_p_habilitacao));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_genero" ,pobjentCotacaoAutomovel.ds_condutor_genero));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_estado_civil" ,pobjentCotacaoAutomovel.ds_condutor_estado_civil));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_profissao" ,pobjentCotacaoAutomovel.ds_condutor_profissao));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_detalhe_profissao" ,pobjentCotacaoAutomovel.ds_condutor_detalhe_profissao));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_reside_em" ,pobjentCotacaoAutomovel.ds_condutor_reside_em));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_considerado" ,pobjentCotacaoAutomovel.ds_condutor_considerado));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_acima_25"  ,pobjentCotacaoAutomovel.ds_condutor_acima_25));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_total_veiculos"  ,pobjentCotacaoAutomovel.ds_condutor_total_veiculos));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_rg"  ,pobjentCotacaoAutomovel.ds_condutor_rg));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_data_emissao_rg" ,pobjentCotacaoAutomovel.ds_condutor_data_emissao_rg));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_emissor_rg"  ,pobjentCotacaoAutomovel.ds_condutor_emissor_rg));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_cnh" ,pobjentCotacaoAutomovel.ds_condutor_cnh));
                cmd.Parameters.Add(new MySqlParameter("?pds_condutor_data_habilitacao" ,pobjentCotacaoAutomovel.ds_condutor_data_habilitacao));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura" ,pobjentCotacaoAutomovel.ds_cobertura));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura_valor_mercado"  ,pobjentCotacaoAutomovel.ds_cobertura_valor_mercado));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura_valor_acessorios"  ,pobjentCotacaoAutomovel.ds_cobertura_valor_acessorios));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura_valor_vidros"  ,pobjentCotacaoAutomovel.ds_cobertura_valor_vidros));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura_valor_equipamentos"  ,pobjentCotacaoAutomovel.ds_cobertura_valor_equipamentos));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura_valor_despesas_extras" ,pobjentCotacaoAutomovel.ds_cobertura_valor_despesas_extras));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura_carro_reserva"  ,pobjentCotacaoAutomovel.ds_cobertura_carro_reserva));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura_assistencia"  ,pobjentCotacaoAutomovel.ds_cobertura_assistencia));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura_danos_materiais"  ,pobjentCotacaoAutomovel.ds_cobertura_danos_materiais));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura_danos_corporais"  ,pobjentCotacaoAutomovel.ds_cobertura_danos_corporais));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura_danos_morais"  ,pobjentCotacaoAutomovel.ds_cobertura_danos_morais));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura_valor_dia_paralisacao" ,pobjentCotacaoAutomovel.ds_cobertura_valor_dia_paralisacao));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura_passageiros"  ,pobjentCotacaoAutomovel.ds_cobertura_passageiros));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura_valor_morte"  ,pobjentCotacaoAutomovel.ds_cobertura_valor_morte));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura_valor_invalidez"  ,pobjentCotacaoAutomovel.ds_cobertura_valor_invalidez));
                cmd.Parameters.Add(new MySqlParameter("?pds_cobertura_valor_despesas_medicas"  ,pobjentCotacaoAutomovel.ds_cobertura_valor_despesas_medicas));
                cmd.Parameters.Add(new MySqlParameter("?pds_renovacao_seguradora"  ,pobjentCotacaoAutomovel.ds_renovacao_seguradora));
                cmd.Parameters.Add(new MySqlParameter("?pds_renovacao_bonus_anterior" ,pobjentCotacaoAutomovel.ds_renovacao_bonus_anterior));
                cmd.Parameters.Add(new MySqlParameter("?pds_renovacao_bonus_atual"   ,pobjentCotacaoAutomovel.ds_renovacao_bonus_atual));
                cmd.Parameters.Add(new MySqlParameter("?pds_renovacao_data_vigencia_anterior_inicio" ,pobjentCotacaoAutomovel.ds_renovacao_data_vigencia_anterior_inicio));
                cmd.Parameters.Add(new MySqlParameter("?pds_renovacao_data_vigencia_anterior_fim" ,pobjentCotacaoAutomovel.ds_renovacao_data_vigencia_anterior_fim));
                cmd.Parameters.Add(new MySqlParameter("?pds_renovacao_apolice",pobjentCotacaoAutomovel.ds_renovacao_apolice));
                cmd.Parameters.Add(new MySqlParameter("?pds_renovacao_apolice_item" ,pobjentCotacaoAutomovel.ds_renovacao_apolice_item));
                cmd.Parameters.Add(new MySqlParameter("?pds_renovacao_apolice_ci" ,pobjentCotacaoAutomovel.ds_renovacao_apolice_ci));

                cmd.Parameters.Add(new MySqlParameter("?pid_cotacao", MySqlDbType.Int32));
                cmd.Parameters["?pid_cotacao"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();

                retorno = (Int32)cmd.Parameters["?pid_cotacao"].Value;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                return 0;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return retorno;
        }
        public int AtualizarStatusCotacao(int pid_cotacao, string pcd_status_cotacao)
        {
            Int32 retorno = 0;
            entCotacaoAutomovel objResp = new entCotacaoAutomovel();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cotacao_status_atualizar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cotacao", pid_cotacao));
                cmd.Parameters.Add(new MySqlParameter("?pcd_status_cotacao", pcd_status_cotacao));
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                return 0;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return pid_cotacao;
        }

        public int AprovarCotacaoAutomovel(int pid_cotacao, int pid_seguradora, string pflg_aprovacao, int pid_cliente_aprovador)
        {
            Int32 retorno = 0;
            entCotacaoAutomovel objResp = new entCotacaoAutomovel();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cotacao_item_aprovar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cotacao", pid_cotacao));
                cmd.Parameters.Add(new MySqlParameter("?pid_seguradora", pid_seguradora));
                cmd.Parameters.Add(new MySqlParameter("?pfl_aprovada", pflg_aprovacao));
                cmd.Parameters.Add(new MySqlParameter("?pid_cliente_aprovador", pid_cliente_aprovador));
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                return 0;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return pid_cotacao;
        }
        public List<entCotacaoAutomovelGrid> ListarCotacoes(int pid_cliente)
        {

            List<entCotacaoAutomovelGrid> objResp = new List<entCotacaoAutomovelGrid>();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cotacao_automovel_listar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cliente", pid_cliente));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {

                        entCotacaoAutomovelGrid objEnt = new entCotacaoAutomovelGrid();
                        objEnt.id_cotacao = Convert.ToString(myReader["id_cotacao"]);
                        objEnt.id_cotacao_automovel =Convert.ToString(myReader["id_cotacao_automovel"]);
                        objEnt.ds_ramo =Convert.ToString(myReader["ds_ramo"]);
                        objEnt.id_cliente = Convert.ToString(myReader["id_cliente"]);
                        objEnt.ds_nome = Convert.ToString(myReader["ds_nome"]);
                        objEnt.ds_telefone_celular = Convert.ToString(myReader["ds_telefone_celular"]);
                        if (myReader["dt_cotacao"].ToString() != "") objEnt.dt_cotacao = Convert.ToDateTime(myReader["dt_cotacao"]).ToString(@"dd/MM/yyyy");
                        objEnt.cd_status_cotacao = Convert.ToString(myReader["cd_status_cotacao"]);
                        //objEnt.ds_pdf = Convert.ToString(myReader["ds_seguradora"]);
                        if (Convert.ToString(myReader["ds_pdf"]).Trim() != string.Empty) objEnt.bt_dl_pdf = "<img src='../../images/dl_pdf.png' style='width: 40px; height: 40px; ' onclick=\"CarregaPDF('A','" + Convert.ToString(myReader["ds_pdf"]) + "')\">"; 
                        objEnt.bt_atualizar = "<button type=\"button\" class='btn btn-xs btn-success pull-right' onclick=\"CarregaCotacao('A','" + Convert.ToString(myReader["id_cotacao"]) + "')\">Alterar</button>";
                        
                        objEnt.ds_status_cotacao = Convert.ToString(myReader["ds_status_cotacao"]);
                        objEnt.ds_marca = Convert.ToString(myReader["ds_marca"]);
                        objEnt.ds_modelo = Convert.ToString(myReader["ds_modelo"]);
                        objEnt.ds_ano_fabricao = Convert.ToString(myReader["ds_ano_fabricao"]);
                        objEnt.ds_ano_modelo = Convert.ToString(myReader["ds_ano_modelo"]);

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
        public entCotacaoAutomovel ConsultarCotacaoAutomovel(int pid_cotacao)
        {
            entCotacaoAutomovel objCotacaoAutomovel = new entCotacaoAutomovel();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cotacao_automovel_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cotacao", pid_cotacao));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {

                        objCotacaoAutomovel.id_cotacao_automovel = Convert.ToInt32(myReader["id_cotacao_automovel"]);
                        objCotacaoAutomovel.id_cotacao = Convert.ToInt32(myReader["id_cotacao"]);
                        objCotacaoAutomovel.id_cliente = Convert.ToInt32(myReader["id_cliente"]);
                        objCotacaoAutomovel.ds_pdf = Convert.ToString(myReader["ds_pdf"]);
                        objCotacaoAutomovel.ds_status_cotacao = Convert.ToString(myReader["ds_status_cotacao"]).Trim();
                        objCotacaoAutomovel.ds_tipo_cotacao = Convert.ToString(myReader["ds_tipo_cotacao"]).Trim();
                        objCotacaoAutomovel.ds_data_vigencia_inicial = Convert.ToString(myReader["ds_data_vigencia_inicial"]).Trim();
                        objCotacaoAutomovel.ds_data_vigencia_final = Convert.ToString(myReader["ds_data_vigencia_final"]).Trim();
                        objCotacaoAutomovel.ds_ano_fabricao = Convert.ToString(myReader["ds_ano_fabricao"]).Trim();
                        objCotacaoAutomovel.ds_ano_modelo = Convert.ToString(myReader["ds_ano_modelo"]).Trim();
                        objCotacaoAutomovel.cd_fipe = Convert.ToString(myReader["cd_fipe"]).Trim();
                        objCotacaoAutomovel.ds_marca = Convert.ToString(myReader["ds_marca"]).Trim();
                        objCotacaoAutomovel.ds_modelo = Convert.ToString(myReader["ds_modelo"]).Trim();
                        objCotacaoAutomovel.ds_versao = Convert.ToString(myReader["ds_versao"]).Trim();
                        objCotacaoAutomovel.ds_chassi = Convert.ToString(myReader["ds_chassi"]).Trim();
                        objCotacaoAutomovel.ds_zero_km = Convert.ToString(myReader["ds_zero_km"]).Trim();
                        objCotacaoAutomovel.ds_estado_veiculo = Convert.ToString(myReader["ds_estado_veiculo"]).Trim();
                        objCotacaoAutomovel.ds_placa = Convert.ToString(myReader["ds_placa"]).Trim();
                        objCotacaoAutomovel.ds_combustivel = Convert.ToString(myReader["ds_combustivel"]).Trim();
                        objCotacaoAutomovel.ds_portas = Convert.ToString(myReader["ds_portas"]).Trim();
                        objCotacaoAutomovel.ds_utilizacao_veiculo = Convert.ToString(myReader["ds_utilizacao_veiculo"]).Trim();
                        objCotacaoAutomovel.ds_cep_pernoite = Convert.ToString(myReader["ds_cep_pernoite"]).Trim();
                        objCotacaoAutomovel.ds_financiado = Convert.ToString(myReader["ds_financiado"]).Trim();
                        objCotacaoAutomovel.ds_kit_gas = Convert.ToString(myReader["ds_kit_gas"]).Trim();
                        objCotacaoAutomovel.ds_taxi = Convert.ToString(myReader["ds_taxi"]).Trim();
                        objCotacaoAutomovel.ds_aplicativo = Convert.ToString(myReader["ds_aplicativo"]).Trim();
                        objCotacaoAutomovel.ds_blindado = Convert.ToString(myReader["ds_blindado"]).Trim();
                        objCotacaoAutomovel.ds_pcd = Convert.ToString(myReader["ds_pcd"]).Trim();
                        objCotacaoAutomovel.ds_cep_circulacao = Convert.ToString(myReader["ds_cep_circulacao"]).Trim();
                        objCotacaoAutomovel.ds_cep_residencia = Convert.ToString(myReader["ds_cep_residencia"]).Trim();
                        objCotacaoAutomovel.ds_proprietario = Convert.ToString(myReader["ds_proprietario"]).Trim();
                        objCotacaoAutomovel.ds_principal_condutor = Convert.ToString(myReader["ds_principal_condutor"]).Trim();
                        objCotacaoAutomovel.ds_relacao_proprietario = Convert.ToString(myReader["ds_relacao_proprietario"]).Trim();
                        objCotacaoAutomovel.ds_18_a_25_dirige = Convert.ToString(myReader["ds_18_a_25_dirige"]).Trim();
                        objCotacaoAutomovel.ds_mora_em = Convert.ToString(myReader["ds_mora_em"]).Trim();
                        objCotacaoAutomovel.ds_local_pernoite = Convert.ToString(myReader["ds_local_pernoite"]).Trim();
                        objCotacaoAutomovel.ds_utilizacao = Convert.ToString(myReader["ds_utilizacao"]).Trim();
                        objCotacaoAutomovel.ds_garagem_residencia = Convert.ToString(myReader["ds_garagem_residencia"]).Trim();
                        objCotacaoAutomovel.ds_garagem_trabalho = Convert.ToString(myReader["ds_garagem_trabalho"]).Trim();
                        objCotacaoAutomovel.ds_garagem_escola = Convert.ToString(myReader["ds_garagem_escola"]).Trim();
                        objCotacaoAutomovel.ds_km_media_mensal = Convert.ToString(myReader["ds_km_media_mensal"]).Trim();
                        objCotacaoAutomovel.nr_idade_habilitacao = Convert.ToString(myReader["nr_idade_habilitacao"]).Trim();
                        objCotacaoAutomovel.ds_condutor_relacao_com_segurado = Convert.ToString(myReader["ds_condutor_relacao_com_segurado"]).Trim();
                        objCotacaoAutomovel.ds_condutor_data_nascimento = Convert.ToString(myReader["ds_condutor_data_nascimento"]).Trim();
                        objCotacaoAutomovel.ds_condutor_cpf = Convert.ToString(myReader["ds_condutor_cpf"]).Trim();
                        objCotacaoAutomovel.ds_condutor_nome = Convert.ToString(myReader["ds_condutor_nome"]).Trim();
                        objCotacaoAutomovel.ds_condutor_idade_p_habilitacao = Convert.ToString(myReader["ds_condutor_idade_p_habilitacao"]).Trim();
                        objCotacaoAutomovel.ds_condutor_genero = Convert.ToString(myReader["ds_condutor_genero"]).Trim();
                        objCotacaoAutomovel.ds_condutor_estado_civil = Convert.ToString(myReader["ds_condutor_estado_civil"]).Trim();
                        objCotacaoAutomovel.ds_condutor_profissao = Convert.ToString(myReader["ds_condutor_profissao"]).Trim();
                        objCotacaoAutomovel.ds_condutor_detalhe_profissao = Convert.ToString(myReader["ds_condutor_detalhe_profissao"]).Trim();
                        objCotacaoAutomovel.ds_condutor_reside_em = Convert.ToString(myReader["ds_condutor_reside_em"]).Trim();
                        objCotacaoAutomovel.ds_condutor_considerado = Convert.ToString(myReader["ds_condutor_considerado"]).Trim();
                        objCotacaoAutomovel.ds_condutor_acima_25 = Convert.ToString(myReader["ds_condutor_acima_25"]).Trim();
                        objCotacaoAutomovel.ds_condutor_total_veiculos = Convert.ToString(myReader["ds_condutor_total_veiculos"]).Trim();
                        objCotacaoAutomovel.ds_condutor_rg = Convert.ToString(myReader["ds_condutor_rg"]).Trim();
                        objCotacaoAutomovel.ds_condutor_data_emissao_rg = Convert.ToString(myReader["ds_condutor_data_emissao_rg"]).Trim();
                        objCotacaoAutomovel.ds_condutor_emissor_rg = Convert.ToString(myReader["ds_condutor_emissor_rg"]).Trim();
                        objCotacaoAutomovel.ds_condutor_cnh = Convert.ToString(myReader["ds_condutor_cnh"]).Trim();
                        objCotacaoAutomovel.ds_condutor_data_habilitacao = Convert.ToString(myReader["ds_condutor_data_habilitacao"]).Trim();
                        objCotacaoAutomovel.ds_cobertura = Convert.ToString(myReader["ds_cobertura"]).Trim();
                        objCotacaoAutomovel.ds_cobertura_valor_mercado = Convert.ToString(myReader["ds_cobertura_valor_mercado"]).Trim();
                        objCotacaoAutomovel.ds_cobertura_valor_acessorios = Convert.ToString(myReader["ds_cobertura_valor_acessorios"]).Trim();
                        objCotacaoAutomovel.ds_cobertura_valor_vidros = Convert.ToString(myReader["ds_cobertura_valor_vidros"]).Trim();
                        objCotacaoAutomovel.ds_cobertura_valor_equipamentos = Convert.ToString(myReader["ds_cobertura_valor_equipamentos"]).Trim();
                        objCotacaoAutomovel.ds_cobertura_valor_despesas_extras = Convert.ToString(myReader["ds_cobertura_valor_despesas_extras"]).Trim();
                        objCotacaoAutomovel.ds_cobertura_carro_reserva = Convert.ToString(myReader["ds_cobertura_carro_reserva"]).Trim();
                        objCotacaoAutomovel.ds_cobertura_assistencia = Convert.ToString(myReader["ds_cobertura_assistencia"]).Trim();
                        objCotacaoAutomovel.ds_cobertura_danos_materiais = Convert.ToString(myReader["ds_cobertura_danos_materiais"]).Trim();
                        objCotacaoAutomovel.ds_cobertura_danos_corporais = Convert.ToString(myReader["ds_cobertura_danos_corporais"]).Trim();
                        objCotacaoAutomovel.ds_cobertura_danos_morais = Convert.ToString(myReader["ds_cobertura_danos_morais"]).Trim();
                        objCotacaoAutomovel.ds_cobertura_valor_dia_paralisacao = Convert.ToString(myReader["ds_cobertura_valor_dia_paralisacao"]).Trim();
                        objCotacaoAutomovel.ds_cobertura_passageiros = Convert.ToString(myReader["ds_cobertura_passageiros"]).Trim();
                        objCotacaoAutomovel.ds_cobertura_valor_morte = Convert.ToString(myReader["ds_cobertura_valor_morte"]).Trim();
                        objCotacaoAutomovel.ds_cobertura_valor_invalidez = Convert.ToString(myReader["ds_cobertura_valor_invalidez"]).Trim();
                        objCotacaoAutomovel.ds_cobertura_valor_despesas_medicas = Convert.ToString(myReader["ds_cobertura_valor_despesas_medicas"]).Trim();
                        objCotacaoAutomovel.ds_renovacao_seguradora = Convert.ToString(myReader["ds_renovacao_seguradora"]).Trim();
                        objCotacaoAutomovel.ds_renovacao_bonus_anterior = Convert.ToString(myReader["ds_renovacao_bonus_anterior"]).Trim();
                        objCotacaoAutomovel.ds_renovacao_bonus_atual = Convert.ToString(myReader["ds_renovacao_bonus_atual"]).Trim();
                        objCotacaoAutomovel.ds_renovacao_data_vigencia_anterior_inicio = Convert.ToString(myReader["ds_renovacao_data_vigencia_anterior_inicio"]).Trim();
                        objCotacaoAutomovel.ds_renovacao_data_vigencia_anterior_fim = Convert.ToString(myReader["ds_renovacao_data_vigencia_anterior_fim"]).Trim();
                        objCotacaoAutomovel.ds_renovacao_apolice = Convert.ToString(myReader["ds_renovacao_apolice"]).Trim();
                        objCotacaoAutomovel.ds_renovacao_apolice_item = Convert.ToString(myReader["ds_renovacao_apolice_item"]).Trim();
                        objCotacaoAutomovel.ds_renovacao_apolice_ci = Convert.ToString(myReader["ds_renovacao_apolice_ci"]).Trim();

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
            return objCotacaoAutomovel;
        }
        public int IncluirCotacaoAutomovelItem(entCotacaoAutomovelItem pobjentCotacaoAutomovelItem)
        {
            Int32 retorno = 0;
            entCotacaoAutomovelItem objResp = new entCotacaoAutomovelItem();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cotacao_automovel_item_incluir", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cotacao", pobjentCotacaoAutomovelItem.id_cotacao));
                cmd.Parameters.Add(new MySqlParameter("?pid_seguradora_cotacao", pobjentCotacaoAutomovelItem.id_seguradora_cotacao));
                cmd.Parameters.Add(new MySqlParameter("?pid_forma_pagamento", pobjentCotacaoAutomovelItem.id_forma_pagamento));
                cmd.Parameters.Add(new MySqlParameter("?pds_valor_franquia_50", pobjentCotacaoAutomovelItem.ds_valor_franquia_50));
                cmd.Parameters.Add(new MySqlParameter("?pds_valor_premio_f50", pobjentCotacaoAutomovelItem.ds_valor_premio_f50));
                cmd.Parameters.Add(new MySqlParameter("?pds_valor_franquia_100", pobjentCotacaoAutomovelItem.ds_valor_franquia_100));
                cmd.Parameters.Add(new MySqlParameter("?pds_valor_premio_f100", pobjentCotacaoAutomovelItem.ds_valor_premio_f100));

                cmd.ExecuteNonQuery();

                retorno = 1;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                return 0;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return retorno;
        }
        public List<entCotacaoAutomovelItemGrid> ListarCotacaoAutomovelItens(int pid_cotacao)
        {

            List<entCotacaoAutomovelItemGrid> objResp = new List<entCotacaoAutomovelItemGrid>();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cotacao_automovel_item_listar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cotacao", pid_cotacao));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {

                        entCotacaoAutomovelItemGrid objEnt = new entCotacaoAutomovelItemGrid();

                        objEnt.id_cotacao = Convert.ToString(myReader["id_cotacao"]);
                        objEnt.id_seguradora_cotacao = Convert.ToString(myReader["id_seguradora_cotacao"]);
                        objEnt.id_forma_pagamento = Convert.ToString(myReader["id_forma_pagamento"]);
                        if (Convert.ToString(myReader["id_forma_pagamento"]) == "1") objEnt.ds_forma_pagamento = "Cartão de Crédito";
                        if (Convert.ToString(myReader["id_forma_pagamento"]) == "2") objEnt.ds_forma_pagamento = "Boleto";
                        if (Convert.ToString(myReader["id_forma_pagamento"]) == "3") objEnt.ds_forma_pagamento = "Débito em Conta";

                        objEnt.ds_valor_franquia_50 = "R$ " + Convert.ToString(myReader["ds_valor_franquia_50"]);
                        objEnt.ds_valor_premio_f50 = "R$ " + Convert.ToString(myReader["ds_valor_premio_f50"]);
                        objEnt.ds_valor_franquia_100 = "R$ " + Convert.ToString(myReader["ds_valor_franquia_100"]);
                        objEnt.ds_valor_premio_f100 = "R$ " + Convert.ToString(myReader["ds_valor_premio_f100"]);
                        objEnt.fl_aprovada_normal = Convert.ToString(myReader["fl_aprovada_normal"]);
                        objEnt.fl_aprovada_reduzida = Convert.ToString(myReader["fl_aprovada_reduzida"]);
                        objEnt.ds_nome_cliente_aprovada_normal = Convert.ToString(myReader["ds_nome_cliente_aprovada_normal"]);
                        objEnt.ds_nome_cliente_aprovada_reduzida = Convert.ToString(myReader["ds_nome_cliente_aprovada_reduzida"]);
                        objEnt.ds_data_hora_aprovada_normal = Convert.ToString(myReader["ds_data_hora_aprovada_normal"]);
                        objEnt.ds_data_hora_aprovada_reduzida = Convert.ToString(myReader["ds_data_hora_aprovada_reduzida"]);
                        if (Convert.ToString(myReader["cd_status_cotacao"]) == "CP") 
                        { 
                            objEnt.bt_cotacao_aprova_normal = "<button type=\"button\" class='btn btn-xs btn-success pull-right' onclick=\"AprovarCotacao('NOR','" + Convert.ToString(myReader["id_cotacao"]) + "','" + Convert.ToString(myReader["id_seguradora_cotacao"]) + "','" + Convert.ToString(myReader["ds_valor_premio_f100"]) + "')\">APROVAR NORMAL</button>";
                            objEnt.bt_cotacao_aprova_reduzida = "<button type=\"button\" class='btn btn-xs btn-success pull-right' onclick=\"AprovarCotacao('RED','" + Convert.ToString(myReader["id_cotacao"]) + "','" + Convert.ToString(myReader["id_seguradora_cotacao"]) + "','" + Convert.ToString(myReader["ds_valor_premio_f50"]) + "')\">APROVAR REDUZIDA 50%</button>";
                        }
                        else
                        { 
                            objEnt.bt_cotacao_aprova_normal = "";
                            objEnt.bt_cotacao_aprova_reduzida = "";
                        }
                        objEnt.img_seguradora_cotacao_foto = "<img src='" + NomeFotoSeguradora(Convert.ToInt32(myReader["id_seguradora_cotacao"])) + "' style='width: 200px; height: 50px; '>";

                        objEnt.ds_Franquia1 = "R$ " + Convert.ToString(myReader["ds_valor_premio_f50"]) + "<br><small class='text-muted'><i>Franquia: R$ " + Convert.ToString(myReader["ds_valor_franquia_50"])  + "<i></small>";
                        objEnt.ds_Franquia2 = "R$ " + Convert.ToString(myReader["ds_valor_premio_f100"]) + "<br><small class='text-muted'><i>Franquia: R$ " + Convert.ToString(myReader["ds_valor_franquia_100"]) + "<i></small>";



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
        public int ExcluirItensCotacao(int pid_cotacao)
        {
            Int32 retorno = 0;
            entCotacaoAutomovelItem objResp = new entCotacaoAutomovelItem();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cotacao_automovel_item_excluir", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cotacao", pid_cotacao));
                cmd.ExecuteNonQuery();

                retorno = 1;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                return 0;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return retorno;
        }
        private string NomeFotoSeguradora(int pid_seguradora)
        {
            if (pid_seguradora == 1) { return "images/01_cotacao_porto.jpg"; }
            if (pid_seguradora == 2) { return "images/02_cotacao_azul.jpg"; }
            if (pid_seguradora == 3) { return "images/03_cotacao_liberty.jpg"; }
            if (pid_seguradora == 4) { return "images/04_cotacao_hdi.jpg"; }
            if (pid_seguradora == 5) { return "images/05_cotacao_mapfre.jpg"; }
            if (pid_seguradora == 6) { return "images/06_cotacao_suhai.jpg"; }
            return "";
        }
        public int AtualizarPDFCotacao(int pid_cotacao, string pds_pdf)
        {
            Int32 retorno = 0;
            entCotacaoAutomovel objResp = new entCotacaoAutomovel();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cotacao_pdf_atualizar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cotacao", pid_cotacao));
                cmd.Parameters.Add(new MySqlParameter("?pds_pdf", pds_pdf));
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                return 0;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return pid_cotacao;
        }
        public bool IncluirCotacaoInteracao(entCotacaoInteracao pobjentCotacaoInteracao)
        {
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cotacao_interacao_incluir", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cotacao", pobjentCotacaoInteracao.id_cotacao));
                cmd.Parameters.Add(new MySqlParameter("?pid_forma_pagamento", pobjentCotacaoInteracao.id_forma_pagamento));
                cmd.Parameters.Add(new MySqlParameter("?pds_mensagem", pobjentCotacaoInteracao.ds_mensagem));
                cmd.Parameters.Add(new MySqlParameter("?pds_pdf_cotacao_concorrente", pobjentCotacaoInteracao.ds_pdf_cotacao_concorrente));
               
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
        public bool IncluirCotacaoFormaPagamento(entCotacaoFormaPagamento pobjent)
        {
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cotacao_forma_pagamento_incluir", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cotacao", pobjent.id_cotacao));
                cmd.Parameters.Add(new MySqlParameter("?pid_forma_pagamento", pobjent.id_forma_pagamento));
                cmd.Parameters.Add(new MySqlParameter("?pnr_parcelas", pobjent.nr_parcelas));
                cmd.Parameters.Add(new MySqlParameter("?pds_bandeira_cc", pobjent.ds_bandeira_cc));
                cmd.Parameters.Add(new MySqlParameter("?pds_nr_cartao_cc", pobjent.ds_nr_cartao_cc));
                cmd.Parameters.Add(new MySqlParameter("?pds_validade_cc", pobjent.ds_validade_cc));
                cmd.Parameters.Add(new MySqlParameter("?pds_nome_cliente_cc", pobjent.ds_nome_cliente_cc));
                cmd.Parameters.Add(new MySqlParameter("?ptp_dados_segurado_dc", pobjent.tp_dados_segurado_dc));
                cmd.Parameters.Add(new MySqlParameter("?pds_nome_titular_conta_dc", pobjent.ds_nome_titular_conta_dc));
                cmd.Parameters.Add(new MySqlParameter("?pds_banco_dc", pobjent.ds_banco_dc));
                cmd.Parameters.Add(new MySqlParameter("?ptp_pessoa_dc", pobjent.tp_pessoa_dc));
                cmd.Parameters.Add(new MySqlParameter("?pds_cpf_titular_conta_dc", pobjent.ds_cpf_titular_conta_dc));
                cmd.Parameters.Add(new MySqlParameter("?pds_parentesco_titular_dc", pobjent.ds_parentesco_titular_dc));
                cmd.Parameters.Add(new MySqlParameter("?pds_nr_agencia_dc", pobjent.ds_nr_agencia_dc));
                cmd.Parameters.Add(new MySqlParameter("?pds_digito_agencia_dc", pobjent.ds_digito_agencia_dc));
                cmd.Parameters.Add(new MySqlParameter("?pds_nr_conta_dc", pobjent.ds_nr_conta_dc));
                cmd.Parameters.Add(new MySqlParameter("?pds_digito_conta_dc", pobjent.ds_digito_conta_dc));

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
        public entCotacaoFormaPagamento ConsultarCotacaoFormaPagamento(int pid_cotacao)
        {
            entCotacaoFormaPagamento objEnt = new entCotacaoFormaPagamento();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                
                MySqlCommand cmd = new MySqlCommand("sp_cotacao_forma_pagamento_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cotacao", pid_cotacao));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {
                        objEnt.id_cotacao = Convert.ToInt32(myReader["id_cotacao"]);
                        objEnt.id_cotacao_forma_pagamento = Convert.ToInt32(myReader["id_cotacao_forma_pagamento"]);
                        objEnt.nr_parcelas = Convert.ToString(myReader["nr_parcelas"]);
                        objEnt.ds_bandeira_cc = Convert.ToString(myReader["ds_bandeira_cc"]);
                        objEnt.ds_nr_cartao_cc = Convert.ToString(myReader["ds_nr_cartao_cc"]);
                        objEnt.ds_validade_cc = Convert.ToString(myReader["ds_validade_cc"]);
                        objEnt.ds_nome_cliente_cc = Convert.ToString(myReader["ds_nome_cliente_cc"]);
                        objEnt.tp_dados_segurado_dc = Convert.ToString(myReader["tp_dados_segurado_dc"]);
                        objEnt.ds_nome_titular_conta_dc = Convert.ToString(myReader["ds_nome_titular_conta_dc"]);
                        objEnt.ds_banco_dc = Convert.ToString(myReader["ds_banco_dc"]);
                        objEnt.tp_pessoa_dc = Convert.ToString(myReader["tp_pessoa_dc"]);
                        objEnt.ds_cpf_titular_conta_dc = Convert.ToString(myReader["ds_cpf_titular_conta_dc"]);
                        objEnt.ds_parentesco_titular_dc = Convert.ToString(myReader["ds_parentesco_titular_dc"]);
                        objEnt.ds_nr_agencia_dc = Convert.ToString(myReader["ds_nr_agencia_dc"]);
                        objEnt.ds_digito_agencia_dc = Convert.ToString(myReader["ds_digito_agencia_dc"]);
                        objEnt.ds_nr_conta_dc = Convert.ToString(myReader["ds_nr_conta_dc"]);
                        objEnt.ds_digito_conta_dc = Convert.ToString(myReader["ds_digito_conta_dc"]);
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
        public int ConsultarCotacaoFormaPagamentoId(int pid_cotacao)
        {
            int Ret = 0;
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {

                MySqlCommand cmd = new MySqlCommand("sp_cotacao_forma_pagamento_id_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cotacao", pid_cotacao));
                MySqlDataReader myReader;
                myReader = cmd.ExecuteReader();
                try
                {
                    while (myReader.Read())
                    {
                        Ret = Convert.ToInt32(myReader["id_forma_pagamento"]);
                    }


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
            return Ret;
        }
        public int ClonarCotacao(int pid_cotacao)
        {
            int retorno = 0;
            entCotacaoAutomovel objResp = new entCotacaoAutomovel();
            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_cotacao_clonar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new MySqlParameter("?pid_cotacao", pid_cotacao));
                cmd.Parameters.Add(new MySqlParameter("?pid_cotacao_clone", MySqlDbType.Int32));
                cmd.Parameters["?pid_cotacao_clone"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                retorno = (Int32)cmd.Parameters["?pid_cotacao_clone"].Value;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                return 0;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return retorno;
        }
        public entCotacaoEnviar ConsultarCotacaoEnviar(int pid_cotacao)
        {

            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                //var sql = "exec [db_acto.sp_cotacao_automovel_consultar_enviar] @pid_cotacao";
                var sql = "CALL `db_acto`.`sp_cotacao_automovel_consultar_enviar`(@pid_cotacao)";
                var values = new { pid_cotacao = pid_cotacao.ToString() };
                return conn.Query<entCotacaoEnviar>(sql, values).FirstOrDefault();

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
        //public string ConsultarPDFCotacao(int pid_cotacao)
        //{
        //    InfraDb ActoDb = new InfraDb();
        //    MySqlConnection conn = ActoDb.ActoConn();
        //    try
        //    {
        //        MySqlCommand cmd = new MySqlCommand("sp_cotacao_pdf_consultar", conn);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.Add(new MySqlParameter("?pid_cotacao", pid_cotacao));
        //        MySqlDataReader myReader;
        //        myReader = cmd.ExecuteReader();
        //        try
        //        {
        //            while (myReader.Read())
        //            {
        //                return Convert.ToString(myReader["ds_pdf"]).Trim();
        //            }


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
        //    return "";
        //}
    }
}

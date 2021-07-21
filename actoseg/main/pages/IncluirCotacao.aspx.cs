using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Acto.Infra.Contexto;
using Acto.Cliente.Busines;
using Acto.Cliente.Entity;
using Acto.Fipe.Busines;
using Acto.Fipe.Entity;
using Acto.Cotacao.Busines;
using Acto.Cotacao.Entity;
using Acto.Usuario.Entity;

namespace actoseg.main.pages
{
    public partial class IncluirCotacao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];
            if (objContexto == null) Response.Redirect("Login.aspx");
            //txtEmail.Text = objContexto.Usuario.Email;
            // busCliente objBusCliente = new busCliente();
            //entCliente objEntcliente;// = objBusCliente.ConsultarClienteEmail(objContexto.Usuario.Email);

            //objContexto.Cliente = (entCliente)HttpContext.Current.Session["contexto"];
            //HttpContext.Current.Session["contexto"] = objContexto;
            
            // entCliente objEntcliente = objContexto.Cliente(); 

            txtIdClienteIndicador.Text = objContexto.Cliente.id_cliente.ToString();
            txtNomeClienteIndicador.Text = objContexto.Cliente.ds_nome.ToString();
            if (!string.IsNullOrEmpty(Request["req"]))
             { 
                txtIdCotacao.Text = Request["req"];
                busCotacao objBus = new busCotacao();
                //Acesso a qualquer cotação
                if (objBus.ListarCotacoes(objContexto.Cliente.id_cliente).Exists(x => x.id_cotacao.Trim() == txtIdCotacao.Text.Trim()) == false)
                {
                    if (objContexto.TemPermissao("CONTODCOT") == false) Response.Redirect("Login.aspx");
                }
            }

            if (!string.IsNullOrEmpty(Request["ClienteCotacaoNova"]))
            {
                txtIdClienteCotacaoNova.Text = Request["ClienteCotacaoNova"];
                busCliente objBus = new busCliente();
                //Acesso a qualquer cotação
                if (objBus.ListarClientesIndicados(objContexto.Cliente.id_cliente).Exists(x => x.id_cliente.ToString().Trim() == txtIdClienteCotacaoNova.Text.Trim()) == false)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static string wmListarMarcas(int tipo)
        {

            busFipe objBus = new busFipe();
            List<entMarca> objLst = objBus.ListarMarcas(tipo);
            var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return oSerializer.Serialize(objLst);
            //return objLstIndicado;
        }
        [System.Web.Services.WebMethod]
        public static string wmListarModelos(int codigo_marca, int ano)
        {

            busFipe objBus = new busFipe();
            List<entModelo> objLst = objBus.ListarModelo(codigo_marca, ano);
            var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return oSerializer.Serialize(objLst);
            //return objLstIndicado;
        }
        [System.Web.Services.WebMethod]
        public static entMarca wmConsultarMarcaModelo(string pcd_fipe)
        {
            busFipe objBus = new busFipe();
            entMarca objEnt = objBus.ConsultarMarcaModelo(pcd_fipe);
            //var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            //return oSerializer.Serialize(objEnt);
            return objEnt;
        }
        [System.Web.Services.WebMethod]
        public static string wmListarUtilizacoes()
        {

            busCotacao objBus = new busCotacao();
            List<entUtilizacao> objLst = objBus.ListarUtilizacoes();
            var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return oSerializer.Serialize(objLst);
            //return objLstIndicado;
        }
        [System.Web.Services.WebMethod]
        public static string wmListarMoraEm()
        {

            busCotacao objBus = new busCotacao();
            List<entMoraEm> objLst = objBus.ListarentMoraEm();
            var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return oSerializer.Serialize(objLst);
            //return objLstIndicado;
        }
        [System.Web.Services.WebMethod]
        public static string wmListarLocalPernoites()
        {

            busCotacao objBus = new busCotacao();
            List<entLocalPernoite> objLst = objBus.ListarLocalPernoites();
            var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return oSerializer.Serialize(objLst);
            //return objLstIndicado;
        }
        [System.Web.Services.WebMethod]
        public static string wmListaSeguradoras()
        {

            busCotacao objBus = new busCotacao();
            List<entSeguradora> objLst = objBus.ListarSeguradoras();
            var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return oSerializer.Serialize(objLst);
            //return objLstIndicado;
        }
        [System.Web.Services.WebMethod]
        public static string wmAtualizarCotacaoAutomovel(string pid_cotacao, string pid_cotacao_automovel,
                                                            string pid_cliente,
                                                            string pds_tipo_cotacao ,
                                                            string pds_data_vigencia_inicial,
                                                            string pds_data_vigencia_final,
                                                            string pds_ano_fabricao,
                                                            string pds_ano_modelo,
                                                            string pcd_fipe,
                                                            string pds_marca,
                                                            string pds_modelo,
                                                            string pds_versao,
                                                            string pds_chassi,
                                                            string pds_zero_km,
                                                            string pds_estado_veiculo,
                                                            string pds_placa,
                                                            string pds_combustivel,
                                                            string pds_portas,
                                                            string pds_utilizacao_veiculo,
                                                            string pds_cep_pernoite,
                                                            string pds_financiado,
                                                            string pds_kit_gas,
                                                            string pds_taxi,
                                                            string pds_aplicativo,
                                                            string pds_blindado,
                                                            string pds_pcd,
                                                            string pds_cep_circulacao,
                                                            string pds_cep_residencia,
                                                            string pds_proprietario,
                                                            string pds_principal_condutor,
                                                            string pds_relacao_proprietario,
                                                            string pds_18_a_25_dirige,
                                                            string pds_mora_em,
                                                            string pds_local_pernoite,
                                                            string pds_utilizacao,
                                                            string pds_garagem_residencia,
                                                            string pds_garagem_trabalho,
                                                            string pds_garagem_escola,
                                                            string pds_km_media_mensal,
                                                            string pnr_idade_habilitacao,
                                                            string pds_condutor_relacao_com_segurado,
                                                            string pds_condutor_data_nascimento,
                                                            string pds_condutor_cpf,
                                                            string pds_condutor_nome,
                                                            string pds_condutor_idade_p_habilitacao,
                                                            string pds_condutor_genero,
                                                            string pds_condutor_estado_civil,
                                                            string pds_condutor_profissao,
                                                            string pds_condutor_detalhe_profissao,
                                                            string pds_condutor_reside_em,
                                                            string pds_condutor_considerado,
                                                            string pds_condutor_acima_25,
                                                            string pds_condutor_total_veiculos,
                                                            string pds_condutor_rg,
                                                            string pds_condutor_data_emissao_rg,
                                                            string pds_condutor_emissor_rg,
                                                            string pds_condutor_cnh,
                                                            string pds_condutor_data_habilitacao,
                                                            string pds_cobertura,
                                                            string pds_cobertura_valor_mercado,
                                                            string pds_cobertura_valor_acessorios,
                                                            string pds_cobertura_valor_vidros,
                                                            string pds_cobertura_valor_equipamentos,
                                                            string pds_cobertura_valor_despesas_extras,
                                                            string pds_cobertura_carro_reserva,
                                                            string pds_cobertura_assistencia,
                                                            string pds_cobertura_danos_materiais,
                                                            string pds_cobertura_danos_corporais,
                                                            string pds_cobertura_danos_morais,
                                                            string pds_cobertura_valor_dia_paralisacao,
                                                            string pds_cobertura_passageiros,
                                                            string pds_cobertura_valor_morte,
                                                            string pds_cobertura_valor_invalidez,
                                                            string pds_cobertura_valor_despesas_medicas,
                                                            string pds_renovacao_seguradora,
                                                            string pds_renovacao_bonus_anterior,
                                                            string pds_renovacao_bonus_atual,
                                                            string pds_renovacao_data_vigencia_anterior_inicio,
                                                            string pds_renovacao_data_vigencia_anterior_fim,
                                                            string pds_renovacao_apolice,
                                                            string pds_renovacao_apolice_item,
                                                            string pds_renovacao_apolice_ci)
            {


            busCotacao objBusCotacao = new busCotacao();
            entCotacaoAutomovel  objEntCotacaoAutomovel = new entCotacaoAutomovel();

            objEntCotacaoAutomovel.id_cotacao = Convert.ToInt32(pid_cotacao);

            objEntCotacaoAutomovel.id_cotacao_automovel = Convert.ToInt32(pid_cotacao_automovel);
            objEntCotacaoAutomovel.id_cliente = Convert.ToInt32(pid_cliente);

            objEntCotacaoAutomovel.ds_tipo_cotacao = pds_tipo_cotacao;
            objEntCotacaoAutomovel.ds_data_vigencia_inicial = pds_data_vigencia_inicial;
            objEntCotacaoAutomovel.ds_data_vigencia_final = pds_data_vigencia_final;


            objEntCotacaoAutomovel.ds_ano_fabricao = pds_ano_fabricao;
            objEntCotacaoAutomovel.ds_ano_modelo = pds_ano_modelo;
            objEntCotacaoAutomovel.cd_fipe= pcd_fipe;
            objEntCotacaoAutomovel.ds_marca= pds_marca;
            objEntCotacaoAutomovel.ds_modelo= pds_modelo;
            objEntCotacaoAutomovel.ds_versao= pds_versao;
            objEntCotacaoAutomovel.ds_chassi= pds_chassi;
            objEntCotacaoAutomovel.ds_zero_km= pds_zero_km;
            objEntCotacaoAutomovel.ds_estado_veiculo= pds_estado_veiculo;
            objEntCotacaoAutomovel.ds_placa= pds_placa;
            objEntCotacaoAutomovel.ds_combustivel= pds_combustivel;
            objEntCotacaoAutomovel.ds_portas= pds_portas;
            objEntCotacaoAutomovel.ds_utilizacao_veiculo= pds_utilizacao_veiculo;
            objEntCotacaoAutomovel.ds_cep_pernoite= pds_cep_pernoite;
            objEntCotacaoAutomovel.ds_financiado= pds_financiado;
            objEntCotacaoAutomovel.ds_kit_gas= pds_kit_gas;
            objEntCotacaoAutomovel.ds_taxi= pds_taxi;
            objEntCotacaoAutomovel.ds_aplicativo= pds_aplicativo;
            objEntCotacaoAutomovel.ds_blindado= pds_blindado;
            objEntCotacaoAutomovel.ds_pcd= pds_pcd;
            objEntCotacaoAutomovel.ds_cep_circulacao= pds_cep_circulacao;
            objEntCotacaoAutomovel.ds_cep_residencia= pds_cep_residencia;
            objEntCotacaoAutomovel.ds_proprietario= pds_proprietario;
            objEntCotacaoAutomovel.ds_principal_condutor= pds_principal_condutor;
            objEntCotacaoAutomovel.ds_relacao_proprietario= pds_relacao_proprietario;
            objEntCotacaoAutomovel.ds_18_a_25_dirige= pds_18_a_25_dirige;
            objEntCotacaoAutomovel.ds_mora_em= pds_mora_em;
            objEntCotacaoAutomovel.ds_local_pernoite= pds_local_pernoite;
            objEntCotacaoAutomovel.ds_utilizacao= pds_utilizacao;
            objEntCotacaoAutomovel.ds_garagem_residencia= pds_garagem_residencia;
            objEntCotacaoAutomovel.ds_garagem_trabalho= pds_garagem_trabalho;
            objEntCotacaoAutomovel.ds_garagem_escola= pds_garagem_escola;
            objEntCotacaoAutomovel.ds_km_media_mensal= pds_km_media_mensal;
            objEntCotacaoAutomovel.nr_idade_habilitacao= pnr_idade_habilitacao;
            objEntCotacaoAutomovel.ds_condutor_relacao_com_segurado= pds_condutor_relacao_com_segurado;
            objEntCotacaoAutomovel.ds_condutor_data_nascimento= pds_condutor_data_nascimento;
            objEntCotacaoAutomovel.ds_condutor_cpf= pds_condutor_cpf;
            objEntCotacaoAutomovel.ds_condutor_nome= pds_condutor_nome;
            objEntCotacaoAutomovel.ds_condutor_idade_p_habilitacao= pds_condutor_idade_p_habilitacao;
            objEntCotacaoAutomovel.ds_condutor_genero= pds_condutor_genero;
            objEntCotacaoAutomovel.ds_condutor_estado_civil= pds_condutor_estado_civil;
            objEntCotacaoAutomovel.ds_condutor_profissao= pds_condutor_profissao;
            objEntCotacaoAutomovel.ds_condutor_detalhe_profissao= pds_condutor_detalhe_profissao;
            objEntCotacaoAutomovel.ds_condutor_reside_em= pds_condutor_reside_em;
            objEntCotacaoAutomovel.ds_condutor_considerado= pds_condutor_considerado;
            objEntCotacaoAutomovel.ds_condutor_acima_25= pds_condutor_acima_25;
            objEntCotacaoAutomovel.ds_condutor_total_veiculos= pds_condutor_total_veiculos;
            objEntCotacaoAutomovel.ds_condutor_rg= pds_condutor_rg;
            objEntCotacaoAutomovel.ds_condutor_data_emissao_rg= pds_condutor_data_emissao_rg;
            objEntCotacaoAutomovel.ds_condutor_emissor_rg= pds_condutor_emissor_rg;
            objEntCotacaoAutomovel.ds_condutor_cnh= pds_condutor_cnh;
            objEntCotacaoAutomovel.ds_condutor_data_habilitacao= pds_condutor_data_habilitacao;
            objEntCotacaoAutomovel.ds_cobertura= pds_cobertura;
            objEntCotacaoAutomovel.ds_cobertura_valor_mercado= pds_cobertura_valor_mercado;
            objEntCotacaoAutomovel.ds_cobertura_valor_acessorios = pds_cobertura_valor_acessorios;
            objEntCotacaoAutomovel.ds_cobertura_valor_vidros= pds_cobertura_valor_vidros;
            objEntCotacaoAutomovel.ds_cobertura_valor_equipamentos= pds_cobertura_valor_equipamentos;
            objEntCotacaoAutomovel.ds_cobertura_valor_despesas_extras= pds_cobertura_valor_despesas_extras;
            objEntCotacaoAutomovel.ds_cobertura_carro_reserva= pds_cobertura_carro_reserva;
            objEntCotacaoAutomovel.ds_cobertura_assistencia= pds_cobertura_assistencia;
            objEntCotacaoAutomovel.ds_cobertura_danos_materiais= pds_cobertura_danos_materiais;
            objEntCotacaoAutomovel.ds_cobertura_danos_corporais= pds_cobertura_danos_corporais;
            objEntCotacaoAutomovel.ds_cobertura_danos_morais= pds_cobertura_danos_morais;
            objEntCotacaoAutomovel.ds_cobertura_valor_dia_paralisacao= pds_cobertura_valor_dia_paralisacao;
            objEntCotacaoAutomovel.ds_cobertura_passageiros= pds_cobertura_passageiros;
            objEntCotacaoAutomovel.ds_cobertura_valor_morte= pds_cobertura_valor_morte;
            objEntCotacaoAutomovel.ds_cobertura_valor_invalidez= pds_cobertura_valor_invalidez;
            objEntCotacaoAutomovel.ds_cobertura_valor_despesas_medicas= pds_cobertura_valor_despesas_medicas;
            objEntCotacaoAutomovel.ds_renovacao_seguradora= pds_renovacao_seguradora;
            objEntCotacaoAutomovel.ds_renovacao_bonus_anterior= pds_renovacao_bonus_anterior;
            objEntCotacaoAutomovel.ds_renovacao_bonus_atual= pds_renovacao_bonus_atual;
            objEntCotacaoAutomovel.ds_renovacao_data_vigencia_anterior_inicio= pds_renovacao_data_vigencia_anterior_inicio;
            objEntCotacaoAutomovel.ds_renovacao_data_vigencia_anterior_fim= pds_renovacao_data_vigencia_anterior_fim;
            objEntCotacaoAutomovel.ds_renovacao_apolice= pds_renovacao_apolice;
            objEntCotacaoAutomovel.ds_renovacao_apolice_item= pds_renovacao_apolice_item;
            objEntCotacaoAutomovel.ds_renovacao_apolice_ci = pds_renovacao_apolice_ci;

            
            return objBusCotacao.AtualizarCotacaoAutomovel(objEntCotacaoAutomovel).ToString();


        }

        [System.Web.Services.WebMethod]
        public static string wmAtualizarStatusCotacaoAutomovel(string pid_cotacao, string pid_cliente, string pcd_status_cotacao, string pid_forma_pagamento, string pds_mensagem, string file)
        {
            busCotacao objBusCotacao = new busCotacao();
            string nomearquivo = string.Empty;

            //Grava Arquivo PDF do Enviar Cotação CONCORRENTE
            if (!string.IsNullOrEmpty(file))
            { 
                nomearquivo = Convert.ToInt32(pid_cotacao).ToString("D5CCRNTE") + objBusCotacao.GeraChave();
                //objBus.AtualizarPDFCotacao(Convert.ToInt32(pid_cotacao), nomearquivo);
                System.IO.FileStream stream = new System.IO.FileStream(@"C:\actoseg\web\upload\" + nomearquivo + ".pdf", System.IO.FileMode.Create);
                System.IO.BinaryWriter writer = new System.IO.BinaryWriter(stream);
                file = file.Replace("data:application/pdf;base64,", "");
                byte[] bytes = Convert.FromBase64String(file);
                writer.Write(bytes, 0, bytes.Length);
                writer.Close();
            }
            if ((!string.IsNullOrEmpty(nomearquivo)) || (!string.IsNullOrEmpty(pid_forma_pagamento.ToString().Trim())) || (!string.IsNullOrEmpty(pds_mensagem.ToString().Trim())))
            {
                entCotacaoInteracao objentCotacaoInteracao = new entCotacaoInteracao();
                objentCotacaoInteracao.id_cotacao = Convert.ToInt32(pid_cotacao);
                objentCotacaoInteracao.id_forma_pagamento = Convert.ToInt32(pid_forma_pagamento);
                objentCotacaoInteracao.ds_mensagem = pds_mensagem;
                objentCotacaoInteracao.ds_pdf_cotacao_concorrente = nomearquivo;
                
                return objBusCotacao.AtualizarStatusCotacao(Convert.ToInt32(pid_cotacao), Convert.ToInt32(pid_cliente), pcd_status_cotacao, objentCotacaoInteracao).ToString();
            }
            else
            { 

                return objBusCotacao.AtualizarStatusCotacao(Convert.ToInt32(pid_cotacao), Convert.ToInt32(pid_cliente), pcd_status_cotacao).ToString();
            }
        }

        [System.Web.Services.WebMethod]
        public static entCotacaoAutomovel wmConsultarCotacaoAutomovel(int pid_cotacao)

        {
            try
            {
                //entIndicado objIndicado = new entIndicado();

                //objIndicado.ds_nome = "TESTE FUNCIONOU";
                //objIndicado.nr_cpf_cnpj = "162.527.088-99";

                busCotacao objBusCotacao = new busCotacao();
                entCotacaoAutomovel  objCotacaoAutomovel = objBusCotacao.ConsultarCotacaoAutomovel(pid_cotacao);
                
                //Acto.Indicado.Entity.entIndicadoTexto objIndicado_txt = new Acto.Indicado.Entity.entIndicadoTexto();
                //objIndicado_txt.id_cliente = objIndicado.id_cliente.ToString();
                //objIndicado_txt.ds_nome = objIndicado.ds_nome;
                //objIndicado_txt.dt_nascimento = objIndicado.dt_nascimento.ToString(@"dd/MM/yyyy");
                //objIndicado_txt.dt_inclusao = objIndicado.dt_inclusao.ToString(@"dd/MM/yyyy");
                //objIndicado_txt.nr_cpf_cnpj = Convert.ToUInt64(objIndicado.nr_cpf_cnpj).ToString(@"000\.000\.000\-00");
                //objIndicado_txt.tp_pessoa = objIndicado.tp_pessoa;
                //objIndicado_txt.ds_email = objIndicado.ds_email;
                //objIndicado_txt.ds_rg = objIndicado.ds_rg;
                //objIndicado_txt.ds_emissao = objIndicado.ds_emissao;
                //objIndicado_txt.dt_emissao_rg = objIndicado.dt_emissao_rg.ToString(@"dd/MM/yyyy");
                //objIndicado_txt.ds_telefone_celular = objIndicado.ds_telefone_celular;
                //objIndicado_txt.ds_telefone_comercial = objIndicado.ds_telefone_comercial;
                //objIndicado_txt.id_estado_civil = objIndicado.id_estado_civil.ToString();
                //objIndicado_txt.id_genero = objIndicado.id_genero.ToString();
                //objIndicado_txt.id_usuario = objIndicado.id_usuario.ToString();
                //objIndicado_txt.id_cliente_pj = objIndicado.id_cliente_pj.ToString();
                //objIndicado_txt.id_cliente_indicado = objIndicado.id_cliente_indicado.ToString();
                //objIndicado_txt.ds_genero = objIndicado.ds_genero;
                //objIndicado_txt.ds_estado_civil = objIndicado.ds_estado_civil;

                //txtNome.Text = objEntcliente.ds_nome;
                //txtCPF.Text = Convert.ToUInt64(objEntcliente.nr_cpf_cnpj).ToString(@"000\.000\.000\-00");// objEntcliente.nr_cpf_cnpj.ToString("000.000.000-00");
                //txtDataNascimento.Text = objEntcliente.dt_nascimento.ToString(@"dd/MM/yyyy");
                //txtTelefoneCelular.Text = objEntcliente.ds_telefone_celular;
                //txtTelefoneFixo.Text = objEntcliente.ds_telefone_comercial;

                //if (objEntcliente.id_genero == 1)
                //{
                //    rdoGeneroM.Checked = true;
                //}
                //else
                //{
                //    rdoGeneroF.Checked = true;
                //}

                //txtNumeroRG.Text = objEntcliente.ds_rg;
                //txtEmissao.Text = objEntcliente.ds_emissao;
                //txtDataExpedicao.Text = objEntcliente.dt_emissao_rg.ToString(@"dd/MM/yyyy");
                //cboEstadoCivil.SelectedValue = objEntcliente.id_estado_civil.ToString();
                //txtDataInclusao.Text = objEntcliente.dt_inclusao.ToString(@"dd/MM/yyyy");

                //if (objEntcliente.id_cliente_pj != 0)
                //{
                //    rdoEmpresaSim.Checked = true;
                //}
                //else
                //{
                //    rdoEmpresaNao.Checked = true;
                //}
                return objCotacaoAutomovel;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                throw ex;
            }

        }

        [System.Web.Services.WebMethod]
        public static string wmIncluirCotacaoAutomovelItem(string pid_cotacao,
                                                            string pid_seguradora_cotacao,
                                                            string pid_forma_pagamento,
                                                            string pds_valor_franquia_50,
                                                            string pds_valor_premio_f50,
                                                            string pds_valor_franquia_100,
                                                            string pds_valor_premio_f100,
                                                            string pds_porcentagem_comissao)                                                            
        {


            busCotacao objBusCotacao = new busCotacao();
            entCotacaoAutomovelItem objEntCotacaoAutomovelItem = new entCotacaoAutomovelItem();

            objEntCotacaoAutomovelItem.id_cotacao = Convert.ToInt32(pid_cotacao);
            objEntCotacaoAutomovelItem.id_seguradora_cotacao = Convert.ToInt32(pid_seguradora_cotacao);
            objEntCotacaoAutomovelItem.id_forma_pagamento = Convert.ToInt32(pid_forma_pagamento);

            objEntCotacaoAutomovelItem.ds_valor_franquia_50 = pds_valor_franquia_50;
            objEntCotacaoAutomovelItem.ds_valor_premio_f50 = pds_valor_premio_f50;
            objEntCotacaoAutomovelItem.ds_valor_franquia_100 = pds_valor_franquia_100;
            objEntCotacaoAutomovelItem.ds_valor_premio_f100 = pds_valor_premio_f100;
            objEntCotacaoAutomovelItem.ds_porcentagem_comissao = pds_porcentagem_comissao;

            return objBusCotacao.IncluirCotacaoAutomovelItem(objEntCotacaoAutomovelItem).ToString();


        }

        [System.Web.Services.WebMethod]
        public static string wmExcluirItensCotacao(string pid_cotacao)
        {
            busCotacao objBusCotacao = new busCotacao();
            return objBusCotacao.ExcluirItensCotacao(Convert.ToInt32(pid_cotacao)).ToString();


        }
        [System.Web.Services.WebMethod]
        public static string wmListaCotacaoAutomovelItens(int pid_cotacao)
        {
            busCotacao objBus = new busCotacao();
            List<entCotacaoAutomovelItemGrid> objLst = objBus.ListarCotacaoAutomovelItens(pid_cotacao);
            var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return oSerializer.Serialize(objLst);
            //return objLstIndicado;
        }
        [System.Web.Services.WebMethod]
        public static string wmListarChat(int pid_cotacao)
        {
            busCotacao objBus = new busCotacao();
            List<entCotacaoInteracao> objLst = objBus.ListarCotacaoInteracao(pid_cotacao);
            var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return oSerializer.Serialize(objLst);
            //return objLstIndicado;
        }
        [System.Web.Services.WebMethod]
        public static string wmIncluiMsgChat(string pid_cotacao, string pds_mensagem)
        {
            busCotacao objBusCotacao = new busCotacao();
            entCotacaoInteracao objent = new entCotacaoInteracao();

            objent.id_cotacao = Convert.ToInt32(pid_cotacao);
            objent.ds_mensagem = pds_mensagem;
            objent.id_forma_pagamento = 0;
            objent.ds_pdf_cotacao_concorrente = "";
            if (objBusCotacao.IncluirCotacaoInteracao(objent))
            { 
                return "OK";
            }
            else
            { 
                return "OK";
            }
        }
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]
        public static string SaveData(string file, string pid_cotacao)//string Name, string[] fileData)
        {
            busCotacao objBus = new busCotacao();
            
            string nomearquivo = Convert.ToInt32(pid_cotacao).ToString("D5") + objBus.GeraChave();
            objBus.AtualizarPDFCotacao(Convert.ToInt32(pid_cotacao), nomearquivo);
            System.IO.FileStream stream = new System.IO.FileStream(@"C:\actoseg\web\upload\" + nomearquivo + ".pdf", System.IO.FileMode.Create);
            System.IO.BinaryWriter writer = new System.IO.BinaryWriter(stream);
            file = file.Replace("data:application/pdf;base64,", "");
            byte[] bytes = Convert.FromBase64String(file);
            writer.Write(bytes, 0, bytes.Length);
            writer.Close();
            //Breakpoint
            return "ok";
        }
        
        [System.Web.Services.WebMethod]
        public static string wmAprovarCotacaoAutomovel(string pid_cotacao, 
                                                        string pid_seguradora, 
                                                        string pflg_aprovacao, 
                                                        string pid_cliente_aprovador, 
                                                        string pid_cliente_cotacao,
                                                        string pid_forma_pagamento,
                                                        string pnr_parcelas,
                                                        string pds_bandeira_cc,
                                                        string pds_nr_cartao_cc,
                                                        string pds_validade_cc,
                                                        string pds_nome_cliente_cc,
                                                        string ptp_dados_segurado_dc,
                                                        string pds_nome_titular_conta,
                                                        string pds_banco_dc,
                                                        string ptp_pessoa_dc,
                                                        string pds_cpf_titular_conta_dc,
                                                        string pds_parentesco_titular_dc,
                                                        string pds_nr_agencia_dc,
                                                        string pds_digito_agencia_dc,
                                                        string pds_nr_conta_dc,
                                                        string pds_digito_conta_dc)
        {
            busCotacao objBusCotacao = new busCotacao();

            entCotacaoFormaPagamento objCFP = new entCotacaoFormaPagamento();

            objCFP.id_cotacao = Convert.ToInt32(pid_cotacao);
            objCFP.id_forma_pagamento = Convert.ToInt32(pid_forma_pagamento);
            objCFP.nr_parcelas = pnr_parcelas;
            objCFP.ds_bandeira_cc = pds_bandeira_cc;
            objCFP.ds_nr_cartao_cc = pds_nr_cartao_cc;
            objCFP.ds_validade_cc = pds_validade_cc;
            objCFP.ds_nome_cliente_cc = pds_nome_cliente_cc;
            objCFP.tp_dados_segurado_dc = ptp_dados_segurado_dc;
            objCFP.ds_nome_titular_conta_dc = pds_nome_titular_conta;
            objCFP.ds_banco_dc = pds_banco_dc;
            objCFP.tp_pessoa_dc = ptp_pessoa_dc;
            objCFP.ds_cpf_titular_conta_dc = pds_cpf_titular_conta_dc.Replace(".","").Replace("-","");
            objCFP.ds_parentesco_titular_dc = pds_parentesco_titular_dc;
            objCFP.ds_nr_agencia_dc = pds_nr_agencia_dc;
            objCFP.ds_digito_agencia_dc = pds_digito_agencia_dc;
            objCFP.ds_nr_conta_dc = pds_nr_conta_dc;
            objCFP.ds_digito_conta_dc = pds_digito_conta_dc;

            return objBusCotacao.AprovarCotacaoAutomovel(Convert.ToInt32(pid_cotacao), Convert.ToInt32(pid_seguradora), pflg_aprovacao, Convert.ToInt32(pid_cliente_aprovador), Convert.ToInt32(pid_cliente_cotacao),objCFP).ToString();
        }

        public bool TemPermissao(string pcd_funcao) {
            ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];

            return objContexto.TemPermissao(pcd_funcao);
        }

        [System.Web.Services.WebMethod]
        public static string wmClonarCotacao(string pid_cotacao)
        {
            busCotacao objBusCotacao = new busCotacao();
            return objBusCotacao.ClonarCotacao(Convert.ToInt32(pid_cotacao)).ToString();
            
        }
    }
}

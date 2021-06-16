using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Cotacao.Data;
using Acto.Cotacao.Entity;
using Acto.Infra.Mail;
using Acto.Cliente.Busines;
using Acto.Cliente.Entity;
namespace Acto.Cotacao.Busines
{
    public class busCotacao
    {
        public List<entUtilizacao> ListarUtilizacoes()
        {
            try
            {
                daoCotacao objDao = new daoCotacao();
                return objDao.ListarUtilizacoes();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public List<entMoraEm> ListarentMoraEm()
        {
            try
            {
                daoCotacao objDao = new daoCotacao();
                return objDao.ListarMoraEm();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public List<entLocalPernoite> ListarLocalPernoites()
        {
            try
            {
                daoCotacao objDao = new daoCotacao();
                return objDao.ListarLocalPernoites();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public List<entSeguradora> ListarSeguradoras()
        {
            try
            {
                daoCotacao objDao = new daoCotacao();
                return objDao.ListarSeguradoras();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public List<entCotacaoInteracao> ListarCotacaoInteracao(int pid_cotacao)
        {
            try
            {
                daoCotacao objDao = new daoCotacao();
                return objDao.ListarCotacaoInteracao(pid_cotacao);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public int AtualizarCotacaoAutomovel(entCotacaoAutomovel pentCotacaoAutomovel)
        {
            try
            {
                CaixaEmail objMail = new CaixaEmail();
                busCliente objBusCliente = new busCliente();
                entCliente objentCliente = objBusCliente.ConsultarClienteIdCliente(pentCotacaoAutomovel.id_cliente);
                daoCotacao objDaoCotacao = new daoCotacao();

                int ret_id_cotacao = objDaoCotacao.AtualizarCotacao(pentCotacaoAutomovel);

                objMail.EnviaEmailGmail(ret_id_cotacao, objentCliente.ds_nome, objentCliente.ds_email, objentCliente.ds_telefone_celular, "NOVO");

                return ret_id_cotacao;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return 0;
            }

        }
        public int AtualizarStatusCotacao(int pid_cotacao, int pid_cliente, string pcd_status_cotacao, entCotacaoInteracao pobjentCotacaoInteracao = null)
        {
            try
            {
                CaixaEmail objMail = new CaixaEmail();
                busCliente objBusCliente = new busCliente();
                entCliente objentCliente = objBusCliente.ConsultarClienteIdCliente(pid_cliente);
                daoCotacao objDaoCotacao = new daoCotacao();

                if (pobjentCotacaoInteracao == null) pobjentCotacaoInteracao = new entCotacaoInteracao();
                pobjentCotacaoInteracao.id_cotacao = pid_cotacao;
                
                if (pcd_status_cotacao == "CE") pobjentCotacaoInteracao.ds_mensagem = "Cliente ENVIA cotação para processamento. (" + pobjentCotacaoInteracao.ds_mensagem + ")";

                if (pcd_status_cotacao == "CA") pobjentCotacaoInteracao.ds_mensagem = "Cliente Cancela a Cotação.";
                if (pcd_status_cotacao == "GR")
                {
                    pobjentCotacaoInteracao.ds_mensagem = "Cliente GRAVA cotação.";
                    objDaoCotacao.ExcluirItensCotacao(pid_cotacao);

                }
                if(pcd_status_cotacao == "CP") pobjentCotacaoInteracao.ds_mensagem = "Actoseg COTAÇÃO PRONTA.";
                if (pcd_status_cotacao == "EM") pobjentCotacaoInteracao.ds_mensagem = "Actoseg FOI EMITIDA A APÓLICE.";
                if (objDaoCotacao.IncluirCotacaoInteracao(pobjentCotacaoInteracao))
                {
                    int ret_id_cotacao = objDaoCotacao.AtualizarStatusCotacao(pid_cotacao, pcd_status_cotacao);
                    string pBodyEnviar = "";
                    if (pcd_status_cotacao == "CE") pBodyEnviar = RetornaBodyCotacaoEnviar(pid_cotacao);

                    objMail.EnviaEmailGmail(ret_id_cotacao, objentCliente.ds_nome, objentCliente.ds_email, objentCliente.ds_telefone_celular, pcd_status_cotacao, pBodyEnviar);

                }
                
                //else 
                //{
                //    int ret_id_cotacao = objDaoCotacao.AtualizarStatusCotacao(pid_cotacao, pcd_status_cotacao);

                //    objMail.EnviaEmailGmail(ret_id_cotacao, objentCliente.ds_nome, objentCliente.ds_email, objentCliente.ds_telefone_celular, pcd_status_cotacao);
                //}
                return pid_cotacao;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return 0;
            }

        }
        public int AprovarCotacaoAutomovel(int pid_cotacao, int pid_seguradora, string pflg_aprovacao, int pid_cliente_aprovador, int pid_cliente_cotacao, entCotacaoFormaPagamento pentCFP)
        {
            try
            {
                CaixaEmail objMail = new CaixaEmail();
                busCliente objBusCliente = new busCliente();
                entCliente objentCliente = objBusCliente.ConsultarClienteIdCliente(pid_cliente_cotacao);
                daoCotacao objDaoCotacao = new daoCotacao();
                entCotacaoInteracao pobjentCotacaoInteracao = new entCotacaoInteracao();
                pobjentCotacaoInteracao.id_cotacao = pid_cotacao;
                pobjentCotacaoInteracao.ds_mensagem = "Cliente APROVA.";
                if (objDaoCotacao.IncluirCotacaoInteracao(pobjentCotacaoInteracao))
                {
                    if (!IncluirCotacaoFormaPagamento(pentCFP)) new Exception("Em AprovarCotacaoAutomovel NÃO FOI POSSIVEL INSERIR IncluirCotacaoFormaPagamento id_cotacao = " + pid_cotacao);  
                    int ret_id_cotacao = objDaoCotacao.AprovarCotacaoAutomovel(pid_cotacao, pid_seguradora, pflg_aprovacao, pid_cliente_aprovador);
                    
                    objMail.EnviaEmailGmail(ret_id_cotacao, objentCliente.ds_nome, objentCliente.ds_email, objentCliente.ds_telefone_celular, "AP");
                }
                else
                {
                    new Exception("Em AprovarCotacaoAutomovel NÃO FOI POSSIVEL INSERIR IncluirCotacaoInteracao id_cotacao = " + pid_cotacao);
                }
                return pid_cotacao;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return 0;
            }

        }
        public List<entCotacaoAutomovelGrid> ListarCotacoes(int pdi_cliente)
        {
            try
            {
                daoCotacao objDao = new daoCotacao();
                return objDao.ListarCotacoes(pdi_cliente);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public entCotacaoAutomovel ConsultarCotacaoAutomovel(int pid_cotacao)
        {
            try
            {
                daoCotacao objDaoCotacao = new daoCotacao();
                entCotacaoAutomovel ret = objDaoCotacao.ConsultarCotacaoAutomovel(pid_cotacao);
                ret.id_forma_pagamento = ConsultarCotacaoFormaPagamentoId(pid_cotacao).ToString();
                return ret;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }


        public int IncluirCotacaoAutomovelItem(entCotacaoAutomovelItem pobjentCotacaoAutomovelItem)
        {
            try
            {
                //CaixaEmail objMail = new CaixaEmail();
                //busCliente objBusCliente = new busCliente();
                //entCliente objentCliente = objBusCliente.ConsultarClienteIdCliente(pentCotacaoAutomovel.id_cliente);
                daoCotacao objDaoCotacao = new daoCotacao();

                int ret_id_cotacao = objDaoCotacao.IncluirCotacaoAutomovelItem(pobjentCotacaoAutomovelItem);

                //objMail.EnviaEmailGmail(ret_id_cotacao, objentCliente.ds_nome, objentCliente.ds_email, objentCliente.ds_telefone_celular);

                return ret_id_cotacao;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return 0;
            }
        }
        public int ExcluirItensCotacao(int pid_cotacao)
        {
            try
            {
                daoCotacao objDaoCotacao = new daoCotacao();

                int ret_id_cotacao = objDaoCotacao.ExcluirItensCotacao(pid_cotacao);

                return ret_id_cotacao;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return 0;
            }
        }
        public List<entCotacaoAutomovelItemGrid> ListarCotacaoAutomovelItens(int pid_cotacao)
        {
            try
            {
                daoCotacao objDao = new daoCotacao();
                return objDao.ListarCotacaoAutomovelItens(pid_cotacao);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public string GeraChave()
        {
            int Tamanho = 20; // Numero de digitos da senha
            string senha = string.Empty;
            for (int i = 0; i < Tamanho; i++)
            {
                Random random = new Random();
                int codigo = Convert.ToInt32(random.Next(48, 122).ToString());

                if ((codigo >= 48 && codigo <= 57) || (codigo >= 97 && codigo <= 122))
                {
                    string _char = ((char)codigo).ToString();
                    if (!senha.Contains(_char))
                    {
                        senha += _char;
                    }
                    else
                    {
                        i--;
                    }
                }
                else
                {
                    i--;
                }
            }
            return senha;
        }

        public int AtualizarPDFCotacao(int pid_cotacao, string pds_pdf)
        {
            try
            {
                daoCotacao objDaoCotacao = new daoCotacao();

                return objDaoCotacao.AtualizarPDFCotacao(pid_cotacao, pds_pdf); ;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return 0;
            }

        }
        public bool IncluirCotacaoInteracao(entCotacaoInteracao pobjent)
        {
            try
            {
                daoCotacao objDaoCotacao = new daoCotacao();
                return objDaoCotacao.IncluirCotacaoInteracao(pobjent); ;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return false;
            }
        }
        public bool IncluirCotacaoFormaPagamento(entCotacaoFormaPagamento pobjent)
        {
            try
            {
                daoCotacao objDaoCotacao = new daoCotacao();
                return objDaoCotacao.IncluirCotacaoFormaPagamento(pobjent); ;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return false;
            }
        }
        public entCotacaoFormaPagamento ConsultarCotacaoFormaPagamento(int pid_cotacao)
        {
            try
            {
                daoCotacao objDaoCotacao = new daoCotacao();
                return objDaoCotacao.ConsultarCotacaoFormaPagamento(pid_cotacao);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public int ConsultarCotacaoFormaPagamentoId(int pid_cotacao)
        {
            try
            {
                daoCotacao objDaoCotacao = new daoCotacao();
                return objDaoCotacao.ConsultarCotacaoFormaPagamentoId(pid_cotacao);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return 0;
            }

        }
        public int ClonarCotacao(int pid_cotacao)
        {
            try
            {
                CaixaEmail objMail = new CaixaEmail();
                busCliente objBusCliente = new busCliente();
                //entCliente objentCliente = objBusCliente.ConsultarClienteIdCliente(pentCotacaoAutomovel.id_cliente);
                daoCotacao objDaoCotacao = new daoCotacao();

                int ret_id_cotacao = objDaoCotacao.ClonarCotacao(pid_cotacao);

                objMail.EnviaEmailGmail(ret_id_cotacao, "Clone da Cotação: " + pid_cotacao.ToString(), "", "", "CLONE");

                return ret_id_cotacao;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return 0;
            }

        }
        private entCotacaoEnviar ConsultarCotacaoEnviar(int pid_cotacao)
        {
            try
            {
                daoCotacao objDaoCotacao = new daoCotacao();
                return objDaoCotacao.ConsultarCotacaoEnviar(pid_cotacao);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                //throw ex;
                return null;
            }
        }
        private string RetornaBodyCotacaoEnviar(int pid_cotacao)
        {
			
            entCotacaoEnviar objCot = ConsultarCotacaoEnviar(pid_cotacao);

            objCot.tp_pessoa = (objCot.tp_pessoa == "F") ? "Pessoa Física" : "Pessoa Jurídica";

            string testestr = "<!DOCTYPE html> " +
"<html lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\"> " +
            "<head> " +
"   <meta charset=\"utf-8\" /> " +
"   <title></title> " +
//"   <style type=\"text/css\"> " +
////"      body { " +
////"         margin: 20px 20px; " +
////"         font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; " +
////"      } " +
//"   </style> " +
"   <style> " +
"       * table, tr, td { " +
"            border: 1px solid white; " +
"            background-color: white; " +
"            font-family: Arial, Helvetica, sans-serif; " +
"        } " +
"        td.label { " +
"            border: 5px solid lightgray; " +
"            background-color: lightgray; " +
"            font-family: Arial, Helvetica, sans-serif; " +
"            font-weight: bold; " +
"        } " +
"        td.texto { " +
"             " +
"            border: 1px solid lightgray; " +
"            background-color: white; " +
"            font-family: Arial, Helvetica, sans-serif; " +
            
"        } " +
"        td.cabecalho { " +
"            color:white; " +
"            border: 5px solid royalblue; " +
"            background-color: royalblue; " +
"            font-family: Arial, Helvetica, sans-serif; " +
"            font-weight: bold; " +
"        } " +
"    </style> " +
"</head> " +
"<body> " +
"   Prezado(a) #ReceiverName#, " +
"   <p> " +
"   #Message# " +
"   </p> " +
"  <p> " +
"   #Description# " +
"   </p> " +
"   <p> " +
"      <a href=\"#Url#\">Clique aqui para resolver sua pendência.</a> " +
"   </p> " +
"   Atenciosamente,<br /> " +
"   Setor de Tecnologia da Informação " +
"<table border=\"1\">" +
"    <tr>" +
"        <td class=\"cabecalho\" colspan=\"8\">CAPA DA COTAÇÃO DE AUTOMÓVEL</td>" +
"    </tr>" +

"    <tr>" +
"        <td class=\"label\">Segurado:</td><td class=\"texto\">" + objCot.ds_nome + "</td>" + 
"        <td class=\"label\">Tipo Pessoa:</td><td class=\"texto\" colspan=\"2\">" + objCot.tp_pessoa + "</td>" +
"        <td class=\"label\">CPF:</td><td class=\"texto\" colspan=\"2\">" + objCot.nr_cpf_cnpj + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\">E-mail:</td><td class=\"texto\">" + objCot.ds_email + "</td>" +
"        <td class=\"label\">Celular:</td><td class=\"texto\"  colspan=\"5\">" + objCot.ds_telefone_celular + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\">Tipo Seguro:</td><td class=\"texto\">" + objCot.ds_tipo_cotacao + "</td>" +
"        <td class=\"label\">Vigência Inicial:</td><td class=\"texto\"  colspan=\"2\">" + objCot.ds_data_vigencia_inicial + "</td>" +
"        <td class=\"label\">Vigência Final:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_data_vigencia_final + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"cabecalho\" colspan=\"8\">ITEM DE CALCULO DE AUTOMÓVEL</td>" +
"    </tr>" +

"    <tr>" +
"        <td class=\"label\">Tipo:</td><td class=\"texto\">" + objCot.ds_tipo_veiculo + "</td>" +
"        <td class=\"label\">Fab. / Mod. / Placa:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_ano_fabricao + " / " + objCot.ds_ano_modelo + " / " + objCot.ds_placa + "</td>" +
"        <td class=\"label\">Marca - Modelo:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_marca + " - " + objCot.ds_modelo + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\">Chassi:</td><td class=\"texto\">" + objCot.ds_chassi  + "</td>" +
"        <td class=\"label\">Combustível:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_combustivel + "</td>" +
"        <td class=\"label\">Zero KM / Financiado:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_zero_km + " / " + objCot.ds_financiado + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\">CEP Pernoite:</td><td class=\"texto\">" + objCot.ds_cep_pernoite + "</td>" +
"        <td class=\"label\">CEP Circulação:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_cep_circulacao + "</td>" +
"        <td class=\"label\">CEP Residência:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_cep_residencia + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"cabecalho\" colspan=\"4\">COBERTURA CASCO</td><td class=\"cabecalho\" colspan=\"4\">COBERTURA RCF</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\">Cobertura:</td><td class=\"texto\">" + objCot.ds_tipo_cobertura + "</td>" +
"        <td class=\"label\">Casco:</td><td class=\"texto\">" + objCot.ds_cobertura_valor_mercado + "</td>" +
"        <td class=\"label\">Danos Materiais:</td><td class=\"texto\">" + objCot.ds_cobertura_danos_materiais + "</td>" +
"        <td class=\"label\">Danos Passageiros:</td><td class=\"texto\">" + objCot.ds_cobertura_danos_materiais + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\">Acessórios:</td><td class=\"texto\">" + objCot.ds_cobertura_valor_acessorios + "</td>" +
"        <td class=\"label\">Cobertura de Vidros:</td><td class=\"texto\">" + objCot.ds_cobertura_valor_vidros + "</td>" +
"        <td class=\"label\">Danos Corporais:</td><td class=\"texto\">" + objCot.ds_cobertura_danos_corporais + "</td>" +
"        <td class=\"label\">Morte:</td><td class=\"texto\">" + objCot.ds_cobertura_valor_morte + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\">Equipamentos:</td><td class=\"texto\">" + objCot.ds_cobertura_valor_equipamentos + "</td>" +
"        <td class=\"label\">Desespesas Extras:</td><td class=\"texto\">" + objCot.ds_cobertura_valor_despesas_extras + "</td>" +
"        <td class=\"label\">Danos Morais:</td><td class=\"texto\">" + objCot.ds_cobertura_danos_morais + "</td>" +
"        <td class=\"label\">Invalidez:</td><td class=\"texto\">" + objCot.ds_cobertura_valor_invalidez + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td></td><td></td><td class=\"label\">Blindagem:</td><td class=\"texto\">" + objCot.ds_blindado + "</td>" +
"        <td class=\"label\">Dias de Paralisação:</td><td class=\"texto\">" + objCot.ds_cobertura_valor_dia_paralisacao + "</td>" +
"        <td class=\"label\">D.Méd.Hospitalar:</td><td class=\"texto\">" + objCot.ds_cobertura_valor_despesas_medicas + "</td>" +
"    </tr>" +

"        <td class=\"cabecalho\" colspan=\"8\">PERFIL INTEGRADO</td>" +
"    </tr>" +
"    <tr>" +
"       <td class=\"label\">Utilização Veiculo:</td>" +
"       <td class=\"texto\" colspan=\"2\">" + objCot.ds_utilizacao + "</td>" +
"       <td class=\"label\" colspan=\"2\">Garagem na Residência:</td>" +
"       <td class=\"texto\" colspan=\"3\">" + objCot.ds_garagem_residencia + "</td>" +
"    </tr>" +
"    <tr>" +
"       <td class=\"label\">Km por Mês:</td>" +
"       <td class=\"texto\" colspan=\"2\">" + objCot.ds_km_media_mensal + "</td>" +
"       <td class=\"label\" colspan=\"2\">Garagem Escola/Faculdade:</td>" +
"       <td class=\"texto\" colspan=\"3\">" + objCot.ds_garagem_escola + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td></td><td></td><td></td><td class=\"label\"  colspan=\"2\">Garagem Trabalho:</td>" +
"        <td class=\"texto\" colspan=\"3\">" + objCot.ds_garagem_trabalho + "</td>" +

"    </tr>" +
"    <tr>" +
"        <td class=\"cabecalho\" colspan=\"8\">SEGURADO</td>" +
"    </tr>" +

"    <tr>" +
"        <td class=\"label\" colspan=\"2\">Relação com o Proprietário:</td>" +
"       <td class=\"texto\" colspan=\"3\">" + objCot.ds_relacao_proprietario + "</td>" +
"        <td class=\"label\" colspan=\"2\">Cobertura 18 a 25 Anos:</td>" +
"        <td class=\"texto\" colspan=\"1\">" + objCot.ds_18_a_25_dirige + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\" colspan=\"2\">Data Nacimento:</td>" +
"        <td class=\"texto\">" + objCot.dt_nascimento + "</td>" +
"        <td class=\"label\">Sexo:</td>" +
"        <td class=\"texto\" colspan=\"2\">" + objCot.ds_genero + "</td>" +
"        <td class=\"label\" colspan=\"1\">Estado Cívil:</td>" +
"        <td class=\"texto\" colspan=\"1\">" + objCot.ds_estado_civil + "</td>" +

"    </tr>";
if (objCot.ds_renovacao_seguradora != "SEGURO NOVO")
{
        testestr = testestr +
    "    <tr>" +
    "        <td class=\"cabecalho\" colspan=\"8\">RENOVAÇÃO</td>" +
    "    </tr>" +

    "    <tr>" +
    "        <td class=\"label\" colspan=\"1\">Seguradora:</td><td class=\"texto\" colspan=\"7\">" + objCot.ds_renovacao_seguradora + "</td>" +
    "    </tr>" +
    "    <tr>" +
    "        <td class=\"label\">Vigência Anterior De:</td><td class=\"texto\">" + objCot.ds_renovacao_data_vigencia_anterior_inicio  + "</td>" +
    "        <td class=\"label\">Vigência Anterior Até:</td><td class=\"texto\">" + objCot.ds_renovacao_data_vigencia_anterior_fim + "</td>" +
    "        <td class=\"label\">Bônus Anterior:</td><td class=\"texto\">" + objCot.ds_renovacao_bonus_anterior + "</td>" +
    "        <td class=\"label\">Bônus Atual:</td><td class=\"texto\">" + objCot.ds_renovacao_bonus_atual + "</td>" +
    "    </tr>" +
    "    <tr>" +
    "        <td class=\"label\" colspan=\"1\">Apolice:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_renovacao_apolice + "</td>" +
    "        <td class=\"label\">Item:</td><td class=\"texto\">" + objCot.ds_renovacao_apolice_item + "</td>" +
    "        <td class=\"label\">C.I.:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_renovacao_apolice_ci + "</td>" +
    "    </tr>";

}


            testestr = testestr + 
"    <tr>" +
"        <td class=\"cabecalho\" colspan=\"8\">CONDUTOR PRINCIPAL</td>" +
"    </tr>" +

"    <tr>" +
"        <td class=\"label\" colspan=\"2\">Relação com o Segurado:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_condutor_relacao_com_segurado + "</td><td class=\"label\">Nascimento:</td><td class=\"texto\" colspan=\"1\">" + objCot.ds_condutor_data_nascimento + "</td><td class=\"label\">Habilitado há:</td><td class=\"texto\" colspan=\"1\">>HABILITADO HÁ</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\" colspan=\"2\">Nome:</td><td class=\"texto\" colspan=\"3\">" + objCot.ds_condutor_nome + "</td> <td class=\"label\">CPF:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_condutor_cpf + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\" colspan=\"2\">Sexo:</td><td class=\"texto\" colspan=\"3\">" + objCot.ds_condutor_genero + "</td> <td class=\"label\">Estado Civil:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_condutor_estado_civil + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\" colspan=\"2\">Profissão:</td><td class=\"texto\" colspan=\"3\">" + objCot.ds_condutor_profissao + "</td><td class=\"label\">Total Veículos Residência:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_condutor_total_veiculos + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\" colspan=\"2\">Detalhe Profissão:</td><td class=\"texto\" colspan=\"3\">" + objCot.ds_condutor_detalhe_profissao + "</td><td class=\"label\">CNH:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_condutor_cnh + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\" colspan=\"2\">Reside em:</td><td class=\"texto\" colspan=\"3\">" + objCot.ds_condutor_reside_em + "</td><td class=\"label\">1ª CNH Data:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_condutor_data_habilitacao + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\" colspan=\"2\">Condutor Considerado:</td><td class=\"texto\" colspan=\"3\">" + objCot.ds_condutor_considerado + "</td> <td class=\"label\">RG:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_condutor_rg + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\" colspan=\"2\">Condutores Acima de 25 anos:</td><td class=\"texto\" colspan=\"3\">" + objCot.ds_condutor_acima_25 + "</td> <td class=\"label\">Data Emissão RG:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_condutor_data_emissao_rg + "</td>" +
"    </tr>" +
"    <tr>" +
"        <td class=\"label\" colspan=\"2\">Condutores Entre 17 e 25 anos:</td><td class=\"texto\" colspan=\"3\">" + objCot.ds_18_a_25_dirige + "</td> <td class=\"label\">Emissor RG:</td><td class=\"texto\" colspan=\"2\">" + objCot.ds_condutor_emissor_rg + "</td>" +
"    </tr>" +
"</table>" +
"</body> " +
"</html> ";

            //string strRet = testestr + "DADOS CLIENTE:<br/>" +
            //                "Nome:  " + objCot.ds_nome + " <br/> " + 
            //                "Email : " + objCot.ds_email + " <br/> " +
            //                "Telefone : " + objCot.ds_telefone_celular + " <br/> " +
            //                "Tipo Cotação : " + objCot.ds_tipo_cotacao; 







            return testestr;

		}
    }

   
}

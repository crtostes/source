using Acto.Cliente.Busines;
using Acto.Cliente.Entity;
using Acto.Empresa.Entity;
using Acto.Empresa.Busines;
using Acto.Infra.Contexto;
using Microsoft.Ajax.Utilities;
using Acto.Usuario.Entity;
using Acto.Usuario.Busines;
using System;
using System.Collections.Generic;
using System.Web;

namespace actoseg.main.pages
{
    public partial class MeuCadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];
            if (objContexto == null) Response.Redirect("Login.aspx");
            //txtIdClienteIndicador.Text = objContexto.Cliente.id_cliente.ToString();
        }

        [System.Web.Services.WebMethod]
        public static string wmAtualizarCliente(string pid_cliente, string pds_nome,
                                                string pdt_nascimento,
                                                string pds_rg,
                                                string pds_emissao,
                                                string pdt_emissao_rg,
                                                string pds_telefone_celular,
                                                string pds_telefone_comercial,
                                                string pid_estado_civil,
                                                string pid_genero,
                                                string pds_cnh,
                                                string pdt_1_habilitacao,
                                                string pds_profissao,
                                                string pds_profissao_complemento,
                                                string pds_nome_pai,
                                                string pds_nome_mae,
                                                string pds_nome_conjuge,
                                                string pds_tipo_endereco,
                                                string pds_cep,
                                                string pds_endereco,
                                                string pds_numero,
                                                string pds_complemento,
                                                string pds_bairro,
                                                string pds_cidade,
                                                string pds_estado,
                                                string pEmpresaSimNao,
                                                string pCNPJ,
                                                string pNomeEmpresa,
                                                string pEnderecoEmpresa,
                                                string pCidadeEmpresa,
                                                string pEstadoEmpresa)

        {

            busCliente objBusCliente = new busCliente();
            entCliente objEntCliente = new entCliente();
            entEmpresa objEntEmpresa = new entEmpresa();

            #region Veriicar Dados Cliente da Tela



            #endregion

            #region Gravar Dados Cliente

            ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];

            //objEntCliente.id_cliente = objContexto.Cliente.id_cliente;
            objEntCliente.id_cliente = Convert.ToInt32(pid_cliente);
            objEntCliente.ds_nome = pds_nome.ToUpper();
            objEntCliente.dt_nascimento = Convert.ToDateTime(pdt_nascimento);
            objEntCliente.tp_pessoa = "F";
            objEntCliente.ds_rg = pds_rg;
            objEntCliente.ds_emissao = pds_emissao.ToUpper(); 
            objEntCliente.dt_emissao_rg = Convert.ToDateTime(pdt_emissao_rg);
            objEntCliente.ds_telefone_celular = pds_telefone_celular;
            objEntCliente.ds_telefone_comercial = pds_telefone_comercial;
            objEntCliente.id_estado_civil = Convert.ToInt32(pid_estado_civil);
            objEntCliente.id_genero = Convert.ToInt32(pid_genero);
            objEntCliente.ds_cnh = pds_cnh;
            objEntCliente.dt_1_habilitacao = pdt_1_habilitacao;
            objEntCliente.ds_profissao = pds_profissao.ToUpper(); 
            objEntCliente.ds_profissao_complemento = pds_profissao_complemento.ToUpper(); 
            objEntCliente.ds_nome_pai = pds_nome_pai.ToUpper();
            objEntCliente.ds_nome_mae = pds_nome_mae.ToUpper();
            objEntCliente.ds_nome_conjuge = pds_nome_conjuge.ToUpper();
            objEntCliente.ds_tipo_endereco = pds_tipo_endereco;
            objEntCliente.ds_cep = pds_cep;
            objEntCliente.ds_endereco = pds_endereco.ToUpper();
            objEntCliente.ds_numero = pds_numero;
            objEntCliente.ds_complemento = pds_complemento.ToUpper();
            objEntCliente.ds_bairro = pds_bairro.ToUpper();
            objEntCliente.ds_cidade = pds_cidade.ToUpper();
            objEntCliente.ds_estado = pds_estado;
            objEntEmpresa.id_cliente = Convert.ToInt32(pid_cliente);

            if (pEmpresaSimNao == "S")
            {
                
                objEntEmpresa.nr_cnpj = pCNPJ.Replace(".", "").Replace("-", "").Replace("/", "");
                objEntEmpresa.ds_nome_empresa = pNomeEmpresa;
                objEntEmpresa.ds_endereco = pEnderecoEmpresa.ToUpper();
                objEntEmpresa.ds_cidade = pCidadeEmpresa.ToUpper(); 
                objEntEmpresa.ds_estado = pEstadoEmpresa;
            }
            
            if (objBusCliente.AtualizarCliente(objEntCliente,pEmpresaSimNao , objEntEmpresa))
            {
                return "OK";
            }
            else
            {
                return "NOK";
            };

            #endregion




        }
      
        [System.Web.Services.WebMethod]
        public static string wmIncluirCliente(string nome, string cpf, string email, string confirmar_email)

        {

            busCliente objBusCliente = new busCliente();
            entCliente objEntCliente = new entCliente();
            busUsuario objBusUsuario = new busUsuario();

            ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];
            if (objContexto == null)
            {
                return "Sistema inoperante. Por favor Reiniciar!!!";
            }

            if (cpf.IsNullOrWhiteSpace()) return "CPF em branco!";
            if (objBusUsuario.ValidarCpf(cpf) != true) return "CPF Inválido, digito não confere!";
            if (nome.IsNullOrWhiteSpace()) return "Nome em branco!";
            if (email.IsNullOrWhiteSpace()) return "E-mail em branco!";
            if (objBusUsuario.ValidarEmail(email) != true) return "E-mail Inválido!";
            if (confirmar_email.IsNullOrWhiteSpace()) return "E-mail em branco!";
            if (email != confirmar_email) return "E-mail diferente do confirmado";
            //if (senha.IsNullOrWhiteSpace()) return "Senha em branco!";
            //if (conf_senha.IsNullOrWhiteSpace()) return "Confirmar Senha em branco!";
            //if (senha != conf_senha) return "Senha diferente do confirmado";

            objEntCliente.ds_nome = nome.ToUpper();
            objEntCliente.ds_email = email.ToLower();
            objEntCliente.nr_cpf_cnpj = cpf.Replace(".", "").Replace("-", "");
            objEntCliente.id_cliente_indicado = objContexto.Cliente.id_cliente;

            return objBusCliente.IncluirCliente(objEntCliente).ToString();


        }
        [System.Web.Services.WebMethod]
        public static string wmListarClientesIndicados()
        {

            ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];
            if (objContexto == null)
            {
                return "Sistema inoperante. Por favor Reiniciar!!!";
            }
            busCliente objBusCliente = new busCliente();
            int idCliente = objContexto.Cliente.id_cliente;
            if (objContexto.TemPermissao("LSTTODCLI")) idCliente = 0;
            List<entCliente> objLstCliente = objBusCliente.ListarClientesIndicados(idCliente);
            var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return oSerializer.Serialize(objLstCliente);
            //return objLstIndicado;
        }
        [System.Web.Services.WebMethod]
        public static entClienteTexto wmConsultarCliente(int id_cliente)

        {
            try
            {
                //entIndicado objIndicado = new entIndicado();

                //objIndicado.ds_nome = "TESTE FUNCIONOU";
                //objIndicado.nr_cpf_cnpj = "162.527.088-99";

                busCliente objBusCliente = new busCliente();
                entCliente objCliente = objBusCliente.ConsultarClienteIdCliente(id_cliente);
                Acto.Cliente.Entity.entClienteTexto objCliente_txt = new Acto.Cliente.Entity.entClienteTexto();
                objCliente_txt.id_cliente = objCliente.id_cliente.ToString();
                objCliente_txt.ds_nome = objCliente.ds_nome;
                if (objCliente.dt_nascimento.ToString(@"dd/MM/yyyy") != "01/01/0001") objCliente_txt.dt_nascimento = objCliente.dt_nascimento.ToString(@"dd/MM/yyyy");
                objCliente_txt.dt_inclusao = objCliente.dt_inclusao.ToString(@"dd/MM/yyyy");
                objCliente_txt.nr_cpf_cnpj = objCliente.nr_cpf_cnpj;
                objCliente_txt.tp_pessoa = objCliente.tp_pessoa;
                objCliente_txt.ds_email = objCliente.ds_email;
                objCliente_txt.ds_rg = objCliente.ds_rg;
                objCliente_txt.ds_emissao = objCliente.ds_emissao;
                if (objCliente.dt_emissao_rg.ToString(@"dd/MM/yyyy") != "01/01/0001" ) objCliente_txt.dt_emissao_rg = objCliente.dt_emissao_rg.ToString(@"dd/MM/yyyy");
                objCliente_txt.ds_telefone_celular = objCliente.ds_telefone_celular;
                objCliente_txt.ds_telefone_comercial = objCliente.ds_telefone_comercial;
                if (objCliente.id_estado_civil != 0) objCliente_txt.id_estado_civil = objCliente.id_estado_civil.ToString();
                if (objCliente.id_genero!=0) objCliente_txt.id_genero = objCliente.id_genero.ToString();
                objCliente_txt.ds_estado_civil = objCliente.ds_estado_civil;
                objCliente_txt.ds_genero = objCliente.ds_genero;
                objCliente_txt.id_usuario = objCliente.id_usuario.ToString();
                objCliente_txt.id_cliente_pj = objCliente.id_cliente_pj.ToString();

                objCliente_txt.ds_cnh = objCliente.ds_cnh;
                objCliente_txt.dt_1_habilitacao = objCliente.dt_1_habilitacao;
                objCliente_txt.ds_profissao = objCliente.ds_profissao;
                objCliente_txt.ds_profissao_complemento = objCliente.ds_profissao_complemento;
                objCliente_txt.ds_nome_pai = objCliente.ds_nome_pai;
                objCliente_txt.ds_nome_mae = objCliente.ds_nome_mae;
                objCliente_txt.ds_nome_conjuge = objCliente.ds_nome_conjuge;
                objCliente_txt.ds_tipo_endereco = objCliente.ds_tipo_endereco;
                objCliente_txt.ds_cep = objCliente.ds_cep;
                objCliente_txt.ds_endereco = objCliente.ds_endereco;
                objCliente_txt.ds_numero = objCliente.ds_numero;
                objCliente_txt.ds_complemento = objCliente.ds_complemento;
                objCliente_txt.ds_bairro = objCliente.ds_bairro;
                objCliente_txt.ds_cidade = objCliente.ds_cidade;
                objCliente_txt.tp_tem_empresa = objCliente.tp_tem_empresa;
                objCliente_txt.ds_estado = objCliente.ds_estado;
                objCliente_txt.dt_atualizacao = objCliente.dt_atualizacao;




                //objCliente_txt.'id_cliente_i = objCliente.id_cliente_Cliente.ToString();
                //objCliente_txt.ds_genero = objCliente.ds_genero;
                //objCliente_txt.ds_estado_civil = objCliente.ds_estado_civil;

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
                return objCliente_txt;
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
        public static entEmpresaTexto wmConsultarEmpresaCliente(int id_cliente)

        {
            try
            {
                busEmpresa objbusEmpresa = new busEmpresa();
                entEmpresa objEmpresa = objbusEmpresa.ConsultarEmpresa(id_cliente);
                entEmpresaTexto objEmpresatexto = new entEmpresaTexto();
                objEmpresatexto.nr_cnpj = objEmpresa.nr_cnpj;
                objEmpresatexto.ds_nome_empresa = objEmpresa.ds_nome_empresa;
                objEmpresatexto.ds_endereco = objEmpresa.ds_endereco;
                objEmpresatexto.ds_cidade = objEmpresa.ds_cidade;
                objEmpresatexto.ds_estado = objEmpresa.ds_estado;

                return objEmpresatexto;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
                objError.TrataErro(ex.Message + " - " + ex.StackTrace);
                throw ex;
            }

        }
    }


}
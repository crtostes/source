using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acto.Cliente.Busines;
using Acto.Cliente.Entity;
using Acto.Empresa.Entity;
using Acto.Empresa.Busines;
using Acto.Endereco.Busines;
using Acto.Endereco.Entity;

using Acto.Infra.Contexto;

namespace actoseg.main.pages
{
    public partial class MeuCadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];
            if (objContexto == null) Response.Redirect("Login.aspx");
            txtEmail.Text = objContexto.Usuario.Email;
            //busCliente objBusCliente = new busCliente();
            //entCliente objEntcliente = objBusCliente.ConsultarClienteEmail(objContexto.Usuario.Email);
            //objContexto.Cliente = objEntcliente;
            //HttpContext.Current.Session["contexto"] = objContexto;

            txtNome.Text = objContexto.Cliente.ds_nome;
            txtCPF.Text = Convert.ToUInt64(objContexto.Cliente.nr_cpf_cnpj).ToString(@"000\.000\.000\-00");// objEntcliente.nr_cpf_cnpj.ToString("000.000.000-00");
            txtDataNascimento.Text = objContexto.Cliente.dt_nascimento.ToString(@"dd/MM/yyyy") ;
            txtTelefoneCelular.Text = objContexto.Cliente.ds_telefone_celular;
            txtTelefoneFixo.Text = objContexto.Cliente.ds_telefone_comercial;

            if (objContexto.Cliente.id_genero == 1)
            {
                rdoGeneroM.Checked = true;
            }
            else
            {
                rdoGeneroF.Checked = true;
            }

            txtNumeroRG.Text = objContexto.Cliente.ds_rg;
            txtEmissao.Text = objContexto.Cliente.ds_emissao;
            txtDataExpedicao.Text = objContexto.Cliente.dt_emissao_rg.ToString(@"dd/MM/yyyy");
            cboEstadoCivil.SelectedValue = objContexto.Cliente.id_estado_civil.ToString();
            txtDataInclusao.Text = objContexto.Cliente.dt_inclusao.ToString(@"dd/MM/yyyy");

            busEmpresa objBusEmpresa = new busEmpresa();
            entEmpresa objEntEmpresa = objBusEmpresa.ConsultarEmpresa(objContexto.Cliente.id_cliente);
            if (objEntEmpresa.id_cliente == 0)
            {
                rdoEmpresaNao.Checked = true;
            }
            else
            {
                rdoEmpresaSim.Checked = true;
                txtCNPJ.Text = Convert.ToUInt64(objEntEmpresa.nr_cnpj).ToString(@"00\.000\.000\/0000\-00");
                txtNomeEmpresa.Text = objEntEmpresa.ds_nome_empresa;
                txtEnderecoEmpresa.Text = objEntEmpresa.ds_endereco;
                txtCidade.Text = objEntEmpresa.ds_cidade.ToString().ToUpper();
                cboEstado.Text = objEntEmpresa.ds_estado;
            }

            //if (objEntcliente.id_cliente_pj != 0)
            //{
            //    rdoEmpresaSim.Checked = true;
            //}
            //else
            //{
            //    rdoEmpresaNao.Checked = true;
            //}

            //rdoEmpresaSim
            //rdoEmpresaNao

            //ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];
            //txtEmail.Text = objContexto.Usuario.Email;
            busEndereco objBusEndereco = new busEndereco();
            entEndereco objEntEndereco = objBusEndereco.ConsultarEnderecoCliente(objContexto.Cliente.id_cliente, 1);
            if (objEntEndereco is null)
            {
                return;
            }
            cboTipoEndereco.SelectedValue = objEntEndereco.id_tipo_endereco.ToString();
            txtCep.Text = objEntEndereco.ds_cep;
            txtEndereco.Text = objEntEndereco.ds_endereco;
            txtNumeroEndereco.Text = objEntEndereco.ds_numero;
            txtComplemento.Text = objEntEndereco.ds_complemento;
            txtBairro.Text = objEntEndereco.ds_bairro;
            txtCidade.Text = objEntEndereco.ds_cidade;
            cboEstado.Text = objEntEndereco.ds_estado;
            txtDataAtualizacao.Text = objEntEndereco.dt_atualizacao.ToString(@"dd/MM/yyyy");

            //objContexto.Cliente = objEntcliente;
            //HttpContext.Current.Session["contexto"] = objContexto;
            /////
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

        }

        [System.Web.Services.WebMethod]
        public static string wmAtualizarCliente(string pds_nome,
                                                string pdt_nascimento,
                                                string pds_rg,
                                                string pds_emissao,
                                                string pdt_emissao_rg,
                                                string pds_telefone_celular,
                                                string pds_telefone_comercial,
                                                string pid_estado_civil,
                                                string pid_genero,
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

            //if (cpf.IsNullOrWhiteSpace()) return "CPF em branco!";
            //if (objBusUsuario.ValidarCpf(cpf) != true) return "CPF Inválido, digito não confere!";
            //if (nome.IsNullOrWhiteSpace()) return "Nome em branco!";
            //if (email.IsNullOrWhiteSpace()) return "E-mail em branco!";
            //if (objBusUsuario.ValidarEmail(email) != true) return "E-mail Inválido!";
            //if (confirmar_email.IsNullOrWhiteSpace()) return "E-mail em branco!";
            //if (email != confirmar_email) return "E-mail diferente do confirmado";
            //if (senha.IsNullOrWhiteSpace()) return "Senha em branco!";
            //if (conf_senha.IsNullOrWhiteSpace()) return "Confirmar Senha em branco!";
            //if (senha != conf_senha) return "Senha diferente do confirmado";

            #endregion

            #region Gravar Dados Cliente

            ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];
          
            objEntCliente.id_cliente = objContexto.Cliente.id_cliente;
            objEntCliente.ds_nome = pds_nome.ToUpper();
            objEntCliente.dt_nascimento = Convert.ToDateTime(pdt_nascimento);
            objEntCliente.tp_pessoa = "F";
            objEntCliente.ds_rg = pds_rg;
            objEntCliente.ds_emissao = pds_emissao;
            objEntCliente.dt_emissao_rg = Convert.ToDateTime(pdt_emissao_rg);
            objEntCliente.ds_telefone_celular = pds_telefone_celular;
            objEntCliente.ds_telefone_comercial = pds_telefone_comercial;
            objEntCliente.id_estado_civil = Convert.ToInt32(pid_estado_civil);
            objEntCliente.id_genero = Convert.ToInt32(pid_genero);
            if (pEmpresaSimNao == "S")
            {
                objEntEmpresa.id_cliente = objContexto.Cliente.id_cliente;
                objEntEmpresa.nr_cnpj = pCNPJ.Replace(".", "").Replace("-", "").Replace("/", "");
                objEntEmpresa.ds_nome_empresa = pNomeEmpresa;
                objEntEmpresa.ds_endereco = pEnderecoEmpresa.ToUpper();
                objEntEmpresa.ds_cidade = pCidadeEmpresa.ToUpper(); 
                objEntEmpresa.ds_estado = pEstadoEmpresa;
            }
            

            //            if (objBusUsuario.ConsultarUsuarioCPF(objEntUsuario)) return "CPF já cadastrado!";


            //          if (objBusUsuario.ConsultarUsuarioEmail(objEntUsuario)) return "E-mail já cadastrado!";

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
        public static string wmAtualizarEndereco(string pid_tipo_endereco,
                                                string pds_cep,
                                                string pds_endereco,
                                                string pds_numero,
                                                string pds_complemento,
                                                string pds_bairro,
                                                string pds_cidade,
                                                string pds_estado,
                                                string pid_cliente)

        {




            busEndereco objBusEndereco = new busEndereco();
            entEndereco objEntEndereco = new entEndereco();

            #region Veriicar Dados Endereco da Tela

            //if (cpf.IsNullOrWhiteSpace()) return "CPF em branco!";

            //if (objBusUsuario.ValidarCpf(cpf) != true) return "CPF Inválido, digito não confere!";

            //if (nome.IsNullOrWhiteSpace()) return "Nome em branco!";

            //if (email.IsNullOrWhiteSpace()) return "E-mail em branco!";

            //if (objBusUsuario.ValidarEmail(email) != true) return "E-mail Inválido!";

            //if (confirmar_email.IsNullOrWhiteSpace()) return "E-mail em branco!";

            //if (email != confirmar_email) return "E-mail diferente do confirmado";

            //if (senha.IsNullOrWhiteSpace()) return "Senha em branco!";

            //if (conf_senha.IsNullOrWhiteSpace()) return "Confirmar Senha em branco!";

            //if (senha != conf_senha) return "Senha diferente do confirmado";

            #endregion

            #region Gravar Dados Endereco

            ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];

            objEntEndereco.id_endereco = 1;
            if (pid_cliente == "")
            {
                objEntEndereco.id_cliente = objContexto.Cliente.id_cliente;
            }
            else
            {
                objEntEndereco.id_cliente = Convert.ToInt32(pid_cliente);
            }
            objEntEndereco.id_tipo_endereco = Convert.ToInt32(pid_tipo_endereco);
            objEntEndereco.ds_cep = pds_cep;
            objEntEndereco.ds_endereco = pds_endereco.ToUpper();
            objEntEndereco.ds_numero = pds_numero;
            objEntEndereco.ds_complemento = pds_complemento.ToUpper();
            objEntEndereco.ds_bairro = pds_bairro.ToUpper();
            objEntEndereco.ds_cidade = pds_cidade.ToUpper();
            objEntEndereco.ds_estado = pds_estado.ToUpper();

            if (objBusEndereco.AtualizarEndereco(objEntEndereco))
            {
                return "OK";
            }
            else
            {
                return "NOK";
            };

            #endregion
        }
    }
}
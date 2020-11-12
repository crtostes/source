using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acto.Endereco.Busines;
using Acto.Endereco.Entity;
using Acto.Infra.Contexto;

namespace actoseg.main.pages
{
    public partial class MeuEndereco : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];
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
            txtCidade.Text = objEntEndereco.ds_cidade ;
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acto.Cliente.Busines;
using Acto.Cliente.Entity;
using Acto.Infra.Contexto;

namespace actoseg.main.pages
{
    public partial class MeuCadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];

            txtEmail.Text = objContexto.Usuario.Email;
            busCliente objBusCliente = new busCliente();
            entCliente objEntcliente = objBusCliente.ConsultarClienteEmail(objContexto.Usuario.Email);
            objContexto.Cliente = objEntcliente;
            HttpContext.Current.Session["contexto"] = objContexto;

            txtNome.Text = objEntcliente.ds_nome;
            txtCPF.Text = Convert.ToUInt64(objEntcliente.nr_cpf_cnpj).ToString(@"000\.000\.000\-00");// objEntcliente.nr_cpf_cnpj.ToString("000.000.000-00");
            txtDataNascimento.Text = objEntcliente.dt_nascimento.ToString(@"dd/MM/yyyy") ;
            txtTelefoneCelular.Text = objEntcliente.ds_telefone_celular;
            txtTelefoneFixo.Text = objEntcliente.ds_telefone_comercial;

            if (objEntcliente.id_genero == 1)
            {
                rdoGeneroM.Checked = true;
            }
            else
            {
                rdoGeneroF.Checked = true;
            }

            txtNumeroRG.Text = objEntcliente.ds_rg;
            txtEmissao.Text = objEntcliente.ds_emissao;
            txtDataExpedicao.Text = objEntcliente.dt_emissao_rg.ToString(@"dd/MM/yyyy");
            cboEstadoCivil.SelectedValue = objEntcliente.id_estado_civil.ToString();
            txtDataInclusao.Text = objEntcliente.dt_inclusao.ToString(@"dd/MM/yyyy");

            if (objEntcliente.id_cliente_pj != 0)
            {
                rdoEmpresaSim.Checked = true;
            }
            else
            {
                rdoEmpresaNao.Checked = true;
            }

            //rdoEmpresaSim
            //rdoEmpresaNao



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
                                                string pEmpresaSimNao)

        {

            busCliente objBusCliente = new busCliente();
            entCliente objEntCliente = new entCliente();

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
            objEntCliente.ds_nome = pds_nome;
            objEntCliente.dt_nascimento = Convert.ToDateTime(pdt_nascimento);
            objEntCliente.tp_pessoa = "F";
            objEntCliente.ds_rg = pds_rg;
            objEntCliente.ds_emissao = pds_emissao;
            objEntCliente.dt_emissao_rg = Convert.ToDateTime(pdt_emissao_rg);
            objEntCliente.ds_telefone_celular = pds_telefone_celular;
            objEntCliente.ds_telefone_comercial = pds_telefone_comercial;
            objEntCliente.id_estado_civil = Convert.ToInt32(pid_estado_civil);
            objEntCliente.id_genero = Convert.ToInt32(pid_genero);



            //            if (objBusUsuario.ConsultarUsuarioCPF(objEntUsuario)) return "CPF já cadastrado!";


            //          if (objBusUsuario.ConsultarUsuarioEmail(objEntUsuario)) return "E-mail já cadastrado!";

            if (objBusCliente.AtualizarCliente(objEntCliente))
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
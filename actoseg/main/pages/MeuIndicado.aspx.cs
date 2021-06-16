using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acto.Infra.Contexto;
using Acto.Cliente.Busines;
using Acto.Cliente.Entity;

namespace actoseg.main.pages
{
    public partial class MeuIndicado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];
            if (objContexto == null) Response.Redirect("Login.aspx");
            //txtEmail.Text = objContexto.Usuario.Email;
            //busCliente objBusCliente = new busCliente();
            //entCliente objEntcliente = objBusCliente.ConsultarClienteEmail(objContexto.Usuario.Email);
            //objContexto.Cliente = objEntcliente;
            //HttpContext.Current.Session["contexto"] = objContexto;

            txtIdClienteIndicador.Text = objContexto.Cliente.id_cliente.ToString();
        }
        //[System.Web.Services.WebMethod]
        //public static string wmIncluirIndicado(string nome, string cpf, string email, string confirmar_email)

        //{

        //    busIndicado objBusIndicado = new busIndicado();
        //    entIndicado objEntIndicado = new entIndicado();

        //    #region Veriicar Dados Tela

        //    if (cpf.IsNullOrWhiteSpace()) return "CPF do Indicado em branco!";

        //    if (objBusIndicado.ValidarCpf(cpf) != true) return "CPF do Indicado Inválido, digito não confere!";

        //    if (nome.IsNullOrWhiteSpace()) return "Nome do Indicado em branco!";

        //    if (email.IsNullOrWhiteSpace()) return "E-mail do Indicado em branco!";

        //    if (objBusIndicado.ValidarEmail(email) != true) return "E-mail do Indicado Inválido!";

        //    if (confirmar_email.IsNullOrWhiteSpace()) return "E-mail do Indicado em branco!";

        //    if (email != confirmar_email) return "E-mail do Indicado diferente do confirmado";



        //    #endregion

        //    #region Gravar Novo USUARIO

        //    ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];
        //    if (objContexto == null)
        //    {
        //        return "Sistema inoperante. Por favor Reiniciar!!!";
        //    }
                
        //    //txtEmail.Text = objContexto.Usuario.Email;
        //    //busCliente objBusCliente = new busCliente();
        //    //entCliente objEntcliente = objBusCliente.ConsultarClienteEmail(objContexto.Usuario.Email);
        //    //objContexto.Cliente = objEntcliente;
        //    // HttpContext.Current.Session["contexto"] = objContexto;

        //    objEntIndicado.ds_nome = nome.ToUpper();
        //    objEntIndicado.ds_email = email.ToLower();
        //    objEntIndicado.nr_cpf_cnpj = cpf.Replace(".", "").Replace("-", "");
        //    objEntIndicado.id_cliente_indicado = objContexto.Cliente.id_cliente;

        //    if (objBusIndicado.ConsultarIndicadoCPFCNPJ(objEntIndicado)) return "CPF do Indicado já cadastrado!";


        //    if (objBusIndicado.ConsultarIndicadoEmail(objEntIndicado)) return "E-mail do Indicado já cadastrado!";


        //    #endregion

        //    return objBusIndicado.IncluirIndicado(objEntIndicado).ToString(); 


        //}

        //[System.Web.Services.WebMethod]
        //public static entIndicadoTexto wmConsultarIndicado(int id_cliente)

        //{
        //    try
        //    { 
        //    //entIndicado objIndicado = new entIndicado();

        //    //objIndicado.ds_nome = "TESTE FUNCIONOU";
        //    //objIndicado.nr_cpf_cnpj = "162.527.088-99";

        //    busIndicado objBusIndicado = new busIndicado();
        //    entIndicado objIndicado = objBusIndicado.ConsultarIndicado(id_cliente);
        //    Acto.Indicado.Entity.entIndicadoTexto objIndicado_txt = new Acto.Indicado.Entity.entIndicadoTexto();
        //    objIndicado_txt.id_cliente = objIndicado.id_cliente.ToString();
        //    objIndicado_txt.ds_nome = objIndicado.ds_nome;
        //    objIndicado_txt.dt_nascimento = objIndicado.dt_nascimento.ToString(@"dd/MM/yyyy");
        //    objIndicado_txt.dt_inclusao = objIndicado.dt_inclusao.ToString(@"dd/MM/yyyy");
        //    objIndicado_txt.nr_cpf_cnpj = Convert.ToUInt64(objIndicado.nr_cpf_cnpj).ToString(@"000\.000\.000\-00");
        //    objIndicado_txt.tp_pessoa = objIndicado.tp_pessoa;
        //    objIndicado_txt.ds_email = objIndicado.ds_email;
        //    objIndicado_txt.ds_rg = objIndicado.ds_rg;
        //    objIndicado_txt.ds_emissao = objIndicado.ds_emissao;
        //    objIndicado_txt.dt_emissao_rg = objIndicado.dt_emissao_rg.ToString(@"dd/MM/yyyy");
        //    objIndicado_txt.ds_telefone_celular = objIndicado.ds_telefone_celular;
        //    objIndicado_txt.ds_telefone_comercial = objIndicado.ds_telefone_comercial;
        //    objIndicado_txt.id_estado_civil = objIndicado.id_estado_civil.ToString();
        //    objIndicado_txt.id_genero = objIndicado.id_genero.ToString();
        //    objIndicado_txt.id_usuario = objIndicado.id_usuario.ToString();
        //    objIndicado_txt.id_cliente_pj = objIndicado.id_cliente_pj.ToString();
        //    objIndicado_txt.id_cliente_indicado = objIndicado.id_cliente_indicado.ToString();
        //    objIndicado_txt.ds_genero= objIndicado.ds_genero;
        //    objIndicado_txt.ds_estado_civil = objIndicado.ds_estado_civil;

        //    //txtNome.Text = objEntcliente.ds_nome;
        //    //txtCPF.Text = Convert.ToUInt64(objEntcliente.nr_cpf_cnpj).ToString(@"000\.000\.000\-00");// objEntcliente.nr_cpf_cnpj.ToString("000.000.000-00");
        //    //txtDataNascimento.Text = objEntcliente.dt_nascimento.ToString(@"dd/MM/yyyy");
        //    //txtTelefoneCelular.Text = objEntcliente.ds_telefone_celular;
        //    //txtTelefoneFixo.Text = objEntcliente.ds_telefone_comercial;

        //    //if (objEntcliente.id_genero == 1)
        //    //{
        //    //    rdoGeneroM.Checked = true;
        //    //}
        //    //else
        //    //{
        //    //    rdoGeneroF.Checked = true;
        //    //}

        //    //txtNumeroRG.Text = objEntcliente.ds_rg;
        //    //txtEmissao.Text = objEntcliente.ds_emissao;
        //    //txtDataExpedicao.Text = objEntcliente.dt_emissao_rg.ToString(@"dd/MM/yyyy");
        //    //cboEstadoCivil.SelectedValue = objEntcliente.id_estado_civil.ToString();
        //    //txtDataInclusao.Text = objEntcliente.dt_inclusao.ToString(@"dd/MM/yyyy");

        //    //if (objEntcliente.id_cliente_pj != 0)
        //    //{
        //    //    rdoEmpresaSim.Checked = true;
        //    //}
        //    //else
        //    //{
        //    //    rdoEmpresaNao.Checked = true;
        //    //}
        //    return objIndicado_txt;
        //    }
        //    catch (Exception ex)
        //    {
        //        //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
        //        Acto.Infra.Log.LogError objError = new Acto.Infra.Log.LogError();
        //        objError.TrataErro(ex.Message + " - " + ex.StackTrace);
        //        throw ex;
        //    }
            
        //}

        //[System.Web.Services.WebMethod]
        //public static string wmListarIndicados(int id_cliente)
        //{

        //    busIndicado objBusIndicado = new busIndicado();
        //    List<entIndicado> objLstIndicado = objBusIndicado.ListarIndicadosCliente(id_cliente); 
        //    var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        //    return oSerializer.Serialize(objLstIndicado);
        //    //return objLstIndicado;
        //}
        //[System.Web.Services.WebMethod]
        //public static string wmAtualizarIndicado(string pid_cliente,
        //                                        string pds_nome,
        //                                        string pdt_nascimento,
        //                                        string pds_rg,
        //                                        string pds_emissao,
        //                                        string pdt_emissao_rg,
        //                                        string pds_telefone_celular,
        //                                        string pds_telefone_comercial,
        //                                        string pid_estado_civil,
        //                                        string pid_genero)

        //{

        //    busCliente objBusCliente = new busCliente();
        //    entCliente objEntCliente = new entCliente();

        //    #region Veriicar Dados Cliente da Tela

        //    //if (cpf.IsNullOrWhiteSpace()) return "CPF em branco!";

        //    //if (objBusUsuario.ValidarCpf(cpf) != true) return "CPF Inválido, digito não confere!";

        //    //if (nome.IsNullOrWhiteSpace()) return "Nome em branco!";

        //    //if (email.IsNullOrWhiteSpace()) return "E-mail em branco!";

        //    //if (objBusUsuario.ValidarEmail(email) != true) return "E-mail Inválido!";

        //    //if (confirmar_email.IsNullOrWhiteSpace()) return "E-mail em branco!";

        //    //if (email != confirmar_email) return "E-mail diferente do confirmado";

        //    //if (senha.IsNullOrWhiteSpace()) return "Senha em branco!";

        //    //if (conf_senha.IsNullOrWhiteSpace()) return "Confirmar Senha em branco!";

        //    //if (senha != conf_senha) return "Senha diferente do confirmado";

        //    #endregion

        //    #region Gravar Dados Cliente

        //    //ActoContexto objContexto = (ActoContexto)HttpContext.Current.Session["contexto"];
        //    objEntCliente.id_cliente = Convert.ToInt32(pid_cliente);
        //    objEntCliente.ds_nome = pds_nome;
        //    objEntCliente.dt_nascimento = Convert.ToDateTime(pdt_nascimento);
        //    objEntCliente.tp_pessoa = "F";
        //    objEntCliente.ds_rg = pds_rg;
        //    objEntCliente.ds_emissao = pds_emissao;
        //    objEntCliente.dt_emissao_rg = Convert.ToDateTime(pdt_emissao_rg);
        //    objEntCliente.ds_telefone_celular = pds_telefone_celular;
        //    objEntCliente.ds_telefone_comercial = pds_telefone_comercial;
        //    objEntCliente.id_estado_civil = Convert.ToInt32(pid_estado_civil);
        //    objEntCliente.id_genero = Convert.ToInt32(pid_genero);



        //    //            if (objBusUsuario.ConsultarUsuarioCPF(objEntUsuario)) return "CPF já cadastrado!";


        //    //          if (objBusUsuario.ConsultarUsuarioEmail(objEntUsuario)) return "E-mail já cadastrado!";

        //    if (objBusCliente.AtualizarCliente(objEntCliente, "N", null))
        //    {
        //        return "OK";
        //    }
        //    else
        //    {
        //        return "NOK";
        //    };

        //    #endregion




        //}
    }
}
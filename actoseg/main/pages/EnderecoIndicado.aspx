<%@ Page Language="C#" MasterPageFile="~/main/pages/Principal.Master" AutoEventWireup="true" CodeBehind="EnderecoIndicado.aspx.cs" Inherits="actoseg.main.pages.EnderecoIndicado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<script>
        function checkNumber(valor) {
            var regra = /^[0-9]+$/;
            if (valor.match(regra)) {
				return true;
            } else {
                return false;
            }
        }; 
        function Trim(strTexto) {
            // Substitúi os espaços vazios no inicio e no fim da string por vazio.
            return strTexto.replace(/^s+|s+$/g, '');
        }
        function IsCEP(strCEP, blnVazio) {
            // Caso o CEP não esteja nesse formato ele é inválido!
            var objER = /^[0-9]{5}-[0-9]{3}$/;

            strCEP = Trim(strCEP)
            if (strCEP.length > 0) {
                if (objER.test(strCEP))
                    return true;
                else
                    return false;
            }
            else
                return blnVazio;
        }
        function Voltar() {
            window.location.href = "Default.aspx";
        }
        function AtualizarEndereco() {

            if ($("#ContentPlaceHolder1_txtIdCliente").val() == '') {
                alert("Localize o Indicado para atualizar seu Endereço.");
                return false;
            }

            //Verifica Tipo Endereço
            if ($("#ContentPlaceHolder1_cboTipoEndereco").val() == null) {
                alert("Informe o Tipo de Endereço do Indicado.");
                return false;
            }
            //Verifica Tipo Endereço
            if ($("#ContentPlaceHolder1_cboTipoEndereco").val() == '') {
                alert("Informe o Tipo de Endereço do Indicado.");
                return false;
            }

            //Verifica CEP
            if ($("#ContentPlaceHolder1_txtCep").val() == '') {
                alert("Informe o CEP.");
                return false;
            }
            if (IsCEP($("#ContentPlaceHolder1_txtCep").val()) == false) {
                alert("Informe o CEP do Indicado corretamente .");
                return false;
            }

            // Verifica Endereço
            if ($("#ContentPlaceHolder1_txtEndereco").val() == '') {
                alert("Informe o Endereço do Indicado.");
                return false;
            }

            // Verifica Endereço
            if ($("#ContentPlaceHolder1_txtNumeroEndereco").val() == '') {
                alert("Informe o número do endereço do Indicado.");
                return false;
            }
            if (checkNumber($("#ContentPlaceHolder1_txtNumeroEndereco").val()) == false) {
                alert("Informe o número do Endereço do Indicado corretamente.");
                return false;
            }
			
           

            // Verifica Complemento
            if ($("#ContentPlaceHolder1_txtComplemento").val() == '') {
                alert("Informe o Complemento do Endereço.");
                return false;
			}
            // Verifica Bairro
            if ($("#ContentPlaceHolder1_txtBairro").val() == '') {
                alert("Informe o Bairro do Indicado.");
                return false;
			}
            // Verifica Cidade
            if ($("#ContentPlaceHolder1_txtCidade").val() == '') {
                alert("Informe o Cidade do Indicado.");
                return false;
			}
            // Verifica Estado
            if ($("#ContentPlaceHolder1_cboEstado").val() == '') {
                alert("Informe o Estado do Indicado.");
                return false;
            }
            $.ajax({
                type: "POST",
                url: "MeuEndereco.aspx/wmAtualizarEndereco",
                data: "{pid_tipo_endereco: '" + $("#ContentPlaceHolder1_cboTipoEndereco").val() +
                    "', pds_cep: '" + $("#ContentPlaceHolder1_txtCep").val() + 
                    "', pds_endereco: '" + $("#ContentPlaceHolder1_txtEndereco").val() +
                    "', pds_numero: '" + $("#ContentPlaceHolder1_txtNumeroEndereco").val() +
                    "', pds_complemento: '" + $("#ContentPlaceHolder1_txtComplemento").val() + 
                    "', pds_bairro: '" + $("#ContentPlaceHolder1_txtBairro").val() +
                    "', pds_cidade: '" + $("#ContentPlaceHolder1_txtCidade").val() +
                    "', pds_estado: '" + $("#ContentPlaceHolder1_cboEstado").val() +
                    "', pid_cliente: '" + $("#ContentPlaceHolder1_txtIdCliente").val() +
                    "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });

            return false;
        }

        function OnSuccess(data, status) {

			if (data.d == "OK") {
				alert("Endereço do Indicado atualizado com sucesso!");				
			}
			else
			{
                alert("Endereço do Indicado não foi atualizado, houve um problema sistêmico.");
            }
		}

        function CarregarListaIndicados() {
           
            $.ajax({
                type: "POST",
                url: "MeuIndicado.aspx/wmListarIndicados",
                data: "{id_cliente: " + $("#ContentPlaceHolder1_txtIdClienteIndicador").val() + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessCarregarListaIndicado,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }
        function OnSuccessCarregarListaIndicado(data, status) {
            //$('p').html("Sobrenome:" + data.d._sobreNome + " idade:" + data.d._idade + "");
            //$("#ContentPlaceHolder1_txtNome").val(data.d.ds_nome);

            $('#ContentPlaceHolder1_ddlIndicados').find("option").remove();

            //$.each(data, function (key, value) {
            //    alert(key + ": " + value);
            //});
            $('#ContentPlaceHolder1_ddlIndicados').append('<option Value="">Selecione...</option>');
            var obj = JSON.parse(data.d);

            obj.forEach(function (o, index) {
                //var option2 = document.createElement('option');
                //option2.value = o.id_cliente;
                //option2.text = o.ds_nome;
                $('#ContentPlaceHolder1_ddlIndicados').append('<option Value="' + o.id_cliente + '">' + o.ds_nome + '</option>');
                //$('#ContentPlaceHolder1_ddlIndicados').add(option2);
                //alert(o.ds_nome);
            });

        }
        function CarregarIndicadoLista() {

            if ($('#ContentPlaceHolder1_ddlIndicados').val() == "") {
                alert("Selecione o Indicado para Atualizar o Cadastro!");
                return false;
            }

            $.ajax({
                type: "POST",
                url: "MeuIndicado.aspx/wmConsultarIndicado",
                data: "{id_cliente: " + $('#ContentPlaceHolder1_ddlIndicados').val() + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessConsultaIndicado,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }
        function CarregarIndicado() {


            $.ajax({
                type: "POST",
                url: "MeuIndicado.aspx/wmConsultarIndicado",
                data: "{id_cliente: '" + $("#ContentPlaceHolder1_txtIdCliente").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessConsultaIndicado,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }
        function OnSuccessConsultaIndicado(data, status) {
           
            //$('p').html("Sobrenome:" + data.d._sobreNome + " idade:" + data.d._idade + "");
            $("#ContentPlaceHolder1_txtIdCliente").val(data.d.id_cliente);
            $("#ContentPlaceHolder1_txtNome").val(data.d.ds_nome);
            $("#ContentPlaceHolder1_txtEmail").val(data.d.ds_email);
            $("#ContentPlaceHolder1_txtCPF").val(data.d.nr_cpf_cnpj);

            ConsultaEnderecoIndicado();
            

        }

        function ConsultaEnderecoIndicado() {
            $.ajax({
                type: "POST",
                url: "EnderecoIndicado.aspx/wmConsultarEnderecoIndicado",
                data: "{id_cliente: '" + $("#ContentPlaceHolder1_txtIdCliente").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessConsultaEnderecoIndicado,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }

        function OnSuccessConsultaEnderecoIndicado(data, status) {
            
            //$('p').html("Sobrenome:" + data.d._sobreNome + " idade:" + data.d._idade + "");
            $("#ContentPlaceHolder1_cboTipoEndereco").val(data.d.id_tipo_endereco);
            $("#ContentPlaceHolder1_txtCep").val(data.d.ds_cep);
            $("#ContentPlaceHolder1_txtEndereco").val(data.d.ds_endereco);
            $("#ContentPlaceHolder1_txtNumeroEndereco").val(data.d.ds_numero);
            $("#ContentPlaceHolder1_txtComplemento").val(data.d.ds_complemento);
            $("#ContentPlaceHolder1_txtBairro").val(data.d.ds_bairro);
            $("#ContentPlaceHolder1_txtCidade").val(data.d.ds_cidade);
            $("#ContentPlaceHolder1_cboEstado").val(data.d.ds_estado);
            $("#ContentPlaceHolder1_txtDataAtualizacao").val(data.d.dt_atualizacao);

            //cboTipoEndereco.SelectedValue = objEntEndereco.id_tipo_endereco.ToString();
            //txtCep.Text = objEntEndereco.ds_cep;
            //txtEndereco.Text = objEntEndereco.ds_endereco;
            //txtNumeroEndereco.Text = objEntEndereco.ds_numero;
            //txtComplemento.Text = objEntEndereco.ds_complemento;
            //txtBairro.Text = objEntEndereco.ds_bairro;
            //txtCidade.Text = objEntEndereco.ds_cidade;
            //cboEstado.Text = objEntEndereco.ds_estado;
            //txtDataAtualizacao.Text = objEntEndereco.dt_atualizacao.ToString(@"dd/MM/yyyy");

        }
        $(document).ready(function () {
            jQuery.support.cors = true;
        });

          
    </script>
    <!-- Content Wrapper. Contains page content -->
  <%--<div class="content-wrapper">--%>
    <!-- Content Header (Page header) -->
    <section class="content-header">
     
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i> Inicío</a></li>
        <li class="breadcrumb-item"><a href="#">Cadastro</a></li>
        <li class="breadcrumb-item active">Meu Endereço</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Modal -->
				<div class="modal center-modal fade" id="modal-localizar-indicado" tabindex="-1">
				  <div class="modal-dialog">
					<div class="modal-content">
					  <div class="modal-header">
						<h5 class="modal-title">Estes são seus Indicados, escolha um para atualizar o cadastro.</h5>

                         
						<button type="button" class="close" data-dismiss="modal">
						  <span aria-hidden="true">&times;</span>
						</button>
					  </div>
					  <div class="modal-body">
						   <div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-user"></i></span>
								</div>
								    <asp:DropDownList id="ddlIndicados" AutoPostBack="False" runat="server" CssClass="form-control">
                                      <asp:ListItem Selected="True" Value="">Selecione</asp:ListItem>
                                      <asp:ListItem Value="1">Solteiro(a)</asp:ListItem>
                                      <asp:ListItem Value="2">Casado(a)</asp:ListItem>
                                      <asp:ListItem Value="3">Divorciado(a)</asp:ListItem>
                                      <asp:ListItem Value="4">Viúvo(a)</asp:ListItem>
                                      <asp:ListItem Value="5">União Estavél</asp:ListItem>
                                      <asp:ListItem Value="6">Outros</asp:ListItem>
                                    </asp:DropDownList>
					            </div>
							</div>
						</div>
                        <div class="modal-footer modal-footer-uniform">
						<button type="button" class="btn btn-bold btn-secondary" data-dismiss="modal">Fechar</button>
						<button type="button" class="btn btn-bold btn-primary float-right" data-dismiss="modal" onclick="CarregarIndicadoLista()">Carregar Indicado</button>
					  </div>
					  </div>
					  
					</div>
				  </div>
				
       <!-- /.modal -->
      <div class="row">		  
        <div class="col-lg-6 col-12">
		  <div class="box">
			<div class="box-header with-border bg-light">
			  <h4 class="box-title">Endereço do Indicado</h4>							
			</div>
			<!-- /.box-header -->
			<form>
				<div class="box-body">
               
					<h4 class="mt-0 mb-20">1. Localize o Indicado para o Endereço:</h4>
                   <button type="button" class="btn btn-primary mb-5" data-toggle="modal" data-target="#modal-localizar-indicado" onclick="CarregarListaIndicados()">Localizar</button>
                  </div>
                <div class="box-body">
					<h4 class="mt-0 mb-20">2.Informações do Indicado:</h4>
                
                <div class="form-group">
						<label>Nome:</label>
						<%--<input id="txtNome" type="text" class="form-control" placeholder="Nome Completo" disabled="disabled">--%>
                        <asp:TextBox name="txtIdCliente" id="txtIdCliente" type="hidden" runat="server"></asp:TextBox>
                        <asp:TextBox name="txtIdClienteIndicador" id="txtIdClienteIndicador" type="hidden" runat="server"></asp:TextBox>
						<asp:TextBox name="txtNome" id="txtNome" type="text" class="form-control" CssClass="form-control" runat="server" disabled="disabled"></asp:TextBox>
					</div>
					<div class="form-group">
						<label>E-mail:</label>
						<%--<input id="txtEmail" type="email" class="form-control" placeholder="E-mail" disabled ="disabled" >--%>
						<asp:TextBox id="txtEmail" type="text" class="form-control" CssClass="form-control" runat="server" disabled="disabled"></asp:TextBox>
					</div>
					<div class="form-group">
						<label>CPF:</label>							
						<%--<input id="txtCPF" type="text" class="form-control" placeholder="000.000.000-00" disabled ="disabled">--%>
						<asp:TextBox id="txtCPF" type="text" class="form-control" CssClass="form-control" runat="server" disabled="disabled"></asp:TextBox>
					</div>
					<h4 class="mt-0 mb-20">3.Informações do Endereço:</h4>
					<div class="form-group">
						<label>Tipo Endereço:</label>		
						<asp:DropDownList id="cboTipoEndereco" AutoPostBack="False" runat="server" CssClass="form-control">
							<asp:ListItem Selected="True" Value="">Selecione...</asp:ListItem>
							<asp:ListItem Value="1">Residencial</asp:ListItem>
							<asp:ListItem Value="2">Comercial</asp:ListItem>
						</asp:DropDownList> 
					</div>
					<div class="form-group">
						<label>CEP:</label>
						<%--<input id="txtCep" type="text" class="form-control" placeholder="Digite o Cep">--%>
						<asp:TextBox name="txtCep" id="txtCep" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite o Cep" MaxLength ="9"></asp:TextBox>
					</div>
					
					<div class="form-group">
						<label>Endereço:</label>
						<%--<input id="txtEndereco" type="text" class="form-control" placeholder="Digite o Endereço">--%>
						<asp:TextBox name="txtEndereco" id="txtEndereco" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite o Endereço"></asp:TextBox>
					</div>
					<div class="form-group">
						<label>Numero:</label>
						<%--<input id="txtNumeroEndereco" type="text" class="form-control" placeholder="Digite o Número">--%>
						<asp:TextBox name="txtNumeroEndereco" id="txtNumeroEndereco" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite o Número"  MaxLength ="6"></asp:TextBox>
					</div>
					<div class="form-group">
						<label>Complemento:</label>							
						<%--<input id="txtComplemento" type="text" class="form-control" placeholder="Digite o complemento">--%>
						<asp:TextBox name="txtComplemento" id="txtComplemento" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite o complemento"></asp:TextBox>
					</div>

					<div class="form-group">
					  <label>Bairro:</label>		
					  <%--<input id="txtBairro" class="form-control" type="text"  placeholder="Digite o Bairro">					  --%>
						<asp:TextBox name="txtBairro" id="txtBairro" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite o Bairro"></asp:TextBox>
					</div>

					<div class="form-group">
					  <label>Cidade:</label>		
					  <%--<input id="txtCidade" class="form-control" type="text"  placeholder="Digite a Cidade">					  --%>
						<asp:TextBox name="txtCidade" id="txtCidade" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite a Cidade"></asp:TextBox>
					</div>

				<div class="form-group">
					  <label>Estado:</label>		
						<asp:DropDownList id="cboEstado" AutoPostBack="False" runat="server" CssClass="form-control">
							<asp:ListItem Selected="True" Value="">Selecione...</asp:ListItem>
							<asp:ListItem>SP</asp:ListItem>
							<asp:ListItem>AC</asp:ListItem>
							<asp:ListItem>AL</asp:ListItem>
							<asp:ListItem>AP</asp:ListItem>
							<asp:ListItem>AM</asp:ListItem>
							<asp:ListItem>BA</asp:ListItem>
							<asp:ListItem>CE</asp:ListItem>
							<asp:ListItem>DF</asp:ListItem>
							<asp:ListItem>ES</asp:ListItem>
							<asp:ListItem>GO</asp:ListItem>
							<asp:ListItem>MA</asp:ListItem>
							<asp:ListItem>MT</asp:ListItem>
							<asp:ListItem>MS</asp:ListItem>
							<asp:ListItem>MG</asp:ListItem>
							<asp:ListItem>PA</asp:ListItem>
							<asp:ListItem>PB</asp:ListItem>
							<asp:ListItem>PR</asp:ListItem>
							<asp:ListItem>PE</asp:ListItem>
							<asp:ListItem>PI</asp:ListItem>
							<asp:ListItem>RJ</asp:ListItem>
							<asp:ListItem>RN</asp:ListItem>
							<asp:ListItem>RS</asp:ListItem>
							<asp:ListItem>RO</asp:ListItem>
							<asp:ListItem>RR</asp:ListItem>
							<asp:ListItem>SC</asp:ListItem>
							<asp:ListItem>SE</asp:ListItem>
							<asp:ListItem>TO</asp:ListItem>
						</asp:DropDownList>
					</div>
					<div class="form-group">
					  <label>Data da Atualização:</label>		
					  <%--<input class="form-control" type="text" value="" id="txtDataInclusao" disabled="disabled" >			--%>
                      <asp:TextBox name="txtDataAtualizacao" id="txtDataAtualizacao" type="text" class="form-control" CssClass="form-control" runat="server" Enabled ="false"></asp:TextBox>
					</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-danger" onclick="Voltar()">Voltar</button>
					<button type="button" class="btn btn-success pull-right" onclick="AtualizarEndereco()">Gravar</button>					

				</div>
			</div>
			</form>
		  </div>
		  <!-- /.box -->			
		</div>		  
		
      </div>
      <!-- /.row -->
      
    </section>
    <!-- /.content -->
  <%--</div>--%>
  <!-- /.content-wrapper -->
</asp:Content>
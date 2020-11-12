<%@ Page Language="C#" MasterPageFile="~/main/pages/Principal.Master"  AutoEventWireup="true" CodeBehind="IncluirCotacao.aspx.cs" Inherits="actoseg.main.pages.IncluirCotacao" %>

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
  <%-- <body class="hold-transition skin-black sidebar-mini">
<div class="wrapper">--%>

  <header class="main-header">	  	
	  <script>
          function submit() {

              alert("acto teste");

          }

          function SendMail(person, isAttending, returnEmail) {

              var dataValue = { "name": person, "isGoing": isAttending, "returnAddress": returnEmail };

              $.ajax({
                  type: "POST",
                  url: "Default.aspx/OnSubmit",
                  data: dataValue,
                  error: function (XMLHttpRequest, textStatus, errorThrown) {
                      alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                  },
                  complete: function (jqXHR, status) {
                      alert("complete: " + status + "\n\nResponse: " + jqXHR.responseText);
                  }
              });

          }
      </script>

  </header>
  
	 <section class="content-header">
     
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i> Inicío</a></li>
        <li class="breadcrumb-item"><a href="#">Cotações</a></li>
        <li class="breadcrumb-item active">Incluir</li>
      </ol>
    </section>

  <!-- Content Wrapper. Contains page content -->
  <div class="">
 

    <!-- Main content -->
    <section class="content">
     
      <!-- tabs -->

      <div class="row">
        <div class="col-12">
          <div class="box">
            <%--<div class="box-header with-border bg-light">
              <h4 class="box-title">Fill</h4>
              <h6 class="subtitle">Use default tab with class <code>nav-tabs &amp; nav-fill </code></h6>
            </div>--%>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<ul class="nav nav-tabs nav-fill" role="tablist">
					<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home11" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">SEGURADO</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile11" role="tab"><span class="hidden-sm-up"><i class="ion-model-s"></i></span> <span class="hidden-xs-down">VEICULO</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages11" role="tab"><span class="hidden-sm-up"><i class="ion-home"></i></span> <span class="hidden-xs-down">PERFIL</span></a> </li>					
				</ul>
				<!-- Tab panes -->
				<div class="tab-content tabcontent-border">
					<div class="tab-pane active" id="home11" role="tabpanel">
						<div class="pad">
                            <%--<section class="content">--%>
                            <div class="row">		
							<div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Dados Segurado</h4>			
				                    <ul class="box-controls pull-right">
				                      <%--<li><a class="box-btn-close" href="#"></a></li>
				                      <li><a class="box-btn-slide" href="#"></a></li>	--%>
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <h4 class="box-title text-info"><i class="ti-user mr-15"></i> Informações Pessoais</h4>
					                    <hr class="my-15">
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>CPF</label>
						                      <input type="text" class="form-control" placeholder="Digite seu CPF">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Nome</label>
						                      <input type="text" class="form-control" placeholder="Digite seu Nome">
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >E-mail</label>
						                      <input type="text" class="form-control" placeholder="Digite seu E-mail">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Telefone Celular</label>
						                      <input type="text" class="form-control" placeholder="Digite seu Telefone Celular">
						                    </div>
					                      </div>
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Data de Nascimento</label>
						                      <input type="text" class="form-control" placeholder="Digite sua Data de Nascimento">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Telefone Fixo (opcional)</label>
						                      <input type="text" class="form-control" placeholder="Digite seu Telefone Fixo (opcional)">
						                    </div>
					                      </div>
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Gênero</label>
						                      <input type="text" class="form-control" placeholder="Selecione seu Gênero">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Estado Civil</label>
						                      <input type="text" class="form-control" placeholder="Selecione seu Estado Civil">
						                    </div>
					                      </div>
					                    </div>
					                   
				                    </div>
				                    <!-- /.box-body -->
				                    <div class="box-footer">
					                    <input type="button" class="btn btn-success" onclick="InserirDadosCliente()">
					                      <i class="ti-save-alt"></i> Grave
					                    </input>
				                    </div>  
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                    <div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Endereço do Segurado</h4>			
				                    <ul class="box-controls pull-right">
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <h4 class="box-title text-info"><i class="ti-location-pin mr-15"></i> Principal</h4>
					                    <hr class="my-15">
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>CEP</label>
						                      <input type="text" class="form-control" placeholder="Digite seu CEP">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Logradouro</label>
						                      <input type="text" class="form-control" placeholder="Logradouro">
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Numero</label>
						                      <input type="text" class="form-control" placeholder="Digite o numero">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Complemento</label>
						                      <input type="text" class="form-control" placeholder="Complemento">
						                    </div>
					                      </div>
					                    </div>
										   <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Bairro</label>
						                      <input type="text" class="form-control" placeholder="Bairro">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Cidade-UF</label>
						                      <input type="text" class="form-control" placeholder="Cidade-UF">
						                    </div>
					                      </div>
					                    </div>
					                </div>
				                    <!-- /.box-body -->
				                    <div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div> 
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div>	
                            
                            </div>
                            <%--</section>--%>
						</div>
					</div>
					<div class="tab-pane pad" id="profile11" role="tabpanel">
                        <div class="pad">
                            <%--<section class="content">--%>
                            <div class="row">		
							<div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Dados Veículo</h4>			
				                    <ul class="box-controls pull-right">
				                      <%--<li><a class="box-btn-close" href="#"></a></li>
				                      <li><a class="box-btn-slide" href="#"></a></li>	--%>
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <h4 class="box-title text-info"><i class="ti-car mr-15"></i> Veículo</h4>
					                    <hr class="my-15">
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Marca</label>
						                      <input type="text" class="form-control" placeholder="Digite a Marca">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Ano Fabricação</label>
						                      <input type="text" class="form-control" placeholder="Digite o Ano Fabricação">
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Ano Modelo</label>
						                      <input type="text" class="form-control" placeholder="Selecione o Modelo">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Modelo</label>
						                      <input type="text" class="form-control" placeholder="Selecione o Modelo">
						                    </div>
					                      </div>
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Versão</label>
						                      <input type="text" class="form-control" placeholder="Selecione a versão">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Placa (opcional)</label>
						                      <input type="text" class="form-control" placeholder="Digite a Placa (opcional)">
						                    </div>
					                      </div>
					                    </div>
                                        
				                    </div>
				                    <!-- /.box-body -->
				                    <div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div>  
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                    <div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Sobre o Veiculo</h4>			
				                    <ul class="box-controls pull-right">
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <h4 class="box-title text-info"><i class="ti-check mr-15"></i> Principal</h4>
					                    <hr class="my-15">
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Financiado</label>
						                      <input type="text" class="form-control" placeholder="Selecione SIM ou NÃO">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Kit Gás</label>
						                      <input type="text" class="form-control" placeholder="Selecione SIM ou NÃO">
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Taxi</label>
						                      <input type="text" class="form-control" placeholder="Selecione SIM ou NÃO">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Aplicativo (Uber,99,Cabify)</label>
						                      <input type="text" class="form-control" placeholder="Selecione SIM ou NÃO">
						                    </div>

					                      </div>
					                    </div>
										 <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Blindado, leilão ou remarcado</label>
						                      <input type="text" class="form-control" placeholder="Selecione SIM ou NÃO">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Isento de Imposto (PCD)</label>
						                      <input type="text" class="form-control" placeholder="Selecione SIM ou NÃO">
						                    </div>

					                      </div>
					                    </div>
					                </div>
				                    <!-- /.box-body -->
				                    <div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div> 
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div>	
                            
                            </div>
                            <%--</section>--%>
						</div>
					</div>
					<div class="tab-pane pad" id="messages11" role="tabpanel">
						<div class="pad">
                            <%--<section class="content">--%>
                            <div class="row">		
							<div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Dados Perfil</h4>			
				                    <ul class="box-controls pull-right">
				                      <%--<li><a class="box-btn-close" href="#"></a></li>
				                      <li><a class="box-btn-slide" href="#"></a></li>	--%>
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <h4 class="box-title text-info"><i class="ti-info-alt mr-15"></i> Informações para Analise</h4>
					                    <hr class="my-15">
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Você é o proprietário</label>
						                      <input type="text" class="form-control" placeholder="Selecione SIM ou NÃO">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Você é o principal condutor</label>
						                      <input type="text" class="form-control" placeholder="Selecione SIM ou NÃO">
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Idade 1ª Habilitação</label>
						                      <input type="text" class="form-control" placeholder="Digite a Idade">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Profissão</label>
						                      <input type="text" class="form-control" placeholder="Digite sua Profissão">
						                    </div>
					                      </div>
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Local pernoite</label>
						                      <input type="text" class="form-control" placeholder="Selecione a opção">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >CEP Pernoite</label>
						                      <input type="text" class="form-control" placeholder="Digite o CEP Pernoite">
						                    </div>
					                      </div>
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Mora em...</label>
						                      <input type="text" class="form-control" placeholder="Selecione a opção">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >CEP frequência (ex. Trabalho, Escola)</label>
						                      <input type="text" class="form-control" placeholder="Digite o CEP mais Frequente">
						                    </div>
					                      </div>
					                    </div>
					                   
				                    </div>
				                    <!-- /.box-body -->
				                    <div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div>  
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                    <div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Complemento</h4>			
				                    <ul class="box-controls pull-right">
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <h4 class="box-title text-info"><i class="ti-info-alt mr-15"></i> Informações para Analise 2</h4>
					                    <hr class="my-15">
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Possui seguro</label>
						                      <input type="text" class="form-control" placeholder="Selecione SIM ou NÂO">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Data Fim da Vigência</label>
						                      <input type="text" class="form-control" placeholder="Digite a Data Fim Vigência">
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Seguradora</label>
						                      <input type="text" class="form-control" placeholder="Selecione a Seguradora">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Qual Bonus</label>
						                      <input type="text" class="form-control" placeholder="Selecione a opção de Bonus">
						                    </div>
					                      </div>

					                    </div>
										<div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Foi utilizado</label>
						                      <input type="text" class="form-control" placeholder="Selecione SIM ou NÃO">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Renovação</label>
						                      <input type="text" class="form-control" placeholder="Selecione SIM ou NÂO">
						                    </div>
					                      </div>

					                    </div>
										<div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Apolice</label>
						                      <input type="text" class="form-control" placeholder="Digite a Apólice">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Pessoa de 17 a 25 anos dirige?</label>
						                      <input type="text" class="form-control" placeholder="Selecione SIM ou NÂO">
						                    </div>
					                      </div>

					                    </div>
					                </div>
				                    <!-- /.box-body -->
				                    <div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div> 
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div>	
                            
                            </div>
                            <%--</section>--%>
						</div>
					</div>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
		
      </div>
      <!-- /.row -->
      <!-- END tabs -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 
    <!-- /.content -->
  <%--</div>--%>
  <!-- /.content-wrapper -->
</asp:Content>
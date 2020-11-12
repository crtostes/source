<%@ Page Title="" Language="C#" MasterPageFile="~/main/pages/Principal.Master" AutoEventWireup="true" CodeBehind="MeuIndicado.aspx.cs" Inherits="actoseg.main.pages.MeuIndicado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <script>
      function formatarCPFCNPJ(campoTexto) {
          if (campoTexto.value.length <= 11) {
              campoTexto.value = mascaraCpf(campoTexto.value);
          } else {
              campoTexto.value = mascaraCnpj(campoTexto.value);
          }
          return campoTexto;
      }
      function retirarFormatacao(campoTexto) {
          campoTexto.value = campoTexto.value.replace(/(\.|\/|\-)/g, "");
      }
      function mascaraCpf(valor) {
          return valor.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/g, "\$1.\$2.\$3\-\$4");
      }
      function mascaraCnpj(valor) {
          return valor.replace(/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/g, "\$1.\$2.\$3\/\$4\-\$5");
      }
        function validaTelefone($phone)
        {
            //^(\(11\) [9][0-9]{4}-[0-9]{4})|(\(1[2-9]\) [5-9][0-9]{3}-[0-9]{4})|(\([2-9][1-9]\) [5-9][0-9]{3}-[0-9]{4})$

            //turn preg_match('/^(?:(?:\+|00)?(55)\s?)?(?:\(?([1-9][0-9])\)?\s?)?(?:((?:9\d|[2-9])\d{3})\-?(\d{4}))$/', $phone);

            //$phone = '(11)99999-9999';
            var isValid = /^(?:(?:\+|00)?(55)\s?)?(?:\(?([1-9][0-9])\)?\s?)?(?:((?:9\d|[2-9])\d{3})\-?(\d{4}))$/.test($phone)

            return isValid;
        }

        function phoneValidate($phone) {
            $regex = '/^(?:(?:\+|00)?(55)\s?)?(?:\(?([1-9][0-9])\)?\s?)?(?:((?:9\d|[2-9])\d{3})\-?(\d{4}))$/';
            alert("teste1" + $phone);
            if (preg_match($regex, $phone) == false) {
                alert("teste1" + "false");
                // O número não foi validado.
                return false;
            } else {
                alert("teste1" + "true");
                // Telefone válido.
                return true;
            }
        }
        function valida_email2() {
            var filter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
            if (!filter.test(document.getElementById("email").value)) {
                alert('Por favor, digite o email corretamente');
                document.getElementById("email").focus();
                return false
            }
        }

        /*função valida email*/
        function valida_email1() {
            var x = document.forms["myForm"]["email"].value;
            var atpos = x.indexOf("@");
            var dotpos = x.lastIndexOf(".");
            if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
                alert("Não é um endereço de e-mail válido");
                return false;
            }
            return true;
        }
        function ValidaData(data) {
            reg = /[^\d\/\.]/gi;                  // Mascara = dd/mm/aaaa | dd.mm.aaaa
            var valida = data.replace(reg, '');    // aplica mascara e valida só numeros
            if (valida && valida.length == 10) {  // é válida, então ;)
                var ano = data.substr(6),
                    mes = data.substr(3, 2),
                    dia = data.substr(0, 2),
                    M30 = ['04', '06', '09', '11'],
                    v_mes = /(0[1-9])|(1[0-2])/.test(mes),
                    v_ano = /(19[1-9]\d)|(20\d\d)|2100/.test(ano),
                    rexpr = new RegExp(mes),
                    fev29 = ano % 4 ? 28 : 29;

                if (v_mes && v_ano) {
                    if (mes == '02') return (dia >= 1 && dia <= fev29);
                    else if (rexpr.test(M30)) return /((0[1-9])|([1-2]\d)|30)/.test(dia);
                    else return /((0[1-9])|([1-2]\d)|3[0-1])/.test(dia);
                }
            }
            return false                           // se inválida :(
        }
        function validarCPF(cpf) {
            cpf = cpf.replace(/[^\d]+/g, '');
            if (cpf == '') return false;
            // Elimina CPFs invalidos conhecidos	
            if (cpf.length != 11 ||
                cpf == "00000000000" ||
                cpf == "11111111111" ||
                cpf == "22222222222" ||
                cpf == "33333333333" ||
                cpf == "44444444444" ||
                cpf == "55555555555" ||
                cpf == "66666666666" ||
                cpf == "77777777777" ||
                cpf == "88888888888" ||
                cpf == "99999999999")
                return false;
            // Valida 1o digito	
            add = 0;
            for (i = 0; i < 9; i++)
                add += parseInt(cpf.charAt(i)) * (10 - i);
            rev = 11 - (add % 11);
            if (rev == 10 || rev == 11)
                rev = 0;
            if (rev != parseInt(cpf.charAt(9)))
                return false;
            // Valida 2o digito	
            add = 0;
            for (i = 0; i < 10; i++)
                add += parseInt(cpf.charAt(i)) * (11 - i);
            rev = 11 - (add % 11);
            if (rev == 10 || rev == 11)
                rev = 0;
            if (rev != parseInt(cpf.charAt(10)))
                return false;
            return true;
        }
        function Voltar() {
            window.location.href = "Default.aspx";
        }
      function AtualizarIndicado() {

            if ($("#ContentPlaceHolder1_txtIdCliente").val() == "") {
                alert("Favor, incluir ou localizar o Indicado para poder atualizar os dados.");
                return false;
            }
            // Valida Data de Nascimento
            if (ValidaData($("#ContentPlaceHolder1_txtDataNascimento").val()) == false) {
                alert("Data de Nascimento Inválida.");
                return false;
            }

            // Valida Telefone
            if (validaTelefone($("#ContentPlaceHolder1_txtTelefoneCelular").val()) == false) {
                alert("Telefone Celular Inválido!");
                return false;
            }

            //if (validaTelefone($("#ContentPlaceHolder1_txtTelefoneCelul0ar2").val()) == false) {
            //    alert("Telefone Fixo Inválido!");
            //    return false;
           // }

            // Validação dos Campos
            var Genero = "";
            if (document.getElementById("ContentPlaceHolder1_rdoGeneroM").checked) {
                Genero = $("#ContentPlaceHolder1_rdoGeneroM").val();
            }
            if (document.getElementById("ContentPlaceHolder1_rdoGeneroF").checked) {
                Genero = $("#ContentPlaceHolder1_rdoGeneroF").val();
            }
            if (Genero == "") {
                alert("Escolha um Genêro.");
                return false;
            }

            //Verifica Numero RG
            if ($("#ContentPlaceHolder1_txtNumeroRG").val() == "") {
                alert("Informe o número do RG.");
                return false;
            }

            //Verifica Local Emissor RG
            if ($("#ContentPlaceHolder1_txtEmissao").val() == "") {
                alert("Informe a descrição do Emissor do RG.");
                return false;
            }

           

            // Valida Data de Emissão do RG
            if (ValidaData($("#ContentPlaceHolder1_txtDataExpedicao").val()) == false) {
                alert("Data da Expedição do R.G. Inválida.");
                return false;
            }

            // Validar Estado Civil
            if ($.trim($('#ContentPlaceHolder1_cboEstadoCivil').val()) == '')
            {
                alert('Informe o Estado Civil!');
                return false;
            }                

            // Validação dos Campos
            var Empresa = "";

           // alert(Genero);
            $.ajax({
                type: "POST",
                url: "MeuIndicado.aspx/wmAtualizarIndicado",
                data: "{pid_cliente: '" + $("#ContentPlaceHolder1_txtIdCliente").val() +
                    "', pds_nome: '" + $("#ContentPlaceHolder1_txtNome").val() +
                    "', pdt_nascimento: '" + $("#ContentPlaceHolder1_txtDataNascimento").val() + 
                    "', pds_rg: '" + $("#ContentPlaceHolder1_txtNumeroRG").val() +
                    "', pds_emissao: '" + $("#ContentPlaceHolder1_txtEmissao").val() +
                    "', pdt_emissao_rg: '" + $("#ContentPlaceHolder1_txtDataExpedicao").val() + 
                    "', pds_telefone_celular: '" + $("#ContentPlaceHolder1_txtTelefoneCelular").val() +
                    "', pds_telefone_comercial: '" + $("#ContentPlaceHolder1_txtTelefoneCelular2").val() +
                    "', pid_estado_civil: '" + $("#ContentPlaceHolder1_cboEstadoCivil").val() +
                    "', pid_genero: '" + Genero +
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
          //alert("chama2");
          if (data.d == "OK") {
              alert("Usuário atualizado com sucesso!");
          }
          else {
              alert("Indicado não foi atualizado, houve um problema sistêmico.");
          }
      }
      function TesteFechaModal() {
         
          
          return false;
      }
      function isNumeric(n) {
          return !isNaN(parseFloat(n)) && isFinite(n);
      }
      function IncluirIndicado() {
          $.ajax({
              type: "POST",
              url: "MeuIndicado.aspx/wmIncluirIndicado",
              data: "{nome: '" + $("#ContentPlaceHolder1_txtNomeNovo").val() + "', cpf: '" + $("#ContentPlaceHolder1_txtCpfNovo").val() + "',  email: '" + $("#ContentPlaceHolder1_txtEmailNovo").val() + "', confirmar_email: '" + $("#ContentPlaceHolder1_txtEmailConfirmeNovo").val() + "'}",
              contentType: "application/json; charset=utf-8",
              dataType: "json",
              success: OnSuccessIncluir,
              error: function (request, status, error) {
                    alert(request.responseText);
              }
          });

          return false;
      }
      function OnSuccessIncluir(data, status) {
          if (isNumeric(data.d) && data.d !="0") {
              $('#ContentPlaceHolder1_txtIdCliente').val(data.d);
              alert("Indicado incluído com sucesso!");

              $('#modal-incluir-indicado').modal('hide');
          }
          else {
              alert(data.d);
              return false;
          }
          CarregarIndicado();
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
          $("#ContentPlaceHolder1_txtDataNascimento").val(data.d.dt_nascimento);

          $("#ContentPlaceHolder1_rdoTipoPessoa1").attr('checked', true);

          $("#ContentPlaceHolder1_txtTelefoneCelular").val(data.d.ds_telefone_celular);
          $("#ContentPlaceHolder1_txtTelefoneCelular2").val(data.d.ds_telefone_comercial);

          $("#ContentPlaceHolder1_rdoGeneroM").attr('checked', false);
          $("#ContentPlaceHolder1_rdoGeneroF").attr('checked', false);
          if (data.d.id_genero == '1') {
              
              $("#ContentPlaceHolder1_rdoGeneroM").attr('checked', true);
              
          }
          if (data.d.id_genero == '2') {
              $("#ContentPlaceHolder1_rdoGeneroF").attr('checked', true);
          }   
          
          $("#ContentPlaceHolder1_txtNumeroRG").val(data.d.ds_rg);
          $("#ContentPlaceHolder1_txtEmissao").val(data.d.ds_emissao);
          $("#ContentPlaceHolder1_txtDataExpedicao").val(data.d.dt_emissao_rg);
          $("#ContentPlaceHolder1_cboEstadoCivil").val(data.d.id_estado_civil);
          $("#ContentPlaceHolder1_txtDataInclusao").val(data.d.dt_inclusao);

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


          //$.each(data.d, function (index, value) {

           //   alert(index + ": " + value);
             // $('#ContentPlaceHolder1_ddlIndicados').append(ds_nome);

          //});

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
        <li class="breadcrumb-item active">Meu Indicado</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Modal -->
				<div class="modal center-modal fade" id="modal-incluir-indicado" tabindex="-1">
				  <div class="modal-dialog">
					<div class="modal-content">
					  <div class="modal-header">
						<h5 class="modal-title">Digite as principais informações do Indicado, em seguida continue o cadastro.</h5>
						<button type="button" class="close" data-dismiss="modal">
						  <span aria-hidden="true">&times;</span>
						</button>
					  </div>
					  <div class="modal-body">
						<p>Your content comes here</p>
                           <div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-user"></i></span>
								</div>
								<%--<input type="text" class="form-control" placeholder="Nome">--%>
								<asp:TextBox ID="txtCpfNovo" runat="server" class="form-control" placeholder="CPF"></asp:TextBox>
							</div>
						</div>
                          <div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-user"></i></span>
								</div>
								<%--<input type="text" class="form-control" placeholder="Nome">--%>
								<asp:TextBox ID="txtNomeNovo" runat="server" class="form-control" placeholder="Nome"></asp:TextBox>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-email"></i></span>
								</div>
								<%--<input type="email" class="form-control" placeholder="Email">--%>
								<asp:TextBox ID="txtEmailNovo" type="email" runat="server" class="form-control" placeholder="E-mail"></asp:TextBox>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-email"></i></span>
								</div>
								<%--<input type="email" class="form-control" placeholder="Email">--%>
								<asp:TextBox ID="txtEmailConfirmeNovo" type="email" runat="server" class="form-control" placeholder="Confirme o E-mail"></asp:TextBox>
							</div>
						</div>
					  </div>
					  <div class="modal-footer modal-footer-uniform">
						<button type="button" class="btn btn-bold btn-secondary" data-dismiss="modal">Fechar</button>
						<button type="button" class="btn btn-bold btn-primary float-right" onclick="IncluirIndicado()" >Gravar Indicado</button>
					  </div>
					</div>
				  </div>
				</div>
       <!-- /.modal -->
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
			  <h4 class="box-title">Meu Indicado</h4>							
			</div>
			<!-- /.box-header -->
			<%--<form id="teste">--%>
                 <div class="col-12 col-lg-3">			
		 
        </div>
              <div class="box-body">
					<h4 class="mt-0 mb-20">1.O que deseja para o Indicado:</h4>
                   <button type="button" class="btn btn-primary mb-5" data-toggle="modal" data-target="#modal-incluir-indicado">Incluir</button>
                   <button type="button" class="btn btn-primary mb-5" data-toggle="modal" data-target="#modal-localizar-indicado" onclick="CarregarListaIndicados()">Localizar</button>
                  </div>
                <div class="box-body">
					<h4 class="mt-0 mb-20">2.Informações do Indicado:</h4>
                
                <div class="form-group">
						<label>Nome:</label>
						<%--<input id="txtNome" type="text" class="form-control" placeholder="Nome Completo" disabled="disabled">--%>
                        <asp:TextBox name="txtIdCliente" id="txtIdCliente" type="hidden" runat="server"></asp:TextBox>
                        <asp:TextBox name="txtIdClienteIndicador" id="txtIdClienteIndicador" type="hidden" runat="server"></asp:TextBox>
						<asp:TextBox name="txtNome" id="txtNome" type="text" class="form-control" CssClass="form-control" runat="server"></asp:TextBox>
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

					<div class="form-group">
					  <label>Data de Nascimento:</label>
					  <%--<input id="txtDataNascimento" class="form-control" type="text" required>--%>
                      <asp:TextBox id="txtDataNascimento" type="text" class="form-control" CssClass="form-control" runat="server" ></asp:TextBox>
					</div>
                    <div class="form-group">
						<label>Tipo Pessoa  :</label>
						<div class="c-inputs-stacked">
							<asp:RadioButton id="rdoTipoPessoa1" runat="server" GroupName="RadioGroupTipoPessoa" Text="Fisica" value="F"></asp:RadioButton>
                            <%--<asp:RadioButton id="rdoTipoPessoa2" runat="server" GroupName="RadioGroupTipoPessoa" Text="Juridica" value="J"></asp:RadioButton>						--%>
                    	</div>
					</div>
					<h4 class="mt-0 mb-20">3. Complemento:</h4>
					<div class="form-group">
						<label>Telefone Celular:</label>	
						<%--<input type="text" class="form-control" id="txtTelefoneCelular">--%>
                        <asp:TextBox id="txtTelefoneCelular" type="text" class="form-control" CssClass="form-control" runat="server" ></asp:TextBox>
					</div>

					<div class="form-group">
						<label>Telefone Celular 2:</label>							
						<%--<input type="text" class="form-control" id="txtTelefoneFixo">--%>
                        <asp:TextBox id="txtTelefoneCelular2" type="text" class="form-control" CssClass="form-control" runat="server" ></asp:TextBox>
					</div>

					<div class="form-group">
						<label>Genêro :</label>
						<div class="c-inputs-stacked">
							<asp:RadioButton  id="rdoGeneroM" runat="server" GroupName="RadioGroupGenero" Text="Masculino" value="1"></asp:RadioButton>
                            <asp:RadioButton id="rdoGeneroF" runat="server" GroupName="RadioGroupGenero" Text="Feminino" value="2"></asp:RadioButton>						
                    	</div>
					</div>

					<div class="form-group">
						<label>Número do R.G.:</label>							
						<%--<input type="text" id="txtNumeroRG" class="form-control" placeholder="Número do R.G." required>--%>
                        <asp:TextBox id="txtNumeroRG" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Número do R.G."></asp:TextBox>
					</div>
					<div class="form-group">
						<label>Emissão:</label>							
						<%--<input type="text" id="txtEmissao" class="form-control" placeholder="Ex.: SSS/SP" required>--%>
                        <asp:TextBox id="txtEmissao" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Ex.: SSS/SP"></asp:TextBox>
					</div>
					<div class="form-group">
					  <label>Data de Expedição:</label>		
					  <%--<input class="form-control" id="txtDataExpedicao" type="text" value="">					  --%>
                      <asp:TextBox id="txtDataExpedicao" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Ex.: SSS/SP"></asp:TextBox>
					</div>
					<div class="form-group">
					  <label>Estado Civil:</label>		
					  <%--<select  name="cboEstadoCivil" id="cboEstadoCivil" class="form-control" required>
							<option value="">Selecione</option>
							<option value="1">Solteiro(a)</option>
							<option value="2">Casado(a)</option>
							<option value="3">Divorciado(a)</option>
							<option value="4">Viúvo(a)</option>
						    <option value="5">Outros</option>
						  </select>	--%>
                        
                       <asp:DropDownList id="cboEstadoCivil" AutoPostBack="False" runat="server" CssClass="form-control">
                          <asp:ListItem Selected="True" Value="">Selecione</asp:ListItem>
                          <asp:ListItem Value="1">Solteiro(a)</asp:ListItem>
                          <asp:ListItem Value="2">Casado(a)</asp:ListItem>
                          <asp:ListItem Value="3">Divorciado(a)</asp:ListItem>
                          <asp:ListItem Value="4">Viúvo(a)</asp:ListItem>
                          <asp:ListItem Value="5">União Estavél</asp:ListItem>
                          <asp:ListItem Value="6">Outros</asp:ListItem>
                        </asp:DropDownList>
					</div>
					
					<div class="form-group">
					  <label>Data da Inclusão:</label>		
					  <%--<input class="form-control" type="text" value="" id="txtDataInclusao" disabled="disabled" >			--%>
                      <asp:TextBox id="txtDataInclusao" type="text" class="form-control" CssClass="form-control" runat="server" Enabled ="false"></asp:TextBox>
					</div>
         
				<div class="box-footer">
					<button type="button" class="btn btn-danger" onclick="Voltar()">Voltar</button>
					<button type="button" class="btn btn-success pull-right" onclick="AtualizarIndicado()">Gravar</button>					

				</div>
                    </div>
			<%--</form>--%>
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
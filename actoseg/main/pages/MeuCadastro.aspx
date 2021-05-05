<%@ Page Language="C#"  MasterPageFile="~/main/pages/Principal.Master" AutoEventWireup="true" CodeBehind="MeuCadastro.aspx.cs" Inherits="actoseg.main.pages.MeuCadastro" %>
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
        function validarCNPJ(cnpj) {

            cnpj = cnpj.replace(/[^\d]+/g, '');

            if (cnpj == '') return false;

            if (cnpj.length != 14)
                return false;

            // Elimina CNPJs invalidos conhecidos
            if (cnpj == "00000000000000" ||
                cnpj == "11111111111111" ||
                cnpj == "22222222222222" ||
                cnpj == "33333333333333" ||
                cnpj == "44444444444444" ||
                cnpj == "55555555555555" ||
                cnpj == "66666666666666" ||
                cnpj == "77777777777777" ||
                cnpj == "88888888888888" ||
                cnpj == "99999999999999")
                return false;

            // Valida DVs
            tamanho = cnpj.length - 2
            numeros = cnpj.substring(0, tamanho);
            digitos = cnpj.substring(tamanho);
            soma = 0;
            pos = tamanho - 7;
            for (i = tamanho; i >= 1; i--) {
                soma += numeros.charAt(tamanho - i) * pos--;
                if (pos < 2)
                    pos = 9;
            }
            resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
            if (resultado != digitos.charAt(0))
                return false;

            tamanho = tamanho + 1;
            numeros = cnpj.substring(0, tamanho);
            soma = 0;
            pos = tamanho - 7;
            for (i = tamanho; i >= 1; i--) {
                soma += numeros.charAt(tamanho - i) * pos--;
                if (pos < 2)
                    pos = 9;
            }
            resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
            if (resultado != digitos.charAt(1))
                return false;

            return true;

        }
        function mascaraCnpj(valor) {
            return valor.replace(/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/g, "\$1.\$2.\$3\/\$4\-\$5");
        }
        function Voltar() {
            window.location.href = "Default.aspx";
        }
        function IncluirUsuario() {
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

            //if (validaTelefone($("#ContentPlaceHolder1_txtTelefoneFixo").val()) == false) {
            //    alert("Telefone Fixo Inválido!");
            //    return false;
            //}

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
            if (document.getElementById("ContentPlaceHolder1_rdoEmpresaSim").checked) {
                Empresa = "S";
            }
            if (document.getElementById("ContentPlaceHolder1_rdoEmpresaNao").checked) {
                Empresa = "N";
            }
            if (Empresa == "") {
                alert("Informe se você tem uma Empresa, se sim você poderá emitir nota fiscal para recebimento de Bônus nas indicações.");
                return false;
            }

            //Verificar Cadastro da Empresa
            if (Empresa == "S") {
                if (validarCNPJ($("#ContentPlaceHolder1_txtCNPJ").val()) == false) {
                    $('#modal-empresa').modal('show');
                    alert("CNPJ da empresa inválido.");
                    
                    return false;           
                }
                if ($("#ContentPlaceHolder1_txtNomeEmpresa").val() == "") {
                    $('#modal-empresa').modal('show');
                    alert("Informe o nome da Empresa");
                    return false;
                }

                if ($("#ContentPlaceHolder1_txtEnderecoEmpresa").val() == "") {
                    $('#modal-empresa').modal('show');
                    alert("Informe o endereço completo da Empresa.");
                    return false;
                }

                // Verifica Cidade
                if ($("#ContentPlaceHolder1_txtCidade").val() == '') {
                    $('#modal-empresa').modal('show');
                    alert("Informe a Cidade da Empresa.");
                    return false;
                }
                // Verifica Estado
                if ($("#ContentPlaceHolder1_cboEstado").val() == '') {
                    $('#modal-empresa').modal('show');
                    alert("Informe o Estado da Empresa.");
                    return false;
                }
            }

            //Verifica Tipo Endereço
            if ($("#ContentPlaceHolder1_cboTipoEndereco").val() == '') {
                alert("Informe o Tipo de Endereço.");
                return false;
            }

            //Verifica CEP
            if ($("#ContentPlaceHolder1_txtCep").val() == '') {
                alert("Informe o CEP.");
                return false;
            }
            if (IsCEP($("#ContentPlaceHolder1_txtCep").val()) == false) {
                alert("Informe o CEP corretamente.");
                return false;
            }
            // Verifica Endereço
            if ($("#ContentPlaceHolder1_txtNumeroEndereco").val() == '') {
                alert("Informe o número do endereço.");
                return false;
            }
            if (checkNumber($("#ContentPlaceHolder1_txtNumeroEndereco").val()) == false) {
                alert("Informe o número do endereço corretamente.");
                return false;
            }


            // Verifica Endereço
            if ($("#ContentPlaceHolder1_txtEndereco").val() == '') {
                alert("Informe o Endereço.");
                return false;
            }

            // Verifica Complemento
            if ($("#ContentPlaceHolder1_txtComplemento").val() == '') {
                alert("Informe o Complemento.");
                return false;
            }
            // Verifica Bairro
            if ($("#ContentPlaceHolder1_txtBairro").val() == '') {
                alert("Informe o Bairro.");
                return false;
            }
            // Verifica Cidade
            if ($("#ContentPlaceHolder1_txtCidade").val() == '') {
                alert("Informe a Cidade.");
                return false;
            }
            // Verifica Estado
            if ($("#ContentPlaceHolder1_cboEstado").val() == '') {
                alert("Informe o Estado.");
                return false;
            }



            $.ajax({
                type: "POST",
                url: "MeuCadastro.aspx/wmAtualizarCliente",
                data: "{pds_nome: '" + $("#ContentPlaceHolder1_txtNome").val() +
                    "', pdt_nascimento: '" + $("#ContentPlaceHolder1_txtDataNascimento").val() + 
                    "', pds_rg: '" + $("#ContentPlaceHolder1_txtNumeroRG").val() +
                    "', pds_emissao: '" + $("#ContentPlaceHolder1_txtEmissao").val() +
                    "', pdt_emissao_rg: '" + $("#ContentPlaceHolder1_txtDataExpedicao").val() + 
                    "', pds_telefone_celular: '" + $("#ContentPlaceHolder1_txtTelefoneCelular").val() +
                    "', pds_telefone_comercial: '" + $("#ContentPlaceHolder1_txtTelefoneFixo").val() +
                    "', pid_estado_civil: '" + $("#ContentPlaceHolder1_cboEstadoCivil").val() +
                    "', pid_genero: '" + Genero +
                    "', pEmpresaSimNao: '" + Empresa +
                    "', pCNPJ: '" + $("#ContentPlaceHolder1_txtCNPJ").val() + 
                    "', pNomeEmpresa: '" + $("#ContentPlaceHolder1_txtNomeEmpresa").val() + 
                    "', pEnderecoEmpresa: '" + $("#ContentPlaceHolder1_txtEnderecoEmpresa").val() +
                    "', pCidadeEmpresa: '" + $("#ContentPlaceHolder1_txtCidade").val() +
                    "', pEstadoEmpresa: '" + $("#ContentPlaceHolder1_cboEstado").val() +
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

        function VerificaEmpresaPopup() {

            
            if (validarCNPJ($("#ContentPlaceHolder1_txtCNPJ").val()) == false) {
                alert("CNPJ da empresa inválido.");
                return false;
            }
            if ($("#ContentPlaceHolder1_txtNomeEmpresa").val() == "") {
                alert("Informe o nome da Empresa");
                return false;
            }

            if ($("#ContentPlaceHolder1_txtEnderecoEmpresa").val() == "") {
                alert("Informe o endereço completo da Empresa.");
                return false;
            }

            // Verifica Cidade
            if ($("#ContentPlaceHolder1_txtCidade").val() == '') {
                alert("Informe a Cidade da Empresa.");
                return false;
            }
            // Verifica Estado
            if ($("#ContentPlaceHolder1_cboEstado").val() == '') {
                alert("Informe o Estado da Empresa.");
                return false;
            }

            $('#modal-empresa').modal('hide');

            }
            
        
        function OnSuccess(data, status) {

            if (data.d == "OK") {
					$.ajax({
                type: "POST",
                url: "MeuCadastro.aspx/wmAtualizarEndereco",
                data: "{pid_tipo_endereco: '" + $("#ContentPlaceHolder1_cboTipoEndereco").val() +
                    "', pds_cep: '" + $("#ContentPlaceHolder1_txtCep").val() +
                    "', pds_endereco: '" + $("#ContentPlaceHolder1_txtEndereco").val() +
                    "', pds_numero: '" + $("#ContentPlaceHolder1_txtNumeroEndereco").val() +
                    "', pds_complemento: '" + $("#ContentPlaceHolder1_txtComplemento").val() +
                    "', pds_bairro: '" + $("#ContentPlaceHolder1_txtBairro").val() +
                    "', pds_cidade: '" + $("#ContentPlaceHolder1_txtCidade").val() +
                    "', pds_estado: '" + $("#ContentPlaceHolder1_cboEstado").val() +
                    "', pid_cliente: '" +
                    "'}",
                contentType: "application/json; charset=utfen-8",
                dataType: "json",
                success: OnSuccessEndereco,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
                    });			
			}
			else
			{
				alert("Usuário não foi atualizado, houve um problema sistêmico.");
            }


            

            return false;
        }

			//if (data.d == "OK") {
			//	alert("Usuário atualizado com sucesso!");				
			//}
			//else
			//{
			//	alert("Usuário não foi atualizado, houve um problema sistêmico.");
   //         }
   //     }
        $(document).ready(function () {
            jQuery.support.cors = true;
        });

          
    </script>
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
       //function AtualizarEndereco() {

        
           

       function OnSuccessEndereco(data, status) {

           if (data.d == "OK") {
               alert("Meus dados atualizado com sucesso!");
           }
           else {
               alert("Meus dados não foi atualizado, houve um problema sistêmico.");
           }
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
        <li class="breadcrumb-item active">Meu Cadastro</li>
      </ol>
    </section>

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
					<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#cliente" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">DADOS PRINCIPAIS</span> </a></li>					
                    <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#endereco" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">ENDEREÇO e COMPLEMENTO</span> </a></li>					
                    <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#listaclientes" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">CLIENTES CADASTRADOS</span> </a></li>					
				</ul>

				<!-- Tab panes -->
				<div class="tab-content tabcontent-border">
				<div class="box-body box-outline-gray">
					
					<div class="row">
					
						<div class="col-md-6">
                            <button type="button" class="btn btn-success" onclick="IncluirUsuario()">Gravar</button>		
                            <button type="button" class="btn btn-danger" onclick="Voltar()">Voltar</button>
                                    
							<%--<button type="button" name="btnGravar" id="btnGravar" class="btn btn-cyan mb-5" onclick="ValidarStatusEmCotacao()" disabled>Gravar</button>
							<button type="button" name="btnEnviar" id="btnEnviar" class="btn btn-yellow mb-5" onclick="EnviarCotacao()"  disabled>Enviar</button>
							<button type="button" name="btnPDF" id="btnPDF" class="btn btn-warning mb-5" onclick="BaixarPDF()" disabled>PDF</button>
							<button type="button" name="btnClonar" id="btnClonar" class="btn btn-brown mb-5" onclick="ClonarCotacao()" disabled>Clonar</button>
							<button type="button" class="btn btn-danger mb-5" onclick="Voltar()">Voltar</button>--%>
						</div>
						<div class="col-md-6">
							<%--<input name="txtMensagemCotacao" id="txtMensagemCotacao"  type="text" class="form-control" value="Cotação não gravada" disabled>--%>
						</div>
					</div>
					
						
				</div>
					<%--Dados cliente--%>
					<div class="tab-pane active" id="cliente" role="tabpanel">
						<div class="pad">
                            <%--<section class="content">--%>
                            <div class="row">		
							<div class="col-lg-6 col-12">
                           
		                      <div class="box">
			                    
			                    <!-- /.box-header -->
			                    <form class="form">
                                    
                            
				                    <div class="box-body">
                                         <h4 class="page-header">Dados Cliente</h4>
					                    <div class="row">
					                      <div class="col-md-12">
						                    <div class="form-group">

						                      <label>Nome</label>
						                        <%--<input id="txtNome" type="text" class="form-control" placeholder="Nome Completo" disabled="disabled">--%>
						                        <asp:TextBox name="txtNome" id="txtNome" type="text" class="form-control" CssClass="form-control" runat="server"></asp:TextBox>
						                    </div>
					                      </div>
					                      
					                    </div>
                                        <div class="row">
					                      <div class="col-md-12">
						                    <div class="form-group">
						                      <label>E-mail</label>
						                        <%--<input id="txtEmail" type="email" class="form-control" placeholder="E-mail" disabled ="disabled" >--%>
						                        <asp:TextBox id="txtEmail" type="text" class="form-control" CssClass="form-control" runat="server" disabled="disabled"></asp:TextBox>
						                    </div>
					                      </div>
					                      
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Telefone Celular</label>	
						                        <%--<input type="text" class="form-control" id="txtTelefoneCelular">--%>
                                                <asp:TextBox id="txtTelefoneCelular" type="text" class="form-control" CssClass="form-control" runat="server" ></asp:TextBox>

						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Telefone Celular 2</label>							
						                        <%--<input type="text" class="form-control" id="txtTelefoneFixo">--%>
                                                <asp:TextBox id="txtTelefoneFixo" type="text" class="form-control" CssClass="form-control" runat="server" ></asp:TextBox>


						                    </div>
					                      </div>
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                     <label>Data de Nascimento</label>
					                          <%--<input id="txtDataNascimento" class="form-control" type="text" required>--%>
                                              <asp:TextBox id="txtDataNascimento" type="text" class="form-control" CssClass="form-control" runat="server" ></asp:TextBox>

						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Genêro</label>
						                    <div class="c-inputs-stacked">
							                    <%--<input name="rdoGenero" type="radio" id="rdoGeneroM" value="1" class="flat-red" required>--%>
                                                <%--<asp:RadioButton id="rdoGeneroM" GroupName="RadioGroupGenero" runat="server"/>--%>
							                    <%--<label for="rdoGeneroM" class="mr-30">Masculino</label>--%>
							                    <%--<input name="rdoGenero" type="radio" id="rdoGeneroF" value="2" class="flat-red" >--%>
                                                <%--<asp:RadioButton id="rdoGeneroF" GroupName="RadioGroupGenero" runat="server"/>--%>
							                    <%--<label for="rdoGeneroF" class="mr-30">Feminino</label>	--%>
                                                <asp:RadioButton id="rdoGeneroM" runat="server" GroupName="RadioGroupGenero" Text="Masculino" value="1"></asp:RadioButton>
                                                <asp:RadioButton id="rdoGeneroF" runat="server" GroupName="RadioGroupGenero" Text="Feminino" value="2"></asp:RadioButton>						
                            


						                    </div>
					                      </div>
					                    </div>
                                        </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Estado Civil</label>		
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
					                      </div>
					                      <div class="col-md-3">
						                    <div class="form-group">
						                      <label>Empresa aberta</label>
						                        <div class="c-inputs-stacked">
                                                   <%--<button type="button" class="btn btn-primary mb-5" data-toggle="modal" data-target="#modal-incluir-indicado">Incluir</button>--%>
							                        <asp:RadioButton id="rdoEmpresaSim" runat="server" GroupName="RadioGroupEmpresa" Text="Sim" data-toggle="modal" data-target="#modal-empresa"></asp:RadioButton>
                                                    <asp:RadioButton id="rdoEmpresaNao" runat="server" GroupName="RadioGroupEmpresa" Text="Não"></asp:RadioButton>							
						                        </div>

					                      </div>
					                    </div>
                                            <div class="col-md-3">
						                    <div class="form-group">
						                      <label>Usuário</label>
						                        <div class="c-inputs-stacked">
                                                   <%--<button type="button" class="btn btn-primary mb-5" data-toggle="modal" data-target="#modal-incluir-indicado">Incluir</button>--%>
							                        <asp:RadioButton id="RadioUsuarioSim" runat="server" GroupName="RadioUsuario" Text="Sim" disabled="disabled"></asp:RadioButton>
                                                    <asp:RadioButton id="RadioUsuarioNao" runat="server" GroupName="RadioUsuario" Text="Não" disabled="disabled"></asp:RadioButton>							
						                        </div>

					                      </div>
					                    </div>
                                        </div>
				                    </div>
				                    <!-- /.box-body -->
				                    <%--<div class="box-footer">
					                    <input type="button" class="btn btn-success" onclick="InserirDadosCliente()">
					                      <i class="ti-save-alt"></i> Grave
					                    </input>
				                    </div>  --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                    <div class="col-lg-6 col-12">
                                
		                      <div class="box">
			                    
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
                                       <h4 class="page-header">Documentos</h4>      
						                <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>CPF</label>							
						                        <%--<input id="txtCPF" type="text" class="form-control" placeholder="000.000.000-00" disabled ="disabled">--%>
						                        <asp:TextBox id="txtCPF" type="text" class="form-control" CssClass="form-control" runat="server" disabled="disabled"></asp:TextBox>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Número do R.G.</label>							
						                        <%--<input type="text" id="txtNumeroRG" class="form-control" placeholder="Número do R.G." required>--%>
                                                <asp:TextBox id="txtNumeroRG" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Número do R.G."></asp:TextBox>
						                    </div>
					                      </div>
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Data de Expedição</label>		
					                          <%--<input class="form-control" id="txtDataExpedicao" type="text" value="">					  --%>
                                              <asp:TextBox id="txtDataExpedicao" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Ex.: SSS/SP"></asp:TextBox>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Emissão</label>							
						                        <%--<input type="text" id="txtEmissao" class="form-control" placeholder="Ex.: SSS/SP" required>--%>
                                                <asp:TextBox id="txtEmissao" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Ex.: SSS/SP"></asp:TextBox>
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>CNH</label>							
						                        <%--<input id="txtCPF" type="text" class="form-control" placeholder="000.000.000-00" disabled ="disabled">--%>
						                        <asp:TextBox id="txtCNH" type="text" class="form-control" CssClass="form-control" runat="server"></asp:TextBox>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Data 1ª Habilitação</label>							
						                        <%--<input type="text" id="txtNumeroRG" class="form-control" placeholder="Número do R.G." required>--%>
                                                <asp:TextBox id="txtDataPrimeiraHabilitacao" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="DD/MM/AAAA"></asp:TextBox>
						                    </div>
					                      </div>
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Data da Inclusão</label>		
					                          <%--<input class="form-control" type="text" value="" id="txtDataInclusao" disabled="disabled" >			--%>
                                              <asp:TextBox id="txtDataInclusao" type="text" class="form-control" CssClass="form-control" runat="server" Enabled ="false"></asp:TextBox>

						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                     <label>Atualização</label>		
					                          <%--<input class="form-control" type="text" value="" id="txtDataInclusao" disabled="disabled" >			--%>
                                              <asp:TextBox id="txtDataAtualizacao" type="text" class="form-control" CssClass="form-control" runat="server" Enabled ="false"></asp:TextBox>


						                    </div>
					                      </div>
					                    </div>
					                </div>
                                   
				                    <!-- /.box-body -->
				                    <%--<div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div> --%>
			                    </form>
                                   
					                      
					               
		                      </div>
		                      <!-- /.box -->			
		                    </div>	
                                    
                            </div>
                            
                            <%--</section>--%>
						</div>
					</div> 
                    <%--Dados ENDERECO--%>
					<div class="tab-pane" id="endereco" role="tabpanel">
						<div class="pad">
                            <%--<section class="content">--%>
                            <div class="row">		
							<div class="col-lg-6 col-12">
                           
		                      <div class="box">
			                    
			                    <!-- /.box-header -->
			                    <form class="form">
                                    
				                    <div class="box-body">
                                    <h4 class="page-header">Dados Endereço</h4>
					                <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Tipo Endereço</label>		
						                        <asp:DropDownList id="cboTipoEndereco" AutoPostBack="False" runat="server" CssClass="form-control">
							                        <asp:ListItem Selected="True" Value="">Selecione...</asp:ListItem>
							                        <asp:ListItem Value="1">Residencial</asp:ListItem>
							                        <asp:ListItem Value="2">Comercial</asp:ListItem>
						                        </asp:DropDownList>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>CEP</label>
						                        <%--<input id="txtCep" type="text" class="form-control" placeholder="Digite o Cep">--%>
						                        <asp:TextBox name="txtCep" id="txtCep" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite o Cep" MaxLength ="9"></asp:TextBox>
						                    </div>
					                      </div>
					                    </div>
					                <div class="row">
					                    <div class="col-md-9">
						                <div class="form-group">
						                    <label>Endereço</label>
						                    <%--<input id="txtEndereco" type="text" class="form-control" placeholder="Digite o Endereço">--%>
						                    <asp:TextBox name="txtEndereco" id="txtEndereco" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite o Endereço"></asp:TextBox>
						                </div>
					                    </div>
					                    <div class="col-md-3">
						                <div class="form-group">
						                    <label>Numero</label>
						                    <%--<input id="txtNumeroEndereco" type="text" class="form-control" placeholder="Digite o Número">--%>
						                    <asp:TextBox name="txtNumeroEndereco" id="txtNumeroEndereco" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite o Número"  MaxLength ="6"></asp:TextBox>
						                </div>
					                    </div>
					                </div>
									<div class="row">
					                    <div class="col-md-6">
						                <div class="form-group">
						                    <label>Complemento</label>							
						                    <%--<input id="txtComplemento" type="text" class="form-control" placeholder="Digite o complemento">--%>
						                    <asp:TextBox name="txtComplemento" id="txtComplemento" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite o complemento"></asp:TextBox>
						                </div>
					                    </div>
					                    <div class="col-md-6">
						                <div class="form-group">
						                    <label>Bairro</label>		
					                        <%--<input id="txtBairro" class="form-control" type="text"  placeholder="Digite o Bairro">					  --%>
						                    <asp:TextBox name="txtBairro" id="txtBairro" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite o Bairro"></asp:TextBox>
						                </div>
					                    </div>
					                </div>
                                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Cidade</label>		
					                          <%--<input id="txtCidade" class="form-control" type="text"  placeholder="Digite a Cidade">					  --%>
						                        <asp:TextBox name="txtCidade" id="txtCidade" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite a Cidade"></asp:TextBox>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                    <label>Estado</label>		
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
					                      </div>

                                             
					                    </div>
				                    </div>
                                    
				                    <!-- /.box-body -->
				                    <%--<div class="box-footer">
					                    <input type="button" class="btn btn-success" onclick="InserirDadosCliente()">
					                      <i class="ti-save-alt"></i> Grave
					                    </input>
				                    </div>  --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                    <div class="col-lg-6 col-12">
                                
		                      <div class="box">
			                    
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
                                        <h4 class="page-header">Complemento</h4>
                                        <div class="row">
					                      <div class="col-md-9">
						                    <div class="form-group">
						                      <label>Profissão</label>		
						                    <asp:DropDownList id="DropDownList1" AutoPostBack="False" runat="server" CssClass="form-control">
							                    <asp:ListItem Selected="True" Value="">Selecione...</asp:ListItem>
							                    <%--<asp:ListItem>RR</asp:ListItem>
							                    <asp:ListItem>SC</asp:ListItem>
							                    <asp:ListItem>SE</asp:ListItem>
							                    <asp:ListItem>TO</asp:ListItem>--%>
						                    </asp:DropDownList>

						                    </div>
                                              
					                      </div>
                                          <div class="col-md-3">
						                    <div class="form-group">
						                      
                                                <label>Complemento</label>		
					                          <%--<input id="txtCidade" class="form-control" type="text"  placeholder="Digite a Cidade">					  --%>
						                        <asp:TextBox name="txtComplementoProfissão" id="txtComplementoProfissão" type="text" class="form-control" CssClass="form-control" runat="server" placeholder=""></asp:TextBox>
						                    </div>

						                    </div>
					                      </div>
                                        
					                    <div class="row">
					                      <div class="col-md-12">
						                    <div class="form-group">
						                      <label>Nome do Pai</label>		
					                          <%--<input id="txtCidade" class="form-control" type="text"  placeholder="Digite a Cidade">					  --%>
						                        <asp:TextBox name="txtNomePai" id="txtNomePai" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite a Cidade"></asp:TextBox>
						                    </div>
						                    </div>
					                      </div>
                                        <div class="row">
					                      <div class="col-md-12">
						                    <div class="form-group">
						                      <label>Nome do Mãe</label>		
					                          <%--<input id="txtCidade" class="form-control" type="text"  placeholder="Digite a Cidade">					  --%>
						                        <asp:TextBox name="txtNomeMae" id="txtNomeMae" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite a Cidade"></asp:TextBox>
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-12">
						                    <div class="form-group">
						                      <label>Nome do Conjuge</label>		
					                          <%--<input id="txtCidade" class="form-control" type="text"  placeholder="Digite a Cidade">					  --%>
						                        <asp:TextBox name="txtNomeConjuge" id="txtNomeConjuge" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite a Cidade"></asp:TextBox>
						                    </div>
						                      
						                    </div>
					                      </div>
					                     
					                </div>
                                   
				                    <!-- /.box-body -->
				                    <%--<div class="box-footer">
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
                    <%--Dados LISTA DE CLIENTES--%>
					<div class="tab-pane" id="listaclientes" role="tabpanel">
						<div class="pad">
                            <%--<section class="content">--%>
                            <div class="row">		
							<div class="col-lg-12 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
									
			                      <h4 class="box-title">CLIENTES CADASTRADOS</h4>	
									<ul class="box-title">
										 
				                     <%-- <button type="button" name="btnInsereCotacao" id="btnInsereCotacao" class="btn btn-blue mb-5" onclick="CarregaTelaInsereCotacao()" hidden >Inserir</button>
										<button type="button" name="btnLimparItensCotacao" id="btnLimparItensCotacao" class="btn btn-blue mb-5" onclick="CarregaTelaLimparItensCotacao()" hidden >Excluir Todos</button>
										<button type="button" name="btnUploadPDF" id="btnUploadPDF" class="btn btn-blue mb-5" onclick="AbrePopupUploadPDF()" hidden>Sobe PDF</button>
										<button type="button" name="btnFinalizaCotacao" id="btnFinalizaCotacao" class="btn btn-blue mb-5" onclick="FinalizaCotacao()" hidden>Finalizar Cotação</button>
										--%> 
				                    </ul>
									<ul class="box-controls pull-right"></ul>
										
									

				                    <ul class="box-controls pull-right">
				                      <%--<li><a class="box-btn-close" href="#"></a></li>
				                      <li><a class="box-btn-slide" href="#"></a></li>	--%>
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                     <div class="box">
			 
										<div class="box-body">		
            								<div class="table-responsive">
											  <table id="grdCotacaoAutomovelItens" class="table table-bordered table-striped display nowrap margin-top-10" style="width:100%">
												<thead>
													<tr>
														<th></th>
														<th>CPF</th>
														<th>Nome</th>
														<th>E-MAIL</th>
														<th>Telefone</th>														
                                                        <th style="text-align: right;">Alterar</th>														
                                                        <th style="text-align: right;">Ativo (S/N)</th>														
													</tr>
												</thead>
											  </table>
            								</div>
										</div>
            <!-- /.box-body -->
								</div>
				                   <%-- <!-- /.box-body -->
				                    <div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div>  --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                
                            
                            </div>
                            <%--</section>--%>
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







    <!-- Main content Cadastro -->
    <%--<section class="content">--%>
             <!-- Modal -->
				<div class="modal center-modal fade" id="modal-empresa" tabindex="-1">
				  <div class="modal-dialog">
					<div class="modal-content">
					  <div class="modal-header">
						<h5 class="modal-title">Digite as principais informações da empresa, em seguida salve a informação.</h5>
						<button type="button" class="close" data-dismiss="modal">
						  <span aria-hidden="true">&times;</span>
						</button>
					  </div>
					  <div class="modal-body">
                        <div class="form-group">
                            <label>CNPJ:</label>
						        <%--<input id="txtNome" type="text" class="form-control" placeholder="Nome Completo" disabled="disabled">--%>
						    <asp:TextBox id="txtCNPJ" type="text" class="form-control" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                          <div class="form-group">
                            <label>Nome da Empresa:</label>
						        <%--<input id="txtNome" type="text" class="form-control" placeholder="Nome Completo" disabled="disabled">--%>
						    <asp:TextBox name="txtNomeEmpresa" id="txtNomeEmpresa" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite o nome da Empresa" MaxLength="150"></asp:TextBox>
                        </div>
                          <div class="form-group">
                            <label>Endereço:</label>
						        <%--<input id="txtNome" type="text" class="form-control" placeholder="Nome Completo" disabled="disabled">--%>
						    <asp:TextBox name="txtEnderecoEmpresa" id="txtEnderecoEmpresa" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite o Endereço da Empresa"></asp:TextBox>
                        </div>
                        
					<div class="form-group">
					  <label>Cidade:</label>		
					  <%--<input id="txtCidade" class="form-control" type="text"  placeholder="Digite a Cidade">					  --%>
						<asp:TextBox name="txtCidadeEmpresa" id="txtCidadeEmpresa" type="text" class="form-control" CssClass="form-control" runat="server" placeholder="Digite a Cidade da Empresa"></asp:TextBox>
					</div>

				<div class="form-group">
					  <label>Estado:</label>		
						<asp:DropDownList id="cboEstadoEmpresa" AutoPostBack="False" runat="server" CssClass="form-control">
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
						
					  </div>
					  <div class="modal-footer modal-footer-uniform">
                          <button type="button" class="btn btn-bold btn-secondary"  onclick="VerificaEmpresaPopup()" >Fechar</button>
						<%--<button type="button" class="btn btn-bold btn-secondary" data-dismiss="modal" onclick="VerificaEmpresaPopup()" >Fechar</button>
						<button type="button" class="btn btn-bold btn-primary float-right" onclick="VerificaEmpresaPopup()" >Gravar Empresa</button>--%>
					  </div>
					</div>
				  </div>
				</div>
       <!-- /.modal -->
      
      <!-- /.row -->
      
    <%--</section>--%>
    	
    <!-- /.content -->
  <%--</div>--%>
  <!-- /.content-wrapper -->
</asp:Content>


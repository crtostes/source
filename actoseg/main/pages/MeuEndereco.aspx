<%@ Page Language="C#"  MasterPageFile="~/main/pages/Principal.Master"  AutoEventWireup="true" CodeBehind="MeuEndereco.aspx.cs" Inherits="actoseg.main.pages.MeuEndereco" %>
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
                url: "MeuEndereco.aspx/wmAtualizarEndereco",
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
				alert("Endereço atualizado com sucesso!");				
			}
			else
			{
                alert("Endereço não foi atualizado, houve um problema sistêmico.");
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
        <li class="breadcrumb-item active">Meu Endereço</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     
      <div class="row">		  
        <div class="col-lg-6 col-12">
		  <div class="box">
			<div class="box-header with-border bg-light">
			  <h4 class="box-title">Meu Endereço</h4>							
			</div>
			<!-- /.box-header -->
			<form>
				<div class="box-body">
					<h4 class="mt-0 mb-20">1.Informações do Endereço:</h4>
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
                      <asp:TextBox id="txtDataAtualizacao" type="text" class="form-control" CssClass="form-control" runat="server" Enabled ="false"></asp:TextBox>
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

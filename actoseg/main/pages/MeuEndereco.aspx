<%@ Page Language="C#"  MasterPageFile="~/main/pages/Principal.Master"  AutoEventWireup="true" CodeBehind="MeuEndereco.aspx.cs" Inherits="actoseg.main.pages.MeuEndereco" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
						<select class="form-control">
								<option value="0">Selecione...</option>
								<option value="1">Residencial</option>
								<option value="2">Comercial</option>							
						</select>					  
					</div>
					<div class="form-group">
					  <label>Logradouro:</label>		
					  <select class="form-control">
							<option>Sem logradouro</option>
							<option>Rua</option>
							<option>Avenida</option>
							<option>Alameda</option>
							<option>Estrada</option>
							<option>Ladeira</option>
							<option>Largo</option>
							<option>Pátio</option>
							<option>Praça</option>
							<option>Rodovia</option>
							<option>Sítio</option>
							<option>Travessa</option>
							<option>Trevo</option>
							<option>Via</option>
							<option>Viaduto</option>
							<option>Viela</option>
							<option>Vila</option>
						</select>					  
					</div>
					
					<div class="form-group">
						<label>Endereço:</label>
						<input id="txtEndereco" type="text" class="form-control" placeholder="Digite o Endereço">
					</div>
					<div class="form-group">
						<label>Numero:</label>
						<input id="txtNumeroEndereco" type="text" class="form-control" placeholder="Digite o Número">
					</div>
					<div class="form-group">
						<label>Complemento:</label>							
						<input id="txtComplemento" type="text" class="form-control" placeholder="Digite o complemento">
					</div>

					<div class="form-group">
					  <label>Bairro:</label>		
					  <input id="txtBairro" class="form-control" type="text"  placeholder="Digite o Bairro">					  
					</div>

					<div class="form-group">
					  <label>Cidade:</label>		
					  <input id="txtCidade" class="form-control" type="text"  placeholder="Digite a Cidade">					  
					</div>

				<div class="form-group">
					  <label>Estado:</label>		
					  <select class="form-control">
						  <option>Selecione</option>
						  <option>São Paulo (SP)</option>
						  <option>Acre (AC)</option>
						  <option>Alagoas (AL)</option>
						  <option>Amapá (AP)</option>
						  <option>Amazonas (AM)</option>
						  <option>Bahia (BA)</option>
						  <option>Ceará (CE)</option>
						  <option>Distrito Federal (DF)</option>
						  <option>Espírito Santo (ES)</option>
						  <option>Goiás (GO)</option>
						  <option>Maranhão (MA)</option>
						  <option>Mato Grosso (MT)</option>
						  <option>Mato Grosso do Sul (MS)</option>
						  <option>Minas Gerais (MG)</option>
						  <option>Pará (PA)</option>
						  <option>Paraíba (PB)</option>
						  <option>Paraná (PR)</option>
						  <option>Pernambuco (PE)</option>
						  <option>Piauí (PI)</option>
						  <option>Rio de Janeiro (RJ)</option>
						  <option>Rio Grande do Norte (RN)</option>
						  <option>Rio Grande do Sul (RS)</option>
						  <option>Rondônia (RO)</option>
						  <option>Roraima (RR)</option>
						  <option>Santa Catarina (SC)</option>
						  <option>Sergipe (SE)</option>
						  <option>Tocantins (TO)</option>
						  </select>					  
					</div>
					
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="submit" class="btn btn-danger">Cancelar</button>
					<button type="submit" class="btn btn-success pull-right">Gravar</button>
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

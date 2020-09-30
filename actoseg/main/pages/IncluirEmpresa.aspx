<%@ Page Language="C#"  MasterPageFile="~/main/pages/Principal.Master"  AutoEventWireup="true" CodeBehind="IncluirEmpresa.aspx.cs" Inherits="actoseg.main.pages.IncluirEmpresa" %>

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
        <li class="breadcrumb-item active">Incluir Empresa</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     
      <div class="row">		  
        <div class="col-lg-6 col-12">
		  <div class="box">
			<div class="box-header with-border bg-light">
			  <h4 class="box-title">Meu Cadastro</h4>							
			</div>
			<!-- /.box-header -->
			<form>
				<div class="box-body">
					<h4 class="mt-0 mb-20">1.Informações Pessoais:</h4>
					<div class="form-group">
						<label>Nome:</label>
						<input type="text" class="form-control" placeholder="Nome Completo" disabled="disabled">
					</div>
					<div class="form-group">
						<label>E-mail:</label>
						<input type="email" class="form-control" placeholder="E-mail" disabled ="disabled" >
					</div>
					<div class="form-group">
						<label>CPF:</label>							
						<input type="text" class="form-control" placeholder="000.000.000-00" disabled ="disabled">
					</div>

					<div class="form-group">
					  <label>Data de Nascimento:</label>		
					  <input class="form-control" type="date" value="" id="txtDataNascimento">					  
					</div>

					<div class="form-group">
						<label>Tipo Pessoa :</label>
						<div class="c-inputs-stacked">
							<input type="checkbox" id="checkbox_123" checked="checked"  disabled="disabled">
							<label for="checkbox_123" class="block">Fisíca</label>							
						</div>
					</div>
					<hr>

					<h4 class="mt-0 mb-20">2. Complemento:</h4>
					<div class="form-group">
						<label>Telefone 1:</label>							
						<input type="text" class="form-control" placeholder="(00) 9-9999-9999">
					</div>
					<div class="form-group">
						<label>Telefone 2:</label>							
						<input type="text" class="form-control" placeholder="(00) 9-9999-9999">
					</div>

					<div class="form-group">
						<label>Genêro :</label>
						<div class="c-inputs-stacked">
							<input name="group123" type="radio" id="radio_123" value="1">
							<label for="radio_123" class="mr-30">Masculino</label>
							<input name="group456" type="radio" id="radio_456" value="1">
							<label for="radio_456" class="mr-30">Feminino</label>							
						</div>
					</div>
					<div class="form-group">
						<label>Número do R.G.:</label>							
						<input type="text" class="form-control" placeholder="Número do R.G.">
					</div>
					<div class="form-group">
						<label>Emissão:</label>							
						<input type="text" class="form-control" placeholder="Ex.: SSS/SP">
					</div>
					<div class="form-group">
					  <label>Data de Expedição:</label>		
					  <input class="form-control" type="date" value="" id="txtDataExpedicao">					  
					</div>
					<div class="form-group">
					  <label>Estado Civil:</label>		
					  <select class="form-control">
							<option>Solteiro(a)</option>
							<option>Casado(a)</option>
							<option>Divorciado(a)</option>
							<option>Viúvo(a)</option>							
						  </select>					  
					</div>
					
					<div class="form-group">
					  <label>Data da Inclusão:</label>		
					  <input class="form-control" type="date" value="" id="txtDataInclusão" disabled="disabled" >					  
					</div>
					<h4 class="mt-0 mb-20">3.Cadastro de Empresa:</h4>
				<div class="form-group">
						<label>Proprietário Pessoa Jurídica:</label>
						<div class="c-inputs-stacked">
							<input name="rdoEmpresa" type="radio" id="rdoEmpresaSim" value="1">
							<label for="lblEmpresa" class="mr-30">Sim</label>
							<input name="group456" type="radio" id="rdoEmpresaNao" value="2">
							<label for="rdoEmpresa" class="mr-30">Não</label>							
						</div>
					</div>
				</div>
				
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="submit" class="btn btn-danger">Cancelar</button>
					<button type="submit" class="btn btn-success pull-right">Gravar</button>
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
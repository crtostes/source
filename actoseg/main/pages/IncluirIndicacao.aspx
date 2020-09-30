<%@ Page Title="" Language="C#" MasterPageFile="~/main/pages/Principal.Master" AutoEventWireup="true" CodeBehind="IncluirIndicacao.aspx.cs" Inherits="actoseg.main.pages.IncluirIndicacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content Wrapper. Contains page content -->
  <%--<div class="content-wrapper">--%>
    <!-- Content Header (Page header) -->
    <section class="content-header">
     
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i> Inicío</a></li>
        <li class="breadcrumb-item"><a href="#">Cadastros</a></li>
        <li class="breadcrumb-item active">Indicado</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     
      <div class="row">		  
        <%--<div class="col-lg-6 col-12">
		  <div class="box">
			<div class="box-header with-border bg-light">
			  <h4 class="box-title">Meu Cadastro</h4>			
				<ul class="box-controls pull-right">
				  <li><a class="box-btn-close" href="#"></a></li>
				  <li><a class="box-btn-slide" href="#"></a></li>	
				  <li><a class="box-btn-fullscreen" href="#"></a></li>
				</ul>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
			  <div class="row">
				<div class="col-12">
					<div class="form-group row">
					  <label for="example-text-input" class="col-sm-2 col-form-label">Nome</label>
					  <div class="col-sm-10">
						<input class="form-control" type="text" value="Nome" id="txtNome">
					  </div>
					</div>
					<div class="form-group row">
					  <label for="example-search-input" class="col-sm-2 col-form-label">Search</label>
					  <div class="col-sm-10">
						<input class="form-control" type="search" value="How do I shoot web" id="example-search-input">
					  </div>
					</div>
					<div class="form-group row">
					  <label for="example-email-input" class="col-sm-2 col-form-label">Email</label>
					  <div class="col-sm-10">
						<input class="form-control" type="email" value="bootstrap@example.com" id="example-email-input">
					  </div>
					</div>
					<div class="form-group row">
					  <label for="example-url-input" class="col-sm-2 col-form-label">URL</label>
					  <div class="col-sm-10">
						<input class="form-control" type="url" value="https://getbootstrap.com" id="example-url-input">
					  </div>
					</div>
					<div class="form-group row">
					  <label for="example-tel-input" class="col-sm-2 col-form-label">Telephone</label>
					  <div class="col-sm-10">
						<input class="form-control" type="tel" value="1-(555)-555-5555" id="example-tel-input">
					  </div>
					</div>
					<div class="form-group row">
					  <label for="example-password-input" class="col-sm-2 col-form-label">Password</label>
					  <div class="col-sm-10">
						<input class="form-control" type="password" value="hunter2" id="example-password-input">
					  </div>
					</div>
					<div class="form-group row">
					  <label for="example-number-input" class="col-sm-2 col-form-label">Number</label>
					  <div class="col-sm-10">
						<input class="form-control" type="number" value="42" id="example-number-input">
					  </div>
					</div>
					<div class="form-group row">
					  <label for="example-datetime-local-input" class="col-sm-2 col-form-label">Date and time</label>
					  <div class="col-sm-10">
						<input class="form-control" type="datetime-local" value="2011-08-19T13:45:00" id="example-datetime-local-input">
					  </div>
					</div>
					<div class="form-group row">
					  <label for="example-date-input" class="col-sm-2 col-form-label">Date</label>
					  <div class="col-sm-10">
						<input class="form-control" type="date" value="2011-08-19" id="example-date-input">
					  </div>
					</div>
					<div class="form-group row">
					  <label for="example-month-input" class="col-sm-2 col-form-label">Month</label>
					  <div class="col-sm-10">
						<input class="form-control" type="month" value="2011-08" id="example-month-input">
					  </div>
					</div>
					<div class="form-group row">
					  <label for="example-week-input" class="col-sm-2 col-form-label">Week</label>
					  <div class="col-sm-10">
						<input class="form-control" type="week" value="2011-W33" id="example-week-input">
					  </div>
					</div>
					<div class="form-group row">
					  <label for="example-time-input" class="col-sm-2 col-form-label">Time</label>
					  <div class="col-sm-10">
						<input class="form-control" type="time" value="13:45:00" id="example-time-input">
					  </div>
					</div>
					<div class="form-group row">
					  <label for="example-color-input" class="col-sm-2 col-form-label">Color</label>
					  <div class="col-sm-10">
						<input class="form-control" type="color" value="#563d7c" id="example-color-input">
					  </div>
					</div>
				</div>
				<!-- /.col -->
			  </div>
			  <!-- /.row -->
			</div>
			<!-- /.box-body -->
		  </div>
		  <!-- /.box -->			
		</div>	--%>
		  
        <div class="col-lg-6 col-12">
		  <div class="box">
			<div class="box-header with-border bg-light">
			  <h4 class="box-title">Cadastro de Indicados</h4>							
			</div>
			<!-- /.box-header -->
			<form>
				<div class="box-body">
					<h4 class="mt-0 mb-20">1.Informações Pessoais:</h4>
					<div class="form-group">
						<label>Nome:</label>
						<input type="text" class="form-control" placeholder="Nome Completo"">
					</div>
					<div class="form-group">
						<label>E-mail:</label>
						<input type="email" class="form-control" placeholder="E-mail">
					</div>
					<div class="form-group">
						<label>CPF:</label>							
						<input type="text" class="form-control" placeholder="000.000.000-00">
					</div>

					<div class="form-group">
					  <label>Data de Nascimento:</label>		
					  <input class="form-control" type="date" value="" id="txtDataNascimento">					  
					</div>

					<div class="form-group">
						<label>Tipo Pessoa :</label>
						<div class="c-inputs-stacked">
							<input type="checkbox" id="checkbox_123" checked="checked">
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
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="submit" class="btn btn-danger">Cancel</button>
					<button type="submit" class="btn btn-success pull-right">Submit</button>
				</div>
			</form>
		  </div>
		  <!-- /.box -->			
		</div>		  
		<%--<div class="col-lg-6 col-12">
		  <div class="box">
			<div class="box-header with-border bg-light">
			  <h4 class="box-title">Sample form 1</h4>			
				<ul class="box-controls pull-right">
				  <li><a class="box-btn-close" href="#"></a></li>
				  <li><a class="box-btn-slide" href="#"></a></li>	
				  <li><a class="box-btn-fullscreen" href="#"></a></li>
				</ul>
			</div>
			<!-- /.box-header -->
			<form class="form">
				<div class="box-body">
					<h4 class="box-title text-info"><i class="ti-user mr-15"></i> Personal Info</h4>
					<hr class="my-15">
					<div class="row">
					  <div class="col-md-6">
						<div class="form-group">
						  <label>First Name</label>
						  <input type="text" class="form-control" placeholder="First Name">
						</div>
					  </div>
					  <div class="col-md-6">
						<div class="form-group">
						  <label>Last Name</label>
						  <input type="text" class="form-control" placeholder="Last Name">
						</div>
					  </div>
					</div>
					<div class="row">
					  <div class="col-md-6">
						<div class="form-group">
						  <label >E-mail</label>
						  <input type="text" class="form-control" placeholder="E-mail">
						</div>
					  </div>
					  <div class="col-md-6">
						<div class="form-group">
						  <label >Contact Number</label>
						  <input type="text" class="form-control" placeholder="Phone">
						</div>
					  </div>
					</div>
					<h4 class="box-title text-info"><i class="ti-save mr-15"></i> Requirements</h4>
					<hr class="my-15">
					<div class="form-group">
					  <label>Company</label>
					  <input type="text" class="form-control" placeholder="Company Name">
					</div>
					<div class="row">
					  <div class="col-md-6">
						<div class="form-group">
						  <label>Interested in</label>
						  <select class="form-control">
							<option>Interested in</option>
							<option>design</option>
							<option>development</option>
							<option>illustration</option>
							<option>branding</option>
							<option>video</option>
						  </select>
						</div>
					  </div>
					  <div class="col-md-6">
						<div class="form-group">
						  <label>Budget</label>
						  <select class="form-control">
							<option>Budget</option>
							<option>less than 5000$</option>
							<option>5000$ - 10000$</option>
							<option>10000$ - 20000$</option>
							<option>more than 20000$</option>
						  </select>
						</div>
					  </div>
					</div>
					<div class="form-group">
					  <label>Select File</label>
					  <label class="file">
						<input type="file" id="file">
					  </label>
					</div>
					<div class="form-group">
					  <label>About Project</label>
					  <textarea rows="5" class="form-control" placeholder="About Project"></textarea>
					</div>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-warning mr-1">
					  <i class="ti-trash"></i> Cancel
					</button>
					<button type="submit" class="btn btn-success">
					  <i class="ti-save-alt"></i> Save
					</button>
				</div>  
			</form>
		  </div>
		  <!-- /.box -->			
		</div> --%>
		<%--<div class="col-lg-6 col-12">
		  <div class="box">
			<div class="box-header with-border bg-light">
			  <h4 class="box-title">Meu Cadastro</h4>			
				<ul class="box-controls pull-right">
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
						  <label>Nome</label>
						  <input type="text" id="txtNome" class="form-control" placeholder="Name">
						</div>
					  </div>
					  <div class="col-md-6">
						<div class="form-group">
						  <label>Last Name</label>
						  <input type="text" class="form-control" placeholder="Last Name">
						</div>
					  </div>
					</div>
					<div class="row">
					  <div class="col-md-6">
						<div class="form-group">
						  <label >E-mail</label>
						  <input type="text" class="form-control" placeholder="E-mail">
						</div>
					  </div>
					  <div class="col-md-6">
						<div class="form-group">
						  <label >Contact Number</label>
						  <input type="text" class="form-control" placeholder="Phone">
						</div>
					  </div>
					</div>
					<h4 class="box-title text-info"><i class="ti-envelope mr-15"></i> Informações Complementares</h4>
					<hr class="my-15">
					<div class="form-group">
					  <label>Email</label>
					  <input class="form-control" type="email" placeholder="email">
					</div>
					<div class="form-group">
					  <label>Website</label>
					  <input class="form-control" type="url" placeholder="http://">
					</div>
					<div class="form-group">
					  <label>Contact Number</label>
					  <input class="form-control" type="tel" placeholder="Contact Number">
					</div>
					<div class="form-group">
					  <label >Bio</label>
					  <textarea rows="4" class="form-control" placeholder="Bio"></textarea>
					</div>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-warning mr-1">
					  <i class="ti-trash"></i> Cancel
					</button>
					<button type="submit" class="btn btn-success">
					  <i class="ti-save-alt"></i> Save
					</button>
				</div> 
			</form>
		  </div>
		  <!-- /.box -->			
		</div>--%>		  
		<%--<div class="col-lg-6 col-12">
		  <div class="box">
			<div class="box-header with-border bg-light">
			  <h4 class="box-title">Sample Form 3 with the Icons</h4>			
				<ul class="box-controls pull-right">
				  <li><a class="box-btn-close" href="#"></a></li>
				  <li><a class="box-btn-slide" href="#"></a></li>	
				  <li><a class="box-btn-fullscreen" href="#"></a></li>
				</ul>
			</div>
			<!-- /.box-header -->
			<form class="form">
				<div class="box-body">
					<div class="form-group">
						<label>User Name</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="ti-user"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="Username">
						</div>
					</div>
					<div class="form-group">
						<label>Email address</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="ti-email"></i></span>
							</div>
							<input type="email" class="form-control" placeholder="Email">
						</div>
					</div>
					<div class="form-group">
						<label>Password</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="ti-lock"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="Password">
						</div>
					</div>
					<div class="form-group">
						<label>Confirm Password</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="ti-lock"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="Confirm Password">
						</div>
					</div>
					<div class="form-group">
						<div class="checkbox checkbox-success">
							<input id="checkbox1" type="checkbox">
							<label for="checkbox1"> Remember me </label>
						</div>
					</div>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-warning btn-outline mr-1">
					  <i class="ti-trash"></i> Cancel
					</button>
					<button type="submit" class="btn btn-primary btn-outline">
					  <i class="ti-save-alt"></i> Save
					</button>
				</div>  
			</form>
		  </div>
		  <!-- /.box -->			
		</div>		  
		<div class="col-lg-6 col-12">
		  <div class="box">
			<div class="box-header with-border bg-light">
			  <h4 class="box-title">Sample Form 4 with the right Icons</h4>			
				<ul class="box-controls pull-right">
				  <li><a class="box-btn-close" href="#"></a></li>
				  <li><a class="box-btn-slide" href="#"></a></li>	
				  <li><a class="box-btn-fullscreen" href="#"></a></li>
				</ul>
			</div>
			<!-- /.box-header -->
			<form class="form">
				<div class="box-body">
					<div class="form-group">
						<label>User Name</label>
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="Username">
							<div class="input-group-append">
								<span class="input-group-text"><i class="ti-user"></i></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label>Email address</label>
						<div class="input-group mb-3">
							<input type="email" class="form-control" placeholder="Email">
							<div class="input-group-append">
								<span class="input-group-text"><i class="ti-email"></i></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label>Password</label>
						<div class="input-group mb-3">
							<input type="password" class="form-control" placeholder="Password">
							<div class="input-group-append">
								<span class="input-group-text"><i class="ti-lock"></i></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label>Confirm Password</label>
						<div class="input-group mb-3">
							<input type="password" class="form-control" placeholder="Confirm Password">
							<div class="input-group-append">
								<span class="input-group-text"><i class="ti-lock"></i></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="checkbox checkbox-success">
							<input id="checkbox2" type="checkbox">
							<label for="checkbox2"> Remember me </label>
						</div>
					</div>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-warning mr-1">
					  <i class="ti-trash"></i> Cancel
					</button>
					<button type="submit" class="btn btn-success">
					  <i class="ti-save-alt"></i> Save
					</button>
				</div></form>
		  </div>
		  <!-- /.box -->			
		</div>			  
        <div class="col-xl-6 col-lg-12">
          <!-- general form elements -->
          <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Quick Example</h4>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" class="form-element">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Email address</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Password</label>
                  <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>
                <div class="form-group">
                  <label for="exampleInputFile">File input</label>
                  <input type="file" id="exampleInputFile">

                  <p class="help-block text-red">Example block-level help text here.</p>
                </div>
                <div class="checkbox">
                    <input type="checkbox" id="basic_checkbox_1">
					<label for="basic_checkbox_1">Check me out</label>                  
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-danger">Submit</button>
              </div>
            </form>
          </div>
          <!-- /.box -->
        </div>		  
        <div class="col-xl-6 col-lg-12">
          <!-- Horizontal Form -->
          <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Horizontal Form</h4>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal form-element">
              <div class="box-body">
                <div class="form-group row">
                  <label for="inputEmail3" class="col-sm-2 control-label">Email</label>

                  <div class="col-sm-10">
                    <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="inputPassword3" class="col-sm-2 control-label">Password</label>

                  <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="ml-auto col-sm-10">
                    <div class="checkbox">
						<input type="checkbox" id="Remember">
						<label for="Remember">Remember me</label> 
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" class="btn btn-default">Cancel</button>
                <button type="submit" class="btn btn-info pull-right">Sign in</button>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
          <!-- /.box -->
        </div>--%>
      </div>
      <!-- /.row -->
      
    </section>
    <!-- /.content -->
  <%--</div>--%>
  <!-- /.content-wrapper -->
</asp:Content>
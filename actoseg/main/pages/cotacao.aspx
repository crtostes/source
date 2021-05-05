<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../images/logoactopeq2.jpg">

    <title>ACTOSEG - COTAÇÃO DE AUTOMÓVEL</title>
  
	<!-- Bootstrap 4.1-->
	<link rel="stylesheet" href="../../assets/vendor_components/bootstrap/dist/css/bootstrap.min.css">
	
	<!-- Bootstrap extend-->
	<link rel="stylesheet" href="../css/bootstrap-extend.css">	
	
	<!-- Theme style -->
	<link rel="stylesheet" href="../css/master_style.css">


	<!-- Bankio admin skins -->
	<%--<link rel="stylesheet" href="../css/skins/_all-skins.css">--%>

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
</head>

<body class="hold-transition skin-black sidebar-mini">
<div class="wrapper">

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
  


  <!-- Content Wrapper. Contains page content -->
  <div class="">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ACTOSEG CORRETORA DE SEGUROS
      </h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i> Inicio</a></li>
        <li class="breadcrumb-item"><a href="#">Cotação</a></li>
        <li class="breadcrumb-item active">Automovél</li>
      </ol>
    </section>

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
						                    <%--<div class="form-group">
						                      <label>Marca</label>
						                      <input type="text" class="form-control" placeholder="Digite a Marca">
						                    </div>--%>
											<div class="form-group">
												<label>Minimal</label>
												<select class="form-control select2" style="width: 100%;">
												  <option selected="selected">Digite...</option>
												  <option>VW</option>
												  <option>FIAT</option>
												  <option>FORD</option>
												  <option>GM</option>												  
												</select>
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
  
   <footer class="main-footer">
    <div class="pull-right d-none d-sm-inline-block">
        <ul class="nav nav-primary nav-dotted nav-dot-separated justify-content-center justify-content-md-end">
		  <li class="nav-item">
			<a class="nav-link" href="javascript:void(0)">COTE AGORA</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="#">SEGURO AUTOMÓVEL</a>
		  </li>
		</ul>
    </div>
	  &copy; 2020 <a href="http://www.actoseg.com.br/">ACTOSEG CORRETORA</a>. Todos os direitos reservados.
  </footer>
  <!-- Control Sidebar -->
<%--  <aside class="control-sidebar control-sidebar-light">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="nav-item"><a href="#control-sidebar-home-tab" data-toggle="tab" class="active"><i class="fa fa-home"></i></a></li>
      <li class="nav-item"><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-cog fa-spin"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-danger"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Admin Birthday</h4>

                <p>Will be July 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-warning"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Jhone Updated His Profile</h4>

                <p>New Email : jhone_doe@demo.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-info"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Disha Joined Mailing List</h4>

                <p>disha@demo.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-success"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Code Change</h4>

                <p>Execution time 15 Days</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Web Design
                <span class="label label-danger pull-right">40%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 40%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Update Data
                <span class="label label-success pull-right">75%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-success" style="width: 75%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Order Process
                <span class="label label-warning pull-right">89%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-warning" style="width: 89%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Development 
                <span class="label label-primary pull-right">72%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 72%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <input type="checkbox" id="report_panel" class="chk-col-grey" >
			<label for="report_panel" class="control-sidebar-subheading ">Report panel usage</label>

            <p>
              general settings information
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <input type="checkbox" id="allow_mail" class="chk-col-grey" >
			<label for="allow_mail" class="control-sidebar-subheading ">Mail redirect</label>

            <p>
              Other sets of options are available
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <input type="checkbox" id="expose_author" class="chk-col-grey" >
			<label for="expose_author" class="control-sidebar-subheading ">Expose author name</label>

            <p>
              Allow the user to show his name in blog posts
            </p>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>

          <div class="form-group">
            <input type="checkbox" id="show_me_online" class="chk-col-grey" >
			<label for="show_me_online" class="control-sidebar-subheading ">Show me as online</label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <input type="checkbox" id="off_notifications" class="chk-col-grey" >
			<label for="off_notifications" class="control-sidebar-subheading ">Turn off notifications</label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">              
              <a href="javascript:void(0)" class="text-red margin-r-5"><i class="fa fa-trash-o"></i></a>
              Delete chat history
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>--%>
  <!-- /.control-sidebar -->
  
  <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

	<!-- jQuery 3 -->
	<script src="../../assets/vendor_components/jquery-3.3.1/jquery-3.3.1.js"></script>
	
	<!-- fullscreen -->
	<script src="../../assets/vendor_components/screenfull/screenfull.js"></script>
	
	<!-- popper -->
	<script src="../../assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap 4.1-->
	<script src="../../assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- SlimScroll -->
	<script src="../../assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	
	<!-- FastClick -->
	<script src="../../assets/vendor_components/fastclick/lib/fastclick.js"></script>
	
	<!-- Bankio admin App -->
	<script src="../js/template.js"></script>
	
	
	
	
</body>
</html>

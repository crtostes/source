<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="actoseg.main.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../images/logos/RGB/Logo_ActoSeg%20Corretora_RGB-01_login.jpg">

    <title>ACTOSEG CORRETORA - LOGIN</title>
  
	<!-- Bootstrap 4.1-->
	<link rel="stylesheet" href="../../assets/vendor_components/bootstrap/dist/css/bootstrap.min.css">
	
	<!-- Bootstrap extend-->
	<link rel="stylesheet" href="../css/bootstrap-extend.css">	
	
	<!-- Theme style -->
	<link rel="stylesheet" href="../css/master_style.css">

	<!-- Bankio admin skins -->
	<link rel="stylesheet" href="../css/skins/_all-skins.css">	

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	 <script>
        
             function Buscar() {

                 // alert("teste");

                 $.ajax({
                     type: "POST",
                     url: "teste.aspx/BuscaCliente",
                     data: "{Codigo: '" + $("#txtCodigo").val() + "'}",
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
                 //alert(data.d);
                 $('#txtDescricao').val(data.d);
        }



        $(document).ready(function () {
                 jQuery.support.cors = true;
        });

          


		 function Entre()
		 {

			 if ($("#txtLogin").val() == '')
			 {
                 alert("Por favor, digite um Login ou seu E-mail !");
				 return false;
			 }

			 if ($("#txtSenha").val() == '')
			 {
                 alert("Por favor, digite a Senha de 4 digitos");
                 return false;
			 }

			 alert("Verificando a Login e Senha");

             $.ajax({
                 type: "POST",
                 url: "Login.aspx/ExecutarAcesso",
                 data: "{Codigo: '" + $("#txtCodigo").val() + "'}",
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
             //alert(data.d);
             $('#txtDescricao').val(data.d);
         }
          function submit() {

              alert("{ Codigo: '" + $("#txtLogin").val() + "    }" + $("#txtSenha").val());

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
</head>
<body class="hold-transition bg-light">
	
	<div class="container h-p100">
		<div class="row align-items-center justify-content-md-center h-p100">
			<div class="col-lg-5 col-md-8 col-12">
				<div class="p-40 bg-white content-bottom">
					<form id="frmLogin" runat="server" > <%--action="../index.html" method="post" --%>
						<div class="form-group">
							<div class="col-12">
								 <div class="fog-pwd text-center">
										<img src="../../images/logos/RGB/Logo_ActoSeg%20Corretora_RGB-01_login.jpg" style="width:150px;height:150px; left:50px;"  />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-info border-info"><i class="ti-user"></i></span>
								</div>
								<%--<input id="txtLogin" type="text" class="form-control" placeholder="E-mail">--%>
								<asp:TextBox id="txtLogin" type="text" class="form-control" placeholder="E-mail" CssClass="form-control" runat="server"></asp:TextBox>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-info border-info"><i class="ti-lock"></i></span>
								</div>
								<%--<input id="txtSenha" type="password" class="form-control" placeholder="Senha" maxlength ="4" >--%>
								<asp:TextBox ID="txtSenha" CssClass="form-control" runat="server" TextMode="Password" type="password" class="form-control" placeholder="Senha" maxlength ="4" ></asp:TextBox>
							</div>
						</div>
						  <div class="row">
							<div class="col-6">
							  <%--<div class="checkbox">--%>
								<%--<input type="checkbox" id="basic_checkbox_1" >--%>
								<asp:Label runat="server" ID="lblMensagem" Font-Bold="True" ForeColor="Red"></asp:Label>
							  <%--</div>--%>
							</div>
							<!-- /.col -->
							<div class="col-6">
							 <div class="fog-pwd text-right">
								<a href="javascript:void(0)"><i class="ion ion-locked"></i> Recupere a senha</a><br>
							  </div>
							</div>
							<!-- /.col -->
							<div class="col-12">
							  <%--<button type="button" class="btn btn-info mt-10" onclick="Entre()">Entre</button>--%>
								<asp:Button ID="btnLogar" CssClass="btn btn-info mt-10" skinID="botaoLogin" runat="server" Text="Entrar" OnClick="btnLogar_Click"/>
							</div>
							<!-- /.col -->
						  </div>
					</form>	
					<div class="mt-20">
						<p class="mb-0">Crie um usuário <a href="IncluirLogin.aspx" class="text-info ml-5">Clique aqui</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- jQuery 3 -->
	<script src="../../assets/vendor_components/jquery-3.3.1/jquery-3.3.1.js"></script>
	
	<!-- fullscreen -->
	<script src="../../assets/vendor_components/screenfull/screenfull.js"></script>
	
	<!-- popper -->
	<script src="../../assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap 4.1-->
	<script src="../../assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>

</body>
</html>

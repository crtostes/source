<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncluirLogin.aspx.cs" Inherits="actoseg.main.pages.IncluirLogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../images/favicon.ico">

    <title>ACTOSEG - CRIAR NOVO LOGIN</title>
  
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
		function IncluirUsuario() {

            $.ajax({
                type: "POST",
                url: "IncluirLogin.aspx/wmIncluirLogin",
                data: "{nome: '" + $("#txtNome").val() + "', cpf: '" + $("#txtCPF").val() + "',  email: '" + $("#txtEmail").val() + "', confirmar_email: '" + $("#txtConfirmarEmail").val() + "',  senha: '" + $("#txtSenha").val() + "', conf_senha: '" + $("#txtConfirmarSenha").val() + "'}",
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
				alert("Usuário cadastrado com sucesso!");
				window.location.href = "Login.aspx";
			}
			else
			{
				$('#txtSenha').val("");
                $('#txtConfirmarSenha').val("");
                alert(data.d);
            }
			


           
        }

     

        $(document).ready(function () {
            jQuery.support.cors = true;
        });

          
    </script>
</head>

<body class="hold-transition bg-light">
	
	<div class="container h-p100">
		<div class="row align-items-center justify-content-md-center h-p100">
			
			<div class="col-lg-5 col-md-8 col-12">
				<div class="p-40 bg-white content-bottom">
					<form runat="server">
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
									<span class="input-group-text bg-success border-success"><i class="ti-user"></i></span>
								</div>
								<%--<input type="text" class="form-control" placeholder="Nome">--%>
								<asp:TextBox ID="txtCPF" runat="server" class="form-control" placeholder="CPF"></asp:TextBox>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-user"></i></span>
								</div>
								<%--<input type="text" class="form-control" placeholder="Nome">--%>
								<asp:TextBox ID="txtNome" runat="server" class="form-control" placeholder="Nome"></asp:TextBox>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-email"></i></span>
								</div>
								<%--<input type="email" class="form-control" placeholder="Email">--%>
								<asp:TextBox ID="txtEmail" type="email" runat="server" class="form-control" placeholder="E-mail"></asp:TextBox>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-email"></i></span>
								</div>
								<%--<input type="email" class="form-control" placeholder="Email">--%>
								<asp:TextBox ID="txtConfirmarEmail" type="email" runat="server" class="form-control" placeholder="Confirme o E-mail"></asp:TextBox>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-lock"></i></span>
								</div>
								<%--<input type="password" class="form-control" placeholder="Senha">--%>
								<asp:TextBox ID="txtSenha" type="password" runat="server" class="form-control" placeholder="Senha" MaxLength="4"></asp:TextBox>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-lock"></i></span>
								</div>
								<%--<input type="password" class="form-control" placeholder="Confirme a Senha">--%>
								<asp:TextBox ID="txtConfirmarSenha" type="password" runat="server" class="form-control" placeholder="Confirme a Senha" MaxLength="4"></asp:TextBox>
							</div>
						</div>
						  <div class="row">
							<div class="col-12">
							  <%--<div class="checkbox">
								<input type="checkbox" id="basic_checkbox_1" >
								<label for="basic_checkbox_1">I agree to the <a href="#" class="text-success"><b>Terms</b></a></label>
							  </div>--%>
							</div>
							<!-- /.col -->
							<div class="col-12">
							  <button type="button" class="btn btn-success mt-10" onclick="IncluirUsuario()">Enviar</button>
							  <%--<asp:Button id="bntCadastrarLogin" runat="server"  CssClass="btn btn-success mt-10" Text="Enviar" onclick="IncluirUsuario()" />--%>
							</div>
							<!-- /.col -->
						  </div>
					</form>		

					<div class="mt-20">
						<p class="mb-0">Voltar para Login:<a href="Login.aspx" class="text-danger ml-5"> Clique aqui</a></p>
					</div>
				</div>
				<%--<div class="content-top-agile bg-primary">
					<h2>Register a new membership</h2>
					  <p class="gap-items-2 mb-20">
						  <a class="btn btn-social-icon btn-facebook" href="#"><i class="fa fa-facebook"></i></a>
						  <a class="btn btn-social-icon btn-twitter" href="#"><i class="fa fa-twitter"></i></a>
						  <a class="btn btn-social-icon btn-google" href="#"><i class="fa fa-google-plus"></i></a>
						  <a class="btn btn-social-icon btn-instagram" href="#"><i class="fa fa-instagram"></i></a>
						</p>
				</div>--%>
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

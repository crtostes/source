
<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="actoseg._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

 <!doctype html>
<html lang="zxx">
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<!-- Bootstrap Min CSS -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<!-- Animate Min CSS -->
		<link rel="stylesheet" href="assets/css/animate.min.css">
		<!-- FontAwesome Min CSS -->
		<link rel="stylesheet" href="assets/css/fontawesome.min.css">
		<!-- FlatIcon CSS -->
		<link rel="stylesheet" href="assets/css/flaticon.css">
		<!-- Owl Carousel Min CSS -->
		<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
		<!-- Slick Min CSS -->
		<link rel="stylesheet" href="assets/css/slick.min.css">
		<!-- MeanMenu CSS -->
		<link rel="stylesheet" href="assets/css/meanmenu.css">
		<!-- Magnific Popup Min CSS -->
		<link rel="stylesheet" href="assets/css/magnific-popup.min.css">
		<!-- Odometer Min CSS -->
		<link rel="stylesheet" href="assets/css/odometer.min.css">
		<!-- Nice Select Min CSS -->
		<link rel="stylesheet" href="assets/css/nice-select.min.css">
		<!-- Style CSS -->
		<link rel="stylesheet" href="assets/css/style.css">
		<!-- Responsive CSS -->
		<link rel="stylesheet" href="assets/css/responsive.css">

		<title>ACTOSEG CORRETORA</title>

		<link rel="icon" type="image/png" href="assets/img/favicon.png">
	</head>
	
	<body>
		<form runat="server">
<%--		<!-- Preloader -->
		<div class="preloader">
			<div class="loader">
				<div class="shadow"></div>
				<div class="box"></div>
			</div>
		</div>
		<!-- End Preloader -->

		<!-- Start Header Area -->
		<header class="header-area">

			<!-- Start Top Header -->
			<div class="top-header">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-5 col-md-12">
							<ul class="top-header-nav">
								<li><a href="#">Parceiros</a></li>
								<li><a href="#">Nossas Soluções</a></li>
								<li><a href="#">Pedidos</a></li>
							</ul>
						</div>

						<div class="col-lg-7 col-md-12">
							<div class="top-header-right-side">
								<ul>
									<li>
										<div class="icon">
											<i class="flaticon-email"></i>
										</div>
										<span>E-mail :</span>
										<a href="#">acto.cotacao@gmail.com</a>
									</li>

									<li>
										<div class="icon">
											<i class="flaticon-call"></i>
										</div>
										<span>Ligue:</span>
										<a href="#">11-9-3208-9366</a>
									</li>

									<li>
										<a href="#" class="default-btn">Cotação <span></span></a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Top Header -->

			<!-- Start Navbar Area -->
			<div class="navbar-area">
				<div class="pearo-responsive-nav">
					<div class="container">
						<div class="pearo-responsive-menu">
							<div class="logo">
								<a href="index.html">
									<img src="assets/img/logo.png" alt="logo">
								</a>
							</div>
						</div>
					</div>
				</div>

				<div class="pearo-nav">
					<div class="container">
						<nav class="navbar navbar-expand-md navbar-light">
							<a class="navbar-brand" href="index.html">
								<img src="assets/img/logo.png" alt="logo">
							</a>

							<div class="collapse navbar-collapse mean-menu" id="navbarSupportedContent">
								<ul class="navbar-nav">
									<li class="nav-item">
										<a href="#" class="nav-link active">Inicio <i class="flaticon-down-arrow"></i></a>
										<ul class="dropdown-menu">
											<li class="nav-item"><a href="index.html" class="nav-link active">Home One</a></li>

											<li class="nav-item"><a href="index-2.html" class="nav-link">Home Two</a></li>

											<li class="nav-item"><a href="index-3.html" class="nav-link">Home Three</a></li>

											<li class="nav-item"><a href="index-4.html" class="nav-link">Home Four</a></li>
										</ul>
									</li>



									<li class="nav-item">
										<a href="#" class="nav-link">Seguros <i class="flaticon-down-arrow"></i></a>
										<ul class="dropdown-menu">
											<li class="nav-item"><a href="home-insurance.html" class="nav-link">Residencial</a></li>

											<li class="nav-item"><a href="business-insurance.html" class="nav-link">Empresarial</a></li>

											<li class="nav-item"><a href="health-insurance.html" class="nav-link">Saúde</a></li>

											<li class="nav-item"><a href="travel-insurance.html" class="nav-link">Viagem</a></li>

											<li class="nav-item"><a href="car-insurance.html" class="nav-link">Automotivo</a></li>

											<li class="nav-item"><a href="life-insurance.html" class="nav-link">Vida</a></li>
										</ul>
									</li>

									<li class="nav-item">
										<a href="#" class="nav-link">Pages <i class="flaticon-down-arrow"></i></a>
										<ul class="dropdown-menu">
											<li class="nav-item"><a href="team.html" class="nav-link">Team</a></li>

											<li class="nav-item">
												<a href="#" class="nav-link">Serviços</a>
												<ul class="dropdown-menu">
													<li class="nav-item"><a href="services-1.html" class="nav-link">Services Style 1</a></li>

													<li class="nav-item"><a href="services-2.html" class="nav-link">Services Style 2</a></li>
												</ul>
											</li>

											<li class="nav-item">
												<a href="#" class="nav-link">Estudo de Caso</a>
												<ul class="dropdown-menu">
													<li class="nav-item"><a href="case-study.html" class="nav-link">Case Study</a></li>

													<li class="nav-item"><a href="single-case-study.html" class="nav-link">Case Study Details</a></li>
												</ul>
											</li>

											<li class="nav-item">
												<a href="#" class="nav-link">Events</a>
												<ul class="dropdown-menu">
													<li class="nav-item"><a href="events.html" class="nav-link">Events</a></li>

													<li class="nav-item"><a href="single-events.html" class="nav-link">Events Details</a></li>
												</ul>
											</li>

											<li class="nav-item"><a href="pricing.html" class="nav-link">Pricing</a></li>

											<li class="nav-item"><a href="feedback.html" class="nav-link">Testimonial</a></li>

											<li class="nav-item"><a href="faq.html" class="nav-link">FAQ</a></li>

											<li class="nav-item"><a href="error-404.html" class="nav-link">404 Error</a></li>
										</ul>
									</li>

									<li class="nav-item">
										<a href="#" class="nav-link">Blog <i class="flaticon-down-arrow"></i></a>
										<ul class="dropdown-menu">
											<li class="nav-item"><a href="blog-1.html" class="nav-link">Blog Grid</a></li>

											<li class="nav-item"><a href="blog-2.html" class="nav-link">Blog Right Sidebar</a></li>

											<li class="nav-item"><a href="single-blog.html" class="nav-link">Blog Details</a></li>
										</ul>
									</li>

									<li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>

									<li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
								</ul>

								<div class="others-option">
									<div class="option-item">
										<i class="search-btn flaticon-search"></i>
										<i class="close-btn flaticon-cross-out"></i>
										
										<div class="search-overlay search-popup">
											<div class='search-box'>
												<form class="search-form">
													<input class="search-input" name="search" placeholder="Search" type="text">

													<button class="search-button" type="submit"><i class="flaticon-search"></i></button>
												</form>
											</div>
										</div>
									</div>

									<div class="burger-menu">
										<i class="flaticon-menu"></i>
									</div>
								</div>
							</div>
						</nav>
					</div>
				</div>
			</div>
			<!-- End Navbar Area -->

		</header>
		<!-- End Header Area -->--%>

		<!-- Sidebar Modal -->
		<div class="sidebar-modal">
			<div class="sidebar-modal-inner">
				<div class="sidebar-about-area">
					<div class="title">
						<h2>ACTOSEG CORRETORA</h2>
						<p>A Actoseg Corretora quer criar uma nova maneira de levar o produto seguro até você. Indique amigos e assim você poderá ter descontos de verdade em suas Apólices, consulte e entenda.</p>
					</div>
				</div>

				<div class="sidebar-instagram-feed">
					<h2>INDIQUE E GANHE $$$</h2>

					<ul>
						<li><a href="#"><img src="assets/img/blog-image/1.jpg" alt="image"></a></li>
						<li><a href="#"><img src="assets/img/blog-image/2.jpg" alt="image"></a></li>
						<li><a href="#"><img src="assets/img/blog-image/3.jpg" alt="image"></a></li>
						<li><a href="#"><img src="assets/img/blog-image/4.jpg" alt="image"></a></li>
						<li><a href="#"><img src="assets/img/blog-image/5.jpg" alt="image"></a></li>
						<li><a href="#"><img src="assets/img/blog-image/6.jpg" alt="image"></a></li>
						<li><a href="#"><img src="assets/img/blog-image/7.jpg" alt="image"></a></li>
						<li><a href="#"><img src="assets/img/blog-image/8.jpg" alt="image"></a></li>
					</ul>
				</div>

				<div class="sidebar-contact-area">
					<div class="sidebar-contact-info">
						<div class="contact-info-content">
							<h2>

								<a href="tel:11932089366">11-9-3208-9366</a>
								<span>OU</span>
								<a href="mailto:acto.cotacao@gmail.com">acto.cotacao@gmail.com</a>
							</h2>
	
							<ul class="social">
								<li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
								<li><a href="#" target="_blank"><i class="fab fa-youtube"></i></a></li>
								<li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
								<li><a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a></li>
								<li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
							</ul>
						</div>
					</div>
				</div>

				<span class="close-btn sidebar-modal-close-btn"><i class="flaticon-cross-out"></i></span>
			</div>
		</div>
		<!-- End Sidebar Modal -->

		<!-- Start Main Banner Area -->
		<div class="home-area home-slides owl-carousel owl-theme">
			<div class="main-banner item-bg1">
				<div class="d-table">
					<div class="d-table-cell">
						<div class="container">
							<div class="main-banner-content">
								<span class="sub-title">proteja suas conquistas</span>
								<h1>aproveite esta oportunidade</h1>
								<p>A ActoSeg tem o seguro sob medida para sua necessidade, proteja as suas conquistas, materiais e sentimentais.</p>

								<div class="btn-box">
									<a class="default-btn" cf-scroll-trigger="#envia_contato" href="#envia_contato">Faça a Cotação <span></span></a>
									<%--<a href="#" class="optional-btn">Contact Us <span></span></a>--%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="main-banner item-bg2">
				<div class="d-table">
					<div class="d-table-cell">
						<div class="container">
							<div class="main-banner-content">
								<span class="sub-title">faca uma consulta agora</span>
								<h1>Indique amigos, ganhe $$$<br> obtenha altos descontos em sua apólice</h1>
								<p>A ActoSeg tem o seguro sob medida para sua necessidade, proteja as suas conquistas, materiais e sentimentais</p>

								<div class="btn-box">
									<a class="default-btn" cf-scroll-trigger="#envia_contato" href="#envia_contato">Faça a Cotação <span></span></a>
									<%--<a href="#" class="optional-btn">Contact Us <span></span></a>--%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="main-banner item-bg5">
				<div class="d-table">
					<div class="d-table-cell">
						<div class="container">
							<div class="main-banner-content">
								<span class="sub-title">traquilidade e proteção para a família</span>
								<h1>Então você está pensando em mudar, aproveite e consulte agora</h1>
								<p>A ActoSeg tem o seguro sob medida para sua necessidade, proteja as suas conquistas, materiais e sentimentais</p>

								<div class="btn-box">
									<a class="default-btn" cf-scroll-trigger="#envia_contato" href="#envia_contato">Faça a Cotação <span></span></a>
									<%--<a href="#" class="optional-btn">Contact Us <span></span></a>--%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Main Banner Area -->



		<!-- Start Services Boxes Area -->
		<section class="services-boxes-area bg-f8f8f8">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="single-box">
							<div class="image">
								<img src="assets/img/featured-services-image/1.jpg" alt="image">
							</div>

							<div class="content">
								<h3><a href="#">PRODUTOS SOB MEDIDA</a></h3>
								<p>Informe sua necessidade e você terá a consultoria certa na aquisição de produtos.</p>

								<div class="icon">
									<img src="assets/img/icon1.png" alt="image">
								</div>
								<div class="shape">
									<img src="assets/img/umbrella.png" alt="image">
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="single-box">
							<div class="image">
								<img src="assets/img/featured-services-image/2.jpg" alt="image">
							</div>

							<div class="content">
								<h3><a href="#">MELHOR CUSTO BENEFICIO</a></h3>
								<p>Valorize seu dinheiro, produtos com o melhor custo beneficio.</p>
								
								<div class="icon">
									<img src="assets/img/icon2.png" alt="image">
								</div>
								<div class="shape">
									<img src="assets/img/umbrella.png" alt="image">
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-0 offset-md-3 offset-sm-3">
						<div class="single-box">
							<div class="image">
								<img src="assets/img/featured-services-image/3.jpg" alt="image">
							</div>

							<div class="content">
								<h3><a href="#">CONSULTE SEM COMPROMISSO</a></h3>
								<p>Prestamos consultoria, para verificar a melhor solução sempre.</p>
								
								<div class="icon">
									<img src="assets/img/icon3.png" alt="image">
								</div>
								<div class="shape">
									<img src="assets/img/umbrella.png" alt="image">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Services Boxes Area -->

	<%--	<!-- Start About Area -->
		<section class="about-area ptb-100 bg-f8f8f8">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-12">
						<div class="about-title">
							<span>About Us</span>
							<h2>We are Award winning company</h2>
						</div>
					</div>

					<div class="col-lg-6 col-md-12">
						<div class="about-text">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. </p>

							<a href="#" class="read-more-btn">More About Us <i class="flaticon-right-chevron"></i></a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- En--%>d About Area -->

		<!-- Start Services Area -->
		<section class="services-area bg-f8f8f8 pb-70">
			<div class="container">
				<div class="services-slides owl-carousel owl-theme">
					<div class="single-services-box">
						<div class="icon">
							<i class="flaticon-home-insurance"></i>

							<div class="icon-bg">
								<img src="assets/img/icon-bg1.png" alt="image">
								<img src="assets/img/icon-bg2.png" alt="image">
							</div>
						</div>

						<h3><a href="#">SEGURO RESIDENCIAL</a></h3>

						<p>Protejer sua residencia com planos que cabem no seu bolso.</br></br></br></br></br></p>

						<a href="#" class="read-more-btn">Saiba mais</a>

						<div class="box-shape">
							<img src="assets/img/box-shape1.png" alt="image">
							<img src="assets/img/box-shape2.png" alt="image">
						</div>
					</div>

					<div class="single-services-box">
						<div class="icon">
							<i class="flaticon-insurance"></i>

							<div class="icon-bg">
								<img src="assets/img/icon-bg1.png" alt="image">
								<img src="assets/img/icon-bg2.png" alt="image">
							</div>
						</div>

						<h3><a href="#">SEGURO EMPRESARIAL</a></h3>

						<p>Empresas podem contar com diversas proteções, peça uma consutoria e entenda.</br></br></br></br></p>

						<a href="#" class="read-more-btn">Saiba mais</a>

						<div class="box-shape">
							<img src="assets/img/box-shape1.png" alt="image">
							<img src="assets/img/box-shape2.png" alt="image">
						</div>
					</div>

					<div class="single-services-box">
						<div class="icon">
							<i class="flaticon-health-insurance"></i>

							<div class="icon-bg">
								<img src="assets/img/icon-bg1.png" alt="image">
								<img src="assets/img/icon-bg2.png" alt="image">
							</div>
						</div>

						<h3><a href="#">PLANOS DE SAÚDE</a></h3>

						<p>Temos varios planos para varios tipos de necessidades.</br></br></br></br></br></p>

						<a href="#" class="read-more-btn">Saiba mais</a>

						<div class="box-shape">
							<img src="assets/img/box-shape1.png" alt="image">
							<img src="assets/img/box-shape2.png" alt="image">
						</div>
					</div>

					<div class="single-services-box">
						<div class="icon">
							<i class="flaticon-travel-insurance"></i>

							<div class="icon-bg">
								<img src="assets/img/icon-bg1.png" alt="image">
								<img src="assets/img/icon-bg2.png" alt="image">
							</div>
						</div>

						<h3><a href="#">SEGURO VIAGEM</a></h3>

						<p>Ao viajar preoculpe-se somente no seu objetivo principal, para viagens de negócios ou diversão, estaja sempre tranquilo.</br></br></br></p>

						<a href="#" class="read-more-btn">Saiba mais</a>
					</div>

					<div class="single-services-box">
						<div class="icon">
							<i class="flaticon-car-insurance"></i>

							<div class="icon-bg">
								<img src="assets/img/icon-bg1.png" alt="image">
								<img src="assets/img/icon-bg2.png" alt="image">
							</div>
						</div>

						<h3><a href="#">SEGURO DE AUTOMÓVEL</a></h3>

						<p>Somente 10% dos veiculos no Brasil tem seguro, não deixe de viver tranquilo até que aquele evento impresvisto ocorra, peça uma cotação agora ou programe sua renovação conosco.</br></br></p>

						<a href="car-insurance.aspx" class="read-more-btn">Saiba mais</a>

						<div class="box-shape">
							<img src="assets/img/box-shape1.png" alt="image">
							<img src="assets/img/box-shape2.png" alt="image">
						</div>
					</div>

					<div class="single-services-box">
						<div class="icon">
							<i class="flaticon-life-insurance"></i>

							<div class="icon-bg">
								<img src="assets/img/icon-bg1.png" alt="image">
								<img src="assets/img/icon-bg2.png" alt="image">
							</div>
						</div>

						<h3><a href="#">SEGURO DE VIDA</a></h3>

						<p>A sensação de se sentir protegido é algo indescritivél. Para isso dê o primeiro passo, peça uma consulta sobre Seguro de Vida. Isto é muito importante.</br></br></br></p>

						<a href="#" class="read-more-btn">Saiba mais</a>

						<div class="box-shape">
							<img src="assets/img/box-shape1.png" alt="image">
							<img src="assets/img/box-shape2.png" alt="image">
						</div>
					</div>

					<div class="single-services-box">
						<div class="icon">
							<i class="flaticon-agriculture"></i>

							<div class="icon-bg">
								<img src="assets/img/icon-bg1.png" alt="image">
								<img src="assets/img/icon-bg2.png" alt="image">
							</div>
						</div>

						<h3><a href="#">SEGURO AGRICOLA</a></h3>

						<p>Consulte. </br></br></br></br></br></br></p>

						<a href="#" class="read-more-btn">Saiba mais</a>

						<div class="box-shape">
							<img src="assets/img/box-shape1.png" alt="image">
							<img src="assets/img/box-shape2.png" alt="image">
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Services Area -->
		<!-- Start Partner Area -->
		<section class="partner-area">
			<div class="container">
				<div class="partner-title">
					<h2>AS MELHORES SEGURADORAS</h2>
				</div>

				<div class="partner-slides owl-carousel owl-theme">
					<div class="single-partner-item">
						<a href="#">
							<img src="assets/img/partner-image/aliro_seguro.jpg" alt="image">
						</a>
					</div>

					<div class="single-partner-item">
						<a href="#">
							<img src="assets/img/partner-image/azul_seguros.jpg" alt="image">
						</a>
					</div>

					<div class="single-partner-item">
						<a href="#">
							<img src="assets/img/partner-image/eagon_seguros.jpg" alt="image">
						</a>
					</div>

					<div class="single-partner-item">
						<a href="#">
							<img src="assets/img/partner-image/itau_seguros.jpg" alt="image">
						</a>
					</div>

					<div class="single-partner-item">
						<a href="#">
							<img src="assets/img/partner-image/liberty-seguros-logo.jpg" alt="image">
						</a>
					</div>
					<div class="single-partner-item">
						<a href="#">
							<img src="assets/img/partner-image/porto_seguro.jpg" alt="image">
						</a>
					</div>
					<div class="single-partner-item">
						<a href="#">
							<img src="assets/img/partner-image/suhai_logo.jpg" alt="image">
						</a>
					</div>
					<div class="single-partner-item">
						<a href="#">
							<img src="assets/img/partner-image/sulamerica_logo.jpg" alt="image">
						</a>
					</div>
				</div>
			</div>
		</section>
		<!-- End Partner Area -->
		

		<!-- Start Why Choose Us Area -->
		<section class="why-choose-us-area">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-5 col-md-12">
						<div class="why-choose-us-slides owl-carousel owl-theme">
							<div class="why-choose-us-image bg1">
								<img src="assets/img/why-choose-img1.jpg" alt="image">
							</div>

							<div class="why-choose-us-image bg2">
								<img src="assets/img/why-choose-img2.jpg" alt="image">
							</div>

							<div class="why-choose-us-image bg3">
								<img src="assets/img/why-choose-img3.jpg" alt="image">
							</div>
						</div>
					</div>

					<div class="col-lg-7 col-md-12">
						<div class="why-choose-us-content">
							<div class="content">
								<div class="title">
									<span class="sub-title">Tenha esses beneficios</span>
									<h2>Porque ACTOSEG</h2>
									<p>Aqui alguns objetivos que seguimos para melhor atender-lo.</p>
								</div>

								<ul class="features-list">
									<li>
										<div class="icon">
											<i class="flaticon-like"></i>
										</div>
										<span>atendimento personalizado</span>
										Você será cadastrado e sempre identificado ao fazer uma consulta.
									</li>

									<li>
										<div class="icon">
											<i class="flaticon-customer-service"></i>
										</div>
										<span>suporte</span>
										Ao adquirir um produto na ActoSeg, você sempre tem o suporte necessário.
									</li>

									<li>
										<div class="icon">
											<i class="flaticon-care"></i>
										</div>
										<span>CLIENTE É PRIORIDADE</span>
										Iremos garantir sempre a melhor proteção.
									</li>

									<li>
										<div class="icon">
											<i class="flaticon-team"></i>
										</div>
										<span>SOMOS UMA PLATAFORMA</span>
										Serviços diferenciados com o objetivo de criarmos uma comunidade de clientes de seguros.
									</li>

									<li>
										<div class="icon">
											<i class="flaticon-policy"></i>
										</div>
										<span>PÓS VENDAS</span>
										Acompanharemos todos o processo do produto, do pedidos até a emissão da Apólice.
									</li>

									<li>
										<div class="icon">
											<i class="flaticon-education"></i>
										</div>
										<span>Cresça junto com a gente</span>
										Planos de bonificação para indicações de clientes e parcerias com empresas.
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Why Choose Us Area -->

		<!-- Start Quote Area -->
		<section class="quote-area ptb-100" id="envia_contato">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-12">
						<div class="quote-content">
							<h2>Peça uma Cotação Agora</h2>
							<p>Não deixe para depois, envie as informações e retornamos.</p>

							<div class="image">
								<img src="assets/img/img1.png" alt="image">
							</div>
						</div>
					</div>

					<div class="col-lg-6 col-md-12">
						<div class="tab quote-list-tab">
							<ul class="tabs">
								<li><a href="#" >Auto</a></li>
								<li><a href="#">Vida</a></li>
								<li><a href="#">Residência</a></li>
								<li><a href="#">Viagem</a></li>								
							</ul>
		
							<div class="tab_content">
								<div class="tabs_item">
									<p>Entramos em contato o mais rapido possível</p>
									<form>
										<div class="form-group">
											<asp:TextBox ID="txtNomeAuto" runat="server" class="form-control" placeholder="Nome"></asp:TextBox>
											<%--<input type="text" class="form-control" placeholder="Nome">--%>
										</div>
										<div class="form-group">
											<%--<input type="email" class="form-control" placeholder="E-mail">--%>
											<asp:TextBox ID="txtEmailAuto" runat="server" class="form-control" placeholder="E-mail"></asp:TextBox>
										</div>
										<div class="form-group">
											<%--<input type="text" class="form-control" placeholder="Telefone">--%>
											<asp:TextBox ID="txtTelefoneAuto" runat="server" class="form-control" placeholder="Telefone"></asp:TextBox>
										</div>
										<div class="form-group">
											<asp:DropDownList runat="server" ID="ddlAssuntoAuto" AppendDataBoundItems="true"> 
												<asp:ListItem Text="Escolha uma opção" Value="Escolha uma opção" />
												<asp:ListItem Text="Individual - Novo" Value="Individual - Novo" />
												<asp:ListItem Text="Individual - Usado" Value="Individual - Usado" />
												<asp:ListItem Text="Caminhão" Value="Caminhão" />
												<asp:ListItem Text="Moto" Value="Moto" />
												<asp:ListItem Text="Frota" Value="Frota" />
												<asp:ListItem Text="Antigos" Value="Antigos" />
											</asp:DropDownList>
											<%--<select>
												<option value="0">Escolha uma opção</option>
												<option value="1">Individual - Novo</option>
												<option value="2">Individual - Usado</option>
												<option value="4">Caminhão</option>
												<option value="5">Moto</option>
												<option value="6">Frota</option>
												<option value="7">Antigos</option>
											</select>--%>
										</div>
										<asp:Button id="bntAutoCotacao" runat="server"  Text="Cotação Auto " OnClick="bntAutoCotacao_Click" />
										<%--<button type="submit" class="default-btn">Cotação Agora <span></span></button>--%>
									</form>
								</div>
		
								<div class="tabs_item">
									<p>Entramos em contato o mais rapido possível</p>
									<form>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Nome">
										</div>
										<div class="form-group">
											<input type="email" class="form-control" placeholder="E-mail">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Telefone">
										</div>
										<div class="form-group">
											<select>
												<option value="0">Escolha a opção</option>
												<option value="1">Individual</option>
												<option value="2">Familiar</option>
												<option value="3">Empresarial</option>
												<option value="4">Grupo</option>
												<option value="5">Outro</option>												
											</select>
										</div>
										<button type="submit" class="default-btn">Cotação Agora <span></span></button>
									</form>
								</div>

								<div class="tabs_item">
									<p>Entramos em contato o mais rapido possível</p>
									<form>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Nome">
										</div>
										<div class="form-group">
											<input type="email" class="form-control" placeholder="E-mail">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Telefone">
										</div>
										<div class="form-group">
											<select>
												<option value="0">Escolha uma opção</option>
												<option value="1">Casa</option>
												<option value="2">Apartamento</option>
												<option value="3">Outro</option>																						
											</select>
										</div>
										<button type="submit" class="default-btn">Cotação Agora <span></span></button>
									</form>
								</div>

								<div class="tabs_item">
									<p>Entramos em contato o mais rapido possível</p>
									<form>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Nome">
										</div>
										<div class="form-group">
											<input type="email" class="form-control" placeholder="E-mail">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Telefone">
										</div>
										<div class="form-group">
											<select>
												<option value="0">Escolha uma opção</option>
												<option value="1">Lazer</option>												
												<option value="0">Negócios</option>
											</select>
										</div>
										<button type="submit" class="default-btn">Peça uma Cotação Agora <span></span></button>
									</form>
								</div>

								<%--<div class="tabs_item">
									<p>Entramos em contato o mais rapido possível</p>
									<form>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Nome">
										</div>
										<div class="form-group">
											<input type="email" class="form-control" placeholder="E-mail">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Telefone">
										</div>
										<div class="form-group">
											<select>
												<option value="0">Escolha a opção</option>
												<option value="1">Automóvel</option>
												<option value="2">Seguro de Vida</option>
												<option value="3">Saúde</option>
												<option value="4">Seguro Viagem</option>
												<option value="5">Outros Seguros</option>
											</select>
										</div>
										<button type="submit" class="default-btn">Peça uma Cotação Agora <span></span></button>
									</form>
								</div>--%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Quote Area -->

		<!-- Start CTR Area -->
		<section class="ctr-area">
			<div class="container">
				<div class="ctr-content">
					<h2>GARANTA O FUTURO DE QUEM VOCÊ AMA</h2>
					<p>Ter uma proteção, não pe realmente ter a melhor fechadura ou um carro blindado, mas também obter um produto que de fato irá garantir aquilo que realmente interessa.</p>
					<a href="#" class="default-btn">peça uma cotação<i class="flaticon-right-chevron"></i><span></span></a>
				</div>

				<div class="ctr-image">
					<img src="assets/img/ctr-img.jpg" alt="image">
				</div>

				<div class="shape">
					<img src="assets/img/bg-dot3.png" alt="image">
				</div>
			</div>
		</section>
		<!-- End CTR Area -->

		<!-- Start Feedback Area -->
		<%--<section class="feedback-area ptb-100">
			<div class="container">
				<div class="section-title">
					<span class="sub-title">Our Feedback</span>
					<h2>What client says</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				</div>

				<div class="feedback-slides">
					<div class="client-feedback">
						<div>
							<div class="item">
								<div class="single-feedback">
									<p>“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. Quis ipsum suspendisse ultrices gravida.”</p>
								</div>
							</div>
							
							<div class="item">
								<div class="single-feedback">
									<p>“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. Quis ipsum suspendisse ultrices gravida.”</p>
								</div>
							</div>
							
							<div class="item">
								<div class="single-feedback">
									<p>“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. Quis ipsum suspendisse ultrices gravida.”</p>
								</div>
							</div>
							
							<div class="item">
								<div class="single-feedback">
									<p>“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. Quis ipsum suspendisse ultrices gravida.”</p>
								</div>
							</div>
							
							<div class="item">
								<div class="single-feedback">
									<p>“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. Quis ipsum suspendisse ultrices gravida.”</p>
								</div>
							</div>
							
							<div class="item">
								<div class="single-feedback">
									<p>“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. Quis ipsum suspendisse ultrices gravida.”</p>
								</div>
							</div>
							
							<div class="item">
								<div class="single-feedback">
									<p>“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. Quis ipsum suspendisse ultrices gravida.”</p>
								</div>
							</div>
							
							<div class="item">
								<div class="single-feedback">
									<p>“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. Quis ipsum suspendisse ultrices gravida.”</p>
								</div>
							</div>
						</div>
						
						<button class="prev-arrow slick-arrow">
							<i class='flaticon-left-chevron'></i>
						</button>
						
						<button class="next-arrow slick-arrow">
							<i class='flaticon-right-chevron'></i>
						</button>
					</div>
					
					<div class="client-thumbnails">
						<div>
							<div class="item">
								<div class="img-fill"><img src="assets/img/client-image/2.jpg" alt="client"></div>
								
								<div class="title">
									<h3>Jonus Nathan</h3>
									<span>CEO at Envato</span>
								</div>
							</div>
							
							<div class="item">
								<div class="img-fill"><img src="assets/img/client-image/4.jpg" alt="client"></div>
								
								<div class="title">
									<h3>Sadio Finn</h3>
									<span>CEO at FlatIcon</span>
								</div>
							</div>
							
							<div class="item">
								<div class="img-fill"><img src="assets/img/client-image/1.jpg" alt="client"></div>
								
								<div class="title">
									<h3>Tom Olivar</h3>
									<span>CEO at ThemeForest</span>
								</div>
							</div>
							
							<div class="item">
								<div class="img-fill"><img src="assets/img/client-image/5.jpg" alt="client"></div>
								
								<div class="title">
									<h3>James Finn</h3>
									<span>CEO at GitLab</span>
								</div>
							</div>
							
							<div class="item">
								<div class="img-fill"><img src="assets/img/client-image/1.jpg" alt="client"></div>
								
								<div class="title">
									<h3>John Lucy</h3>
									<span>CEO at Linkedin</span>
								</div>
							</div>
							
							<div class="item">
								<div class="img-fill"><img src="assets/img/client-image/3.jpg" alt="client"></div>
								
								<div class="title">
									<h3>Sarah Taylor</h3>
									<span>CEO at Twitter</span>
								</div>
							</div>
							
							<div class="item">
								<div class="img-fill"><img src="assets/img/client-image/5.jpg" alt="client"></div>
								
								<div class="title">
									<h3>James Anderson</h3>
									<span>CEO at Facebook</span>
								</div>
							</div>
							
							<div class="item">
								<div class="img-fill"><img src="assets/img/client-image/3.jpg" alt="client"></div>
								
								<div class="title">
									<h3>Steven Smith</h3>
									<span>CEO at EnvyTheme</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>--%>
		<!-- End Feedback Area -->

		<%--<!-- Start Our Mission Area -->
		<section class="our-mission-area">
			<div class="container-fluid p-0">
				<div class="row m-0">
					<div class="col-lg-3 col-md-6 p-0">
						<div class="mission-image bg-1">
							<img src="assets/img/mission-img1.jpg" alt="image">
						</div>
					</div>

					<div class="col-lg-3 col-md-6 p-0">
						<div class="mission-text">
							<div class="icon">
								<i class="flaticon-target"></i>
							</div>

							<h3>Our Mission</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et.</p>

							<a href="#" class="default-btn">Learn More <span></span></a>

							<div class="shape"><img src="assets/img/bg-dot2.png" alt="image"></div>
						</div>
					</div>

					<div class="col-lg-3 col-md-6 p-0">
						<div class="mission-image bg-2">
							<img src="assets/img/mission-img2.jpg" alt="image">
						</div>
					</div>

					<div class="col-lg-3 col-md-6 p-0">
						<div class="mission-text">
							<div class="icon">
								<i class="flaticon-medal"></i>
							</div>

							<h3>Our History</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et.</p>

							<a href="#" class="default-btn">Learn More <span></span></a>

							<div class="shape"><img src="assets/img/bg-dot2.png" alt="image"></div>
						</div>
					</div>
				</div>
			</div>
		</section>--%>
		<!-- --End Our Mission Area -->
			</form>
	</body>
	

</html>

</asp:Content>

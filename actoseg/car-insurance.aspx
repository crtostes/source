﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="car-insurance.aspx.cs" Inherits="actoseg.car_insurance" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
< <head>
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

        <title>Pearo - Insurance Company HTML Template</title>

        <link rel="icon" type="image/png" href="assets/img/favicon.png">
    </head>

    <body>

      <%--  <!-- Preloader -->
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
                                <li><a href="#">Career</a></li>
                                <li><a href="#">Our Solutions</a></li>
                                <li><a href="#">Claims</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-7 col-md-12">
                            <div class="top-header-right-side">
                                <ul>
                                    <li>
                                        <div class="icon">
                                            <i class="flaticon-email"></i>
                                        </div>
                                        <span>Drop us an email:</span>
                                        <a href="#">info@pearo.com</a>
                                    </li>

                                    <li>
                                        <div class="icon">
                                            <i class="flaticon-call"></i>
                                        </div>
                                        <span>Call us:</span>
                                        <a href="#">+1 518 285679</a>
                                    </li>

                                    <li>
                                        <a href="#" class="default-btn">Get A Quote <span></span></a>
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
                                    <li class="nav-item"><a href="#" class="nav-link">Home <i class="flaticon-down-arrow"></i></a>
                                        <ul class="dropdown-menu">
                                            <li class="nav-item"><a href="index.html" class="nav-link">Home One</a></li>

                                            <li class="nav-item"><a href="index-2.html" class="nav-link">Home Two</a></li>

                                            <li class="nav-item"><a href="index-3.html" class="nav-link">Home Three</a></li>

                                            <li class="nav-item"><a href="index-4.html" class="nav-link">Home Four</a></li>
                                        </ul>
                                    </li>

                                    <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>

                                    <li class="nav-item"><a href="#" class="nav-link active">Insurance <i class="flaticon-down-arrow"></i></a>
                                        <ul class="dropdown-menu">
                                            <li class="nav-item"><a href="home-insurance.html" class="nav-link">Home Insurance</a></li>

                                            <li class="nav-item"><a href="business-insurance.html" class="nav-link">Business Insurance</a></li>

                                            <li class="nav-item"><a href="health-insurance.html" class="nav-link">Health Insurance</a></li>

                                            <li class="nav-item"><a href="travel-insurance.html" class="nav-link">Travel Insurance</a></li>

                                            <li class="nav-item"><a href="car-insurance.html" class="nav-link active">Car Insurance</a></li>

                                            <li class="nav-item"><a href="life-insurance.html" class="nav-link">Life Insurance</a></li>
                                        </ul>
                                    </li>

                                    <li class="nav-item"><a href="#" class="nav-link">Pages <i class="flaticon-down-arrow"></i></a>
                                        <ul class="dropdown-menu">
                                            <li class="nav-item"><a href="team.html" class="nav-link">Team</a></li>

                                            <li class="nav-item"><a href="#" class="nav-link">Services</a>
                                                <ul class="dropdown-menu">
                                                    <li class="nav-item"><a href="services-1.html" class="nav-link">Services Style 1</a></li>

                                                    <li class="nav-item"><a href="services-2.html" class="nav-link">Services Style 2</a></li>
                                                </ul>
                                            </li>

                                            <li class="nav-item"><a href="#" class="nav-link">Case Study</a>
                                                <ul class="dropdown-menu">
                                                    <li class="nav-item"><a href="case-study.html" class="nav-link">Case Study</a></li>

                                                    <li class="nav-item"><a href="single-case-study.html" class="nav-link">Case Study Details</a></li>
                                                </ul>
                                            </li>

                                            <li class="nav-item"><a href="#" class="nav-link">Events</a>
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

                                    <li class="nav-item"><a href="#" class="nav-link">Blog <i class="flaticon-down-arrow"></i></a>
                                        <ul class="dropdown-menu">
                                            <li class="nav-item"><a href="blog-1.html" class="nav-link">Blog Grid</a></li>

                                            <li class="nav-item"><a href="blog-2.html" class="nav-link">Blog Right Sidebar</a></li>

                                            <li class="nav-item"><a href="single-blog.html" class="nav-link">Blog Details</a></li>
                                        </ul>
                                    </li>

                                    <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
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
        <%--<div class="sidebar-modal">
            <div class="sidebar-modal-inner">
                <div class="sidebar-about-area">
                    <div class="title">
                        <h2>About Us</h2>
                        <p>We believe brand interaction is key in communication. Real innovations and a positive customer experience are the heart of successful communication. No fake products and services. The customer is king, their lives and needs are the inspiration.</p>
                    </div>
                </div>

                <div class="sidebar-instagram-feed">
                    <h2>Instagram</h2>

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
                                <a href="tel:+0881306298615">+088 130 629 8615</a>
                                <span>OR</span>
                                <a href="mailto:pearo@gmail.com">pearo@gmail.com</a>
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
        </div>--%>
        <!-- End Sidebar Modal -->

        <!-- Start Page Title Area -->
        <div class="page-title-area page-title-bg3">
            <div class="d-table">
                <div class="d-table-cell">
                    <div class="container">
                        <div class="page-title-content">
                            <h2>SEGURO DE AUTOMOVÉL</h2>
                            <ul>
                                <li><a href="index.html">INICIO</a></li>
                                <li>Seguro de Automovél</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Page Title Area -->

        <!-- Start Insurance Details Area -->
        <section class="insurance-details-area ptb-100">
            <div class="container">
                <div class="insurance-details-header">
                    <div class="row align-items-center">
                        <div class="col-lg-6 col-md-12">
                            <div class="image text-center">
                                <img src="assets/img/services-image/5.jpg" alt="image">
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12">
                            <div class="content">
                                <h3>Cote conosco o seu Seguro de Automovél Indique pessoas e ganhe bônus</h3>

                                <p>Aqui no site da Actoseg Corretora você pode preencher as informações referentes a sua necessidade ou de seus amigos.</p>
                                <p>Se voce preencher o campo "CPF do Indicador", assim ele irá ganhar bônus por indicação e você também pode indicar. </p>
                                <p>É só pedir para a pessoas indicada inserir o seu CPF no campo "CPF do Indicador".</p>
                                <p>Você também terá uma tela para ver suas indicacões, seus Status e seu saldo de bônus.</p>
                                <p>Com esses bônus você corre o risco de ter sua renovação de gratis, esse risco sim é bom hein!</p>
                                <p></p>
                                <div class="btn-box">
									<a class="default-btn" cf-scroll-trigger="#envia_contato" href="bkoficce/main/pages/cotacao.aspx">COTE AGORA<span></span></a>
									
								</div>
                            </div>
                        </div>

                        
                    </div>
                </div>

            <%--    <div class="insurance-details-desc">
                    <h3>Four major elements that we offer:</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>

                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <ul class="features-list">
                                <li><i class="fas fa-check"></i> Scientific Skills For getting a better result</li>
                                <li><i class="fas fa-check"></i> Communication Skills to getting in touch</li>
                                <li><i class="fas fa-check"></i> A Career Overview opportunity Available</li>
                                <li><i class="fas fa-check"></i> A good Work Environment For work</li>
                            </ul>
                        </div>

                        <div class="col-lg-6 col-md-6">
                            <ul class="features-list">
                                <li><i class="fas fa-check"></i> Scientific Skills For getting a better result</li>
                                <li><i class="fas fa-check"></i> Communication Skills to getting in touch</li>
                                <li><i class="fas fa-check"></i> A Career Overview opportunity Available</li>
                                <li><i class="fas fa-check"></i> A good Work Environment For work</li>
                            </ul>
                        </div>
                    </div>

                    <%--<h3>Setting the mood with incense</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>

                    <ul class="wp-block-gallery columns-3">
                        <li class="blocks-gallery-item">
                            <figure>
                                <img src="assets/img/services-image/1.jpg" alt="image">
                            </figure>
                        </li>

                        <li class="blocks-gallery-item">
                            <figure>
                                <img src="assets/img/services-image/2.jpg" alt="image">
                            </figure>
                        </li>

                        <li class="blocks-gallery-item">
                            <figure>
                                <img src="assets/img/services-image/3.jpg" alt="image">
                            </figure>
                        </li>
                    </ul>

                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>

                    <blockquote class="wp-block-quote">
                        <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>

                        <cite>Tom Cruise</cite>
                    </blockquote>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>

                    <div class="pearo-post-navigation">
                        <div class="prev-link-wrapper">
                            <div class="info-prev-link-wrapper">
                                <a href="#">
                                    <span class="image-prev">
                                        <img src="assets/img/services-image/1.jpg" alt="image">
                                        <span class="post-nav-title">Prev</span>
                                    </span>

                                    <span class="prev-link-info-wrapper">
                                        <span class="prev-title">Health Insurance</span>
                                        <span class="meta-wrapper">
                                            <span class="date-post">January 21, 2020</span>
                                        </span>
                                    </span>
                                </a>
                            </div>
                        </div>

                        <div class="next-link-wrapper">
                            <div class="info-next-link-wrapper">
                                <a href="#">
                                    <span class="next-link-info-wrapper">
                                        <span class="next-title">Life Insurance</span>
                                        <span class="meta-wrapper">
                                            <span class="date-post">January 21, 2020</span>
                                        </span>
                                    </span>

                                    <span class="image-next">
                                        <img src="assets/img/services-image/3.jpg" alt="image">
                                        <span class="post-nav-title">Next</span>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
        </section>
        <!-- End Insurance Details Area -->
        
    
        
        <div class="go-top"><i class="fas fa-chevron-up"></i><i class="fas fa-chevron-up"></i></div>
        
        <!-- jQuery Min JS -->
        <script src="assets/js/jquery.min.js"></script>
        <!-- Popper Min JS -->
        <script src="assets/js/popper.min.js"></script>
        <!-- Bootstrap Min JS -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- Parallax Min JS -->
        <script src="assets/js/parallax.min.js"></script>
        <!-- Owl Carousel Min JS -->
        <script src="assets/js/owl.carousel.min.js"></script>
        <!-- Slick Min JS -->
        <script src="assets/js/slick.min.js"></script>
        <!-- MeanMenu JS -->
        <script src="assets/js/jquery.meanmenu.js"></script>
        <!-- Appear Min JS -->
        <script src="assets/js/jquery.appear.min.js"></script>
        <!-- Odometer Min JS -->
        <script src="assets/js/odometer.min.js"></script>
        <!-- Nice Select Min JS -->
        <script src="assets/js/jquery.nice-select.min.js"></script>
        <!-- Magnific Popup Min JS -->
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <!-- WOW Min JS -->
        <script src="assets/js/wow.min.js"></script>
        <!-- AjaxChimp Min JS -->
        <script src="assets/js/jquery.ajaxchimp.min.js"></script>
        <!-- Form Validator Min JS -->
        <script src="assets/js/form-validator.min.js"></script>
        <!-- Contact Form Min JS -->
        <script src="assets/js/contact-form-script.js"></script>
        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
    </body>
</html>

    
</asp:Content>

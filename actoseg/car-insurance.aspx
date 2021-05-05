<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="car-insurance.aspx.cs" Inherits="actoseg.car_insurance" %>

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
									<a class="default-btn" cf-scroll-trigger="#envia_contato" href="/main/pages/login.aspx">COTE AGORA<span></span></a>
									
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

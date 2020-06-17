<%@ Page Language="C#"   AutoEventWireup="true" CodeBehind="cotacao.aspx.cs" Inherits="actoseg.bkoficce.cotacao" %>

<%--MasterPageFile="~/Site.Master"
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">--%>

 <!doctype html>
<html lang="zxx">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../images/favicon.ico">


    <title>ACTOSEG - COTAÇÃO SEGURO AUTOMOVÉL</title>
  
	<!-- Bootstrap 4.1-->
	<link rel="stylesheet" href="assets/vendor_components/bootstrap/dist/css/bootstrap.min.css">
	
	<!-- Bootstrap extend-->
	<link rel="stylesheet" href="css/bootstrap-extend.css">	
	
	<!-- Theme style -->
	<link rel="stylesheet" href="css/master_style.css">

	<!-- Bankio admin skins -->
	<link rel="stylesheet" href="css/skins/_all-skins.css">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
</head>
	
	<body>
		<form runat="server">



		<!-- Start Main Banner Area -->
		 <!-- tabs -->

      <div class="row">
        <div class="col-12">
          <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Fill</h4>
              <h6 class="subtitle">Use default tab with class <code>nav-tabs &amp; nav-fill </code></h6>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<ul class="nav nav-tabs nav-fill" role="tablist">
					<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home11" role="tab"><span class="hidden-sm-up"><i class="ion-home"></i></span> <span class="hidden-xs-down">Home</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile11" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">Profile</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages11" role="tab"><span class="hidden-sm-up"><i class="ion-email"></i></span> <span class="hidden-xs-down">Messages</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#info11" role="tab"><span class="hidden-sm-up"><i class="ion-email"></i></span> <span class="hidden-xs-down">Info</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#nots11" role="tab"><span class="hidden-sm-up"><i class="ion-email"></i></span> <span class="hidden-xs-down">Nots</span></a> </li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content tabcontent-border">
					<div class="tab-pane active" id="home11" role="tabpanel">
						<div class="pad">
							<h3>Donec vitae laoreet neque, id convallis ante.</h3>
							<h4>Fusce porta eros a nisl varius, non molestie metus mollis. Pellentesque tincidunt ante sit amet ornare lacinia.</h4>
							<p>Duis cursus eros lorem, pretium ornare purus tincidunt eleifend. Etiam quis justo vitae erat faucibus pharetra. Morbi in ullamcorper diam. Morbi lacinia, sem vitae dignissim cursus, massa nibh semper magna, nec pellentesque lorem nisl quis ex.</p>
						</div>
					</div>
					<div class="tab-pane pad" id="profile11" role="tabpanel">2</div>
					<div class="tab-pane pad" id="messages11" role="tabpanel">3</div>
					<div class="tab-pane pad" id="info11" role="tabpanel">4</div>
					<div class="tab-pane pad" id="nots11" role="tabpanel">5</div>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
		  
        <div class="col-12">
          <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Horizontal alignment</h4>
              <h6 class="subtitle">Use default tab with class <code>nav-tabs &amp; justify-content-center </code></h6>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<ul class="nav nav-tabs justify-content-center" role="tablist">
					<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home12" role="tab"><span class="hidden-sm-up"><i class="ion-home"></i></span> <span class="hidden-xs-down">Home</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile12" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">Profile</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages12" role="tab"><span class="hidden-sm-up"><i class="ion-email"></i></span> <span class="hidden-xs-down">Messages</span></a> </li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content tabcontent-border">
					<div class="tab-pane active" id="home12" role="tabpanel">
						<div class="pad">
							<h3>Donec vitae laoreet neque, id convallis ante.</h3>
							<h4>Fusce porta eros a nisl varius, non molestie metus mollis. Pellentesque tincidunt ante sit amet ornare lacinia.</h4>
							<p>Duis cursus eros lorem, pretium ornare purus tincidunt eleifend. Etiam quis justo vitae erat faucibus pharetra. Morbi in ullamcorper diam. Morbi lacinia, sem vitae dignissim cursus, massa nibh semper magna, nec pellentesque lorem nisl quis ex.</p>
						</div>
					</div>
					<div class="tab-pane pad" id="profile12" role="tabpanel">2</div>
					<div class="tab-pane pad" id="messages12" role="tabpanel">3</div>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
		  
        <div class="col-12">
          <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Horizontal alignment</h4>
              <h6 class="subtitle">Use default tab with class <code>nav-tabs &amp; justify-content-end </code></h6>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<ul class="nav nav-tabs justify-content-end" role="tablist">
					<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home13" role="tab"><span class="hidden-sm-up"><i class="ion-home"></i></span> <span class="hidden-xs-down">Home</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile13" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">Profile</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages13" role="tab"><span class="hidden-sm-up"><i class="ion-email"></i></span> <span class="hidden-xs-down">Messages</span></a> </li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content tabcontent-border">
					<div class="tab-pane active" id="home13" role="tabpanel">
						<div class="pad">
							<h3>Donec vitae laoreet neque, id convallis ante.</h3>
							<h4>Fusce porta eros a nisl varius, non molestie metus mollis. Pellentesque tincidunt ante sit amet ornare lacinia.</h4>
							<p>Duis cursus eros lorem, pretium ornare purus tincidunt eleifend. Etiam quis justo vitae erat faucibus pharetra. Morbi in ullamcorper diam. Morbi lacinia, sem vitae dignissim cursus, massa nibh semper magna, nec pellentesque lorem nisl quis ex.</p>
						</div>
					</div>
					<div class="tab-pane pad" id="profile13" role="tabpanel">2</div>
					<div class="tab-pane pad" id="messages13" role="tabpanel">3</div>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->	
		  
        <div class="col-12">
          <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Default Tab</h4>
              <h6 class="subtitle">Use default tab with class <code>nav-tabs &amp; tabcontent-border </code></h6>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home" role="tab"><span class="hidden-sm-up"><i class="ion-home"></i></span> <span class="hidden-xs-down">Home</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">Profile</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages" role="tab"><span class="hidden-sm-up"><i class="ion-email"></i></span> <span class="hidden-xs-down">Messages</span></a> </li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content tabcontent-border">
					<div class="tab-pane active" id="home" role="tabpanel">
						<div class="pad">
							<h3>Donec vitae laoreet neque, id convallis ante.</h3>
							<h4>Fusce porta eros a nisl varius, non molestie metus mollis. Pellentesque tincidunt ante sit amet ornare lacinia.</h4>
							<p>Duis cursus eros lorem, pretium ornare purus tincidunt eleifend. Etiam quis justo vitae erat faucibus pharetra. Morbi in ullamcorper diam. Morbi lacinia, sem vitae dignissim cursus, massa nibh semper magna, nec pellentesque lorem nisl quis ex.</p>
						</div>
					</div>
					<div class="tab-pane pad" id="profile" role="tabpanel">2</div>
					<div class="tab-pane pad" id="messages" role="tabpanel">3</div>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
        <div class="col-12">
          <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Customtab Tab</h4>
              <h6 class="subtitle">Use default tab with class <code>customtab</code></h6>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<ul class="nav nav-tabs customtab" role="tablist">
					<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home2" role="tab"><span class="hidden-sm-up"><i class="ion-home"></i></span> <span class="hidden-xs-down">Home</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile2" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">Profile</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages2" role="tab"><span class="hidden-sm-up"><i class="ion-email"></i></span> <span class="hidden-xs-down">Messages</span></a> </li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="home2" role="tabpanel">
						<div class="pad">
							<h3>Donec vitae laoreet neque, id convallis ante.</h3>
							<h4>Fusce porta eros a nisl varius, non molestie metus mollis. Pellentesque tincidunt ante sit amet ornare lacinia.</h4>
							<p>Duis cursus eros lorem, pretium ornare purus tincidunt eleifend. Etiam quis justo vitae erat faucibus pharetra. Morbi in ullamcorper diam. Morbi lacinia, sem vitae dignissim cursus, massa nibh semper magna, nec pellentesque lorem nisl quis ex.</p>
						</div>
					</div>
					<div class="tab-pane pad" id="profile2" role="tabpanel">2</div>
					<div class="tab-pane pad" id="messages2" role="tabpanel">3</div>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
        <div class="col-12">
          <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Vertical Tab</h4>
              <h6 class="subtitle">Use default tab with class <code>vtabs & tabs-vertical</code></h6>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<div class="vtabs">
					<ul class="nav nav-tabs tabs-vertical" role="tablist">
						<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home4" role="tab"><span class="hidden-sm-up"><i class="ion-home"></i></span> <span class="hidden-xs-down">Home</span> </a> </li>
						<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile4" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">Profile</span></a> </li>
						<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages4" role="tab"><span class="hidden-sm-up"><i class="ion-email"></i></span> <span class="hidden-xs-down">Messages</span></a> </li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div class="tab-pane active" id="home4" role="tabpanel">
							<div class="pad">
								<h3>Donec vitae laoreet neque, id convallis ante.</h3>
								<h4>Fusce porta eros a nisl varius, non molestie metus mollis. Pellentesque tincidunt ante sit amet ornare lacinia.</h4>
								<p>Duis cursus eros lorem, pretium ornare purus tincidunt eleifend. Etiam quis justo vitae erat faucibus pharetra. Morbi in ullamcorper diam. Morbi lacinia, sem vitae dignissim cursus, massa nibh semper magna, nec pellentesque lorem nisl quis ex.</p>
							</div>
						</div>
						<div class="tab-pane pad" id="profile4" role="tabpanel">2</div>
						<div class="tab-pane pad" id="messages4" role="tabpanel">3</div>
					</div>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
        <div class="col-12">
          <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Customtab vertical Tab</h4>
              <h6 class="subtitle">Use default tab with class <code>vtabs, tabs-vertical & customvtab</code></h6>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<div class="vtabs customvtab">
					<ul class="nav nav-tabs tabs-vertical" role="tablist">
						<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home3" role="tab" aria-expanded="true"><span class="hidden-sm-up"><i class="ion-home"></i></span> <span class="hidden-xs-down">Home</span> </a> </li>
						<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile3" role="tab" aria-expanded="false"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">Profile</span></a> </li>
						<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages3" role="tab" aria-expanded="false"><span class="hidden-sm-up"><i class="ion-email"></i></span> <span class="hidden-xs-down">Messages</span></a> </li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div class="tab-pane active" id="home3" role="tabpanel" aria-expanded="true">
							<div class="pad">
								<h3>Donec vitae laoreet neque, id convallis ante.</h3>
								<h4>Fusce porta eros a nisl varius, non molestie metus mollis. Pellentesque tincidunt ante sit amet ornare lacinia.</h4>
								<p>Duis cursus eros lorem, pretium ornare purus tincidunt eleifend. Etiam quis justo vitae erat faucibus pharetra. Morbi in ullamcorper diam. Morbi lacinia, sem vitae dignissim cursus, massa nibh semper magna, nec pellentesque lorem nisl quis ex.</p>
							</div>
						</div>
						<div class="tab-pane pad" id="profile3" role="tabpanel" aria-expanded="false">2</div>
						<div class="tab-pane pad" id="messages3" role="tabpanel" aria-expanded="false">3</div>
					</div>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
        <div class="col-12">
          <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Tab with dropdown</h4>
              <h6 class="subtitle">Use default tab with class <code>nav-tabs & tabcontent-border</code></h6>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"> <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home5" role="tab" aria-controls="home5" aria-expanded="true"><span class="hidden-sm-up"><i class="ion-home"></i></span> <span class="hidden-xs-down">Home</span></a> </li>
					<li class="nav-item"> <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile5" role="tab" aria-controls="profile"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">Profile</span></a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
							<span class="hidden-sm-up"><i class="ion-email"></i></span> <span class="hidden-xs-down">Dropdown</span>
						</a>
						<div class="dropdown-menu"> <a class="dropdown-item" id="dropdown1-tab" href="#dropdown1" role="tab" data-toggle="tab" aria-controls="dropdown1">@fat</a> <a class="dropdown-item" id="dropdown2-tab" href="#dropdown2" role="tab" data-toggle="tab" aria-controls="dropdown2">@mdo</a> </div>
					</li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content tabcontent-border pad" id="myTabContent">
					<div role="tabpanel" class="tab-pane fade show active" id="home5" aria-labelledby="home-tab">
						<p> Pellentesque posuere non mi nec feugiat. Sed mattis neque non nisi consequat fringilla. Mauris justo risus, mattis sollicitudin nulla ac, mattis mollis neque. Vestibulum eget ante magna. Aenean lobortis, neque ac consequat eleifend, eros tortor ultrices mi, a scelerisque mauris libero quis quam. Vivamus luctus dolor ac sodales suscipit. Aenean dictum nisi sapien, non sodales sem pellentesque nec.</p>
					</div>
					<div class="tab-pane fade" id="profile5" role="tabpanel" aria-labelledby="profile-tab">
						<p>Fusce porta eros a nisl varius, non molestie metus mollis. Pellentesque tincidunt ante sit amet ornare lacinia. Duis vitae feugiat purus. Nulla facilisi. Ut vitae euismod lorem. Donec sed pellentesque mi. Nullam quam urna, tincidunt eu metus sed, pretium luctus tellus. Integer viverra turpis urna, ut facilisis nulla luctus vitae. Maecenas blandit turpis pretium sollicitudin facilisis. Nam vitae aliquet massa, vel posuere tortor.</p>
					</div>
					<div class="tab-pane fade" id="dropdown1" role="tabpanel" aria-labelledby="dropdown1-tab">
						<p>Donec vitae laoreet neque, id convallis ante. Phasellus a tellus molestie, varius massa in, suscipit diam. Nulla vulputate, nisi eget porttitor semper, quam justo volutpat lacus, in pretium augue tortor at leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi at nisl fringilla, malesuada quam eu, eleifend odio. Nulla nunc orci, aliquam quis ligula vel, porttitor tempus nibh. Praesent semper fermentum massa. Proin id maximus metus, vitae ultricies ante. Duis tempus, arcu a vulputate congue, purus ex rutrum elit, at imperdiet nisi nibh at purus. Nunc in fringilla erat.</p>
					</div>
					<div class="tab-pane fade" id="dropdown2" role="tabpanel" aria-labelledby="dropdown2-tab">
						<p>Morbi ac mi vel tellus condimentum semper. In nec finibus erat. Sed ultrices ligula mi, a euismod metus egestas in. Nulla imperdiet neque at massa fringilla dignissim a id orci. Nam faucibus, ipsum interdum bibendum rutrum, libero odio vestibulum purus, non sollicitudin risus nunc et odio. Vestibulum volutpat, ante sit amet dignissim imperdiet, diam diam sodales orci, in gravida lorem erat eu diam. Nulla lorem nunc, ultrices ac dignissim et, dignissim nec lacus. Praesent euismod lorem eget justo lacinia rutrum sed at mi. Fusce commodo eros a vulputate accumsan.</p>
					</div>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
        <div class="col-12">
          <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Customtab2 Tab</h4>
              <h6 class="subtitle">Use default tab with class <code>customtab</code></h6>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<ul class="nav nav-tabs customtab2" role="tablist">
					<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home7" role="tab"><span class="hidden-sm-up"><i class="ion-home"></i></span> <span class="hidden-xs-down">Home</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile7" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">Profile</span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages7" role="tab"><span class="hidden-sm-up"><i class="ion-email"></i></span> <span class="hidden-xs-down">Messages</span></a> </li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="home7" role="tabpanel">
						<div class="pad">
							<h3>Donec vitae laoreet neque, id convallis ante.</h3>
							<h4>Fusce porta eros a nisl varius, non molestie metus mollis. Pellentesque tincidunt ante sit amet ornare lacinia.</h4>
							<p>Duis cursus eros lorem, pretium ornare purus tincidunt eleifend. Etiam quis justo vitae erat faucibus pharetra. Morbi in ullamcorper diam. Morbi lacinia, sem vitae dignissim cursus, massa nibh semper magna, nec pellentesque lorem nisl quis ex.</p>
						</div>
					</div>
					<div class="tab-pane pad" id="profile7" role="tabpanel">2</div>
					<div class="tab-pane pad" id="messages7" role="tabpanel">3</div>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
        <div class="col-12">
          <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Nav Pills Tabs</h4>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<ul class="nav nav-pills margin-bottom margin-top-10">
					<li class=" nav-item"> <a href="#navpills-1" class="nav-link active" data-toggle="tab" aria-expanded="false">Tab One</a> </li>
					<li class="nav-item"> <a href="#navpills-2" class="nav-link" data-toggle="tab" aria-expanded="false">Tab Two</a> </li>
					<li class="nav-item"> <a href="#navpills-3" class="nav-link" data-toggle="tab" aria-expanded="true">Tab Three</a> </li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div id="navpills-1" class="tab-pane active">
						<div class="row">
							<div class="col-md-4"> <img src="../../images/card/img1.jpg" class="img-fluid" alt=""> </div>
							<div class="col-md-8">Morbi ac mi vel tellus condimentum semper. In nec finibus erat. Sed ultrices ligula mi, a euismod metus egestas in. Nulla imperdiet neque at massa fringilla dignissim a id orci. Nam faucibus, ipsum interdum bibendum rutrum, libero odio vestibulum purus, non sollicitudin risus nunc et odio.
								<p>
									<br/> Vestibulum volutpat, ante sit amet dignissim imperdiet, diam diam sodales orci, in gravida lorem erat eu diam. Nulla lorem nunc, ultrices ac dignissim et, dignissim nec lacus. Praesent euismod lorem eget justo lacinia rutrum sed at mi.</p>
							</div>
						</div>
					</div>
					<div id="navpills-2" class="tab-pane">
						<div class="row">
							<div class="col-md-8"> Morbi ac mi vel tellus condimentum semper. In nec finibus erat. Sed ultrices ligula mi, a euismod metus egestas in. Nulla imperdiet neque at massa fringilla dignissim a id orci. Nam faucibus, ipsum interdum bibendum rutrum, libero odio vestibulum purus, non sollicitudin risus nunc et odio.
								<p>
									<br/> Vestibulum volutpat, ante sit amet dignissim imperdiet, diam diam sodales orci, in gravida lorem erat eu diam. Nulla lorem nunc, ultrices ac dignissim et, dignissim nec lacus. Praesent euismod lorem eget justo lacinia rutrum sed at mi.</p>
							</div>
							<div class="col-md-4"> <img src="../../images/card/img2.jpg" class="img-fluid" alt=""> </div>
						</div>
					</div>
					<div id="navpills-3" class="tab-pane">
						<div class="row">
							<div class="col-md-4"> <img src="../../images/card/img3.jpg" class="img-fluid" alt=""> </div>
							<div class="col-md-8"> Morbi ac mi vel tellus condimentum semper. In nec finibus erat. Sed ultrices ligula mi, a euismod metus egestas in. Nulla imperdiet neque at massa fringilla dignissim a id orci. Nam faucibus, ipsum interdum bibendum rutrum, libero odio vestibulum purus, non sollicitudin risus nunc et odio.
								<p>
									<br/> Vestibulum volutpat, ante sit amet dignissim imperdiet, diam diam sodales orci, in gravida lorem erat eu diam. Nulla lorem nunc, ultrices ac dignissim et, dignissim nec lacus. Praesent euismod lorem eget justo lacinia rutrum sed at mi.</p>
							</div>
						</div>
					</div>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
        <div class="col-12">
          <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Nav Pills Tabs</h4>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<ul class="nav nav-pills justify-content-end margin-bottom margin-top-10">
					<li class=" nav-item"> <a href="#navpills2-1" class="nav-link active" data-toggle="tab" aria-expanded="false">Tab One</a> </li>
					<li class="nav-item"> <a href="#navpills2-2" class="nav-link" data-toggle="tab" aria-expanded="false">Tab Two</a> </li>
					<li class="nav-item"> <a href="#navpills2-3" class="nav-link" data-toggle="tab" aria-expanded="true">Tab Three</a> </li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div id="navpills2-1" class="tab-pane active">
						<div class="row">
							<div class="col-md-4"> <img src="../../images/card/img1.jpg" class="img-fluid" alt=""> </div>
							<div class="col-md-8"> Morbi ac mi vel tellus condimentum semper. In nec finibus erat. Sed ultrices ligula mi, a euismod metus egestas in. Nulla imperdiet neque at massa fringilla dignissim a id orci. Nam faucibus, ipsum interdum bibendum rutrum, libero odio vestibulum purus, non sollicitudin risus nunc et odio.
								<p>
									<br/> Vestibulum volutpat, ante sit amet dignissim imperdiet, diam diam sodales orci, in gravida lorem erat eu diam. Nulla lorem nunc, ultrices ac dignissim et, dignissim nec lacus. Praesent euismod lorem eget justo lacinia rutrum sed at mi.</p>
							</div>
						</div>
					</div>
					<div id="navpills2-2" class="tab-pane">
						<div class="row">
							<div class="col-md-8"> Morbi ac mi vel tellus condimentum semper. In nec finibus erat. Sed ultrices ligula mi, a euismod metus egestas in. Nulla imperdiet neque at massa fringilla dignissim a id orci. Nam faucibus, ipsum interdum bibendum rutrum, libero odio vestibulum purus, non sollicitudin risus nunc et odio.
								<p>
									<br/> Vestibulum volutpat, ante sit amet dignissim imperdiet, diam diam sodales orci, in gravida lorem erat eu diam. Nulla lorem nunc, ultrices ac dignissim et, dignissim nec lacus. Praesent euismod lorem eget justo lacinia rutrum sed at mi.</p>
							</div>
							<div class="col-md-4"> <img src="../../images/card/img2.jpg" class="img-fluid" alt=""> </div>
						</div>
					</div>
					<div id="navpills2-3" class="tab-pane">
						<div class="row">
							<div class="col-md-4"> <img src="../../images/card/img3.jpg" class="img-fluid" alt=""> </div>
							<div class="col-md-8"> Morbi ac mi vel tellus condimentum semper. In nec finibus erat. Sed ultrices ligula mi, a euismod metus egestas in. Nulla imperdiet neque at massa fringilla dignissim a id orci. Nam faucibus, ipsum interdum bibendum rutrum, libero odio vestibulum purus, non sollicitudin risus nunc et odio.
								<p>
									<br/> Vestibulum volutpat, ante sit amet dignissim imperdiet, diam diam sodales orci, in gravida lorem erat eu diam. Nulla lorem nunc, ultrices ac dignissim et, dignissim nec lacus. Praesent euismod lorem eget justo lacinia rutrum sed at mi.</p>
							</div>
						</div>
					</div>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
        <div class="col-12">
          <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Tab with icon</h4>
              <h6 class="subtitle">Use default tab with class <code>nav-tabs &amp; tabcontent-border </code></h6>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home8" role="tab"><span><i class="ion-home"></i></span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile8" role="tab"><span><i class="ion-person"></i></span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages8" role="tab"><span><i class="ion-email"></i></span></a> </li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content tabcontent-border">
					<div class="tab-pane active" id="home8" role="tabpanel">
						<div class="pad">
							<h3>Donec vitae laoreet neque, id convallis ante.</h3>
							<h4>Fusce porta eros a nisl varius, non molestie metus mollis. Pellentesque tincidunt ante sit amet ornare lacinia.</h4>
							<p>Duis cursus eros lorem, pretium ornare purus tincidunt eleifend. Etiam quis justo vitae erat faucibus pharetra. Morbi in ullamcorper diam. Morbi lacinia, sem vitae dignissim cursus, massa nibh semper magna, nec pellentesque lorem nisl quis ex.</p>
						</div>
					</div>
					<div class="tab-pane pad" id="profile8" role="tabpanel">2</div>
					<div class="tab-pane pad" id="messages8" role="tabpanel">3</div>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
        <div class="col-12">
          <div class="box">
            <div class="box-header with-border bg-light">
              <h3 class="box-title">Customtab vertical Tab Icon</h3>
              <h6 class="subtitle">Use default tab with class <code>vtabs & tabs-vertical</code></h6>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<div class="vtabs">
					<ul class="nav nav-tabs tabs-vertical" role="tablist">
						<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home9" role="tab"><span><i class="ion-home"></i></span></a> </li>
						<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile9" role="tab"><span><i class="ion-person"></i></span></a> </li>
						<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages9" role="tab"><span><i class="ion-email"></i></span></a> </li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div class="tab-pane active" id="home9" role="tabpanel">
							<div class="pad">
								<h3>Donec vitae laoreet neque, id convallis ante.</h3>
							<h4>Fusce porta eros a nisl varius, non molestie metus mollis. Pellentesque tincidunt ante sit amet ornare lacinia.</h4>
							<p>Duis cursus eros lorem, pretium ornare purus tincidunt eleifend. Etiam quis justo vitae erat faucibus pharetra. Morbi in ullamcorper diam. Morbi lacinia, sem vitae dignissim cursus, massa nibh semper magna, nec pellentesque lorem nisl quis ex.</p>
							</div>
						</div>
						<div class="tab-pane pad" id="profile9" role="tabpanel">2</div>
						<div class="tab-pane pad" id="messages9" role="tabpanel">3</div>
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
		<!-- End Main Banner Area -->

		
			</form>

		
	</body>
	

</html>

<%--</asp:Content>--%>
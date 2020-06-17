﻿<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../images/favicon.ico">

    <title>Bankio admin - Dashboard  Tab  UI </title>
  
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
  	<!-- Sidebar toggle button-->
	 <%-- <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
		<span class="sr-only">Toggle navigation</span>
	  </a>
    <!-- Logo -->
    <a href="../index.html" class="logo">
      <!-- mini logo -->
	  <b class="logo-mini">
		  <span class="light-logo"><img src="../../images/logo-light.png" alt="logo"></span>
		  <span class="dark-logo"><img src="../../images/logo-dark.png" alt="logo"></span>
	  </b>
      <!-- logo-->
      <span class="logo-lg">
		  <img src="../../images/logo-light-text.png" alt="logo" class="light-logo">
	  	  <img src="../../images/logo-dark-text.png" alt="logo" class="dark-logo">
	  </span>
    </a>--%>
    <!-- Header Navbar -->
    <%--<nav class="navbar navbar-static-top">
	  <div class="ml-10 app-menu">
		<ul class="header-megamenu nav">
			<li class="btn-group nav-item">
				<a href="#" class="nav-link rounded" data-provide="fullscreen" title="Full Screen">
					<i class="mdi mdi-crop-free"></i>
				</a>
			</li>
			<li class="btn-group nav-item">
				<a href="#" class="nav-link rounded" data-toggle="dropdown" aria-expanded="false">
					<i class="nav-link-icon mdi mdi-view-dashboard text-white mx-5"> </i>
					Mega Menu
					<i class="fa fa-angle-down ml-2"></i>
				</a>
				<div class="dropdown-menu dropdown-grid">
					<div class="dropdown-mega-menu">
						<div class="row">
							<div class="col-lg-4 col-12">
								<ul class="nav flex-column">
									<li class="nav-item-header nav-item">
										Overview
									</li>
									<li class="nav-item">
										<a href="javascript:void(0);" class="nav-link">
											<i class="nav-link-icon fa fa-inbox">
											</i>
											<span>
												Contacts
											</span>
										</a>
									</li>
									<li class="nav-item">
										<a href="javascript:void(0);" class="nav-link">
											<i class="nav-link-icon fa fa-book">
											</i>
											<span>
												Incidents
											</span>
											<div class="ml-auto badge badge-pill badge-danger">5
											</div>
										</a>
									</li>
									<li class="nav-item">
										<a href="javascript:void(0);" class="nav-link">
											<i class="nav-link-icon fa fa-picture-o">
											</i>
											<span>
												Companies
											</span>
										</a>
									</li>
									<li class="nav-item">
										<a href="javascript:void(0);" class="nav-link disabled">
											<i class="nav-link-icon fa fa-dashboard">
											</i>
											<span>
												Dashboards
											</span>
										</a>
									</li>
								</ul>
							</div>
							<div class="col-lg-4 col-12 bx-1">
								<ul class="nav flex-column">
									<li class="nav-item-header nav-item">
										Favourites
									</li>
									<li class="nav-item">
										<a href="javascript:void(0);" class="nav-link">
											Reports Conversions
										</a>
									</li>
									<li class="nav-item">
										<a href="javascript:void(0);" class="nav-link">
											Quick Start
											<div class="ml-auto badge badge-success">New</div>
										</a>
									</li>
									<li class="nav-item">
										<a href="javascript:void(0);" class="nav-link">Users &amp; Groups</a>
									</li>
									<li class="nav-item">
										<a href="javascript:void(0);" class="nav-link">Proprieties</a>
									</li>
								</ul>
							</div>
							<div class="col-lg-4 col-12">
								<ul class="nav flex-column">
									<li class="nav-item-header nav-item">
										Sales & Marketing
									</li>
									<li class="nav-item">
										<a href="javascript:void(0);" class="nav-link">Queues
										</a>
									</li>
									<li class="nav-item">
										<a href="javascript:void(0);" class="nav-link">Resource Groups
										</a>
									</li>
									<li class="nav-item">
										<a href="javascript:void(0);" class="nav-link">Goal Metrics
											<div class="ml-auto badge badge-warning">3
											</div>
										</a>
									</li>
									<li class="nav-item">
										<a href="javascript:void(0);" class="nav-link">Campaigns
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</li>
			<li class="btn-group nav-item">
				<a href="#" class="nav-link rounded" data-toggle="dropdown" aria-expanded="false">
					<span class="badge badge-pill badge-danger ml-0 mr-2">4</span>
					Settings
					<i class="fa fa-angle-down ml-2"></i>
				</a>
				<div class="dropdown-menu">
					<div class="dropdown-menu-header-inner bg-img" style="background-image: url('../../images/gallery/landscape1.jpg');" data-overlay="5">
						<div class="px-10 py-20 w-250 text-center">
							<h5 class="text-white">Overview</h5>
							<h6 class="text-white mb-0">Dropdown menus for everyone</h6>
						</div>
					</div>
					<div>
						<h4 class="dropdown-header py-15 text-gray font-size-18">Key Figures</h4>
						<button type="button" class="btn btn-flat btn-light w-p100 text-left no-radius"><i class="fa fa-folder mr-10"> </i>Service Calendar</button>
						<button type="button" class="btn btn-flat btn-light w-p100 text-left no-radius"><i class="fa fa-folder mr-10"> </i>Knowledge Base</button>
						<button type="button" class="btn btn-flat btn-light w-p100 text-left no-radius"><i class="fa fa-folder mr-10"> </i>Accounts</button>
						<div tabindex="-1" class="dropdown-divider"></div>
						<button type="button" class="btn btn-flat btn-light w-p100 text-left no-radius"><i class="fa fa-folder mr-10"> </i>Products</button>
						<button type="button" class="btn btn-flat btn-light w-p100 text-left no-radius"><i class="fa fa-folder mr-10"> </i>Rollup Queries</button>
					</div>
					<ul class="nav flex-column p-20">
						<li class="nav-item-divider nav-item"></li>
						<li class="nav-item-btn nav-item">
							<button class="btn-wide btn-shadow btn btn-danger btn-sm">Cancel</button>
						</li>
					</ul>
				  </div>
			</li>
			<li class="dropdown nav-item">
				<a href="#" aria-haspopup="true"  data-toggle="dropdown" class="nav-link rounded" aria-expanded="false">
					<i class="nav-link-icon fa fa-cogs mx-5 text-white"></i>
					Projects
					<i class="fa fa-angle-down ml-2"></i>
				</a>
				<div class="dropdown-menu">
					<div class="dropdown-menu-header-inner bg-img" style="background-image: url('../../images/gallery/landscape1.jpg');" data-overlay="5">
						<div class="p-30 text-left w-250">
							<h5 class="text-white">Overview</h5>
							<h6 class="text-white">Unlimited options</h6>
							<div class="menu-header-btn-pane">
								<button class="mr-2 btn btn-success btn-sm">Settings</button>
								<button class="btn-icon btn-icon-only btn btn-info btn-sm">
									<i class="fa fa-cog"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="p-10">
						<button type="button" class="btn btn-flat btn-light w-p100 text-left"><i class="fa fa-folder mr-10"> </i>Graphic Design</button>
						<button type="button" class="btn btn-flat btn-light w-p100 text-left"><i class="fa fa-folder mr-10"> </i>App Development</button>
						<button type="button" class="btn btn-flat btn-light w-p100 text-left"><i class="fa fa-folder mr-10"> </i>Icon Design</button>
						<div tabindex="-1" class="dropdown-divider"></div>
						<button type="button" class="btn btn-flat btn-light w-p100 text-left"><i class="fa fa-folder mr-10"> </i>Miscellaneous</button>
						<button type="button" class="btn btn-flat btn-light w-p100 text-left"><i class="fa fa-folder mr-10"> </i>Frontend Dev</button>
					</div>
				  </div>
			</li>
		</ul> 
	  </div>
		
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
		  
		  <li class="search-box">
            <a class="nav-link hidden-sm-down" href="javascript:void(0)"><i class="ti-search"></i></a>
            <form class="app-search" style="display: none;">
                <input type="text" class="form-control" placeholder="Search &amp; enter"> <a class="srh-btn"><i class="ti-close"></i></a>
			</form>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a class="control-btn" href="#" data-toggle="control-sidebar"><i class="ti-settings"></i></a>
          </li>			  
          <!-- Messages -->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="ti-email"></i><span class="label label-success">5</span>
            </a>
            <ul class="dropdown-menu scale-up">
              <li class="header">You have 5 messages</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu inner-content-div">
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <img src="../../images/user2-160x160.jpg" class="rounded-circle" alt="User Image">
                      </div>
                      <div class="mail-contnet">
                         <h4>
                          Lorem Ipsum
                          <small><i class="fa fa-clock-o"></i> 15 mins</small>
                         </h4>
                         <span>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span>
                      </div>
                    </a>
                  </li>
                  <!-- end message -->
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="../../images/user3-128x128.jpg" class="rounded-circle" alt="User Image">
                      </div>
                      <div class="mail-contnet">
                         <h4>
                          Nullam tempor
                          <small><i class="fa fa-clock-o"></i> 4 hours</small>
                         </h4>
                         <span>Curabitur facilisis erat quis metus congue viverra.</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="../../images/user4-128x128.jpg" class="rounded-circle" alt="User Image">
                      </div>
                      <div class="mail-contnet">
                         <h4>
                          Proin venenatis
                          <small><i class="fa fa-clock-o"></i> Today</small>
                         </h4>
                         <span>Vestibulum nec ligula nec quam sodales rutrum sed luctus.</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="../../images/user3-128x128.jpg" class="rounded-circle" alt="User Image">
                      </div>
                      <div class="mail-contnet">
                         <h4>
                          Praesent suscipit
                        <small><i class="fa fa-clock-o"></i> Yesterday</small>
                         </h4>
                         <span>Curabitur quis risus aliquet, luctus arcu nec, venenatis neque.</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="../../images/user4-128x128.jpg" class="rounded-circle" alt="User Image">
                      </div>
                      <div class="mail-contnet">
                         <h4>
                          Donec tempor
                          <small><i class="fa fa-clock-o"></i> 2 days</small>
                         </h4>
                         <span>Praesent vitae tellus eget nibh lacinia pretium.</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">See all e-Mails</a></li>
            </ul>
          </li>
		  <!-- User Account-->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="../../images/user5-128x128.jpg" class="user-image rounded-circle b-2" alt="User Image">
            </a>
            <ul class="dropdown-menu scale-up">
              <!-- Menu Body -->
              <li class="user-body bt-0">
                <div class="row no-gutters">
                  <div class="col-12 text-left">
                    <a href="#"><i class="ion ion-person"></i> My Profile</a>
                  </div>
                  <div class="col-12 text-left">
                    <a href="#"><i class="ion ion-email-unread"></i> Inbox</a>
                  </div>
                  <div class="col-12 text-left">
                    <a href="#"><i class="ion ion-settings"></i> Setting</a>
                  </div>
				<div role="separator" class="divider col-12"></div>
				  <div class="col-12 text-left">
                    <a href="#"><i class="ti-settings"></i> Account</a>
                  </div>
				<div role="separator" class="divider col-12"></div>
				  <div class="col-12 text-left">
                    <a href="#"><i class="fa fa-power-off"></i> Logout</a>
                  </div>				
                </div>
                <!-- /.row -->
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>--%>
  </header>
  
  <!-- Left side column. contains the logo and sidebar -->
 <%-- <aside class="main-sidebar">
    <!-- sidebar-->
    <section class="sidebar">
      
      <!-- sidebar menu-->
      <ul class="sidebar-menu" data-widget="tree">
        
         <li class="treeview">
          <a href="#">
            <i class="ti-dashboard"></i>
            <span>Dashboard</span>
            <span class="pull-right-container">
              <i class="fa fa-caret-down pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="../index.html"><i class="fa fa-circle-thin"></i>Dashboard 1</a></li>
            <li><a href="../index2.html"><i class="fa fa-circle-thin"></i>Dashboard 2</a></li>
			<li><a href="../index3.html"><i class="fa fa-circle-thin"></i>Dashboard 3</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-apps"></i>
            <span>App</span>
            <span class="pull-right-container">
              <i class="fa fa-caret-down pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="app-chat.html"><i class="fa fa-circle-thin"></i>Chat app</a></li>
            <li><a href="app-contact.html"><i class="fa fa-circle-thin"></i>Contact / Employee</a></li>
			<li><a href="app-calendar.html"><i class="fa fa-circle-thin"></i>Calendar</a></li>
            <li><a href="app-profile.html"><i class="fa fa-circle-thin"></i>Profile</a></li>
            <li><a href="app-userlist-grid.html"><i class="fa fa-circle-thin"></i>Userlist Grid</a></li>
          </ul>
        </li>
        <li>
          <a href="mailbox.html">
            <i class="mdi mdi-email"></i> <span>Mailbox</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-warning">12</small>
            </span>
          </a>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="mdi mdi-presentation"></i> <span>Pages</span>
            <span class="pull-right-container">
              <i class="fa fa-caret-down pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="page-blank.html"><i class="fa fa-circle-thin"></i>Blank</a></li>
            <li><a href="page-coming-soon.html"><i class="fa fa-circle-thin"></i>Coming Soon</a></li>
			<li><a href="page-faq.html"><i class="fa fa-circle-thin"></i>FAQ</a></li>
			<li><a href="page-gallery.html"><i class="fa fa-circle-thin"></i>Gallery</a></li>
			<li><a href="page-invoice.html"><i class="fa fa-circle-thin"></i>Invoice</a></li>
			<li><a href="page-pace.html"><i class="fa fa-circle-thin"></i>Pace</a></li>
			<li><a href="page-pricing.html"><i class="fa fa-circle-thin"></i>Pricing</a></li>
          </ul>
        </li>  		
		  
        <li class="treeview active">
          <a href="#">
            <i class="mdi mdi-animation"></i>
            <span>UI Elements</span>
            <span class="pull-right-container">
              <i class="fa fa-caret-down pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="ui-border-utilities.html"><i class="fa fa-circle-thin"></i>Border</a></li>
            <li><a href="ui-buttons.html"><i class="fa fa-circle-thin"></i>Buttons</a></li>
            <li><a href="ui-color-utilities.html"><i class="fa fa-circle-thin"></i>Color</a></li>
            <li><a href="ui-dropdown.html"><i class="fa fa-circle-thin"></i>Dropdown</a></li>
            <li><a href="ui-general.html"><i class="fa fa-circle-thin"></i>General</a></li>
            <li><a href="ui-icons.html"><i class="fa fa-circle-thin"></i>Icons</a></li>
            <li><a href="ui-media-advanced.html"><i class="fa fa-circle-thin"></i>Advanced Medias</a></li>
			<li><a href="ui-modals.html"><i class="fa fa-circle-thin"></i>Modals</a></li>
            <li><a href="ui-notification.html"><i class="fa fa-circle-thin"></i>Notification</a></li>
            <li><a href="ui-portlet-draggable.html"><i class="fa fa-circle-thin"></i>Draggable Portlets</a></li>
            <li><a href="ui-ribbons.html"><i class="fa fa-circle-thin"></i>Ribbons</a></li>
            <li><a href="ui-sliders.html"><i class="fa fa-circle-thin"></i>Sliders</a></li>
            <li><a href="ui-sweatalert.html"><i class="fa fa-circle-thin"></i>Sweet Alert</a></li>
            <li class="active"><a href="ui-tab.html"><i class="fa fa-circle-thin"></i>Tabs</a></li>
            <li><a href="ui-timeline.html"><i class="fa fa-circle-thin"></i>Timeline</a></li>
          </ul>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="mdi mdi-vector-difference"></i>
            <span>Widgets</span>
            <span class="pull-right-container">
              <i class="fa fa-caret-down pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="widgets.html"><i class="fa fa-circle-thin"></i>Widgets</a></li>
            <li><a href="widgets-chart.html"><i class="fa fa-circle-thin"></i>Chart</a></li>
            <li><a href="widgets-statistic.html"><i class="fa fa-circle-thin"></i>Statistic</a></li>
            <li><a href="widgets-weather.html"><i class="fa fa-circle-thin"></i>Weather</a></li>
          </ul>
        </li>		
		<li class="treeview">
          <a href="#">
            <i class="mdi mdi-vector-square"></i>
            <span>Box</span>
            <span class="pull-right-container">
              <i class="fa fa-caret-down pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="box-advanced.html"><i class="fa fa-circle-thin"></i>Advanced</a></li>
            <li><a href="box-basic.html"><i class="fa fa-circle-thin"></i>Basic</a></li>
            <li><a href="box-color.html"><i class="fa fa-circle-thin"></i>Color</a></li>
			<li><a href="box-group.html"><i class="fa fa-circle-thin"></i>Group</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-chart-pie"></i>
            <span>Charts</span>
            <span class="pull-right-container">
              <i class="fa fa-caret-down pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="chart-chartjs.html"><i class="fa fa-circle-thin"></i>ChartJS</a></li>
            <li><a href="chart-flot.html"><i class="fa fa-circle-thin"></i>Flot</a></li>
            <li><a href="chart-inline.html"><i class="fa fa-circle-thin"></i>Inline charts</a></li>
            <li><a href="chart-morris.html"><i class="fa fa-circle-thin"></i>Morris</a></li>
            <li><a href="chart-peity.html"><i class="fa fa-circle-thin"></i>Peity</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-format-page-break"></i> <span>Forms</span>
            <span class="pull-right-container">
              <i class="fa fa-caret-down pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="forms-advanced.html"><i class="fa fa-circle-thin"></i>Advanced Elements</a></li>
            <li><a href="forms-code-editor.html"><i class="fa fa-circle-thin"></i>Code Editor</a></li>
            <li><a href="forms-editors.html"><i class="fa fa-circle-thin"></i>Editors</a></li>
            <li><a href="forms-validation.html"><i class="fa fa-circle-thin"></i>Form Validation</a></li>
            <li><a href="forms-wizard.html"><i class="fa fa-circle-thin"></i>Form Wizard</a></li>
            <li><a href="forms-general.html"><i class="fa fa-circle-thin"></i>General Elements</a></li>
            <li><a href="forms-mask.html"><i class="fa fa-circle-thin"></i>Formatter</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-table-column-width"></i> <span>Tables</span>
            <span class="pull-right-container">
              <i class="fa fa-caret-down pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="tables-simple.html"><i class="fa fa-circle-thin"></i>Simple tables</a></li>
            <li><a href="tables-data.html"><i class="fa fa-circle-thin"></i>Data tables</a></li>
            <li><a href="tables-editable.html"><i class="fa fa-circle-thin"></i>Editable Tables</a></li>
          </ul>
        </li>
        		
		<li class="treeview">
		  <a href="#"><i class="mdi mdi-all-inclusive"></i> <span>Authentication</span> 
			<span class="pull-right-container">
			  <i class="fa fa-caret-down pull-right"></i>
			</span>
		  </a>
		  <ul class="treeview-menu">
			<li><a href="auth-login.html"><i class="fa fa-circle"></i>Login</a></li>
			<li><a href="auth-register.html"><i class="fa fa-circle"></i>Register</a></li>
			<li><a href="auth-lockscreen.html"><i class="fa fa-circle"></i>Lockscreen</a></li>
			<li><a href="auth-user-pass.html"><i class="fa fa-circle"></i>Recover password</a></li>				  
		  </ul>
		</li>            
		<li class="treeview">
		  <a href="#"><i class="mdi mdi-alert"></i> <span>Error Pages</span> 
			<span class="pull-right-container">
			  <i class="fa fa-caret-down pull-right"></i>
			</span>
		  </a>
		  <ul class="treeview-menu">
			<li><a href="error-404.html"><i class="fa fa-circle"></i>404</a></li>
			<li><a href="error-500.html"><i class="fa fa-circle"></i>500</a></li>
			<li><a href="error-maintenance.html"><i class="fa fa-circle"></i>Maintenance</a></li>		  
		  </ul>
		</li> 
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-map-marker-circle"></i> <span>Map</span>
            <span class="pull-right-container">
              <i class="fa fa-caret-down pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="map-google.html"><i class="fa fa-circle-thin"></i>Google Map</a></li>
            <li><a href="map-vector.html"><i class="fa fa-circle-thin"></i>Vector Map</a></li>
          </ul>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="mdi mdi-power-plug"></i> <span>Extension</span>
            <span class="pull-right-container">
              <i class="fa fa-caret-down pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="extension-fullscreen.html"><i class="fa fa-circle-thin"></i>Fullscreen</a></li>
          </ul>
        </li>        
		
        <li class="treeview">
          <a href="#">
            <i class="fa fa-share"></i> <span>Multilevel</span>
            <span class="pull-right-container">
              <i class="fa fa-caret-down pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#">Level One</a></li>
            <li class="treeview">
              <a href="#">Level One
                <span class="pull-right-container">
              <i class="fa fa-caret-down pull-right"></i>
            </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="#">Level Two</a></li>
                <li class="treeview">
                  <a href="#">Level Two
                    <span class="pull-right-container">
              <i class="fa fa-caret-down pull-right"></i>
            </span>
                  </a>
                  <ul class="treeview-menu">
                    <li><a href="#">Level Three</a></li>
                    <li><a href="#">Level Three</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li><a href="#">Level One</a></li>
          </ul>
        </li>        
        
      </ul>
    </section>
  </aside>--%>

  <!-- Content Wrapper. Contains page content -->
  <div class="">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Tabs
      </h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i> Home</a></li>
        <li class="breadcrumb-item"><a href="#">UI</a></li>
        <li class="breadcrumb-item active">Tabs</li>
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
							<h3>Donec vitae laoreet neque, id convallis ante.</h3>
							<h4>Fusce porta eros a nisl varius, non molestie metus mollis. Pellentesque tincidunt ante sit amet ornare lacinia.</h4>
							<p>Duis cursus eros lorem, pretium ornare purus tincidunt eleifend. Etiam quis justo vitae erat faucibus pharetra. Morbi in ullamcorper diam. Morbi lacinia, sem vitae dignissim cursus, massa nibh semper magna, nec pellentesque lorem nisl quis ex.</p>
						</div>
					</div>
					<div class="tab-pane pad" id="profile11" role="tabpanel">2</div>
					<div class="tab-pane pad" id="messages11" role="tabpanel">3</div>
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
			<a class="nav-link" href="javascript:void(0)">FAQ</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="#">Purchase Now</a>
		  </li>
		</ul>
    </div>
	  &copy; 2019 <a href="https://www.multipurposethemes.com/">Multi-Purpose Themes</a>. All Rights Reserved.
  </footer>
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-light">
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
  </aside>
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

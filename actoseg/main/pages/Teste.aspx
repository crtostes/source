<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teste.aspx.cs" Inherits="actoseg.main.pages.Teste" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../images/favicon.ico">

    <title>Bankio admin - Dashboard  Advanced form elements </title>
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
	
	<!-- This is data table -->
    <script src="../../assets/vendor_components/datatable/datatables.min.js"></script>
	
	<!-- Bankio admin for Data Table -->
	<script src="../js/pages/data-table.js"></script>
	<script src="../js/pages/project-table.js"></script>
	<%--<!-- Bootstrap 4.1-->
	<link rel="stylesheet" href="../../assets/vendor_components/bootstrap/dist/css/bootstrap.min.css">
	
	<!-- Bootstrap extend-->
	<link rel="stylesheet" href="../css/bootstrap-extend.css">

	<!-- Select2 -->
	<link rel="stylesheet" href="../../assets/vendor_components/select2/dist/css/select2.min.css">	
	
	<!-- Theme style -->
	<link rel="stylesheet" href="../css/master_style.css">

	<!-- Bankio admin skins -->
	<link rel="stylesheet" href="../css/skins/_all-skins.css">--%>


	<!-- Bootstrap 4.1-->
	<link rel="stylesheet" href="../../assets/vendor_components/bootstrap/dist/css/bootstrap.min.css">
	
	<!-- Bootstrap extend-->
	<link rel="stylesheet" href="../css/bootstrap-extend.css">	
	
    <!-- Select2 -->
	<link rel="stylesheet" href="../../assets/vendor_components/select2/dist/css/select2.min.css">	

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
	
      <!-- Formatter -->
    <script src="../../assets/vendor_components/formatter/formatter.js"></script>
    <script src="../../assets/vendor_components/formatter/jquery.formatter.js"></script>

	<!-- Bankio admin App -->
	<script src="../js/template.js"></script>
	
	<script src="../js/pages/formatter.js"></script>


	<!-- jQuery ui -->
	<script src="../../assets/vendor_components/jquery-ui/jquery-ui.js"></script>
	
	<!-- popper -->
	<script src="../../assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap 4.0-->
	<script src="../../assets/vendor_components/bootstrap/dist/js/bootstrap.js"></script>	
	
	<!-- Slimscroll -->
	<script src="../../assets/vendor_components/jquery-slimscroll/jquery.slimscroll.js"></script>
	
	<!-- FastClick -->
	<script src="../../assets/vendor_components/fastclick/lib/fastclick.js"></script>
	
	<!-- peity -->
	<script src="../../assets/vendor_components/jquery.peity/jquery.peity.js"></script>
	
	<!-- Sparkline -->
	<script src="../../assets/vendor_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
	
	<!-- ChartJS -->
	<script src="../../assets/vendor_components/chart.js-master/Chart.bundle.js"></script>
	<script src="../../assets/vendor_components/chart.js-master/utils.js"></script>
	
	<!-- apexcharts -->
	<script src="../../assets/vendor_components/apexcharts-bundle/irregular-data-series.js"></script>
	<script src="../../assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
	
	<!-- weather for demo purposes -->
	<script src="../../assets/vendor_plugins/weather-icons/WeatherIcon.js"></script>
		
	<!-- weather weather -->
	<link rel="stylesheet" href="../../assets/vendor_components/weather-icons/weather-icons.css">	

		<!-- Bankio admin App -->
	<script src="js/template.js"></script>
	
	<!-- Bankio admin dashboard demo (This is only for demo purposes) -->
	<script src="../js/pages/dashboard.js"></script>
</head>
<body class="hold-transition skin-black sidebar-mini">
    <form id="form1" runat="server">
<div class="wrapper">


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    

    <!-- Main content -->
    <section class="content">
		
	  <div class="row">
		  
    
		  
		<div class="col-12">
		  <!-- SELECT2 EXAMPLE -->
		  <div class="box">
            <div class="box-header with-border bg-light">
			  <h4 class="box-title">Select Elements</h4>
				<ul class="box-controls pull-right">
				  <li><a class="box-btn-close" href="#"></a></li>
				  <li><a class="box-btn-slide" href="#"></a></li>	
				</ul>
			</div>
			<!-- /.box-header -->
			<div class="box-body pb-0">
			  <div class="row">
				<div class="col-md-3 col-12">
				  <div class="form-group">
					<label>Minimal</label>
					<select class="form-control select2" style="width: 100%;">
					  <option selected="selected">Alabama</option>
					  <option>Alaska</option>
					  <option>California</option>
					  <option>Delaware</option>
					  <option>Tennessee</option>
					  <option>Texas</option>
					  <option>Washington</option>
					</select>
				  </div>
				  <!-- /.form-group -->
				</div>
				<!-- /.col -->
				<div class="col-md-3 col-12">
				  <div class="form-group">
					<label>Disabled</label>
					<select class="form-control select2" disabled="disabled" style="width: 100%;">
					  <option selected="selected">Alabama</option>
					  <option>Alaska</option>
					  <option>California</option>
					  <option>Delaware</option>
					  <option>Tennessee</option>
					  <option>Texas</option>
					  <option>Washington</option>
					</select>
				  </div>
				  <!-- /.form-group -->
				</div>
				<!-- /.col -->
				<div class="col-md-3 col-12">
				  <div class="form-group">
					<label>Multiple</label>
					<select class="form-control select2" multiple="multiple" data-placeholder="Select a State"
							style="width: 100%;">
					  <option>Alabama</option>
					  <option>Alaska</option>
					  <option>California</option>
					  <option>Delaware</option>
					  <option>Tennessee</option>
					  <option>Texas</option>
					  <option>Washington</option>
					</select>
				  </div>
				  <!-- /.form-group -->
				</div>
				<!-- /.col -->
				<div class="col-md-3 col-12">
				  <div class="form-group">
					<label>Disabled Result</label>
					<select class="form-control select2" style="width: 100%;">
					  <option selected="selected">Alabama</option>
					  <option>Alaska</option>
					  <option disabled="disabled">California (disabled)</option>
					  <option>Delaware</option>
					  <option>Tennessee</option>
					  <option>Texas</option>
					  <option>Washington</option>
					</select>
				  </div>
				  <!-- /.form-group -->
				</div>
				<!-- /.col -->
			  </div>
			  <!-- /.row -->
			</div>
			<!-- /.box-body -->
		  </div>
		  <!-- /.box -->
        </div>
		  
	
      

          
              <!-- /input-group -->
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" Width="238px" />
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  

  <!-- /.control-sidebar -->
  
  <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

	<%--<!-- jQuery 3 -->
	<script src="../../assets/vendor_components/jquery-3.3.1/jquery-3.3.1.js"></script>
	
	<!-- fullscreen -->
	<script src="../../assets/vendor_components/screenfull/screenfull.js"></script>
	
	<!-- popper -->
	<script src="../../assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap 4.1-->
	<script src="../../assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>--%>
	
	<%--<!-- Bootstrap Select -->
	<script src="../../assets/vendor_components/bootstrap-select/dist/js/bootstrap-select.js"></script>
	
	<!-- Bootstrap tagsinput -->
	<script src="../../assets/vendor_components/bootstrap-tagsinput/dist/bootstrap-tagsinput.js"></script>
	
	<!-- Bootstrap touchspin -->
	<script src="../../assets/vendor_components/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>--%>
	
	<!-- Select2 -->
	<script src="../../assets/vendor_components/select2/dist/js/select2.full.js"></script>
	
<%--	<!-- InputMask -->
	<script src="../../assets/vendor_plugins/input-mask/jquery.inputmask.js"></script>
	<script src="../../assets/vendor_plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="../../assets/vendor_plugins/input-mask/jquery.inputmask.extensions.js"></script>
	--%>
<%--	<!-- date-range-picker -->
	<script src="../../assets/vendor_components/moment/min/moment.min.js"></script>
	<script src="../../assets/vendor_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	
	<!-- bootstrap datepicker -->
	<script src="../../assets/vendor_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	
	<!-- bootstrap color picker -->
	<script src="../../assets/vendor_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
	
	<!-- bootstrap time picker -->
	<script src="../../assets/vendor_plugins/timepicker/bootstrap-timepicker.min.js"></script>
	
	<!-- SlimScroll -->
	<script src="../../assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	
	<!-- iCheck 1.0.1 -->
	<script src="../../assets/vendor_plugins/iCheck/icheck.min.js"></script>
	
	<!-- FastClick -->
	<script src="../../assets/vendor_components/fastclick/lib/fastclick.js"></script>
	
	<!-- Bankio admin App -->
	<script src="../js/template.js"></script>
	--%>
	
	
	<!-- Bankio admin for advanced form element -->
	<script src="../js/pages/advanced-form-element.js"></script>
	<script>
		$(document).ready(function () {
			alert("Onload");
        });
        function InserirLinha ()
        {
            //inclui uma nova linha
            var index = 2;
            novaLinha = "<tr>" +
                            "<td class='id'>CLI1033</td>" +
                            "<td class='nome'>Jessica</td>" +
                            "<td class='email'>jessicalang@net.com</td>" +
                            "<td class='idade'>22</td>" +
                        "</tr>";
            $('#tblClientes > tbody > tr').eq(index-1).before(novaLinha); // incluir como segunda linha
        };
       
        function RemoverTodasLinhas() {
            // remove todas as linhas exceto o header
            $('#tblClientes tbody tr').remove();
        };
        function InserirLinhaNoFim() {
            // inclui uma nova linha no fim da tabela
            novaLinha = "<tr>" +
                "<td class='id'>CLI1035</td>" +
                "<td class='nome'>Jefferson</td>" +
                "<td class='email'>jeff@bol.com.br</td>" +
                "<td class='idade'>21</td>" +
            "</tr>";
            $('#tblClientes > tbody > tr:last').after(novaLinha);
        };
    </script>
	<div>
    <table id="tblClientes">
    <thead>
        <tr>
            <th class="id">Codigo</th>
            <th class="nome">Nome</th>
            <th class="email">Email</th>
            <th class="idade">Idade</th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <td colspan="5">
                <a href="http://www.macoratti.net">Quase tudo para Visual Basic, C# e ASP .NET</a>
            </td>
        </tr>
    </tfoot>
    <tbody>
        <tr>
            <td class="id">CLI1042</td>
            <td class="nome">Macoratti</td>
            <td class="email">macoratti@yahoo.com</td>
            <td class="idade">45</td>
        </tr>
        <tr>
            <td class="id">CLI1043</td>
            <td class="nome">Macoratti.net (Facebook)</td>
            <td class="email">https://www.facebook.com/Macoratti.net?ref=hl</td>
            <td class="idade">3</td>
        </tr>
        ...
    </tbody>
   </table>

<%--		Button -  ID="btnInserLinhaIndice" Text="Inserir Linha"            OnClientClick="InserirLinha(); return false;"
Button -  ID="btnInserirLinhaFim"  Text="Inserir linha no Fim"   OnClientClick="InserirLinhaNoFim(); return false;"
Button -  ID="btnRemoverLinhas"  Text="Remover Linhas"        OnClientClick="RemoverTodasLinhas(); return false;"--%>

		<button id="btnInserLinhaIndice" class="btn btn-xs btn-danger"  OnClick="InserirLinha(); return false;">Inserir Linha</button>
		<button id="btnInserirLinhaFim" class="btn btn-xs btn-danger" OnClick="InserirLinhaNoFim(); return false;">Inserir linha no Fim</button>
		<button id="btnRemoverLinhas" class="btn btn-xs btn-danger" OnClick="RemoverTodasLinhas(); return false;">Remover Linhas</button>
  </div>
	 <section class="content">
      <div class="row">		
        <div class="col-12">                
         <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Data Table With Full Features</h4>
			  <div class="box-controls pull-right">
                 <button id="row-count" class="btn btn-xs btn-primary">Row count</button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
				<div class="table-responsive">
				  <table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Name</th>
							<th>Position</th>
							<th>Office</th>
							<th>Age</th>
							<th>Start date</th>
							<th>Salary</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Tiger Nixon</td>
							<td>System Architect</td>
							<td>Edinburgh</td>
							<td>61</td>
							<td>2011/04/25</td>
							<td>$320,800</td>
						</tr>
						<tr>
							<td>Garrett Winters</td>
							<td>Accountant</td>
							<td>Tokyo</td>
							<td>63</td>
							<td>2011/07/25</td>
							<td>$170,750</td>
						</tr>
						<tr>
							<td>Ashton Cox</td>
							<td>Junior Technical Author</td>
							<td>San Francisco</td>
							<td>66</td>
							<td>2009/01/12</td>
							<td>$86,000</td>
						</tr>
						<tr>
							<td>Cedric Kelly</td>
							<td>Senior Javascript Developer</td>
							<td>Edinburgh</td>
							<td>22</td>
							<td>2012/03/29</td>
							<td>$433,060</td>
						</tr>
						<tr>
							<td>Airi Satou</td>
							<td>Accountant</td>
							<td>Tokyo</td>
							<td>33</td>
							<td>2008/11/28</td>
							<td>$162,700</td>
						</tr>
						<tr>
							<td>Brielle Williamson</td>
							<td>Integration Specialist</td>
							<td>New York</td>
							<td>61</td>
							<td>2012/12/02</td>
							<td>$372,000</td>
						</tr>
						<tr>
							<td>Herrod Chandler</td>
							<td>Sales Assistant</td>
							<td>San Francisco</td>
							<td>59</td>
							<td>2012/08/06</td>
							<td>$137,500</td>
						</tr>
						<tr>
							<td>Rhona Davidson</td>
							<td>Integration Specialist</td>
							<td>Tokyo</td>
							<td>55</td>
							<td>2010/10/14</td>
							<td>$327,900</td>
						</tr>
						<tr>
							<td>Colleen Hurst</td>
							<td>Javascript Developer</td>
							<td>San Francisco</td>
							<td>39</td>
							<td>2009/09/15</td>
							<td>$205,500</td>
						</tr>
						<tr>
							<td>Sonya Frost</td>
							<td>Software Engineer</td>
							<td>Edinburgh</td>
							<td>23</td>
							<td>2008/12/13</td>
							<td>$103,600</td>
						</tr>
						<tr>
							<td>Jena Gaines</td>
							<td>Office Manager</td>
							<td>London</td>
							<td>30</td>
							<td>2008/12/19</td>
							<td>$90,560</td>
						</tr>
						<tr>
							<td>Quinn Flynn</td>
							<td>Support Lead</td>
							<td>Edinburgh</td>
							<td>22</td>
							<td>2013/03/03</td>
							<td>$342,000</td>
						</tr>
						<tr>
							<td>Charde Marshall</td>
							<td>Regional Director</td>
							<td>San Francisco</td>
							<td>36</td>
							<td>2008/10/16</td>
							<td>$470,600</td>
						</tr>
						<tr>
							<td>Haley Kennedy</td>
							<td>Senior Marketing Designer</td>
							<td>London</td>
							<td>43</td>
							<td>2012/12/18</td>
							<td>$313,500</td>
						</tr>
						<tr>
							<td>Tatyana Fitzpatrick</td>
							<td>Regional Director</td>
							<td>London</td>
							<td>19</td>
							<td>2010/03/17</td>
							<td>$385,750</td>
						</tr>
						<tr>
							<td>Michael Silva</td>
							<td>Marketing Designer</td>
							<td>London</td>
							<td>66</td>
							<td>2012/11/27</td>
							<td>$198,500</td>
						</tr>
						<tr>
							<td>Paul Byrd</td>
							<td>Chief Financial Officer (CFO)</td>
							<td>New York</td>
							<td>64</td>
							<td>2010/06/09</td>
							<td>$725,000</td>
						</tr>
						<tr>
							<td>Gloria Little</td>
							<td>Systems Administrator</td>
							<td>New York</td>
							<td>59</td>
							<td>2009/04/10</td>
							<td>$237,500</td>
						</tr>
						<tr>
							<td>Bradley Greer</td>
							<td>Software Engineer</td>
							<td>London</td>
							<td>41</td>
							<td>2012/10/13</td>
							<td>$132,000</td>
						</tr>
						<tr>
							<td>Dai Rios</td>
							<td>Personnel Lead</td>
							<td>Edinburgh</td>
							<td>35</td>
							<td>2012/09/26</td>
							<td>$217,500</td>
						</tr>
						<tr>
							<td>Jenette Caldwell</td>
							<td>Development Lead</td>
							<td>New York</td>
							<td>30</td>
							<td>2011/09/03</td>
							<td>$345,000</td>
						</tr>
						<tr>
							<td>Yuri Berry</td>
							<td>Chief Marketing Officer (CMO)</td>
							<td>New York</td>
							<td>40</td>
							<td>2009/06/25</td>
							<td>$675,000</td>
						</tr>
						<tr>
							<td>Caesar Vance</td>
							<td>Pre-Sales Support</td>
							<td>New York</td>
							<td>21</td>
							<td>2011/12/12</td>
							<td>$106,450</td>
						</tr>
						<tr>
							<td>Doris Wilder</td>
							<td>Sales Assistant</td>
							<td>Sidney</td>
							<td>23</td>
							<td>2010/09/20</td>
							<td>$85,600</td>
						</tr>
						<tr>
							<td>Angelica Ramos</td>
							<td>Chief Executive Officer (CEO)</td>
							<td>London</td>
							<td>47</td>
							<td>2009/10/09</td>
							<td>$1,200,000</td>
						</tr>
						<tr>
							<td>Gavin Joyce</td>
							<td>Developer</td>
							<td>Edinburgh</td>
							<td>42</td>
							<td>2010/12/22</td>
							<td>$92,575</td>
						</tr>
						<tr>
							<td>Jennifer Chang</td>
							<td>Regional Director</td>
							<td>Singapore</td>
							<td>28</td>
							<td>2010/11/14</td>
							<td>$357,650</td>
						</tr>
						<tr>
							<td>Brenden Wagner</td>
							<td>Software Engineer</td>
							<td>San Francisco</td>
							<td>28</td>
							<td>2011/06/07</td>
							<td>$206,850</td>
						</tr>
						<tr>
							<td>Fiona Green</td>
							<td>Chief Operating Officer (COO)</td>
							<td>San Francisco</td>
							<td>48</td>
							<td>2010/03/11</td>
							<td>$850,000</td>
						</tr>
						<tr>
							<td>Shou Itou</td>
							<td>Regional Marketing</td>
							<td>Tokyo</td>
							<td>20</td>
							<td>2011/08/14</td>
							<td>$163,000</td>
						</tr>
						<tr>
							<td>Michelle House</td>
							<td>Integration Specialist</td>
							<td>Sidney</td>
							<td>37</td>
							<td>2011/06/02</td>
							<td>$95,400</td>
						</tr>
						<tr>
							<td>Suki Burks</td>
							<td>Developer</td>
							<td>London</td>
							<td>53</td>
							<td>2009/10/22</td>
							<td>$114,500</td>
						</tr>
						<tr>
							<td>Prescott Bartlett</td>
							<td>Technical Author</td>
							<td>London</td>
							<td>27</td>
							<td>2011/05/07</td>
							<td>$145,000</td>
						</tr>
						<tr>
							<td>Gavin Cortez</td>
							<td>Team Leader</td>
							<td>San Francisco</td>
							<td>22</td>
							<td>2008/10/26</td>
							<td>$235,500</td>
						</tr>
						<tr>
							<td>Martena Mccray</td>
							<td>Post-Sales support</td>
							<td>Edinburgh</td>
							<td>46</td>
							<td>2011/03/09</td>
							<td>$324,050</td>
						</tr>
						<tr>
							<td>Unity Butler</td>
							<td>Marketing Designer</td>
							<td>San Francisco</td>
							<td>47</td>
							<td>2009/12/09</td>
							<td>$85,675</td>
						</tr>
						<tr>
							<td>Howard Hatfield</td>
							<td>Office Manager</td>
							<td>San Francisco</td>
							<td>51</td>
							<td>2008/12/16</td>
							<td>$164,500</td>
						</tr>
						<tr>
							<td>Hope Fuentes</td>
							<td>Secretary</td>
							<td>San Francisco</td>

							<td>41</td>
							<td>2010/02/12</td>
							<td>$109,850</td>
						</tr>
						<tr>
							<td>Vivian Harrell</td>
							<td>Financial Controller</td>
							<td>San Francisco</td>
							<td>62</td>
							<td>2009/02/14</td>
							<td>$452,500</td>
						</tr>
						<tr>
							<td>Timothy Mooney</td>
							<td>Office Manager</td>
							<td>London</td>
							<td>37</td>
							<td>2008/12/11</td>
							<td>$136,200</td>
						</tr>
						<tr>
							<td>Jackson Bradshaw</td>
							<td>Director</td>
							<td>New York</td>
							<td>65</td>
							<td>2008/09/26</td>
							<td>$645,750</td>
						</tr>
						<tr>
							<td>Olivia Liang</td>
							<td>Support Engineer</td>
							<td>Singapore</td>
							<td>64</td>
							<td>2011/02/03</td>
							<td>$234,500</td>
						</tr>
						<tr>
							<td>Bruno Nash</td>
							<td>Software Engineer</td>
							<td>London</td>
							<td>38</td>
							<td>2011/05/03</td>
							<td>$163,500</td>
						</tr>
						<tr>
							<td>Sakura Yamamoto</td>
							<td>Support Engineer</td>
							<td>Tokyo</td>
							<td>37</td>
							<td>2009/08/19</td>
							<td>$139,575</td>
						</tr>
						<tr>
							<td>Thor Walton</td>
							<td>Developer</td>
							<td>New York</td>
							<td>61</td>
							<td>2013/08/11</td>
							<td>$98,540</td>
						</tr>
						<tr>
							<td>Finn Camacho</td>
							<td>Support Engineer</td>
							<td>San Francisco</td>
							<td>47</td>
							<td>2009/07/07</td>
							<td>$87,500</td>
						</tr>
						<tr>
							<td>Serge Baldwin</td>
							<td>Data Coordinator</td>
							<td>Singapore</td>
							<td>64</td>
							<td>2012/04/09</td>
							<td>$138,575</td>
						</tr>
						<tr>
							<td>Zenaida Frank</td>
							<td>Software Engineer</td>
							<td>New York</td>
							<td>63</td>
							<td>2010/01/04</td>
							<td>$125,250</td>
						</tr>
						<tr>
							<td>Zorita Serrano</td>
							<td>Software Engineer</td>
							<td>San Francisco</td>
							<td>56</td>
							<td>2012/06/01</td>
							<td>$115,000</td>
						</tr>
						<tr>
							<td>Jennifer Acosta</td>
							<td>Junior Javascript Developer</td>
							<td>Edinburgh</td>
							<td>43</td>
							<td>2013/02/01</td>
							<td>$75,650</td>
						</tr>
						<tr>
							<td>Cara Stevens</td>
							<td>Sales Assistant</td>
							<td>New York</td>
							<td>46</td>
							<td>2011/12/06</td>
							<td>$145,600</td>
						</tr>
						<tr>
							<td>Hermione Butler</td>
							<td>Regional Director</td>
							<td>London</td>
							<td>47</td>
							<td>2011/03/21</td>
							<td>$356,250</td>
						</tr>
						<tr>
							<td>Lael Greer</td>
							<td>Systems Administrator</td>
							<td>London</td>
							<td>21</td>
							<td>2009/02/27</td>
							<td>$103,500</td>
						</tr>
						<tr>
							<td>Jonas Alexander</td>
							<td>Developer</td>
							<td>San Francisco</td>
							<td>30</td>
							<td>2010/07/14</td>
							<td>$86,500</td>
						</tr>
						<tr>
							<td>Shad Decker</td>
							<td>Regional Director</td>
							<td>Edinburgh</td>
							<td>51</td>
							<td>2008/11/13</td>
							<td>$183,000</td>
						</tr>
						<tr>
							<td>Michael Bruce</td>
							<td>Javascript Developer</td>
							<td>Singapore</td>
							<td>29</td>
							<td>2011/06/27</td>
							<td>$183,000</td>
						</tr>
						<tr>
							<td>Donna Snider</td>
							<td>Customer Support</td>
							<td>New York</td>
							<td>27</td>
							<td>2011/01/25</td>
							<td>$112,000</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>Name</th>
							<th>Position</th>
							<th>Office</th>
							<th>Age</th>
							<th>Start date</th>
							<th>Salary</th>
						</tr>
					</tfoot>
				  </table>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Hover Export Data Table</h4>
              <h6 class="subtitle">Export data to Copy, CSV, Excel, PDF & Print</h6>
			  <div class="box-controls pull-right">
				  <button id="row-remove" class="btn btn-xs btn-danger">Delete selected row</button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
				<div class="table-responsive">
				  <table id="example" class="table table-bordered table-hover display nowrap margin-top-10 w-p100">
					<thead>
						<tr>
							<th>Name</th>
							<th>Position</th>
							<th>Office</th>
							<th>Age</th>
							<th>Start date</th>
							<th>Salary</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Tiger Nixon</td>
							<td>System Architect</td>
							<td>Edinburgh</td>
							<td>61</td>
							<td>2011/04/25</td>
							<td>$320,800</td>
						</tr>
						<tr>
							<td>Garrett Winters</td>
							<td>Accountant</td>
							<td>Tokyo</td>
							<td>63</td>
							<td>2011/07/25</td>
							<td>$170,750</td>
						</tr>
						<tr>
							<td>Ashton Cox</td>
							<td>Junior Technical Author</td>
							<td>San Francisco</td>
							<td>66</td>
							<td>2009/01/12</td>
							<td>$86,000</td>
						</tr>
						<tr>
							<td>Cedric Kelly</td>
							<td>Senior Javascript Developer</td>
							<td>Edinburgh</td>
							<td>22</td>
							<td>2012/03/29</td>
							<td>$433,060</td>
						</tr>
						<tr>
							<td>Airi Satou</td>
							<td>Accountant</td>
							<td>Tokyo</td>
							<td>33</td>
							<td>2008/11/28</td>
							<td>$162,700</td>
						</tr>
						<tr>
							<td>Brielle Williamson</td>
							<td>Integration Specialist</td>
							<td>New York</td>
							<td>61</td>
							<td>2012/12/02</td>
							<td>$372,000</td>
						</tr>
						<tr>
							<td>Herrod Chandler</td>
							<td>Sales Assistant</td>
							<td>San Francisco</td>
							<td>59</td>
							<td>2012/08/06</td>
							<td>$137,500</td>
						</tr>
						<tr>
							<td>Rhona Davidson</td>
							<td>Integration Specialist</td>
							<td>Tokyo</td>
							<td>55</td>
							<td>2010/10/14</td>
							<td>$327,900</td>
						</tr>
						<tr>
							<td>Colleen Hurst</td>
							<td>Javascript Developer</td>
							<td>San Francisco</td>
							<td>39</td>
							<td>2009/09/15</td>
							<td>$205,500</td>
						</tr>
						<tr>
							<td>Sonya Frost</td>
							<td>Software Engineer</td>
							<td>Edinburgh</td>
							<td>23</td>
							<td>2008/12/13</td>
							<td>$103,600</td>
						</tr>
						<tr>
							<td>Jena Gaines</td>
							<td>Office Manager</td>
							<td>London</td>
							<td>30</td>
							<td>2008/12/19</td>
							<td>$90,560</td>
						</tr>
						<tr>
							<td>Quinn Flynn</td>
							<td>Support Lead</td>
							<td>Edinburgh</td>
							<td>22</td>
							<td>2013/03/03</td>
							<td>$342,000</td>
						</tr>
						<tr>
							<td>Charde Marshall</td>
							<td>Regional Director</td>
							<td>San Francisco</td>
							<td>36</td>
							<td>2008/10/16</td>
							<td>$470,600</td>
						</tr>
						<tr>
							<td>Haley Kennedy</td>
							<td>Senior Marketing Designer</td>
							<td>London</td>
							<td>43</td>
							<td>2012/12/18</td>
							<td>$313,500</td>
						</tr>
						<tr>
							<td>Tatyana Fitzpatrick</td>
							<td>Regional Director</td>
							<td>London</td>
							<td>19</td>
							<td>2010/03/17</td>
							<td>$385,750</td>
						</tr>
						<tr>
							<td>Michael Silva</td>
							<td>Marketing Designer</td>
							<td>London</td>
							<td>66</td>
							<td>2012/11/27</td>
							<td>$198,500</td>
						</tr>
						<tr>
							<td>Paul Byrd</td>
							<td>Chief Financial Officer (CFO)</td>
							<td>New York</td>
							<td>64</td>
							<td>2010/06/09</td>
							<td>$725,000</td>
						</tr>
						<tr>
							<td>Gloria Little</td>
							<td>Systems Administrator</td>
							<td>New York</td>
							<td>59</td>
							<td>2009/04/10</td>
							<td>$237,500</td>
						</tr>
						<tr>
							<td>Bradley Greer</td>
							<td>Software Engineer</td>
							<td>London</td>
							<td>41</td>
							<td>2012/10/13</td>
							<td>$132,000</td>
						</tr>
						<tr>
							<td>Dai Rios</td>
							<td>Personnel Lead</td>
							<td>Edinburgh</td>
							<td>35</td>
							<td>2012/09/26</td>
							<td>$217,500</td>
						</tr>
						<tr>
							<td>Jenette Caldwell</td>
							<td>Development Lead</td>
							<td>New York</td>
							<td>30</td>
							<td>2011/09/03</td>
							<td>$345,000</td>
						</tr>
						<tr>
							<td>Yuri Berry</td>
							<td>Chief Marketing Officer (CMO)</td>
							<td>New York</td>
							<td>40</td>
							<td>2009/06/25</td>
							<td>$675,000</td>
						</tr>
						<tr>
							<td>Caesar Vance</td>
							<td>Pre-Sales Support</td>
							<td>New York</td>
							<td>21</td>
							<td>2011/12/12</td>
							<td>$106,450</td>
						</tr>
						<tr>
							<td>Doris Wilder</td>
							<td>Sales Assistant</td>
							<td>Sidney</td>
							<td>23</td>
							<td>2010/09/20</td>
							<td>$85,600</td>
						</tr>
						<tr>
							<td>Angelica Ramos</td>
							<td>Chief Executive Officer (CEO)</td>
							<td>London</td>
							<td>47</td>
							<td>2009/10/09</td>
							<td>$1,200,000</td>
						</tr>
						<tr>
							<td>Gavin Joyce</td>
							<td>Developer</td>
							<td>Edinburgh</td>
							<td>42</td>
							<td>2010/12/22</td>
							<td>$92,575</td>
						</tr>
						<tr>
							<td>Jennifer Chang</td>
							<td>Regional Director</td>
							<td>Singapore</td>
							<td>28</td>
							<td>2010/11/14</td>
							<td>$357,650</td>
						</tr>
						<tr>
							<td>Brenden Wagner</td>
							<td>Software Engineer</td>
							<td>San Francisco</td>
							<td>28</td>
							<td>2011/06/07</td>
							<td>$206,850</td>
						</tr>
						<tr>
							<td>Fiona Green</td>
							<td>Chief Operating Officer (COO)</td>
							<td>San Francisco</td>
							<td>48</td>
							<td>2010/03/11</td>
							<td>$850,000</td>
						</tr>
						<tr>
							<td>Shou Itou</td>
							<td>Regional Marketing</td>
							<td>Tokyo</td>
							<td>20</td>
							<td>2011/08/14</td>
							<td>$163,000</td>
						</tr>
						<tr>
							<td>Michelle House</td>
							<td>Integration Specialist</td>
							<td>Sidney</td>
							<td>37</td>
							<td>2011/06/02</td>
							<td>$95,400</td>
						</tr>
						<tr>
							<td>Suki Burks</td>
							<td>Developer</td>
							<td>London</td>
							<td>53</td>
							<td>2009/10/22</td>
							<td>$114,500</td>
						</tr>
						<tr>
							<td>Prescott Bartlett</td>
							<td>Technical Author</td>
							<td>London</td>
							<td>27</td>
							<td>2011/05/07</td>
							<td>$145,000</td>
						</tr>
						<tr>
							<td>Gavin Cortez</td>
							<td>Team Leader</td>
							<td>San Francisco</td>
							<td>22</td>
							<td>2008/10/26</td>
							<td>$235,500</td>
						</tr>
						<tr>
							<td>Martena Mccray</td>
							<td>Post-Sales support</td>
							<td>Edinburgh</td>
							<td>46</td>
							<td>2011/03/09</td>
							<td>$324,050</td>
						</tr>
						<tr>
							<td>Unity Butler</td>
							<td>Marketing Designer</td>
							<td>San Francisco</td>
							<td>47</td>
							<td>2009/12/09</td>
							<td>$85,675</td>
						</tr>
						<tr>
							<td>Howard Hatfield</td>
							<td>Office Manager</td>
							<td>San Francisco</td>
							<td>51</td>
							<td>2008/12/16</td>
							<td>$164,500</td>
						</tr>
						<tr>
							<td>Hope Fuentes</td>
							<td>Secretary</td>
							<td>San Francisco</td>
							<td>41</td>
							<td>2010/02/12</td>
							<td>$109,850</td>
						</tr>
						<tr>
							<td>Vivian Harrell</td>
							<td>Financial Controller</td>
							<td>San Francisco</td>
							<td>62</td>
							<td>2009/02/14</td>
							<td>$452,500</td>
						</tr>
						<tr>
							<td>Timothy Mooney</td>
							<td>Office Manager</td>
							<td>London</td>
							<td>37</td>
							<td>2008/12/11</td>
							<td>$136,200</td>
						</tr>
						<tr>
							<td>Jackson Bradshaw</td>
							<td>Director</td>
							<td>New York</td>
							<td>65</td>
							<td>2008/09/26</td>
							<td>$645,750</td>
						</tr>
						<tr>
							<td>Olivia Liang</td>
							<td>Support Engineer</td>
							<td>Singapore</td>
							<td>64</td>
							<td>2011/02/03</td>
							<td>$234,500</td>
						</tr>
						<tr>
							<td>Bruno Nash</td>
							<td>Software Engineer</td>
							<td>London</td>
							<td>38</td>
							<td>2011/05/03</td>
							<td>$163,500</td>
						</tr>
						<tr>
							<td>Sakura Yamamoto</td>
							<td>Support Engineer</td>
							<td>Tokyo</td>
							<td>37</td>
							<td>2009/08/19</td>
							<td>$139,575</td>
						</tr>
						<tr>
							<td>Thor Walton</td>
							<td>Developer</td>
							<td>New York</td>
							<td>61</td>
							<td>2013/08/11</td>
							<td>$98,540</td>
						</tr>
						<tr>
							<td>Finn Camacho</td>
							<td>Support Engineer</td>
							<td>San Francisco</td>
							<td>47</td>
							<td>2009/07/07</td>
							<td>$87,500</td>
						</tr>
						<tr>
							<td>Serge Baldwin</td>
							<td>Data Coordinator</td>
							<td>Singapore</td>
							<td>64</td>
							<td>2012/04/09</td>
							<td>$138,575</td>
						</tr>
						<tr>
							<td>Zenaida Frank</td>
							<td>Software Engineer</td>
							<td>New York</td>
							<td>63</td>
							<td>2010/01/04</td>
							<td>$125,250</td>
						</tr>
						<tr>
							<td>Zorita Serrano</td>
							<td>Software Engineer</td>
							<td>San Francisco</td>
							<td>56</td>
							<td>2012/06/01</td>
							<td>$115,000</td>
						</tr>
						<tr>
							<td>Jennifer Acosta</td>
							<td>Junior Javascript Developer</td>
							<td>Edinburgh</td>
							<td>43</td>
							<td>2013/02/01</td>
							<td>$75,650</td>
						</tr>
						<tr>
							<td>Cara Stevens</td>
							<td>Sales Assistant</td>
							<td>New York</td>
							<td>46</td>
							<td>2011/12/06</td>
							<td>$145,600</td>
						</tr>
						<tr>
							<td>Hermione Butler</td>
							<td>Regional Director</td>
							<td>London</td>
							<td>47</td>
							<td>2011/03/21</td>
							<td>$356,250</td>
						</tr>
						<tr>
							<td>Lael Greer</td>
							<td>Systems Administrator</td>
							<td>London</td>
							<td>21</td>
							<td>2009/02/27</td>
							<td>$103,500</td>
						</tr>
						<tr>
							<td>Jonas Alexander</td>
							<td>Developer</td>
							<td>San Francisco</td>
							<td>30</td>
							<td>2010/07/14</td>
							<td>$86,500</td>
						</tr>
						<tr>
							<td>Shad Decker</td>
							<td>Regional Director</td>
							<td>Edinburgh</td>
							<td>51</td>
							<td>2008/11/13</td>
							<td>$183,000</td>
						</tr>
						<tr>
							<td>Michael Bruce</td>
							<td>Javascript Developer</td>
							<td>Singapore</td>
							<td>29</td>
							<td>2011/06/27</td>
							<td>$183,000</td>
						</tr>
						<tr>
							<td>Donna Snider</td>
							<td>Customer Support</td>
							<td>New York</td>
							<td>27</td>
							<td>2011/01/25</td>
							<td>$112,000</td>
						</tr>
					</tbody>				  
					<tfoot>
						<tr>
							<th>Name</th>
							<th>Position</th>
							<th>Office</th>
							<th>Age</th>
							<th>Start date</th>
							<th>Salary</th>
						</tr>
					</tfoot>
				</table>
				</div>              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->         
          <div class="box">
			  <div class="box-header bg-light">
				<h4 class="box-title">Nots! <span class="font-size-12">All the data is loaded from a seperate JS file</span></h4>
			  </div>
            <div class="box-body">		
            	<div class="table-responsive">
				  <table id="project-table" class="table table-bordered table-striped display nowrap margin-top-10" style="width:100%">
					<thead>
						<tr>
							<th></th>
							<th>Projects</th>
							<th><i class="fa fa-fw fa-user text-muted hidden-md hidden-sm hidden-xs"></i> EST</th>
							<th>Contacts</th>
							<th>Status</th>
							<th><i class="fa fa-fw fa-calendar text-muted hidden-md hidden-sm hidden-xs"></i> Starts</th>
							<th><i class="fa fa-fw fa-calendar text-muted hidden-md hidden-sm hidden-xs"></i> Ends</th>
							<th>Tracker</th>
						</tr>
					</thead>
				  </table>
            	</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->             
         <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Individual column searching</h4>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
				<div class="table-responsive">
				  <table id="example5" class="table table-bordered table-striped" style="width:100%">
					<thead>
						<tr>
							<th>Name</th>
							<th>Position</th>
							<th>Office</th>
							<th>Age</th>
							<th>Start date</th>
							<th>Salary</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Tiger Nixon</td>
							<td>System Architect</td>
							<td>Edinburgh</td>
							<td>61</td>
							<td>2011/04/25</td>
							<td>$320,800</td>
						</tr>
						<tr>
							<td>Garrett Winters</td>
							<td>Accountant</td>
							<td>Tokyo</td>
							<td>63</td>
							<td>2011/07/25</td>
							<td>$170,750</td>
						</tr>
						<tr>
							<td>Ashton Cox</td>
							<td>Junior Technical Author</td>
							<td>San Francisco</td>
							<td>66</td>
							<td>2009/01/12</td>
							<td>$86,000</td>
						</tr>
						<tr>
							<td>Cedric Kelly</td>
							<td>Senior Javascript Developer</td>
							<td>Edinburgh</td>
							<td>22</td>
							<td>2012/03/29</td>
							<td>$433,060</td>
						</tr>
						<tr>
							<td>Airi Satou</td>
							<td>Accountant</td>
							<td>Tokyo</td>
							<td>33</td>
							<td>2008/11/28</td>
							<td>$162,700</td>
						</tr>
						<tr>
							<td>Brielle Williamson</td>
							<td>Integration Specialist</td>
							<td>New York</td>
							<td>61</td>
							<td>2012/12/02</td>
							<td>$372,000</td>
						</tr>
						<tr>
							<td>Herrod Chandler</td>
							<td>Sales Assistant</td>
							<td>San Francisco</td>
							<td>59</td>
							<td>2012/08/06</td>
							<td>$137,500</td>
						</tr>
						<tr>
							<td>Rhona Davidson</td>
							<td>Integration Specialist</td>
							<td>Tokyo</td>
							<td>55</td>
							<td>2010/10/14</td>
							<td>$327,900</td>
						</tr>
						<tr>
							<td>Colleen Hurst</td>
							<td>Javascript Developer</td>
							<td>San Francisco</td>
							<td>39</td>
							<td>2009/09/15</td>
							<td>$205,500</td>
						</tr>
						<tr>
							<td>Sonya Frost</td>
							<td>Software Engineer</td>
							<td>Edinburgh</td>
							<td>23</td>
							<td>2008/12/13</td>
							<td>$103,600</td>
						</tr>
						<tr>
							<td>Jena Gaines</td>
							<td>Office Manager</td>
							<td>London</td>
							<td>30</td>
							<td>2008/12/19</td>
							<td>$90,560</td>
						</tr>
						<tr>
							<td>Quinn Flynn</td>
							<td>Support Lead</td>
							<td>Edinburgh</td>
							<td>22</td>
							<td>2013/03/03</td>
							<td>$342,000</td>
						</tr>
						<tr>
							<td>Charde Marshall</td>
							<td>Regional Director</td>
							<td>San Francisco</td>
							<td>36</td>
							<td>2008/10/16</td>
							<td>$470,600</td>
						</tr>
						<tr>
							<td>Haley Kennedy</td>
							<td>Senior Marketing Designer</td>
							<td>London</td>
							<td>43</td>
							<td>2012/12/18</td>
							<td>$313,500</td>
						</tr>
						<tr>
							<td>Tatyana Fitzpatrick</td>
							<td>Regional Director</td>
							<td>London</td>
							<td>19</td>
							<td>2010/03/17</td>
							<td>$385,750</td>
						</tr>
						<tr>
							<td>Michael Silva</td>
							<td>Marketing Designer</td>
							<td>London</td>
							<td>66</td>
							<td>2012/11/27</td>
							<td>$198,500</td>
						</tr>
						<tr>
							<td>Paul Byrd</td>
							<td>Chief Financial Officer (CFO)</td>
							<td>New York</td>
							<td>64</td>
							<td>2010/06/09</td>
							<td>$725,000</td>
						</tr>
						<tr>
							<td>Gloria Little</td>
							<td>Systems Administrator</td>
							<td>New York</td>
							<td>59</td>
							<td>2009/04/10</td>
							<td>$237,500</td>
						</tr>
						<tr>
							<td>Bradley Greer</td>
							<td>Software Engineer</td>
							<td>London</td>
							<td>41</td>
							<td>2012/10/13</td>
							<td>$132,000</td>
						</tr>
						<tr>
							<td>Dai Rios</td>
							<td>Personnel Lead</td>
							<td>Edinburgh</td>
							<td>35</td>
							<td>2012/09/26</td>
							<td>$217,500</td>
						</tr>
						<tr>
							<td>Jenette Caldwell</td>
							<td>Development Lead</td>
							<td>New York</td>
							<td>30</td>
							<td>2011/09/03</td>
							<td>$345,000</td>
						</tr>
						<tr>
							<td>Yuri Berry</td>
							<td>Chief Marketing Officer (CMO)</td>
							<td>New York</td>
							<td>40</td>
							<td>2009/06/25</td>
							<td>$675,000</td>
						</tr>
						<tr>
							<td>Caesar Vance</td>
							<td>Pre-Sales Support</td>
							<td>New York</td>
							<td>21</td>
							<td>2011/12/12</td>
							<td>$106,450</td>
						</tr>
						<tr>
							<td>Doris Wilder</td>
							<td>Sales Assistant</td>
							<td>Sidney</td>
							<td>23</td>
							<td>2010/09/20</td>
							<td>$85,600</td>
						</tr>
						<tr>
							<td>Angelica Ramos</td>
							<td>Chief Executive Officer (CEO)</td>
							<td>London</td>
							<td>47</td>
							<td>2009/10/09</td>
							<td>$1,200,000</td>
						</tr>
						<tr>
							<td>Gavin Joyce</td>
							<td>Developer</td>
							<td>Edinburgh</td>
							<td>42</td>
							<td>2010/12/22</td>
							<td>$92,575</td>
						</tr>
						<tr>
							<td>Jennifer Chang</td>
							<td>Regional Director</td>
							<td>Singapore</td>
							<td>28</td>
							<td>2010/11/14</td>
							<td>$357,650</td>
						</tr>
						<tr>
							<td>Brenden Wagner</td>
							<td>Software Engineer</td>
							<td>San Francisco</td>
							<td>28</td>
							<td>2011/06/07</td>
							<td>$206,850</td>
						</tr>
						<tr>
							<td>Fiona Green</td>
							<td>Chief Operating Officer (COO)</td>
							<td>San Francisco</td>
							<td>48</td>
							<td>2010/03/11</td>
							<td>$850,000</td>
						</tr>
						<tr>
							<td>Shou Itou</td>
							<td>Regional Marketing</td>
							<td>Tokyo</td>
							<td>20</td>
							<td>2011/08/14</td>
							<td>$163,000</td>
						</tr>
						<tr>
							<td>Michelle House</td>
							<td>Integration Specialist</td>
							<td>Sidney</td>
							<td>37</td>
							<td>2011/06/02</td>
							<td>$95,400</td>
						</tr>
						<tr>
							<td>Suki Burks</td>
							<td>Developer</td>
							<td>London</td>
							<td>53</td>
							<td>2009/10/22</td>
							<td>$114,500</td>
						</tr>
						<tr>
							<td>Prescott Bartlett</td>
							<td>Technical Author</td>
							<td>London</td>
							<td>27</td>
							<td>2011/05/07</td>
							<td>$145,000</td>
						</tr>
						<tr>
							<td>Gavin Cortez</td>
							<td>Team Leader</td>
							<td>San Francisco</td>
							<td>22</td>
							<td>2008/10/26</td>
							<td>$235,500</td>
						</tr>
						<tr>
							<td>Martena Mccray</td>
							<td>Post-Sales support</td>
							<td>Edinburgh</td>
							<td>46</td>
							<td>2011/03/09</td>
							<td>$324,050</td>
						</tr>
						<tr>
							<td>Unity Butler</td>
							<td>Marketing Designer</td>
							<td>San Francisco</td>
							<td>47</td>
							<td>2009/12/09</td>
							<td>$85,675</td>
						</tr>
						<tr>
							<td>Howard Hatfield</td>
							<td>Office Manager</td>
							<td>San Francisco</td>
							<td>51</td>
							<td>2008/12/16</td>
							<td>$164,500</td>
						</tr>
						<tr>
							<td>Hope Fuentes</td>
							<td>Secretary</td>
							<td>San Francisco</td>
							<td>41</td>
							<td>2010/02/12</td>
							<td>$109,850</td>
						</tr>
						<tr>
							<td>Vivian Harrell</td>
							<td>Financial Controller</td>
							<td>San Francisco</td>
							<td>62</td>
							<td>2009/02/14</td>
							<td>$452,500</td>
						</tr>
						<tr>
							<td>Timothy Mooney</td>
							<td>Office Manager</td>
							<td>London</td>
							<td>37</td>
							<td>2008/12/11</td>
							<td>$136,200</td>
						</tr>
						<tr>
							<td>Jackson Bradshaw</td>
							<td>Director</td>
							<td>New York</td>
							<td>65</td>
							<td>2008/09/26</td>
							<td>$645,750</td>
						</tr>
						<tr>
							<td>Olivia Liang</td>
							<td>Support Engineer</td>
							<td>Singapore</td>
							<td>64</td>
							<td>2011/02/03</td>
							<td>$234,500</td>
						</tr>
						<tr>
							<td>Bruno Nash</td>
							<td>Software Engineer</td>
							<td>London</td>
							<td>38</td>
							<td>2011/05/03</td>
							<td>$163,500</td>
						</tr>
						<tr>
							<td>Sakura Yamamoto</td>
							<td>Support Engineer</td>
							<td>Tokyo</td>
							<td>37</td>
							<td>2009/08/19</td>
							<td>$139,575</td>
						</tr>
						<tr>
							<td>Thor Walton</td>
							<td>Developer</td>
							<td>New York</td>
							<td>61</td>
							<td>2013/08/11</td>
							<td>$98,540</td>
						</tr>
						<tr>
							<td>Finn Camacho</td>
							<td>Support Engineer</td>
							<td>San Francisco</td>
							<td>47</td>
							<td>2009/07/07</td>
							<td>$87,500</td>
						</tr>
						<tr>
							<td>Serge Baldwin</td>
							<td>Data Coordinator</td>
							<td>Singapore</td>
							<td>64</td>
							<td>2012/04/09</td>
							<td>$138,575</td>
						</tr>
						<tr>
							<td>Zenaida Frank</td>
							<td>Software Engineer</td>
							<td>New York</td>
							<td>63</td>
							<td>2010/01/04</td>
							<td>$125,250</td>
						</tr>
						<tr>
							<td>Zorita Serrano</td>
							<td>Software Engineer</td>
							<td>San Francisco</td>
							<td>56</td>
							<td>2012/06/01</td>
							<td>$115,000</td>
						</tr>
						<tr>
							<td>Jennifer Acosta</td>
							<td>Junior Javascript Developer</td>
							<td>Edinburgh</td>
							<td>43</td>
							<td>2013/02/01</td>
							<td>$75,650</td>
						</tr>
						<tr>
							<td>Cara Stevens</td>
							<td>Sales Assistant</td>
							<td>New York</td>
							<td>46</td>
							<td>2011/12/06</td>
							<td>$145,600</td>
						</tr>
						<tr>
							<td>Hermione Butler</td>
							<td>Regional Director</td>
							<td>London</td>
							<td>47</td>
							<td>2011/03/21</td>
							<td>$356,250</td>
						</tr>
						<tr>
							<td>Lael Greer</td>
							<td>Systems Administrator</td>
							<td>London</td>
							<td>21</td>
							<td>2009/02/27</td>
							<td>$103,500</td>
						</tr>
						<tr>
							<td>Jonas Alexander</td>
							<td>Developer</td>
							<td>San Francisco</td>
							<td>30</td>
							<td>2010/07/14</td>
							<td>$86,500</td>
						</tr>
						<tr>
							<td>Shad Decker</td>
							<td>Regional Director</td>
							<td>Edinburgh</td>
							<td>51</td>
							<td>2008/11/13</td>
							<td>$183,000</td>
						</tr>
						<tr>
							<td>Michael Bruce</td>
							<td>Javascript Developer</td>
							<td>Singapore</td>
							<td>29</td>
							<td>2011/06/27</td>
							<td>$183,000</td>
						</tr>
						<tr>
							<td>Donna Snider</td>
							<td>Customer Support</td>
							<td>New York</td>
							<td>27</td>
							<td>2011/01/25</td>
							<td>$112,000</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>Name</th>
							<th>Position</th>
							<th>Office</th>
							<th>Age</th>
							<th>Start date</th>
							<th>Salary</th>
						</tr>
					</tfoot>
				</table>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->              
         <div class="box">
            <div class="box-header with-border bg-light">
              <h4 class="box-title">Form inputs</h4>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
				<div class="table-responsive">
				  <table id="example6" class="display table table-bordered table-separated" style="width:100%">
					<thead>
						<tr>
							<th>Name</th>
							<th>Age</th>
							<th>Position</th>
							<th>Office</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Tiger Nixon</td>
							<td><input type="text" id="row-1-age" name="row-1-age" value="61"></td>
							<td><input type="text" id="row-1-position" name="row-1-position" value="System Architect"></td>
							<td><select size="1" id="row-1-office" name="row-1-office">
								<option value="Edinburgh" selected="selected">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Garrett Winters</td>
							<td><input type="text" id="row-2-age" name="row-2-age" value="63"></td>
							<td><input type="text" id="row-2-position" name="row-2-position" value="Accountant"></td>
							<td><select size="1" id="row-2-office" name="row-2-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo" selected="selected">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Ashton Cox</td>
							<td><input type="text" id="row-3-age" name="row-3-age" value="66"></td>
							<td><input type="text" id="row-3-position" name="row-3-position" value="Junior Technical Author"></td>
							<td><select size="1" id="row-3-office" name="row-3-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco" selected="selected">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Cedric Kelly</td>
							<td><input type="text" id="row-4-age" name="row-4-age" value="22"></td>
							<td><input type="text" id="row-4-position" name="row-4-position" value="Senior Javascript Developer"></td>
							<td><select size="1" id="row-4-office" name="row-4-office">
								<option value="Edinburgh" selected="selected">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Airi Satou</td>
							<td><input type="text" id="row-5-age" name="row-5-age" value="33"></td>
							<td><input type="text" id="row-5-position" name="row-5-position" value="Accountant"></td>
							<td><select size="1" id="row-5-office" name="row-5-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo" selected="selected">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Brielle Williamson</td>
							<td><input type="text" id="row-6-age" name="row-6-age" value="61"></td>
							<td><input type="text" id="row-6-position" name="row-6-position" value="Integration Specialist"></td>
							<td><select size="1" id="row-6-office" name="row-6-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York" selected="selected">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Herrod Chandler</td>
							<td><input type="text" id="row-7-age" name="row-7-age" value="59"></td>
							<td><input type="text" id="row-7-position" name="row-7-position" value="Sales Assistant"></td>
							<td><select size="1" id="row-7-office" name="row-7-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco" selected="selected">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Rhona Davidson</td>
							<td><input type="text" id="row-8-age" name="row-8-age" value="55"></td>
							<td><input type="text" id="row-8-position" name="row-8-position" value="Integration Specialist"></td>
							<td><select size="1" id="row-8-office" name="row-8-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo" selected="selected">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Colleen Hurst</td>
							<td><input type="text" id="row-9-age" name="row-9-age" value="39"></td>
							<td><input type="text" id="row-9-position" name="row-9-position" value="Javascript Developer"></td>
							<td><select size="1" id="row-9-office" name="row-9-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco" selected="selected">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Sonya Frost</td>
							<td><input type="text" id="row-10-age" name="row-10-age" value="23"></td>
							<td><input type="text" id="row-10-position" name="row-10-position" value="Software Engineer"></td>
							<td><select size="1" id="row-10-office" name="row-10-office">
								<option value="Edinburgh" selected="selected">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Jena Gaines</td>
							<td><input type="text" id="row-11-age" name="row-11-age" value="30"></td>
							<td><input type="text" id="row-11-position" name="row-11-position" value="Office Manager"></td>
							<td><select size="1" id="row-11-office" name="row-11-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London" selected="selected">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Quinn Flynn</td>
							<td><input type="text" id="row-12-age" name="row-12-age" value="22"></td>
							<td><input type="text" id="row-12-position" name="row-12-position" value="Support Lead"></td>
							<td><select size="1" id="row-12-office" name="row-12-office">
								<option value="Edinburgh" selected="selected">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Charde Marshall</td>
							<td><input type="text" id="row-13-age" name="row-13-age" value="36"></td>
							<td><input type="text" id="row-13-position" name="row-13-position" value="Regional Director"></td>
							<td><select size="1" id="row-13-office" name="row-13-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco" selected="selected">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Haley Kennedy</td>
							<td><input type="text" id="row-14-age" name="row-14-age" value="43"></td>
							<td><input type="text" id="row-14-position" name="row-14-position" value="Senior Marketing Designer"></td>
							<td><select size="1" id="row-14-office" name="row-14-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London" selected="selected">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Tatyana Fitzpatrick</td>
							<td><input type="text" id="row-15-age" name="row-15-age" value="19"></td>
							<td><input type="text" id="row-15-position" name="row-15-position" value="Regional Director"></td>
							<td><select size="1" id="row-15-office" name="row-15-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London" selected="selected">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Michael Silva</td>
							<td><input type="text" id="row-16-age" name="row-16-age" value="66"></td>
							<td><input type="text" id="row-16-position" name="row-16-position" value="Marketing Designer"></td>
							<td><select size="1" id="row-16-office" name="row-16-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London" selected="selected">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Paul Byrd</td>
							<td><input type="text" id="row-17-age" name="row-17-age" value="64"></td>
							<td><input type="text" id="row-17-position" name="row-17-position" value="Chief Financial Officer (CFO)"></td>
							<td><select size="1" id="row-17-office" name="row-17-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York" selected="selected">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Gloria Little</td>
							<td><input type="text" id="row-18-age" name="row-18-age" value="59"></td>
							<td><input type="text" id="row-18-position" name="row-18-position" value="Systems Administrator"></td>
							<td><select size="1" id="row-18-office" name="row-18-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York" selected="selected">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Bradley Greer</td>
							<td><input type="text" id="row-19-age" name="row-19-age" value="41"></td>
							<td><input type="text" id="row-19-position" name="row-19-position" value="Software Engineer"></td>
							<td><select size="1" id="row-19-office" name="row-19-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London" selected="selected">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Dai Rios</td>
							<td><input type="text" id="row-20-age" name="row-20-age" value="35"></td>
							<td><input type="text" id="row-20-position" name="row-20-position" value="Personnel Lead"></td>
							<td><select size="1" id="row-20-office" name="row-20-office">
								<option value="Edinburgh" selected="selected">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Jenette Caldwell</td>
							<td><input type="text" id="row-21-age" name="row-21-age" value="30"></td>
							<td><input type="text" id="row-21-position" name="row-21-position" value="Development Lead"></td>
							<td><select size="1" id="row-21-office" name="row-21-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York" selected="selected">
									New York
								</option>

								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Yuri Berry</td>
							<td><input type="text" id="row-22-age" name="row-22-age" value="40"></td>
							<td><input type="text" id="row-22-position" name="row-22-position" value="Chief Marketing Officer (CMO)"></td>
							<td><select size="1" id="row-22-office" name="row-22-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York" selected="selected">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Caesar Vance</td>
							<td><input type="text" id="row-23-age" name="row-23-age" value="21"></td>
							<td><input type="text" id="row-23-position" name="row-23-position" value="Pre-Sales Support"></td>
							<td><select size="1" id="row-23-office" name="row-23-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York" selected="selected">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Doris Wilder</td>
							<td><input type="text" id="row-24-age" name="row-24-age" value="23"></td>
							<td><input type="text" id="row-24-position" name="row-24-position" value="Sales Assistant"></td>
							<td><select size="1" id="row-24-office" name="row-24-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Angelica Ramos</td>
							<td><input type="text" id="row-25-age" name="row-25-age" value="47"></td>
							<td><input type="text" id="row-25-position" name="row-25-position" value="Chief Executive Officer (CEO)"></td>
							<td><select size="1" id="row-25-office" name="row-25-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London" selected="selected">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Gavin Joyce</td>
							<td><input type="text" id="row-26-age" name="row-26-age" value="42"></td>
							<td><input type="text" id="row-26-position" name="row-26-position" value="Developer"></td>
							<td><select size="1" id="row-26-office" name="row-26-office">
								<option value="Edinburgh" selected="selected">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Jennifer Chang</td>
							<td><input type="text" id="row-27-age" name="row-27-age" value="28"></td>
							<td><input type="text" id="row-27-position" name="row-27-position" value="Regional Director"></td>
							<td><select size="1" id="row-27-office" name="row-27-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Brenden Wagner</td>
							<td><input type="text" id="row-28-age" name="row-28-age" value="28"></td>
							<td><input type="text" id="row-28-position" name="row-28-position" value="Software Engineer"></td>
							<td><select size="1" id="row-28-office" name="row-28-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco" selected="selected">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Fiona Green</td>
							<td><input type="text" id="row-29-age" name="row-29-age" value="48"></td>
							<td><input type="text" id="row-29-position" name="row-29-position" value="Chief Operating Officer (COO)"></td>
							<td><select size="1" id="row-29-office" name="row-29-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco" selected="selected">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Shou Itou</td>
							<td><input type="text" id="row-30-age" name="row-30-age" value="20"></td>
							<td><input type="text" id="row-30-position" name="row-30-position" value="Regional Marketing"></td>
							<td><select size="1" id="row-30-office" name="row-30-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo" selected="selected">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Michelle House</td>
							<td><input type="text" id="row-31-age" name="row-31-age" value="37"></td>
							<td><input type="text" id="row-31-position" name="row-31-position" value="Integration Specialist"></td>
							<td><select size="1" id="row-31-office" name="row-31-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Suki Burks</td>
							<td><input type="text" id="row-32-age" name="row-32-age" value="53"></td>
							<td><input type="text" id="row-32-position" name="row-32-position" value="Developer"></td>
							<td><select size="1" id="row-32-office" name="row-32-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London" selected="selected">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Prescott Bartlett</td>
							<td><input type="text" id="row-33-age" name="row-33-age" value="27"></td>
							<td><input type="text" id="row-33-position" name="row-33-position" value="Technical Author"></td>
							<td><select size="1" id="row-33-office" name="row-33-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London" selected="selected">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Gavin Cortez</td>
							<td><input type="text" id="row-34-age" name="row-34-age" value="22"></td>
							<td><input type="text" id="row-34-position" name="row-34-position" value="Team Leader"></td>
							<td><select size="1" id="row-34-office" name="row-34-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco" selected="selected">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Martena Mccray</td>
							<td><input type="text" id="row-35-age" name="row-35-age" value="46"></td>
							<td><input type="text" id="row-35-position" name="row-35-position" value="Post-Sales support"></td>
							<td><select size="1" id="row-35-office" name="row-35-office">
								<option value="Edinburgh" selected="selected">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Unity Butler</td>
							<td><input type="text" id="row-36-age" name="row-36-age" value="47"></td>
							<td><input type="text" id="row-36-position" name="row-36-position" value="Marketing Designer"></td>
							<td><select size="1" id="row-36-office" name="row-36-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco" selected="selected">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Howard Hatfield</td>
							<td><input type="text" id="row-37-age" name="row-37-age" value="51"></td>
							<td><input type="text" id="row-37-position" name="row-37-position" value="Office Manager"></td>
							<td><select size="1" id="row-37-office" name="row-37-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco" selected="selected">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Hope Fuentes</td>
							<td><input type="text" id="row-38-age" name="row-38-age" value="41"></td>
							<td><input type="text" id="row-38-position" name="row-38-position" value="Secretary"></td>
							<td><select size="1" id="row-38-office" name="row-38-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco" selected="selected">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Vivian Harrell</td>
							<td><input type="text" id="row-39-age" name="row-39-age" value="62"></td>
							<td><input type="text" id="row-39-position" name="row-39-position" value="Financial Controller"></td>
							<td><select size="1" id="row-39-office" name="row-39-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco" selected="selected">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Timothy Mooney</td>
							<td><input type="text" id="row-40-age" name="row-40-age" value="37"></td>
							<td><input type="text" id="row-40-position" name="row-40-position" value="Office Manager"></td>
							<td><select size="1" id="row-40-office" name="row-40-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London" selected="selected">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Jackson Bradshaw</td>
							<td><input type="text" id="row-41-age" name="row-41-age" value="65"></td>
							<td><input type="text" id="row-41-position" name="row-41-position" value="Director"></td>
							<td><select size="1" id="row-41-office" name="row-41-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York" selected="selected">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Olivia Liang</td>
							<td><input type="text" id="row-42-age" name="row-42-age" value="64"></td>
							<td><input type="text" id="row-42-position" name="row-42-position" value="Support Engineer"></td>
							<td><select size="1" id="row-42-office" name="row-42-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Bruno Nash</td>
							<td><input type="text" id="row-43-age" name="row-43-age" value="38"></td>
							<td><input type="text" id="row-43-position" name="row-43-position" value="Software Engineer"></td>
							<td><select size="1" id="row-43-office" name="row-43-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London" selected="selected">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Sakura Yamamoto</td>
							<td><input type="text" id="row-44-age" name="row-44-age" value="37"></td>
							<td><input type="text" id="row-44-position" name="row-44-position" value="Support Engineer"></td>
							<td><select size="1" id="row-44-office" name="row-44-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo" selected="selected">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Thor Walton</td>
							<td><input type="text" id="row-45-age" name="row-45-age" value="61"></td>
							<td><input type="text" id="row-45-position" name="row-45-position" value="Developer"></td>
							<td><select size="1" id="row-45-office" name="row-45-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York" selected="selected">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Finn Camacho</td>
							<td><input type="text" id="row-46-age" name="row-46-age" value="47"></td>
							<td><input type="text" id="row-46-position" name="row-46-position" value="Support Engineer"></td>
							<td><select size="1" id="row-46-office" name="row-46-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco" selected="selected">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Serge Baldwin</td>
							<td><input type="text" id="row-47-age" name="row-47-age" value="64"></td>
							<td><input type="text" id="row-47-position" name="row-47-position" value="Data Coordinator"></td>
							<td><select size="1" id="row-47-office" name="row-47-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Zenaida Frank</td>
							<td><input type="text" id="row-48-age" name="row-48-age" value="63"></td>
							<td><input type="text" id="row-48-position" name="row-48-position" value="Software Engineer"></td>
							<td><select size="1" id="row-48-office" name="row-48-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York" selected="selected">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Zorita Serrano</td>
							<td><input type="text" id="row-49-age" name="row-49-age" value="56"></td>
							<td><input type="text" id="row-49-position" name="row-49-position" value="Software Engineer"></td>
							<td><select size="1" id="row-49-office" name="row-49-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco" selected="selected">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Jennifer Acosta</td>
							<td><input type="text" id="row-50-age" name="row-50-age" value="43"></td>
							<td><input type="text" id="row-50-position" name="row-50-position" value="Junior Javascript Developer"></td>
							<td><select size="1" id="row-50-office" name="row-50-office">
								<option value="Edinburgh" selected="selected">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Cara Stevens</td>
							<td><input type="text" id="row-51-age" name="row-51-age" value="46"></td>
							<td><input type="text" id="row-51-position" name="row-51-position" value="Sales Assistant"></td>
							<td><select size="1" id="row-51-office" name="row-51-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York" selected="selected">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Hermione Butler</td>
							<td><input type="text" id="row-52-age" name="row-52-age" value="47"></td>
							<td><input type="text" id="row-52-position" name="row-52-position" value="Regional Director"></td>
							<td><select size="1" id="row-52-office" name="row-52-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London" selected="selected">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Lael Greer</td>
							<td><input type="text" id="row-53-age" name="row-53-age" value="21"></td>
							<td><input type="text" id="row-53-position" name="row-53-position" value="Systems Administrator"></td>
							<td><select size="1" id="row-53-office" name="row-53-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London" selected="selected">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Jonas Alexander</td>
							<td><input type="text" id="row-54-age" name="row-54-age" value="30"></td>
							<td><input type="text" id="row-54-position" name="row-54-position" value="Developer"></td>
							<td><select size="1" id="row-54-office" name="row-54-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco" selected="selected">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Shad Decker</td>
							<td><input type="text" id="row-55-age" name="row-55-age" value="51"></td>
							<td><input type="text" id="row-55-position" name="row-55-position" value="Regional Director"></td>
							<td><select size="1" id="row-55-office" name="row-55-office">
								<option value="Edinburgh" selected="selected">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Michael Bruce</td>
							<td><input type="text" id="row-56-age" name="row-56-age" value="29"></td>
							<td><input type="text" id="row-56-position" name="row-56-position" value="Javascript Developer"></td>
							<td><select size="1" id="row-56-office" name="row-56-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
						<tr>
							<td>Donna Snider</td>
							<td><input type="text" id="row-57-age" name="row-57-age" value="27"></td>
							<td><input type="text" id="row-57-position" name="row-57-position" value="Customer Support"></td>
							<td><select size="1" id="row-57-office" name="row-57-office">
								<option value="Edinburgh">
									Edinburgh
								</option>
								<option value="London">
									London
								</option>
								<option value="New York" selected="selected">
									New York
								</option>
								<option value="San Francisco">
									San Francisco
								</option>
								<option value="Tokyo">
									Tokyo
								</option>
							</select></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>Name</th>
							<th>Age</th>
							<th>Position</th>
							<th>Office</th>
						</tr>
					</tfoot>
				</table>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->         
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    </form>
</body>
</html>


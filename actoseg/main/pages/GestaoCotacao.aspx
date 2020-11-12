<%@ Page Language="C#" MasterPageFile="~/main/pages/Principal.Master"  AutoEventWireup="true" CodeBehind="GestaoCotacao.aspx.cs" Inherits="actoseg.main.pages.GestaoCotacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<script>
        function checkNumber(valor) {
            var regra = /^[0-9]+$/;
            if (valor.match(regra)) {
				return true;
            } else {
                return false;
            }
        }; 
        function Trim(strTexto) {
            // Substitúi os espaços vazios no inicio e no fim da string por vazio.
            return strTexto.replace(/^s+|s+$/g, '');
        }
        function IsCEP(strCEP, blnVazio) {
            // Caso o CEP não esteja nesse formato ele é inválido!
            var objER = /^[0-9]{5}-[0-9]{3}$/;

            strCEP = Trim(strCEP)
            if (strCEP.length > 0) {
                if (objER.test(strCEP))
                    return true;
                else
                    return false;
            }
            else
                return blnVazio;
        }
        function Voltar() {
            window.location.href = "Default.aspx";
        }
        function AtualizarEndereco() {

            if ($("#ContentPlaceHolder1_txtIdCliente").val() == '') {
                alert("Localize o Indicado para atualizar seu Endereço.");
                return false;
            }

            //Verifica Tipo Endereço
            if ($("#ContentPlaceHolder1_cboTipoEndereco").val() == null) {
                alert("Informe o Tipo de Endereço do Indicado.");
                return false;
            }
            //Verifica Tipo Endereço
            if ($("#ContentPlaceHolder1_cboTipoEndereco").val() == '') {
                alert("Informe o Tipo de Endereço do Indicado.");
                return false;
            }

            //Verifica CEP
            if ($("#ContentPlaceHolder1_txtCep").val() == '') {
                alert("Informe o CEP.");
                return false;
            }
            if (IsCEP($("#ContentPlaceHolder1_txtCep").val()) == false) {
                alert("Informe o CEP do Indicado corretamente .");
                return false;
            }

            // Verifica Endereço
            if ($("#ContentPlaceHolder1_txtEndereco").val() == '') {
                alert("Informe o Endereço do Indicado.");
                return false;
            }

            // Verifica Endereço
            if ($("#ContentPlaceHolder1_txtNumeroEndereco").val() == '') {
                alert("Informe o número do endereço do Indicado.");
                return false;
            }
            if (checkNumber($("#ContentPlaceHolder1_txtNumeroEndereco").val()) == false) {
                alert("Informe o número do Endereço do Indicado corretamente.");
                return false;
            }
			
           

            // Verifica Complemento
            if ($("#ContentPlaceHolder1_txtComplemento").val() == '') {
                alert("Informe o Complemento do Endereço.");
                return false;
			}
            // Verifica Bairro
            if ($("#ContentPlaceHolder1_txtBairro").val() == '') {
                alert("Informe o Bairro do Indicado.");
                return false;
			}
            // Verifica Cidade
            if ($("#ContentPlaceHolder1_txtCidade").val() == '') {
                alert("Informe o Cidade do Indicado.");
                return false;
			}
            // Verifica Estado
            if ($("#ContentPlaceHolder1_cboEstado").val() == '') {
                alert("Informe o Estado do Indicado.");
                return false;
            }
            $.ajax({
                type: "POST",
                url: "MeuEndereco.aspx/wmAtualizarEndereco",
                data: "{pid_tipo_endereco: '" + $("#ContentPlaceHolder1_cboTipoEndereco").val() +
                    "', pds_cep: '" + $("#ContentPlaceHolder1_txtCep").val() + 
                    "', pds_endereco: '" + $("#ContentPlaceHolder1_txtEndereco").val() +
                    "', pds_numero: '" + $("#ContentPlaceHolder1_txtNumeroEndereco").val() +
                    "', pds_complemento: '" + $("#ContentPlaceHolder1_txtComplemento").val() + 
                    "', pds_bairro: '" + $("#ContentPlaceHolder1_txtBairro").val() +
                    "', pds_cidade: '" + $("#ContentPlaceHolder1_txtCidade").val() +
                    "', pds_estado: '" + $("#ContentPlaceHolder1_cboEstado").val() +
                    "', pid_cliente: '" + $("#ContentPlaceHolder1_txtIdCliente").val() +
                    "'}",
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
				alert("Endereço do Indicado atualizado com sucesso!");				
			}
			else
			{
                alert("Endereço do Indicado não foi atualizado, houve um problema sistêmico.");
            }
		}

        function CarregarListaIndicados() {
           
            $.ajax({
                type: "POST",
                url: "MeuIndicado.aspx/wmListarIndicados",
                data: "{id_cliente: " + $("#ContentPlaceHolder1_txtIdClienteIndicador").val() + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessCarregarListaIndicado,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }
        function OnSuccessCarregarListaIndicado(data, status) {
            //$('p').html("Sobrenome:" + data.d._sobreNome + " idade:" + data.d._idade + "");
            //$("#ContentPlaceHolder1_txtNome").val(data.d.ds_nome);

            $('#ContentPlaceHolder1_ddlIndicados').find("option").remove();

            //$.each(data, function (key, value) {
            //    alert(key + ": " + value);
            //});
            $('#ContentPlaceHolder1_ddlIndicados').append('<option Value="">Selecione...</option>');
            var obj = JSON.parse(data.d);

            obj.forEach(function (o, index) {
                //var option2 = document.createElement('option');
                //option2.value = o.id_cliente;
                //option2.text = o.ds_nome;
                $('#ContentPlaceHolder1_ddlIndicados').append('<option Value="' + o.id_cliente + '">' + o.ds_nome + '</option>');
                //$('#ContentPlaceHolder1_ddlIndicados').add(option2);
                //alert(o.ds_nome);
            });

        }
        function CarregarIndicadoLista() {

            if ($('#ContentPlaceHolder1_ddlIndicados').val() == "") {
                alert("Selecione o Indicado para Atualizar o Cadastro!");
                return false;
            }

            $.ajax({
                type: "POST",
                url: "MeuIndicado.aspx/wmConsultarIndicado",
                data: "{id_cliente: " + $('#ContentPlaceHolder1_ddlIndicados').val() + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessConsultaIndicado,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }
        function CarregarIndicado() {


            $.ajax({
                type: "POST",
                url: "MeuIndicado.aspx/wmConsultarIndicado",
                data: "{id_cliente: '" + $("#ContentPlaceHolder1_txtIdCliente").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessConsultaIndicado,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }
        function OnSuccessConsultaIndicado(data, status) {
           
            //$('p').html("Sobrenome:" + data.d._sobreNome + " idade:" + data.d._idade + "");
            $("#ContentPlaceHolder1_txtIdCliente").val(data.d.id_cliente);
            $("#ContentPlaceHolder1_txtNome").val(data.d.ds_nome);
            $("#ContentPlaceHolder1_txtEmail").val(data.d.ds_email);
            $("#ContentPlaceHolder1_txtCPF").val(data.d.nr_cpf_cnpj);

            ConsultaEnderecoIndicado();
            

        }

        function ConsultaEnderecoIndicado() {
            $.ajax({
                type: "POST",
                url: "EnderecoIndicado.aspx/wmConsultarEnderecoIndicado",
                data: "{id_cliente: '" + $("#ContentPlaceHolder1_txtIdCliente").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessConsultaEnderecoIndicado,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }

        function OnSuccessConsultaEnderecoIndicado(data, status) {
            
            //$('p').html("Sobrenome:" + data.d._sobreNome + " idade:" + data.d._idade + "");
            $("#ContentPlaceHolder1_cboTipoEndereco").val(data.d.id_tipo_endereco);
            $("#ContentPlaceHolder1_txtCep").val(data.d.ds_cep);
            $("#ContentPlaceHolder1_txtEndereco").val(data.d.ds_endereco);
            $("#ContentPlaceHolder1_txtNumeroEndereco").val(data.d.ds_numero);
            $("#ContentPlaceHolder1_txtComplemento").val(data.d.ds_complemento);
            $("#ContentPlaceHolder1_txtBairro").val(data.d.ds_bairro);
            $("#ContentPlaceHolder1_txtCidade").val(data.d.ds_cidade);
            $("#ContentPlaceHolder1_cboEstado").val(data.d.ds_estado);
            $("#ContentPlaceHolder1_txtDataAtualizacao").val(data.d.dt_atualizacao);

            //cboTipoEndereco.SelectedValue = objEntEndereco.id_tipo_endereco.ToString();
            //txtCep.Text = objEntEndereco.ds_cep;
            //txtEndereco.Text = objEntEndereco.ds_endereco;
            //txtNumeroEndereco.Text = objEntEndereco.ds_numero;
            //txtComplemento.Text = objEntEndereco.ds_complemento;
            //txtBairro.Text = objEntEndereco.ds_bairro;
            //txtCidade.Text = objEntEndereco.ds_cidade;
            //cboEstado.Text = objEntEndereco.ds_estado;
            //txtDataAtualizacao.Text = objEntEndereco.dt_atualizacao.ToString(@"dd/MM/yyyy");

        }
        $(document).ready(function () {
            jQuery.support.cors = true;
        });

          
    </script>
    <!-- Content Wrapper. Contains page content -->
  <%--<div class="content-wrapper">--%>
    <!-- Content Header (Page header) -->
    <section class="content-header">
     
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i> Inicío</a></li>
        <li class="breadcrumb-item"><a href="#">Cotações</a></li>
        <li class="breadcrumb-item active">Gestão</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
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
      
    </section>
    <!-- /.content -->
  <%--</div>--%>
  <!-- /.content-wrapper -->
</asp:Content>

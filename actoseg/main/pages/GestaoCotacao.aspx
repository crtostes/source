<%@ Page Language="C#" MasterPageFile="~/main/pages/Principal.Master"  AutoEventWireup="true" CodeBehind="GestaoCotacao.aspx.cs" Inherits="actoseg.main.pages.GestaoCotacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<script>
        $(document).ready(function () {
            CarregaGrid();
        });


        function CarregaGrid()
        {

            $.ajax({
                type: "POST",
                url: "GestaoCotacao.aspx/wmListaCotacoes",
                data: "{pid_cliente: " + $("#ContentPlaceHolder1_txtIdClienteIndicador").val() + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessCarregarGrid,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });

            
        }
        function format(d) {
            
            // `d` is the original data object for the row
            return '<table cellpadding="6" cellspacing="0" border="0" style="padding-left:50px; width:100%;">' +
                '<tr>' +
                '<td style="width:100px">Telefone:</td>' +
                '<td>' + d.ds_telefone_celular + '</td>' +
                '</tr>' +
                '<tr>' +
                '<td>Marca:</td>' +
                '<td>' + d.ds_marca + '</td>' +
                '</tr>' +
                '<tr>' +
                '<td>Marca:</td>' +
                '<td>' + d.ds_modelo + '</td>' +
                '</tr>' +
                '<tr>' +
                '<td>Ano Fabricação:</td>' +
                '<td>' + d.ds_ano_fabricao + '</td>' +
                '</tr>' +
                '<tr>' +
                '<td>Ano Modelo:</td>' +
                '<td>' + d.ds_ano_modelo + '</td>' +
                '</tr>' +
                '</table>';
        }
        function OnSuccessCarregarGrid(data, status) {

          
            var Jsondata = JSON.parse(data.d);
            var testdata1 = {
                "data": [

                    {
                        "name": "CARLOS ALBERTO TOSTES<br><small class='text-muted'><i>Budget: 15,000<i></small>",
                        "est": "<td><div class='progress progress-sm'><div class='progress-bar progress-bar-warning progress-bar-striped' role='progressbar' aria-valuenow='100' aria-valuemin='0' aria-valuemax='100' style='width: 100%'></div></div></td>",
                        "contacts": "(11) 9-9720-2238",
                        "status": "<span class='badge badge-success'>Active</span>",
                        "tracker": "<button type='button' class='btn btn-xs btn-success pull-right'>Download PDF</button> ",
                        "starts": "01-6-2017",
                        "ends": "<button type='button' class='btn btn-xs btn-success pull-right'>X</button> ",

                        "action": "<button class='btn btn-xs'>Open case</button> <button class='btn btn-xs btn-danger pull-right' style='margin-left:5px'>Delete Record</button> <button class='btn btn-xs btn-success pull-right'>Save Changes</button> "
                    },
                    {
                        "name": "Publish to Wrapbootstrap<br><small class='text-muted'><i>Budget: 4,000<i></small>",
                        "est": "<td><div class='progress progress-sm'><div class='progress-bar progress-bar-info progress-bar-striped' role='progressbar' aria-valuenow='95' aria-valuemin='0' aria-valuemax='100' style='width: 95%'></div></div></td>",
                        "contacts": "(11) 9-9720-2238",
                        "status": "<span class='badge badge-success'>Active</span>",
                        "tracker": "<button type='button' class='btn btn-sm btn-toggle btn-primary' data-toggle='button' aria-pressed='true'><span class='handle'></span></button>",
                        "starts": "01-8-2017",
                        "ends": "<strong>07-07-2018</strong>",

                        "action": "<button class='btn btn-xs'>Open case</button> <button class='btn btn-xs btn-danger pull-right' style='margin-left:5px'>Delete Record</button> <button class='btn btn-xs btn-success pull-right'>Save Changes</button> "
                    },
                    {
                        "name": "Chares Grid<br><small class='text-muted'><i>Budget: 4,000<i></small>",
                        "est": "<td><div class='progress progress-sm'><div class='progress-bar progress-bar-info progress-bar-striped' role='progressbar' aria-valuenow='95' aria-valuemin='0' aria-valuemax='100' style='width: 95%'></div></div></td>",
                        "contacts": "(11) 9-9720-2238",
                        "status": "<span class='badge badge-success'>Active</span>",
                        "tracker": "<button type='button' class='btn btn-sm btn-toggle btn-primary' data-toggle='button' aria-pressed='true'><span class='handle'></span></button>",
                        "starts": "01-8-2017",
                        "ends": "<strong>07-07-2018</strong>",
                        "comments": "This is a blank comments area, used to add comments and keep notes",
                        "action": "<button class='btn btn-xs'>Open case</button> <button class='btn btn-xs btn-danger pull-right' style='margin-left:5px'>Delete Record</button> <button class='btn btn-xs btn-success pull-right'>Save Changes</button> "
                    }
                ]
            };
            var table = $('#grdCotacoes').DataTable({
                "data": Jsondata,
                "searching": true,
                "paging": true,
                "info": true,
                select: "single",
                "columns": [
                    {
                        "className": 'details-control',
                        "orderable": false,
                        "data": null,
                        "defaultContent": '',
                        "render": function () {
                            return '';
                        },
                        width: "15px"
                    },
                    { "data": "id_cotacao" },
                    { "data": "ds_nome" },
                    { "data": "ds_status_cotacao" },
                    { "data": "dt_cotacao" },
                    { "data": "bt_atualizar" },
                    { "data": "bt_dl_pdf" },

                ],
                "order": [[1, 'asc']]
            });

            // Add event listener for opening and closing details
            $('#grdCotacoes tbody').on('click', 'td.details-control', function () {
                var tr = $(this).closest('tr');
                var tdi = tr.find("i.fa");
                var row = table.row(tr);

                if (row.child.isShown()) {
                    // This row is already open - close it
                    row.child.hide();
                    tr.removeClass('shown');
                    tdi.first().removeClass('fa-minus-square');
                    tdi.first().addClass('fa-plus-square');
                }
                else {
                    // Open this row
                    row.child(format(row.data())).show();
                    tr.addClass('shown');
                    tdi.first().removeClass('fa-plus-square');
                    tdi.first().addClass('fa-minus-square');
                }
            });

            table.on("user-select", function (e, dt, type, cell, originalEvent) {
                if ($(cell.node()).hasClass("details-control")) {
                    e.preventDefault();
                }
            });


            ////$('p').html("Sobrenome:" + data.d._sobreNome + " idade:" + data.d._idade + "");
            ////$("#ContentPlaceHolder1_txtNome").val(data.d.ds_nome);

            //$('#ContentPlaceHolder1_ddlIndicados').find("option").remove();

            ////$.each(data, function (key, value) {
            ////    alert(key + ": " + value);
            ////});
            //$('#ContentPlaceHolder1_ddlIndicados').append('<option Value="">Selecione...</option>');
            //var obj = JSON.parse(data.d);

            //obj.forEach(function (o, index) {
            //    //var option2 = document.createElement('option');
            //    //option2.value = o.id_cliente;
            //    //option2.text = o.ds_nome;
            //    $('#ContentPlaceHolder1_ddlIndicados').append('<option Value="' + o.id_cliente + '">' + o.ds_nome + '</option>');
            //    //$('#ContentPlaceHolder1_ddlIndicados').add(option2);
            //    //alert(o.ds_nome);
            //});

        }

        function InserirLinha() {
            //inclui uma nova linha
            var index = 2;
            novaLinha = "<tr>" +
                "<td class='id'>CLI1033</td>" +
                "<td class='nome'>Jessica</td>" +
                "<td class='email'>jessicalang@net.com</td>" +
                "<td class='idade'>22</td>" +
                "</tr>";
            $('#grdCotacoes > tbody > tr').eq(index - 1).before(novaLinha); // incluir como segunda linha
        };

        function RemoverTodasLinhas() {
            // remove todas as linhas exceto o header
            $('#grdCotacoes tbody tr').remove();
        };
        function InserirLinhaNoFim() {
            // inclui uma nova linha no fim da tabela
            novaLinha = "<tr>" +
                "<td class='id'>CLI1035</td>" +
                "<td class='nome'>Jefferson</td>" +
                "<td class='email'>jeff@bol.com.br</td>" +
                "<td class='idade'>21</td>" +
                "</tr>";
            $('#example > tbody > tr:last').after(novaLinha);
		};

        function CarregaCotacao(tipo, id_cotacao)
        {
            if (tipo == 'A')
            {
                
                window.location.href = "IncluirCotacao.aspx?req=" + id_cotacao;
            }

        }
        function CarregaPDF(tipo, pds_pdf) {
            if (pds_pdf != "") {
                window.open("../../../upload/" + pds_pdf + ".pdf",
                    "",
                    "toolbar=no, location=no, status=no, menubar=yes, " +
                    "scrollbars=yes, resizable=no, width=680, " +
                    "height=650, left=180, top=50");
            }
            else {
                alert("PDF estará disponivel quando o Status for COTAÇÃO PRONTA.")
            }

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
            <!-- /.box-header -->
            <div class="box">
			  <div class="box-header bg-light">

				<h4 class="box-title">Gestão de Cotações </h4>
                 <div class="box-controls pull-right">
				    <%--<button id="row-remove" class="btn btn-xs btn-danger">Delete selected row</button>
				    <button id="btnInserLinhaIndice" class="btn btn-xs btn-danger"  OnClick="InserirLinha(); return false;">Inserir Linha</button>
		            <button id="btnInserirLinhaFim" class="btn btn-xs btn-danger" OnClick="InserirLinhaNoFim(); return false;">Inserir linha no Fim</button>
		            <button id="btnRemoverLinhas" class="btn btn-xs btn-danger" OnClick="RemoverTodasLinhas(); return false;">Remover Linhas</button>--%>
                      <asp:TextBox name="txtIdClienteIndicador" id="txtIdClienteIndicador" type="hidden" runat="server"></asp:TextBox>
              </div>
			  </div>
            <div class="box-body">		
            	<div class="table-responsive">
				  <table id="grdCotacoes" class="table table-bordered table-striped display nowrap margin-top-10" style="width:100%">
					<thead>
						<tr>
							<th></th>
                            <th>Nº Cotação</th>
							<th>Segurado</th>
							<th>Status</th>
							<th>Data Cotação</th>
							<th>Atualizar</th>
							<th>PDF</th>
						</tr>
					</thead>
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

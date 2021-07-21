<%@ Page Language="C#" MasterPageFile="~/main/pages/Principal.Master" AutoEventWireup="true" CodeBehind="Gratificacao.aspx.cs" Inherits="actoseg.main.pages.Gratificacao" %>

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
                url: "Gratificacao.aspx/wmListaGratificacaoPagamento",
                data: "{pid_cliente_indicado: " + $("#ContentPlaceHolder1_txtIdClienteIndicador").val() + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessCarregarGrid,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });

            
        }
        
        function OnSuccessCarregarGrid(data, status) {

          
            var Jsondata = JSON.parse(data.d);
            $('#grdGratificacaoPagamento').DataTable().destroy();
            var table = $('#grdGratificacaoPagamento').DataTable({
                "data": Jsondata,
                "searching": false,
                "paging": true,
                "info": false,
                "ordering": false,
                select: "single",
                "columns": [
                    
                    { "data": "ds_ano_gratificacao" },
                    { "data": "ds_mes_gratificacao" },
                    { "data": "vl_gratificacao" },
                    { "data": "ds_status_gratificacao" },
                    { "data": "dt_pagamento" },
                    { "data": "ds_comprovante_pdf" },
                    { "data": "bt_emissoes" },

                ]
            });

            table.on("user-select", function (e, dt, type, cell, originalEvent) {
                if ($(cell.node()).hasClass("details-control")) {
                    e.preventDefault();
                }
            });
        }

        function CarregaEmissoes(nr_mes_gratificacao, id_cliente_indicado) {
            CarregaGridEmissoes(nr_mes_gratificacao, id_cliente_indicado);
            $('#modal-emissoes').modal('show');
        }
        function CarregaGridEmissoes(nr_mes_gratificacao, id_cliente_indicado) {
           
            $.ajax({
                type: "POST",
                url: "Gratificacao.aspx/wmListarGratificacaoMes",
                data: "{pid_cliente_indicado: " + id_cliente_indicado +
                    ", pnr_mes_gratificacao: " + nr_mes_gratificacao +
                        "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessCarregaGridEmissoes,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }
        function OnSuccessCarregaGridEmissoes(data, status) {

            $('#grdGratificacao').DataTable().destroy();
            var Jsondata = JSON.parse(data.d);
            

            var table = $('#grdGratificacao').DataTable({
                "data": Jsondata,
                "searching": false,
                "paging": false,
                "info": false,
                //"scrollY": true,
                //"scrollX": true,
                "ordering": false,
                select: "single",
                "columns": [
                    { "data": "id_cotacao" },
                    { "data": "ds_logo" },
                   
                    { "data": "vl_premio" },
                    { "data": "nr_porcentagem_comissao" },
                    { "data": "vl_comissao" },
                    { "data": "nr_porcentagem_gratificacao" },
                    { "data": "vl_gratificacao" },
                    { "data": "dt_emissao" },
                   
                    


                ],
                "order": [[1, 'asc']]
            });



            

        }

        
       
        $(document).ready(function () {
            jQuery.support.cors = true;
        });
        function FecharEmissoes() {
            
            $('#modal-emissoes').modal('hide');

        }
          
    </script>
    <!-- Content Wrapper. Contains page content -->
  <%--<div class="content-wrapper">--%>
    <!-- Content Header (Page header) -->
    <section class="content-header">
     
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i> Inicío</a></li>
        <li class="breadcrumb-item"><a href="#">Administração</a></li>
        <li class="breadcrumb-item active">Gratificações</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Modal EMISSÕES-->
				<div class="modal center-modal fade" id="modal-emissoes" tabindex="-2" >
				  <div class="modal-dialog modal-xl" >
					<div class="modal-content" style="width: 100%;" >
					  <div class="modal-header" >
						<h5 class="modal-title">Emissões</h5>
						<button type="button" class="close" onclick="FecharEmissoes()">
						  <span aria-hidden="true">&times;</span>
						</button>
					  </div>
					  <%--<div class="modal-body">--%>
						   <div class="row">		
							<div class="col-lg-12 col-12">
		                      <div class="">
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <%--<h4 class="box-title text-info"><i class="ti-user mr-15"></i> Informações Pessoais                </h4>--%>
					                    <hr class="my-15">
										
					                    <div class="row">
					                      <div class="col-md-12">
												<div class="form-group" >
													<div class="table-responsive" style="overflow-y: scroll;display: flex; flex-wrap: wrap; height: 265px;margin-bottom: 12px;">
													  <%--<table id="grdChat" class="table table-bordered table-striped display nowrap margin-top-10" style="width:100%">--%>
														  <table id="grdGratificacao" class="grdacto table table-striped" style="width:100%">
														<thead>
															<tr>
																<th>Cotação</th>
																<th>Seguradora</th>
																
																<th>Prêmio</th>
                                                                <th>% Comissão</th>
                                                                <th>Valor Comissão</th>
                                                                <th>% Gratificação</th>
                                                                <th>Valor Gratificação</th>
                                                                <th>Data Emissão</th>
															</tr>
														</thead>
													  </table>
            										</div>
												</div>
										  </div>
											
					                    </div>
										
									</div>
				                 
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                   
                            
                            </div>
						<%--</div>--%>                        
					  </div>
					  
					</div>
				</div>
				
       <!-- /.modal -->
            <!-- /.box-header -->
            <div class="box">
			    <div class="box-header bg-light">

				<h4 class="box-title">Gratificações</h4>
                 <div class="box-controls pull-right">
				    <%--<button id="row-remove" class="btn btn-xs btn-danger">Delete selected row</button>
				    <button id="btnInserLinhaIndice" class="btn btn-xs btn-danger"  OnClick="InserirLinha(); return false;">Inserir Linha</button>
		            <button id="btnInserirLinhaFim" class="btn btn-xs btn-danger" OnClick="InserirLinhaNoFim(); return false;">Inserir linha no Fim</button>
		            <button id="btnRemoverLinhas" class="btn btn-xs btn-danger" OnClick="RemoverTodasLinhas(); return false;">Remover Linhas</button>--%>
                      <asp:TextBox name="txtIdClienteIndicador" id="txtIdClienteIndicador" type="hidden" runat="server"></asp:TextBox>
              </div>
			  </div>
                <div class="box-body">		
            	<%--<div class="table-responsive">--%>
                <div class="table-responsive" style="overflow-y: scroll;display: flex; flex-wrap: wrap; height: 400px;margin-bottom: 12px;">
				  <table id="grdGratificacaoPagamento" class="grdacto table table-striped" style="width:100%">
					<thead>
						<tr>
							<th>Ano</th>
                            <th>Mês</th>
							<th>Valor</th>
                            <th>Status</th>
							<th>Data Pagamento</th>
                            <th>Comprovante</th>							
                            <th></th>							
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


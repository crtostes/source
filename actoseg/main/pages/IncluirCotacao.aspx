<%@ Page Language="C#" MasterPageFile="~/main/pages/Principal.Master"  AutoEventWireup="true" CodeBehind="IncluirCotacao.aspx.cs" Inherits="actoseg.main.pages.IncluirCotacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<script src="..\..\Scripts\Pages\IncluirCotacao.js" type="text/javascript"></script>
	
	 <script>

		 //ONLOAD JAVASCRIPT DA PAGINA
    //     function codeAddress() {

			 //CarregarListarUtilizacoes();
			 //CarregarListarMoraEm();
			 //CarregarListarLocalPernoites();
			 //CarregarListaSeguradoras();
    //     }
    //     window.onload = codeAddress; 

		var DESC_MARCA_ALTERA = "";
        var CODIGO_MARCA_ALTERA = "";
		var ANO_MODELO_ALTERA = "";
		var CD_FIPE_ALTERA = "";
		var CODIGO_MORAEM_ALTERA = "";
		var CODIGO_LOCALPERNOITE_ALTERA = "";
        var CODIGO_ULTILIZACAO_ALTERA = "";
        var CODIGO_SEGURADORA_ALTERA = "";

         
		 $(document).ready(function () {
            
			CarregarListarUtilizacoes();
            CarregarListaSeguradoras();
            CarregarListarMoraEm();
            CarregarListarLocalPernoites();
			CarregarCotacao();
             
		});
		function CarregarCotacao() {
            
			if ($("#ContentPlaceHolder1_txtIdCotacao").val() != '') {
                //EmProcessamento(true);
				$.ajax({
					type: "POST",
					url: "IncluirCotacao.aspx/wmConsultarCotacaoAutomovel",
					data: "{pid_cotacao: " + $("#ContentPlaceHolder1_txtIdCotacao").val() + "}",
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					success: OnSuccessCarregarCotacao,
					error: function (request, status, error) {
						alert(request.responseText);
					}
				});
			}
			else
			{
				
				$('#txtDtVigenciaInicial').val(dataAtualFormatada(0));
				$('#txtDtVigenciaFinal').val(dataAtualFormatada(1));
				TrocaFigura("segurado", false);
                document.getElementById("btnGravar").disabled = false;
			}


		 }
		function OnSuccessCarregarCotacao(data, status) {
	     	 //Topo
			
             $("#ddlTipoSeguro").val(data.d.ds_tipo_cotacao);
             $("#txtDtVigenciaInicial").val(data.d.ds_data_vigencia_inicial);
			$("#txtDtVigenciaFinal").val(data.d.ds_data_vigencia_final);
            $("#txtCotacao").val(data.d.id_cotacao);
             $("#ContentPlaceHolder1_txtIdCotacao").val(data.d.id_cotacao);
             $("#txtCotacaoAutomovel").val(data.d.id_cotacao_automovel);
             switch (data.d.ds_status_cotacao) {
                 case 'GR': 
					 $("#txtStatusCotacao").val("COTAÇÃO GRAVADA");
					 //$("#btnEnviar").disabled = false;
					 document.getElementById("btnEnviar").disabled = false;
                     document.getElementById("btnGravar").disabled = false;
					 $("#txtMensagemCotacao").val("Você pode alterar e gravar ou enviar para processamento.");
                     break;
				 case 'CE':
					 
					 $("#txtStatusCotacao").val("COTAÇÃO EM PROCESSAMENTO");
					 document.getElementById("btnGravar").disabled = true;
					 document.getElementById("btnEnviar").disabled = true;
                     document.getElementById("btnPDF").disabled = true;
					 document.getElementById("btnClonar").disabled = false;
                     document.getElementById("btnInsereCotacao").hidden = false;
                     document.getElementById("btnLimparItensCotacao").hidden = false;
                     document.getElementById("btnUploadPDF").hidden = false;
                     document.getElementById("btnFinalizaCotacao").hidden = false;
                     $("#txtMensagemCotacao").val("Esta Cotação foi enviada para processamento, aguarde o retorno.");
                     break;
				 case 'CP':
                     
					 $("#txtStatusCotacao").val("COTAÇÃO PRONTA");
                     document.getElementById("btnGravar").disabled = false;
                     document.getElementById("btnEnviar").disabled = true;
                     document.getElementById("btnPDF").disabled = false;
					 document.getElementById("btnClonar").disabled = false;
                     $("#txtMensagemCotacao").val("Esta Cotação está PRONTA, contate o cliente para Aprovação.");
					 break;
				 case 'CA':
                     
					 $("#txtStatusCotacao").val("CANCELADA");
                     document.getElementById("btnGravar").disabled = true;
                     document.getElementById("btnEnviar").disabled = true;
                     document.getElementById("btnPDF").disabled = true;
					 document.getElementById("btnClonar").disabled = true;
                     $("#txtMensagemCotacao").val("Você pode CLONAR esta cotação e gerar um nova.");
					 break;
				 case 'AP':
                    
					 $("#txtStatusCotacao").val("COTAÇÃO APROVADA");
                     document.getElementById("btnGravar").disabled = true;
                     document.getElementById("btnEnviar").disabled = true;
                     document.getElementById("btnPDF").disabled = false;
					 document.getElementById("btnClonar").disabled = false;
					 
                     $("#txtMensagemCotacao").val("Esta Cotação está APROVADA, contate o cliente para PAGAMENTO e EMISSÃO.");

                     break;
				 case 'EM':
                     
					 $("#txtStatusCotacao").val("APOLICE EMITIDA");
                     document.getElementById("btnGravar").disabled = true;
                     document.getElementById("btnEnviar").disabled = true;
                     document.getElementById("btnPDF").disabled = true;
                     document.getElementById("btnClonar").disabled = true;
                     break;
                 
             }
			 
			//Segurado
			//Carrega Segurado
			$("#txtIdClienteCotacao").val(data.d.id_cliente);
			$("#txtPDFCotacao").val(data.d.ds_pdf);
			 CarregarIndicado(); 
			//Veiculo
            //Carrega Veiculo
             CarregarTipoVeiculoFipe(data.d.cd_fipe);
             CD_FIPE_ALTERA = data.d.cd_fipe;
             ANO_MODELO_ALTERA = data.d.ds_ano_modelo;
             $("#txtAnoFabricacao").val(data.d.ds_ano_fabricao);
             CarregaAnoModelo();
             $('#ddlAnoModelo option[value="' + data.d.ds_ano_modelo + '"]').prop("selected", true);
             $("#txtChassi").val(data.d.ds_chassi);
             $("#ddlZeroKM").val(data.d.ds_zero_km);
             $("#ddlEstadoVeiculo").val(data.d.ds_estado_veiculo);
             $("#txtPlaca").val(data.d.ds_placa);

             $("#ddlCombustivel").val(data.d.ds_combustivel);
             $("#ddlPortas").val(data.d.ds_portas);
             $("#ddlUtilizacaoVeiculo").val(data.d.ds_utilizacao_veiculo);
             $("#txtCepPernoite").val(data.d.ds_cep_pernoite);
             $("#ddlFinanciado").val(data.d.ds_financiado);
             $("#ddlKitGas").val(data.d.ds_kit_gas);
             $("#ddlTaxi").val(data.d.ds_taxi);
             $("#ddlAplicativo").val(data.d.ds_aplicativo);
             $("#ddlBLR").val(data.d.ds_blindado);
             $("#ddlIsento").val(data.d.ds_pcd);

			 document.getElementById("imgVeiculo").className = "fa fa-check"; 
			//Perfil
			$("#txtCEPFrequencia").val(data.d.ds_cep_circulacao);
			$("#txtCEPResidencia").val(data.d.ds_cep_residencia);
            $("#ddlProprietario").val(data.d.ds_proprietario);
            $("#ddlPrincipalCondutor").val(data.d.ds_principal_condutor);
            $("#ddlRelacaoProprietario").val(data.d.ds_relacao_proprietario);
            $("#ddl18a25").val(data.d.ds_18_a_25_dirige);
            //$("#ddlMoraEm").val(data.d.ds_mora_em);
            //$("#ddlLocalPernoite").val(data.d.ds_local_pernoite);
			 
            $("#ddlUtilizacao").val(data.d.ds_utilizacao);
            $("#ddlGaragemResidencia").val(data.d.ds_garagem_residencia);
            $("#ddlGaragemTrabalho").val(data.d.ds_garagem_trabalho);
            $("#ddlGaragemEscola").val(data.d.ds_garagem_escola);
            $("#txtKmMediaMensal").val(data.d.ds_km_media_mensal);
			 $("#txtIdadePHabilitacao").val(data.d.nr_idade_habilitacao);
			 document.getElementById("imgPerfil").className = "fa fa-check";

			//Condutor
			$("#ddlRelComSegurado").val(data.d.ds_condutor_relacao_com_segurado);
			$("#txtDataNascimentoCondutor").val(data.d.ds_condutor_data_nascimento);
			$("#txtCPFCondutorPrincipal").val(data.d.ds_condutor_cpf);
			$("#txtNomeCondutoPrincipal").val(data.d.ds_condutor_nome);
			$("#txtIdadePHabilitacao").val(data.d.ds_condutor_idade_p_habilitacao);
			 $("#ddlGeneroCondutorPricipal").val(data.d.ds_condutor_genero);
			 
             $("#ddlEstadoCivilCondutorPricipal").val(data.d.ds_condutor_estado_civil);
			$("#txtProfissao").val(data.d.ds_condutor_profissao);
			 $("#txtDetalheProfissao").val(data.d.ds_condutor_detalhe_profissao);

			$("#ddlCondutorResideEm").val(data.d.ds_condutor_reside_em);
			$("#ddlCondutorConsiderado").val(data.d.ds_condutor_considerado);
			$("#ddlCondutorAcima25").val(data.d.ds_condutor_acima_25);
			$("#ddlTotalVeiculos").val(data.d.ds_condutor_total_veiculos);
			$("#txtRgCondutorPrinicpal").val(data.d.ds_condutor_rg);
			$("#txtDataEmissaoRgCondutorPrincipal").val(data.d.ds_condutor_data_emissao_rg);
			$("#txtEmissorRG").val(data.d.ds_condutor_emissor_rg);
			$("#txtCnhCondutorPrinicpal").val(data.d.ds_condutor_cnh);
			 $("#txtDataHabilitacao").val(data.d.ds_condutor_data_habilitacao);
             document.getElementById("imgCondutor").className = "fa fa-check";
			//Cobertura
			$("#ddlCobertura").val(data.d.ds_cobertura);
			$("#ddlValorMercado").val(data.d.ds_cobertura_valor_mercado);
			$("#ddlValorAcessorios").val(data.d.ds_cobertura_valor_acessorios);
			$("#ddlValorVidros").val(data.d.ds_cobertura_valor_vidros);
			$("#ddlValorEquipamentos").val(data.d.ds_cobertura_valor_equipamentos);
			$("#ddlValorDespExtras").val(data.d.ds_cobertura_valor_despesas_extras);
			$("#ddlCarroReserva").val(data.d.ds_cobertura_carro_reserva);
			$("#ddlAssistencia").val(data.d.ds_cobertura_assistencia);

			 
			$("#ddlDanosMateriais").val(data.d.ds_cobertura_danos_materiais);
			$("#ddlDanosCorporais").val(data.d.ds_cobertura_danos_corporais);
			$("#ddlDanosMorais").val(data.d.ds_cobertura_danos_morais);
			$("#ddlValorDiaParalisacao").val(data.d.ds_cobertura_valor_dia_paralisacao);
			$("#ddlPassageiros").val(data.d.ds_cobertura_passageiros);
			$("#ddlValorMorte").val(data.d.ds_cobertura_valor_morte);
			$("#ddlValorInvalidez").val(data.d.ds_cobertura_valor_invalidez);
			$("#ddlValorDespesasMedicas").val(data.d.ds_cobertura_valor_despesas_medicas);
			//Renovação
			$("#ddlSeguradoraRenovacao").val(data.d.ds_renovacao_seguradora);
			$("#ddlBonusAnterior").val(data.d.ds_renovacao_bonus_anterior);
			$("#ddlBonusAtual").val(data.d.ds_renovacao_bonus_atual);
			$("#txtDataVigenciaAnteriorInicio").val(data.d.ds_renovacao_data_vigencia_anterior_inicio);
			$("#txtDataVigenciaAnteriorFim").val(data.d.ds_renovacao_data_vigencia_anterior_fim);
			$("#txtApoliceRenovacao").val(data.d.ds_renovacao_apolice);
			$("#txtApoliceRenovacaoItem").val(data.d.ds_renovacao_apolice_item);
			$("#txtApoliceRenovacaoCI").val(data.d.ds_renovacao_apolice_ci);

			

			CODIGO_MORAEM_ALTERA = data.d.ds_mora_em;
			CODIGO_LOCALPERNOITE_ALTERA = data.d.ds_local_pernoite;
			CODIGO_ULTILIZACAO_ALTERA = data.d.ds_utilizacao;
            CODIGO_SEGURADORA_ALTERA = data.d.ds_renovacao_seguradora;
           
			CarregaCotacaoAutomoveisItensGrid();

            if (data.d.ds_status_cotacao == 'CE') { TravaCampos()};
			if (data.d.ds_status_cotacao == 'CA') { TravaCampos() };
			if (data.d.ds_status_cotacao == 'AP') { TravaCampos() };
            if (data.d.ds_status_cotacao == 'EM') { TravaCampos() };
            EmProcessamento(false);
			 //for (var i, j = 0; i = mySelect.options[j]; j++) {
                 
				// if (i.value == temp) {
    //                 alert(i.value);
    //                 mySelect.selectedIndex = j;
    //                 break;
    //             }
			 //}

		 }
        function CarregarTipoVeiculoFipe(cd_fipe) {
			$.ajax({
                type: "POST",
                url: "IncluirCotacao.aspx/wmConsultarMarcaModelo",
                data: "{pcd_fipe: '" + cd_fipe + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
				success: function (data, status) {
					
					//$("#txtTipoVeiculoFipe").val(data.d.cd_tipo);
					if (data.d.cd_tipo == '1') {
                        $("#rdoTipoVeiculoCarro").attr('checked', true);

					}
                    if (data.d.cd_tipo == '2') {
                        $("#rdoTipoVeiculoMoto").attr('checked', true);
					}   
                    if (data.d.cd_tipo == '3') {
                        $("#rdoTipoVeiculoCaminhao").attr('checked', true);
                    }

					DESC_MARCA_ALTERA = data.d.ds_marca;
					CODIGO_MARCA_ALTERA = data.d.cd_marca;
                    //alert("CODIGO_MARCA_ALTERA " + CODIGO_MARCA_ALTERA )
					CarregarListaMarcas(data.d.cd_tipo);


                    //var TipoVeiculo = "";
                    //if (document.getElementById("rdoTipoVeiculoCarro").checked) {
                    //    TipoVeiculo = $("#rdoTipoVeiculoCarro").val();
                    //}
                    //if (document.getElementById("rdoTipoVeiculoMoto").checked) {
                    //    TipoVeiculo = $("#rdoTipoVeiculoMoto").val();
                    //}
                    //if (document.getElementById("rdoTipoVeiculoCaminhao").checked) {
                    //    TipoVeiculo = $("#rdoTipoVeiculoCaminhao").val();
                    //}







                },
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
         }
        function CarregarListaModelos(codigo_marca, ano) {
			$.ajax({
                type: "POST",
                url: "IncluirCotacao.aspx/wmListarModelos",
                data: "{codigo_marca: " + codigo_marca +
                    ", ano: " + ano +
                    "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessCarregarListaModelos,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }
        function OnSuccessCarregarListaModelos(data, status) {
            //$('p').html("Sobrenome:" + data.d._sobreNome + " idade:" + data.d._idade + "");
            //$("#ContentPlaceHolder1_txtNome").val(data.d.ds_nome);


            $('#ddlModelo').find("option").remove();

            //$.each(data, function (key, value) {
            //    alert(key + ": " + value);
            //});
            $('#ddlModelo').append('<option Value="">Selecione...</option>');
            var obj = JSON.parse(data.d);

            obj.forEach(function (o, index) {
                //var option2 = document.createElement('option');
                //option2.value = o.id_cliente;
                //option2.text = o.ds_nome;
                var selcdFipe = "";

                if (o.cd_fipe == CD_FIPE_ALTERA) {
                    selcdFipe = "selected='selected'";
                }
                else {
                    selcdFipe = "";
                }
                $('#ddlModelo').append('<option Value="' + o.cd_fipe + '"' + selcdFipe + '>' + o.ds_modelo + '</option>');
                //$('#ContentPlaceHolder1_ddlIndicados').add(option2);
                //alert(o.ds_nome);
			});

			if ($("#ContentPlaceHolder1_txtIdCotacao").val() != '') {
                CarregarListarMoraEm();
				CarregarListarLocalPernoites();
                CarregarListarUtilizacoes();
                CarregarListaSeguradoras();
			}

        }
        function CarregarModelos() {
			
            var codigo_marca = 0;
			var ano = 0;

			if ($.trim($('#ddlAnoModelo').val()) == '') {
                MensagemActoSimples("Cotação", "Informe o Ano Modelo!");
                //alert('Informe o Ano Modelo!');
                return false;
			}   
			var codigo_marca = '';
			if (CODIGO_MARCA_ALTERA != '') {
                codigo_marca = CODIGO_MARCA_ALTERA;
			}
			else
			{	
                codigo_marca = $.trim($('#ddlMarca').val());
			}

			var ano = "";
			if (ANO_MODELO_ALTERA != '') {
                ano = ANO_MODELO_ALTERA;
            }
            else {
                ano = $.trim($('#ddlAnoModelo').val());
            }
			
            CarregarListaModelos(codigo_marca, ano);
            
		 }
        function CarregarModelosCombo() {

             var codigo_marca = 0;
             var ano = 0;

             if ($.trim($('#ddlAnoModelo').val()) == '') {
                 MensagemActoSimples("Cotação", "Informe o Ano Modelo!");
                //alert('Informe o Ano Modelo!');
                 return false;
             }
             var codigo_marca = $.trim($('#ddlMarca').val());
             var ano = $.trim($('#ddlAnoModelo').val());
            
            CarregarListaModelos(codigo_marca, ano);

			onchange_aba_veiculo(); 
         }
		function CarregarListaMarcas(tipo) {
			
            $.ajax({
                type: "POST",
                url: "IncluirCotacao.aspx/wmListarMarcas",
                data: "{tipo: " + tipo + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessCarregarListaMarcas,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }
        function OnSuccessCarregarListaMarcas(data, status) {
            //$('p').html("Sobrenome:" + data.d._sobreNome + " idade:" + data.d._idade + "");
            //$("#ContentPlaceHolder1_txtNome").val(data.d.ds_nome);
			if ($("#ContentPlaceHolder1_txtIdCotacao").val() == '') {
				$('#txtAnoFabricacao').val('');
				$('#ddlAnoModelo').val('');
				
				
			}
            $('#ddlModelo').find("option").remove();
            $('#ddlMarca').find("option").remove();
            //$.each(data, function (key, value) {
            //    alert(key + ": " + value);
            //});
			
            $('#ddlMarca').append('<option Value="">Selecione...</option>');
            var obj = JSON.parse(data.d);
			;
            obj.forEach(function (o, index) {
                //var option2 = document.createElement('option');
                //option2.value = o.id_cliente;
                //option2.text = o.ds_nome;
				var selMarca = "";
                
                if (o.ds_marca == DESC_MARCA_ALTERA) {
					selMarca = "selected='selected'";
				}
				else
				{
                    selMarca = "";
				}

                $('#ddlMarca').append('<option Value="' + o.cd_marca + '"' + selMarca + '>' + o.ds_marca + '</option>');
                //$('#ContentPlaceHolder1_ddlIndicados').add(option2);
                //alert(o.ds_nome);
			});

			if ($("#ContentPlaceHolder1_txtIdCotacao").val() != '') {
				CarregarModelos();
			}

        }
        function CarregarMarcas() {

            var TipoVeiculo = "";
			if (document.getElementById("rdoTipoVeiculoCarro").checked) {
                
                TipoVeiculo = $("#rdoTipoVeiculoCarro").val();
            }
			if (document.getElementById("rdoTipoVeiculoCaminhao").checked) {
                
                TipoVeiculo = $("#rdoTipoVeiculoCaminhao").val();
			}
			if (document.getElementById("rdoTipoVeiculoMoto").checked) {
                
                TipoVeiculo = $("#rdoTipoVeiculoMoto").val();
            }
            
            CarregarListaMarcas(TipoVeiculo);
            
        }
        function CarregaAnoModeloSel(anosel) {

             $('#ddlAnoModelo').find("option").remove();
             //$.each(data, function (key, value) {
             //    alert(key + ": " + value);
             //});
             $('#ddlAnoModelo').append('<option Value="">Selecione...</option>');
             $('#ddlAnoModelo').append('<option Value="' + $('#txtAnoFabricacao').val() + '">' + $('#txtAnoFabricacao').val() + '</option>');
             $('#ddlAnoModelo').append('<option selected=true Value="' + (parseInt($('#txtAnoFabricacao').val()) + 1) + '">' + (parseInt($('#txtAnoFabricacao').val()) + 1) + '</option>');

         }
		function CarregaAnoModelo() {            

            $('#ddlAnoModelo').find("option").remove();
            //$.each(data, function (key, value) {
            //    alert(key + ": " + value);
            //});
            $('#ddlAnoModelo').append('<option Value="">Selecione...</option>');
            $('#ddlAnoModelo').append('<option Value="' + $('#txtAnoFabricacao').val() + '">' + $('#txtAnoFabricacao').val() + '</option>');
            $('#ddlAnoModelo').append('<option Value="' + (parseInt($('#txtAnoFabricacao').val()) + 1) + '">' + (parseInt($('#txtAnoFabricacao').val()) + 1) + '</option>');

        }
        function Voltar() {
            window.location.href = "Default.aspx";
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

            $('#ddlIndicados').find("option").remove();

            //$.each(data, function (key, value) {
            //    alert(key + ": " + value);
            //});
			$('#ddlIndicados').append('<option Value="">Selecione...</option>');
            $('#ddlIndicados').append('<option Value="' + $("#ContentPlaceHolder1_txtIdClienteIndicador").val() + '">' + $("#ContentPlaceHolder1_txtNomeClienteIndicador").val() + '</option>');
			

            var obj = JSON.parse(data.d);

            obj.forEach(function (o, index) {
                //var option2 = document.createElement('option');
                //option2.value = o.id_cliente;
                //option2.text = o.ds_nome;
				//$('#ContentPlaceHolder1_ddlIndicados').append('<option Value="' + o.id_cliente + '">' + o.ds_nome + '</option>');
                $('#ddlIndicados').append('<option Value="' + o.id_cliente + '">' + o.nr_cpf_cnpj + ' - ' + o.ds_nome + '</option>');
                //$('#ContentPlaceHolder1_ddlIndicados').add(option2);
                //alert(o.ds_nome);
            });

        }
        function CarregarIndicadoLista() {

			//if ($('#ContentPlaceHolder1_ddlIndicados').val() == "") {
            if ($('#ddlIndicados').val() == "") {
                MensagemActoSimples("Cotação", "Selecione o Cliente para Cotação de Automóvel!");
                //alert("");
                return false;
            }

            $.ajax({
                type: "POST",
                url: "MeuIndicado.aspx/wmConsultarIndicado",
                data: "{id_cliente: " + $('#ddlIndicados').val() + "}",
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
                data: "{id_cliente: '" + $("#txtIdClienteCotacao").val() + "'}",
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
            $("#txtIdClienteCotacao").val(data.d.id_cliente);
            $("#txtCPF").val(data.d.nr_cpf_cnpj);
            $("#txtNome").val(data.d.ds_nome);
            $("#txtEmail").val(data.d.ds_email);
            $("#txtDataNascimento").val(data.d.dt_nascimento);
			$("#txtTelefoneCelular").val(data.d.ds_telefone_celular);
            $("#txtTelefoneCelular2").val(data.d.ds_telefone_comercial);
			$("#txtGenero").val(data.d.ds_genero);
            $("#txtEstadoCivil").val(data.d.ds_estado_civil);
			//$("#ContentPlaceHolder1_rdoTipoPessoa1").attr('checked', true);
			TrocaFigura("segurado", true);
            
            //$("#ContentPlaceHolder1_rdoGeneroM").attr('checked', false);
            //$("#ContentPlaceHolder1_rdoGeneroF").attr('checked', false);
            //if (data.d.id_genero == '1') {

            //    $("#ContentPlaceHolder1_rdoGeneroM").attr('checked', true);

            //}
            //if (data.d.id_genero == '2') {
            //    $("#ContentPlaceHolder1_rdoGeneroF").attr('checked', true);
            //}

   //         $("#ContentPlaceHolder1_txtNumeroRG").val(data.d.ds_rg);
   //         $("#ContentPlaceHolder1_txtEmissao").val(data.d.ds_emissao);
   //         $("#ContentPlaceHolder1_txtDataExpedicao").val(data.d.dt_emissao_rg);
   //         $("#ContentPlaceHolder1_cboEstadoCivil").val(data.d.id_estado_civil);
			//$("#ContentPlaceHolder1_txtDataInclusao").val(data.d.dt_inclusao);


            ConsultaEnderecoIndicado();
            //CarregarListarUtilizacoes();
            //CarregarListarMoraEm();
            //CarregarListarLocalPernoites();
            //CarregarListaSeguradoras(); 

        }
		function ConsultaEnderecoIndicado() {
            
            $.ajax({
                type: "POST",
                url: "EnderecoIndicado.aspx/wmConsultarEnderecoIndicado",
                data: "{id_cliente: '" + $("#txtIdClienteCotacao").val() + "'}",
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
           // $("#ContentPlaceHolder1_cboTipoEndereco").val(data.d.id_tipo_endereco);
			$("#txtCEP").val(data.d.ds_cep);
            $("#txtCepPernoite").val(data.d.ds_cep);
            $("#txtCEPFrequencia").val(data.d.ds_cep);
            $("#txtCEPResidencia").val(data.d.ds_cep);

            $("#txtEndereco").val(data.d.ds_endereco);
            $("#txtNumeroEndereco").val(data.d.ds_numero);
            $("#txtComplemento").val(data.d.ds_complemento);
            $("#txtBairro").val(data.d.ds_bairro);
            $("#txtCidadeUF").val(data.d.ds_cidade + ' - ' + data.d.ds_estado);
            //$("#ContentPlaceHolder1_cboEstado").val(data.d.ds_estado);
            //$("#ContentPlaceHolder1_txtDataAtualizacao").val(data.d.dt_atualizacao);
			


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
        function CarregarListarUtilizacoes() {

            $.ajax({
                type: "POST",
                url: "IncluirCotacao.aspx/wmListarUtilizacoes",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessCarregarListarUtilizacoes,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
		 }
		function OnSuccessCarregarListarUtilizacoes(data, status) {
			 $('#ddlUtilizacao').find("option").remove();
			 $('#ddlUtilizacao').append('<option Value="">Selecione...</option>');
			 var obj = JSON.parse(data.d);

			obj.forEach(function (o, index) {
                var selu = "";

                if (o.id_utilizacao == CODIGO_ULTILIZACAO_ALTERA) {
                    selu = "selected='selected'";

                }
                else {
                    selu = "";
                }
                $('#ddlUtilizacao').append('<option Value="' + o.id_utilizacao + '"' + selu + '>' + o.ds_utilizacao + '</option>');
			 });
		 }
        function CarregarListarMoraEm() {

            $.ajax({
                type: "POST",
                url: "IncluirCotacao.aspx/wmListarMoraEm",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessCarregarListarMoraEm,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }
		function OnSuccessCarregarListarMoraEm(data, status) {
			 $('#ddlMoraEm').find("option").remove();
			 $('#ddlMoraEm').append('<option Value="">Selecione...</option>');
			 var obj = JSON.parse(data.d);

			obj.forEach(function (o, index) {
                var selme = "";

                if (o.id_mora_em == CODIGO_MORAEM_ALTERA) {
					selme = "selected='selected'";
                 
                }
                else {
                    selme = "";
                }
                $('#ddlMoraEm').append('<option Value="' + o.id_mora_em + '"' + selme + '>' + o.ds_mora_em + '</option>');
			 });
		 }
        function CarregarListarLocalPernoites() {

            $.ajax({
                type: "POST",
                url: "IncluirCotacao.aspx/wmListarLocalPernoites",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessCarregarListarLocalPernoites,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }
	    function OnSuccessCarregarListarLocalPernoites(data, status) {
			 $('#ddlLocalPernoite').find("option").remove();
			 $('#ddlLocalPernoite').append('<option Value="">Selecione...</option>');
			 var obj = JSON.parse(data.d);

			obj.forEach(function (o, index) {
                var sellp = "";

                if (o.id_local_pernoite == CODIGO_LOCALPERNOITE_ALTERA) {
					sellp = "selected='selected'";
					
                }
                else {
                    sellp = "";
                }
                $('#ddlLocalPernoite').append('<option Value="' + o.id_local_pernoite + '"' + sellp + '>' + o.ds_local_pernoite + '</option>');
			 });
		 }
        function CarregarListaSeguradoras() {

                $.ajax({
                    type: "POST",
                    url: "IncluirCotacao.aspx/wmListaSeguradoras",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccessCarregarListaSeguradoras,
                    error: function (request, status, error) {
                        alert(request.responseText);
                    }
                });
            }
		function OnSuccessCarregarListaSeguradoras(data, status) {
			 $('#ddlSeguradora').find("option").remove();
			 $('#ddlSeguradora').append('<option Value="">Selecione...</option>');
			 var obj = JSON.parse(data.d);

			obj.forEach(function (o, index) {

				
                var sel = "";

                if (o.id_seguradora == CODIGO_SEGURADORA_ALTERA) {
                    sel = "selected='selected'";
                }
                else {
                    sel = "";
                }
                $('#ddlSeguradora').append('<option Value="' + o.id_seguradora + '"' + sel + '>' + o.ds_seguradora + '</option>');
			 });
		 }

     </script>
	<script>
		function AbrePopupUploadPDF() {
            $('#modal-sobe-pdf').modal('show');
		}
		function SaveData() {
            $('#modal-sobe-pdf').modal('hide');
			$('#em-processamento').modal('show');
			var conteudo = "";
    
		//Read File
        var selectedFile = $("#FileUpload1")[0].files;
        //Check File is not Empty
        if (selectedFile.length > 0) {
            // Select the very first file from list
            var fileToLoad = selectedFile[0];
            // FileReader function for read the file.
            var fileReader = new FileReader();
            var base64;
            // Onload of file read the file content
            fileReader.onload = function(fileLoadedEvent) {
                base64 = fileLoadedEvent.target.result;
                // Print data in console
                conteudo = base64;
                
                 $.ajax({
                    url: 'IncluirCotacao.aspx/SaveData',
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                     data: "{file:'" + conteudo + "',pid_cotacao: " + $("#ContentPlaceHolder1_txtIdCotacao").val() + "}",
                    dataType: "json",
                    success: OnSuccessSaveData ,
					 error: function () {
                         $('#em-processamento').modal('hide');
                         MensagemActoSimples("UPLOAD PDF COTAÇÃO", "Erro: " + request.responseText);
                         
                    }
                });
            };
            // Convert data to base64
			fileReader.readAsDataURL(fileToLoad);

		}
		function OnSuccessSaveData(data, status) {
			$('#em-processamento').modal('hide');
			MensagemActoSimples("UPLOAD PDF COTAÇÃO", "Arquivo Enviado com sucesso!");

            

        }

		}
		function BaixarPDF() {
            window.open("../../../upload/" + $("#txtPDFCotacao").val() + ".pdf",
                "",
                "toolbar=no, location=no, status=no, menubar=yes, " +
                "scrollbars=yes, resizable=no, width=680, " +
                "height=650, left=180, top=50");
		}
    </script>
	 <script>
		
        $(document).ready(function () {
			jQuery.support.cors = true;
			
		});
         
		function TrocaFigura(aba, result) {

			 if (aba == "segurado")
			 {
				 if (result)
				 {
                     
                     document.getElementById("imgSegurado").className = "fa fa-check";
                     //document.getElementById("imgSegurado").classList.add('fa fa-check');
                     
				 }
				 else
				 {
					 
                     document.getElementById("imgSegurado").className = "fa fa-bomb";
                     //document.getElementById("imgSegurado").classList.remove('fa fa-check');
                     //document.getElementById("imgSegurado").classList.add('fa fa-bomb');
				 }



			 }
				
         }
         

		 function GravarCotacao() {

			 if (ValidarCamposCotacao() == false) {
                EmProcessamento(false);
				return false;
			}
			EmProcessamento(true);
			if ($("#ContentPlaceHolder1_txtIdCotacao").val() != '') {
				$("#txtCotacao").val($("#ContentPlaceHolder1_txtIdCotacao").val());
			}
			else
			{
                $("#ContentPlaceHolder1_txtIdCotacao").val("0");
            }
			 if ($("#txtStatusCotacao").val = "COTAÇÃO PRONTA") {
                 
				 $.ajax({
					 type: "POST",
					 url: "IncluirCotacao.aspx/wmAtualizarStatusCotacaoAutomovel",
                     data: "{pid_cotacao: '" + $("#ContentPlaceHolder1_txtIdCotacao").val() +
						 "', pid_cliente: '" + $("#txtIdClienteCotacao").val() +
						 "', pcd_status_cotacao: 'GR'}",
					 contentType: "application/json; charset=utf-8",
					 dataType: "json",
					 error: function (request, status, error) {
						 alert(request.responseText);
					 }
				 });
			 }

			$.ajax({
				type: "POST",
				url: "IncluirCotacao.aspx/wmAtualizarCotacaoAutomovel",
                data: "{pid_cotacao: '" + $("#ContentPlaceHolder1_txtIdCotacao").val() +
                    "', pid_cotacao_automovel: '" + $("#txtCotacaoAutomovel").val() +
					"', pid_cliente: '" + $("#txtIdClienteCotacao").val() + 

                    "', pds_tipo_cotacao: '" + $("#ddlTipoSeguro").val() +
                    "', pds_data_vigencia_inicial: '" + $("#txtDtVigenciaInicial").val() +
                    "', pds_data_vigencia_final: '" + $("#txtDtVigenciaFinal").val() +

					"', pds_ano_fabricao: '" + $("#txtAnoFabricacao").val() +
					"', pds_ano_modelo: '" + $("#ddlAnoModelo").val() +
					"', pcd_fipe: '" + $("#ddlModelo").val() +
					"', pds_marca: '" + $("#ddlMarca :selected").text() +
					"', pds_modelo: '" + $("#ddlModelo :selected").text() +
					"', pds_versao: '" + $("#ddlModelo :selected").text() +
					"', pds_chassi: '" + $("#txtChassi").val() +
					"', pds_zero_km: '" + $("#ddlZeroKM").val() +
					"', pds_estado_veiculo: '" + $("#ddlEstadoVeiculo").val() +
					"', pds_placa: '" + $("#txtPlaca").val() +

					"', pds_combustivel: '" + $("#ddlCombustivel").val() +
					"', pds_portas: '" + $("#ddlPortas").val() +
					"', pds_utilizacao_veiculo: '" + $("#ddlUtilizacaoVeiculo").val() +
                    "', pds_cep_pernoite: '" + $("#txtCepPernoite").val() +
					"', pds_financiado: '" + $("#ddlFinanciado").val() +
					"', pds_kit_gas: '" + $("#ddlKitGas").val() +
					"', pds_taxi: '" + $("#ddlTaxi").val() +
					"', pds_aplicativo: '" + $("#ddlAplicativo").val() +
					"', pds_blindado: '" + $("#ddlBLR").val() +
					"', pds_pcd: '" + $("#ddlIsento").val() +

					"', pds_cep_circulacao: '" + $("#txtCEPFrequencia").val() +
					"', pds_cep_residencia: '" + $("#txtCEPResidencia").val() +
					"', pds_proprietario: '" + $("#ddlProprietario").val() +
					"', pds_principal_condutor: '" + $("#ddlPrincipalCondutor").val() +
					"', pds_relacao_proprietario: '" + $("#ddlRelacaoProprietario").val() +
					"', pds_18_a_25_dirige: '" + $("#ddl18a25").val() +
					"', pds_mora_em: '" + $("#ddlMoraEm").val() +
					"', pds_local_pernoite: '" + $("#ddlLocalPernoite").val() +
                     
					"', pds_utilizacao: '" + $("#ddlUtilizacao").val() +
					"', pds_garagem_residencia: '" + $("#ddlGaragemResidencia").val() +
					"', pds_garagem_trabalho: '" + $("#ddlGaragemTrabalho").val() +
					"', pds_garagem_escola: '" + $("#ddlGaragemEscola").val() +
					"', pds_km_media_mensal: '" + $("#txtKmMediaMensal").val() +
					"', pnr_idade_habilitacao: '" + $("#txtIdadePHabilitacao").val() +

					"', pds_condutor_relacao_com_segurado: '" + $("#ddlRelComSegurado").val() +
					"', pds_condutor_data_nascimento: '" + $("#txtDataNascimentoCondutor").val() +
					"', pds_condutor_cpf: '" + $("#txtCPFCondutorPrincipal").val() +
					"', pds_condutor_nome: '" + $("#txtNomeCondutoPrincipal").val() +
					"', pds_condutor_idade_p_habilitacao: '" + $("#txtIdadePHabilitacao").val() +
					"', pds_condutor_genero: '" + $("#ddlGeneroCondutorPricipal").val() +
					"', pds_condutor_estado_civil: '" + $("#ddlEstadoCivilCondutorPricipal").val() +
					"', pds_condutor_profissao: '" + $("#txtProfissao").val() +
					"', pds_condutor_detalhe_profissao: '" + $("#txtDetalheProfissao").val() +
					 
					"', pds_condutor_reside_em: '" + $("#ddlCondutorResideEm").val() +
					"', pds_condutor_considerado: '" + $("#ddlCondutorConsiderado").val() +
					"', pds_condutor_acima_25: '" + $("#ddlCondutorAcima25").val() +
					"', pds_condutor_total_veiculos: '" + $("#ddlTotalVeiculos").val() +
					"', pds_condutor_rg: '" + $("#txtRgCondutorPrinicpal").val() +
					"', pds_condutor_data_emissao_rg: '" + $("#txtDataEmissaoRgCondutorPrincipal").val() +
					"', pds_condutor_emissor_rg: '" + $("#txtEmissorRG").val() +
					"', pds_condutor_cnh: '" + $("#txtCnhCondutorPrinicpal").val() +
					"', pds_condutor_data_habilitacao: '" + $("#txtDataHabilitacao").val() +


					"', pds_cobertura: '" + $("#ddlCobertura").val() +
					"', pds_cobertura_valor_mercado: '" + $("#ddlValorMercado").val() +
					"', pds_cobertura_valor_acessorios: '" + $("#ddlValorAcessorios").val() +
					"', pds_cobertura_valor_vidros: '" + $("#ddlValorVidros").val() +
					"', pds_cobertura_valor_equipamentos: '" + $("#ddlValorEquipamentos").val() +
					"', pds_cobertura_valor_despesas_extras: '" + $("#ddlValorDespExtras").val() +
					"', pds_cobertura_carro_reserva: '" + $("#ddlCarroReserva").val() +
					"', pds_cobertura_assistencia: '" + $("#ddlAssistencia").val() +
					 
					"', pds_cobertura_danos_materiais: '" + $("#ddlDanosMateriais").val() +
					"', pds_cobertura_danos_corporais: '" + $("#ddlDanosCorporais").val() +
					"', pds_cobertura_danos_morais: '" + $("#ddlDanosMorais").val() +
					"', pds_cobertura_valor_dia_paralisacao: '" + $("#ddlValorDiaParalisacao").val() +
					"', pds_cobertura_passageiros: '" + $("#ddlPassageiros").val() +
					"', pds_cobertura_valor_morte: '" + $("#ddlValorMorte").val() +
					"', pds_cobertura_valor_invalidez: '" + $("#ddlValorInvalidez").val() +
					"', pds_cobertura_valor_despesas_medicas: '" + $("#ddlValorDespesasMedicas").val() +
 
					"', pds_renovacao_seguradora: '" + $("#ddlSeguradoraRenovacao").val() +
					"', pds_renovacao_bonus_anterior: '" + $("#ddlBonusAnterior").val() +
					"', pds_renovacao_bonus_atual: '" + $("#ddlBonusAtual").val() +
					"', pds_renovacao_data_vigencia_anterior_inicio: '" + $("#txtDataVigenciaAnteriorInicio").val() +
					"', pds_renovacao_data_vigencia_anterior_fim: '" + $("#txtDataVigenciaAnteriorFim").val() +
					"', pds_renovacao_apolice: '" + $("#txtApoliceRenovacao").val() +
					"', pds_renovacao_apolice_item: '" + $("#txtApoliceRenovacaoItem").val() +
					"', pds_renovacao_apolice_ci: '" + $("#txtApoliceRenovacaoCI").val() +

					"'}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: OnSuccess,
                 error: function (request, status, error) {
                     alert(request.responseText);
                 }
             });


         }
        function OnSuccess(data, status) {

            
            
             if (isNumeric(data.d) && data.d != "0") {
				 $('#txtCotacao').val(data.d);
				 $('#ContentPlaceHolder1_txtIdCotacao').val(data.d);
				 $("#txtStatusCotacao").val("COTAÇÃO GRAVADA");
                 document.getElementById("btnEnviar").disabled = false;
				 CarregarCotacao();
				 EmProcessamento(false);
                 MensagemActoSimples("Gravar Cotação", "Cotação de Automóvel gravada com sucesso!");
                 
                 //$("#btnEnviar").disabled = false;
                 
                 $("#txtMensagemCotacao").val("Você pode alterar e gravar ou enviar para processamento.");

                 //alert("Cotação de Automóvel gravada com sucesso!");

                 //$('#modal-incluir-indicado').modal('hide'); show
             }
			 else {
                 EmProcessamento(false);
				 alert("Infelizmente não foi possível gravar a cotação agora, contate o ZAP 11-9-3208-9366.");
                 
                 return false;
             }
		 }
		 function EnviarCotacao() {
             
			 if (ValidarCamposCotacao() == false) {
                 EmProcessamento(false);
				return false;
			 }
			EmProcessamento(true);
             $.ajax({
                 type: "POST",
                 url: "IncluirCotacao.aspx/wmAtualizarStatusCotacaoAutomovel",
                 data: "{pid_cotacao: '" + $("#ContentPlaceHolder1_txtIdCotacao").val() +
                     "', pid_cliente: '" + $("#txtIdClienteCotacao").val() +
					 "', pcd_status_cotacao: 'CE'}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: OnSuccessEnviarCotacao,
                 error: function (request, status, error) {
                     alert(request.responseText);
                 }
			 });

            
		 }
		function OnSuccessEnviarCotacao(data, status) {

             $("#txtStatusCotacao").val("COTAÇÃO EM PROCESSAMENTO");
			 document.getElementById("btnGravar").disabled = true;
			 document.getElementById("btnEnviar").disabled = true;             
			 document.getElementById("btnClonar").disabled = false;
             $("#txtMensagemCotacao").val("Esta Cotação foi enviada para processamento, aguarde o retorno.");
            EmProcessamento(false);
             if (isNumeric(data.d) && data.d != "0") {
				 $('#txtCotacaoAutomovel').val(data.d);
                 MensagemActoSimples("Enviar Cotação para Processamento", "Cotação de Automóvel enviada para Cotação com sucesso!"); 
                 //alert("Cotação de Automóvel enviada para Cotação com sucesso!");

                 //$('#modal-incluir-indicado').modal('hide'); show
             }
             else {
                 alert("Infelizmente não foi possível enviadar para  a cotação agora, contate o ZAP 11-9-3208-9366.");
                 return false;
             }
		 }

         function CarregaTelaInsereCotacao() {
             $('#modal-insere-cotacao').modal('show');

         }

         function InsereCotacaoItem() {
             $.ajax({
                 type: "POST",
                 url: "IncluirCotacao.aspx/wmIncluirCotacaoAutomovelItem",
                 data: "{pid_cotacao: '" + $("#ContentPlaceHolder1_txtIdCotacao").val() +
                     "', pid_seguradora_cotacao: '" + $("#ddlSeguradoraCotacao").val() +
                     "', pid_forma_pagamento: '" + $("#ddlFormaPagamento").val() +
                     "', pds_valor_franquia_50: '" + $("#txtValorFranquia50").val() +
                     "', pds_valor_premio_f50: '" + $("#txtValorPremioF50").val() +
                     "', pds_valor_franquia_100: '" + $("#txtValorFranquia100").val() +
                     "', pds_valor_premio_f100: '" + $("#txtValorPremioF100").val() +
                     "'}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: OnSuccessInsereCotacaoItem,
                 error: function (request, status, error) {
                     alert(request.responseText);
                 }
             });
         }
         function OnSuccessInsereCotacaoItem(data, status) {

			 if (isNumeric(data.d) && data.d != "0") {
                 $('#modal-insere-cotacao').modal('hide');
                 MensagemActoSimples("Cotação", "Item de Cotação de Automóvel incluída com sucesso!");
                //alert("");
				 CarregaCotacaoAutomoveisItensGrid();
             }
             else {
                 alert("Infelizmente não foi possível incluir item de cotação agora, contate o ZAP 11-9-3208-9366.");
                 return false;
             }
         }
		 function CarregaTelaLimparItensCotacao() {
             $.ajax({
                 type: "POST",
                 url: "IncluirCotacao.aspx/wmExcluirItensCotacao",
                 data: "{pid_cotacao: " + $("#ContentPlaceHolder1_txtIdCotacao").val() + "}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: OnSuccessCarregaTelaLimparItensCotacao,
                 error: function (request, status, error) {
                     alert(request.responseText);
                 }
             });
         }
         function OnSuccessCarregaTelaLimparItensCotacao(data, status) {

             if (isNumeric(data.d) && data.d != "0") {
                 MensagemActoSimples("Itens Cotação", "Itens da Cotação excluídos com sucesso!");
                 //alert("");
                 CarregaCotacaoAutomoveisItensGrid();
             }
             else {
                 alert("Infelizmente não foi possível incluir item de cotação agora, contate o ZAP 11-9-3208-9366.");
                 return false;
             }
         }

         function CarregaCotacaoAutomoveisItensGrid() {

             $.ajax({
                 type: "POST",
                 url: "IncluirCotacao.aspx/wmListaCotacaoAutomovelItens",
                 data: "{pid_cotacao: " + $("#ContentPlaceHolder1_txtIdCotacao").val() + "}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: OnSuccessCarregaCotacaoAutomoveisItensGrid,
                 error: function (request, status, error) {
                     alert(request.responseText);
                 }
             });


         }
         function format(d) {

             // `d` is the original data object for the row
             return '<table cellpadding="10" cellspacing="0" border="0" style="padding-left:50px; width:100%;">' +
                 
                 '<tr>' +
				 '<td style="width:100px">Valor Normal:</td>' +
                 '<td style="width:100px">' + d.ds_valor_premio_f100 + '</td>' +
                 '<td style="width:400px">' + d.bt_cotacao_aprova_normal + '</td>' +
				 '<td style="width:400px">' + d.fl_aprovada_normal + '</td>' +
                 '<td style="width:400px">' + d.ds_nome_cliente_aprovada_normal + '</td>' +
                 '<td style="width:400px">' + d.ds_data_hora_aprovada_normal + '</td>' +
                 '</tr>' +
                 '<tr>' +
                 '<td>Valor Franquia Reduzida:</td>' +
				 '<td>' + d.ds_valor_premio_f50 + '</td>' +
                 '<td>' + d.bt_cotacao_aprova_reduzida + '</td>' +
                 '<td style="width:400px">' + d.fl_aprovada_reduzida + '</td>' +
                 '<td style="width:400px">' + d.ds_nome_cliente_aprovada_reduzida + '</td>' +
                 '<td style="width:400px">' + d.ds_data_hora_aprovada_reduzida + '</td>' +
                 '</tr>' +
                 '</table>';
         }
         function OnSuccessCarregaCotacaoAutomoveisItensGrid(data, status) {

             $('#grdCotacaoAutomovelItens').DataTable().destroy();
             var Jsondata = JSON.parse(data.d);
             

             var table = $('#grdCotacaoAutomovelItens').DataTable({
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
                     //{ "data": "id_cotacao" },
                     { "data": "img_seguradora_cotacao_foto",  },
                     { "data": "ds_forma_pagamento" },
                     { "data": "ds_Franquia1", className: "text-right" },
                     { "data": "ds_Franquia2", className: "text-right" },

                 ],
                 "order": [[1, 'asc']]
             });

             // Add event listener for opening and closing details
             $('#grdCotacaoAutomovelItens tbody').on('click', 'td.details-control', function () {
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


             EmProcessamento(false);

         }
		 function FinalizaCotacao() {
			 EmProcessamento(true);
			 //if (ValidarCamposCotacao() == false) {
    //             EmProcessamento(false);
    //             return false;
    //         }
			 
             $.ajax({
                 type: "POST",
                 url: "IncluirCotacao.aspx/wmAtualizarStatusCotacaoAutomovel",
                 data: "{pid_cotacao: '" + $("#ContentPlaceHolder1_txtIdCotacao").val() +
                     "', pid_cliente: '" + $("#txtIdClienteCotacao").val() +
                     "', pcd_status_cotacao: 'CP'}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: OnSuccessFinalizaCotacao,
                 error: function (request, status, error) {
                     alert(request.responseText);
                 }
             });
		 }
         function OnSuccessFinalizaCotacao(data, status) {

             $("#txtStatusCotacao").val("COTAÇÃO PRONTA");
             document.getElementById("btnGravar").disabled = true;
             document.getElementById("btnEnviar").disabled = true;
             document.getElementById("btnPDF").disabled = false;
             document.getElementById("btnClonar").disabled = false;
			 $("#txtMensagemCotacao").val("Esta Cotação está PRONTA, contate o cliente para Aprovação.");
			 CarregarCotacao(); 
             EmProcessamento(false);
             if (isNumeric(data.d) && data.d != "0") {
				 $('#txtCotacaoAutomovel').val(data.d);
				 MensagemActoSimples("Finalizar Cotação", "Cotação de Automóvel finalizada com sucesso!");
                 //alert("Cotação de Automóvel finalizada com sucesso!");

                 //$('#modal-incluir-indicado').modal('hide'); show
             }
             else {
                 alert("Infelizmente não foi possível enviadar para  a cotação agora, contate o ZAP 11-9-3208-9366.");
                 return false;
             }
		 }
		 
		 function AprovarCotacao(pflg_aprovacao, pid_cotacao, pid_seguradora) {
            
             EmProcessamento(true);

			 //if (ValidarCamposCotacao() == false) {
             //             EmProcessamento(false);
             //             return false;
             //         }

             $.ajax({
                 type: "POST",
                 url: "IncluirCotacao.aspx/wmAprovarCotacaoAutomovel",
				 data: "{pid_cotacao: '" + pid_cotacao +
					 "', pid_seguradora: '" + pid_seguradora +
                     "', pflg_aprovacao: '" + pflg_aprovacao +
                     "', pid_cliente_aprovador: '" + $("#ContentPlaceHolder1_txtIdClienteIndicador").val() +					 
                     "', pid_cliente_cotacao: '" + $("#txtIdClienteCotacao").val() +					 
				     "'}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: OnSuccessAprovarCotacao,
				 error: function (request, status, error) {
                     EmProcessamento(false);
					 alert(request.responseText);

                 }
             });
         }
         function OnSuccessAprovarCotacao(data, status) {

             $("#txtStatusCotacao").val("COTAÇÃO APROVADA");
             document.getElementById("btnGravar").disabled = true;
             document.getElementById("btnEnviar").disabled = true;
             document.getElementById("btnPDF").disabled = false;
             document.getElementById("btnClonar").disabled = false;
             $("#txtMensagemCotacao").val("Esta Cotação está APROVADA, contate o cliente para PAGAMENTO e EMISSÃO.");
             CarregarCotacao();
             EmProcessamento(false);
             if (isNumeric(data.d) && data.d != "0") {
                 $('#txtCotacaoAutomovel').val(data.d);
                 MensagemActoSimples("Aprovar Cotação", "Cotação de Automóvel APROVADA com sucesso!");
                 //alert("Cotação de Automóvel finalizada com sucesso!");

                 //$('#modal-incluir-indicado').modal('hide'); show
             }
             else {
                 alert("Infelizmente não foi possível enviadar para  a cotação agora, contate o ZAP 11-9-3208-9366.");
                 return false;
             }
		 }
		 function CarregaCondutor() {
			 onchange_aba_perfil();

			 if ($("#ddlPrincipalCondutor").val() == "SIM") {
				 
                 $('#ddlRelComSegurado').val("O próprio");
                 $("#txtCPFCondutorPrincipal").val($("#txtCPF").val());
				 $("#txtDataNascimentoCondutor").val($("#txtDataNascimento").val());
				 $('#txtNomeCondutoPrincipal').val($("#txtNome").val());
				$('#ddlGeneroCondutorPricipal').val($("#txtGenero").val());
				 //if ($.trim($('#ddlRelComSegurado').val()) == '') { resultado = false; }

                 $('#ddlEstadoCivilCondutorPricipal').val($("#txtEstadoCivil").val());
				//$('#ddlProfissao').val();
				//$('#txtDetalheProfissao').val();
				 $('#txtRgCondutorPrinicpal').val();
				 $('#txtDataEmissaoRgCondutorPrincipal').val();
				 $('#txtEmissorRG').val();
				//$('#txtCnhCondutorPrinicpal').val();
				 $('#txtDataHabilitacao').val();
				 
                 //$("#txtTelefoneCelular").val(data.d.ds_telefone_celular);
                 //$("#txtTelefoneCelular2").val(data.d.ds_telefone_comercial);
                 //$("#txtGenero").val(data.d.ds_genero);
                 //$("#txtEstadoCivil").val(data.d.ds_estado_civil);
			 }
			 else
			 {
                 alert("Limpa");
			 }

			 
             
         }
     </script>
    <!-- Content Wrapper. Contains page content -->
  <%--<div class="content-wrapper">--%>
    <!-- Content Header (Page header) -->
  <%-- <body class="hold-transition skin-black sidebar-mini">
<div class="wrapper">--%>

  <header class="main-header">	  

	 <%-- <script type="text/javascript">
				function codeLoad() {
					alert("lod");
                    //CarregarListarUtilizacoes();
                    //CarregarListarMoraEm();
                    //CarregarListarLocalPernoites();
                    //CarregarListaSeguradoras();  
                }
                window.onload = codeLoad;
      </script>--%>
	  <script>
		  function EmProcessamento(Habilitado) {

			  if (Habilitado)
			  {
                  $('#modal-em-processamento').modal('show');
			  }
			  else {
                  $('#modal-em-processamento').modal('hide');
			  }

          }



          function submit() {

              alert("acto teste");

          }

          function SendMail(person, isAttending, returnEmail) {

              var dataValue = { "name": person, "isGoing": isAttending, "returnAddress": returnEmail };

              $.ajax({
                  type: "POST",
                  url: "Default.aspx/OnSubmit",
                  data: dataValue,
                  error: function (XMLHttpRequest, textStatus, errorThrown) {
                      alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                  },
                  complete: function (jqXHR, status) {
                      alert("complete: " + status + "\n\nResponse: " + jqXHR.responseText);
                  }
              });

		  }

		 
      </script>

  </header>
  




	 <section class="content-header">
     
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i> Inicío</a></li>
        <li class="breadcrumb-item"><a href="#">Cotações</a></li>
        <li class="breadcrumb-item active">Incluir</li>
      </ol>

    </section>

  <!-- Content Wrapper. Contains page content -->
  <div class="">
 

    <!-- Main content -->
    <section class="content">
           <!-- Modal Clientes Indicado -->
				<div class="modal center-modal fade" id="modal-localizar-indicado" tabindex="-1">
				  <div class="modal-dialog">
					<div class="modal-content">
					  <div class="modal-header">
						<h5 class="modal-title">Estes são seus Indicados, escolha um para atualizar o cadastro.</h5>
						<button type="button" class="close" data-dismiss="modal">
						  <span aria-hidden="true">&times;</span>
						</button>
					  </div>
					  <div class="modal-body">
						   <div class="form-group">
							<label>Selecione o Cliente</label>
								
								    <%--<asp:DropDownList id="ddlIndicados" AutoPostBack="False" runat="server" CssClass="form-control select2" style="width: 90%;" >--%>
                                      <%--<asp:ListItem Selected="True" Value="">NÃO CARREGADO CORRETAMENTE</asp:ListItem>                                      --%>
                                    <%--</asp:DropDownList>--%>
					           
							   <select name="ddlIndicados" id="ddlIndicados" class="form-control select2" style="width: 100%;"> <%--onchange="CarregarModelos()"--%>
									<option selected="selected">NÃO CARREGADA</option>
								</select>
						 </div>
						  </div>
                        <div class="modal-footer modal-footer-uniform">
						<button type="button" class="btn btn-bold btn-secondary" data-dismiss="modal">Fechar</button>
						<button type="button" class="btn btn-bold btn-primary float-right" data-dismiss="modal" onclick="CarregarIndicadoLista()">Carregar Indicado</button>
					  </div>
					  </div>
					  
					</div>
				  </div>
				
       <!-- /.modal -->
		 <!-- Modal Renovação -->
				<div class="modal center-modal fade" id="modal-renovacao" tabindex="-2">
				  <div class="modal-dialog">
					<div class="modal-content">
					  <div class="modal-header">
						<h5 class="modal-title">Preencha os dados para Renovação.</h5>
						<button type="button" class="close" data-dismiss="modal">
						  <span aria-hidden="true">&times;</span>
						</button>
					  </div>
					  <div class="modal-body">
						   <%--<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-user"></i></span>
								</div>
								    <asp:DropDownList id="DropDownList1" AutoPostBack="False" runat="server" CssClass="form-control select2" style="width: 90%;" >
                                      <asp:ListItem Selected="True" Value="">NÃO CARREGADO CORRETAMENTE</asp:ListItem>                                      
                                    </asp:DropDownList>
					            </div>
							</div>--%>
						   <div class="row">		
							<div class="col-lg-12 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Dados Renovação</h4>			
				                    <ul class="box-controls pull-right">				                      
				                    </ul>
									
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <%--<h4 class="box-title text-info"><i class="ti-user mr-15"></i> Informações Pessoais                </h4>--%>
					                    <hr class="my-15">
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Seguradora e Bônus...</label>
												<%--<asp:TextBox name="txtIdClienteIndicador" id="TextBox1" type="hidden" runat="server"></asp:TextBox>
												<asp:TextBox name="txtNomeClienteIndicador" id="TextBox2" type="hidden" runat="server"></asp:TextBox>
												<asp:TextBox name="txtIdCotacao" id="TextBox3" type="hidden" runat="server"></asp:TextBox>--%>

												<%--<input name="txtIdClienteCotacao" id="txtIdClienteCotacao" type="hidden">
												<input name="txtCotacaoAutomovel" id="txtCotacaoAutomovel" type="hidden" value="0">
												<input name="txtTipoVeiculoFipe" id="txtTipoVeiculoFipe" type="hidden">--%>
						                      <select name="ddlSeguradoraRenovacao" id="ddlSeguradoraRenovacao" class="form-control" onchange="">
												<option selected value="">Selecione...</option> 												  
												<option value="1">Porto Seguro</option> 												  									
												<option value="2">Azul</option> 												  									
												<option value="3">Liberty</option> 												  									
												<option value="4">Mapfre</option> 												  									
												<option value="5">Suhai</option> 												  									
											</select>
						                    </div>
					                      </div>
											  <div class="col-md-3">
						                    <div class="form-group">
						                      <label>Anterior</label>
						                      <select name="ddlBonusAnterior" id="ddlBonusAnterior" class="form-control" onchange="">
												<option selected value="">Selecione...</option> 												  
												<option value="1">1</option> 												  									
												<option value="2">2</option> 												  									
												<option value="3">3</option> 												  									
												<option value="4">4</option> 												  									
												<option value="5">5</option> 												  									
												  <option value="6">6</option> 												  									
												  <option value="7">7</option> 												  									
												  <option value="8">8</option> 												  									
												  <option value="9">9</option> 												  									
												  <option value="10">10</option> 												  									
											</select>
						                    </div>
					                      </div>
											<div class="col-md-3">
						                    <div class="form-group">
						                      <label>Atual</label>
						                      <select name="ddlBonusAtual" id="ddlBonusAtual" class="form-control" onchange="">
												<option selected value="">Selecione...</option> 												  
												<option value="1">1</option> 												  									
												<option value="2">2</option> 												  									
												<option value="3">3</option> 												  									
												<option value="4">4</option> 												  									
												<option value="5">5</option> 												  									
												  <option value="6">6</option> 												  									
												  <option value="7">7</option> 												  									
												  <option value="8">8</option> 												  									
												  <option value="9">9</option> 												  									
												  <option value="10">10</option> 												  									
											</select>
						                    </div>
					                      </div>


											 </div>
					                    <div class="row">
					                      <div class="col-md-6">
												<div class="form-group">
													<label>Vigencia Anterior - Início</label>
													<input name="txtDataVigenciaAnteriorInicio" id="txtDataVigenciaAnteriorInicio" type="text" class="form-control" placeholder="00/00/0000" maxlength ="10">
												</div>
												</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Fim</label>
													<input name="txtDataVigenciaAnteriorFim" id="txtDataVigenciaAnteriorFim" type="text" class="form-control" placeholder="00/00/0000" maxlength ="10">
												</div>
												</div>
					                    </div>
											
										<div class="row">
					                      <div class="col-md-9">
						                    <div class="form-group">
						                      <label >Apólice</label>
						                      <input name="txtApoliceRenovacao" id="txtApoliceRenovacao" type="text" class="form-control" placeholder="Digite Nº da Aplice" maxlength ="20" onkeypress="return somenteNumeros(event)">
						                    </div>
					                      </div>
					                      <div class="col-md-3">
						                    <div class="form-group">
						                      <label >Item</label>
						                      <input name="txtApoliceRenovacaoItem" id="txtApoliceRenovacaoItem" type="text" class="form-control"  placeholder="" maxlength ="1" onkeypress="return somenteNumeros(event)">
						                    </div>
					                      </div>
											<%--<div class="col-md-6">
						                    <div class="form-group">
						                      <label >C.I.</label>
						                      <input name="txtApoliceRenovacaoCI" id="txtApoliceRenovacaoCI" type="text" class="form-control" placeholder="">
						                    </div>
					                      </div>--%>
					                    </div>
                                      <div class="row">
					                     
											<div class="col-md-12">
						                    <div class="form-group">
						                      <label >C.I.</label>
						                      <input name="txtApoliceRenovacaoCI" id="txtApoliceRenovacaoCI" type="text" class="form-control" placeholder="" maxlength ="40" onkeypress="return somenteNumeros(event)">
						                    </div>
					                      </div>
					                    </div>
					                   
				                    </div>
				                    <!-- /.box-body -->
				                    <%--<div class="box-footer">
					                    <input type="button" class="btn btn-success" onclick="InserirDadosCliente()">
					                      <i class="ti-save-alt"></i> Grave
					                    </input>
				                    </div>  --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                    
                            
                            </div>
						</div>
                        <div class="modal-footer modal-footer-uniform">
						<button type="button" class="btn btn-bold btn-secondary" onclick="CancelarRenovacao_onclick()">Cancelar Renovação</button>
						<button type="button" class="btn btn-bold btn-primary float-right"  onclick="ValidarRenovacao()">Gravar dados Renovação</button> <%--data-dismiss="modal"--%>
					  </div>
					  </div>
					  
					</div>
				  </div>
				
       <!-- /.modal -->
		<!-- Modal INSERE COTACAO -->
				<div class="modal center-modal fade" id="modal-insere-cotacao" tabindex="-2">
				  <div class="modal-dialog">
					<div class="modal-content">
					  <div class="modal-header">
						<h5 class="modal-title">Incluir item da Cotação.</h5>
						<button type="button" class="close" data-dismiss="modal">
						  <span aria-hidden="true">&times;</span>
						</button>
					  </div>
					  <div class="modal-body">
						   <%--<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-user"></i></span>
								</div>
								    <asp:DropDownList id="DropDownList1" AutoPostBack="False" runat="server" CssClass="form-control select2" style="width: 90%;" >
                                      <asp:ListItem Selected="True" Value="">NÃO CARREGADO CORRETAMENTE</asp:ListItem>                                      
                                    </asp:DropDownList>
					            </div>
							</div>--%>
						   <div class="row">		
							<div class="col-lg-12 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Dados do item da cotação</h4>			
				                    <ul class="box-controls pull-right">				                      
				                    </ul>
									
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <%--<h4 class="box-title text-info"><i class="ti-user mr-15"></i> Informações Pessoais                </h4>--%>
					                    <hr class="my-15">
					                    <div class="row">
											<div class="col-md-6">
												<div class="form-group">
												  <label>Seguradora</label>												
												  <select name="ddlSeguradoraCotacao" id="ddlSeguradoraCotacao" class="form-control" onchange="">
													<option selected value="">Selecione...</option> 												  
													<option value="1">Porto Seguro</option> 												  									
													<option value="2">Azul</option> 												  									
													<option value="3">Liberty</option> 												  			
													<%--<option value="4">Aliro</option> 												  			--%>
													<option value="4">HDI</option> 												  			
													<option value="5">Mapfre</option> 												  									
													<option value="6">Suhai</option> 												  									
												</select>
												</div>
											  </div>
											<div class="col-md-6">
						                    <div class="form-group">
						                      <label>Forma de Pagamento</label>												
						                      <select name="ddlFormaPagamento" id="ddlFormaPagamento" class="form-control" onchange="">
												<option selected value="">Selecione...</option> 												  
												<option value="1">Cartão de Crédito</option> 												  									
												<option value="2">Boleto</option> 												  									
												<option value="3">Débito em Conta</option> 												  															
											</select>
						                    </div>
					                      </div>
										</div>
										<div class="row">
					                      <div class="col-md-6">
												<div class="form-group">
													<label>Valor Franquia 100%</label>
													<input name="txtValorFranquia100" id="txtValorFranquia100" type="text" class="form-control" onkeyup="formatarMoeda('txtValorFranquia100')">
												</div>
												</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Valor Prêmio F. 100%</label>
													<input name="txtValorPremioF100" id="txtValorPremioF100" type="text" class="form-control" onkeyup="formatarMoeda('txtValorPremioF100')">
												</div>
											</div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
												<div class="form-group">
													<label>Valor Franquia 50%</label>
													<input name="txtValorFranquia50" id="txtValorFranquia50" type="text" class="form-control" onkeyup="formatarMoeda('txtValorFranquia50')">
												</div>
												</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Valor Prêmio F. 50%</label>
													<input name="txtValorPremioF50" id="txtValorPremioF50" type="text" class="form-control" onkeyup="formatarMoeda('txtValorPremioF50')">
												</div>
											</div>
					                    </div>
										
									</div>
				                    <!-- /.box-body -->
				                    <%--<div class="box-footer">
					                    <input type="button" class="btn btn-success" onclick="InserirDadosCliente()">
					                      <i class="ti-save-alt"></i> Grave
					                    </input>
				                    </div>  --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                    
                            
                            </div>
						</div>
                        <div class="modal-footer modal-footer-uniform">
						<button type="button" class="btn btn-bold btn-primary float-right"  onclick="InsereCotacaoItem()">GRAVAR ITEM COTAÇÃO</button> <%--data-dismiss="modal"--%>
					  </div>
					  </div>
					  
					</div>
				  </div>
				
       <!-- /.modal -->
		<!-- Modal SOBE PDF -->
				<div class="modal center-modal fade" id="modal-sobe-pdf" tabindex="-2">
				  <div class="modal-dialog">
					<div class="modal-content">
					  <div class="modal-header">
						<h5 class="modal-title">Envie aqui o PDF da Cotação para o Cliente.</h5>
						<button type="button" class="close" data-dismiss="modal">
						  <span aria-hidden="true">&times;</span>
						</button>
					  </div>
					  <div class="modal-body">
						   <%--<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-user"></i></span>
								</div>
								    <asp:DropDownList id="DropDownList1" AutoPostBack="False" runat="server" CssClass="form-control select2" style="width: 90%;" >
                                      <asp:ListItem Selected="True" Value="">NÃO CARREGADO CORRETAMENTE</asp:ListItem>                                      
                                    </asp:DropDownList>
					            </div>
							</div>--%>
						   <div class="row">		
							<div class="col-lg-12 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Selecio o PDF e Envie</h4>			
				                    <ul class="box-controls pull-right">				                      
				                    </ul>
									
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <%--<h4 class="box-title text-info"><i class="ti-user mr-15"></i> Informações Pessoais                </h4>--%>
					                    <hr class="my-15">
					                    <div class="row">
											<div class="col-md-6">
												<div class="form-group">
												  <label>Selecio o PDF</label>												
												  <input type="file" id="FileUpload1" />
												</div>
											  </div>
											<div class="col-md-6">
						                    <div class="form-group">
						                      <label>Enviar</label>												
						                      
						                    </div>
					                      </div>
										</div>
					                  
									</div>
				                    <!-- /.box-body -->
				                    <%--<div class="box-footer">
					                    <input type="button" class="btn btn-success" onclick="InserirDadosCliente()">
					                      <i class="ti-save-alt"></i> Grave
					                    </input>
				                    </div>  --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                    
                            
                            </div>
						</div>
                        <div class="modal-footer modal-footer-uniform">
						<button type="button" class="btn btn-bold btn-primary float-right"  onclick="SaveData()">ENVIAR UPLOAD PDF</button> <%--data-dismiss="modal"--%>
					  </div>
					  </div>
					  
					</div>
				  </div>
				
       <!-- /.modal -->
		<!-- Modal EM PROCESSAMENTO... -->
				<div class="modal center-modal fade" data-backdrop="static" id="modal-em-processamento" tabindex="-2" style='justify-content: center;align-items: center;'>
				  <div class="modal-dialog" style='justify-content: center;align-items: center;'>
					<div class="modal-content" style='justify-content: center;align-items: center;'>
					  <div class="modal-header" style='justify-content: center;align-items: center;'>
						<h5 class="modal-title">AGUARDE EM PROCESSAMENTO....</h5>
						
					  </div>
					  <div class="modal-body" style='justify-content: center;align-items: center;'>

		                      <div class="">
			                    <div class="" style='justify-content: center;align-items: center;'>
									<img src="images/dot-bricks.gif" style='width: 200px; height: 200px;justify-content: center;align-items: center; ' />
			                    </div>
			                    <!-- /.box-header -->
			                   
		                      </div>
		                      <!-- /.box -->			

						</div>
                        <%--<div class="modal-footer modal-footer-uniform">
						</div>--%>
					  </div>
					  
					</div>
				  </div>
				
       <!-- /.modal -->

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
					<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#segurado" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">SEGURADO      </span> <i id="imgSegurado" aria-hidden="false"> </i></a></li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#veiculo" role="tab"><span class="hidden-sm-up"><i class="ion-model-s"></i></span> <span class="hidden-xs-down">VEICULO      <i id="imgVeiculo" class="fa fa-bomb" aria-hidden="false"></i></span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#perfil" role="tab"><span class="hidden-sm-up"><i class="ion-home"></i></span> <span class="hidden-xs-down">PERFIL      <i id="imgPerfil" class="fa fa-bomb" aria-hidden="false"></i></span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#condutor" role="tab"><span class="hidden-sm-up"><i class="ion-home"></i></span> <span class="hidden-xs-down">CONDUTOR      <i id="imgCondutor" class="fa fa-bomb" aria-hidden="false"></i></span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#cobertura" role="tab"><span class="hidden-sm-up"><i class="ion-home"></i></span> <span class="hidden-xs-down">COBERTURA      <i id="imgCobertura" class="fa fa-check" aria-hidden="false"></i></span></a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#calculo" role="tab"><span class="hidden-sm-up"><i class="ion-home"></i></span> <span class="hidden-xs-down">RESULTADO CALCULO</span></a> </li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content tabcontent-border">
				<div class="box-body box-outline-gray">
					<div class="row">
						<div class="col-md-1">
							<div class="form-group">
								<label title="Número da Cotação">Número</label>
								<input name="txtCotacao" id="txtCotacao" type="text" class="form-control" disabled>
							</div>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								<label>Tipo Seguro</label>
								<select name="ddlTipoSeguro" id="ddlTipoSeguro" class="form-control" onchange="onchange_tipo_seguro();">
									<option selected value="Seguro Novo">Seguro Novo</option> 												  
									<option value="Renovação">Renovação</option> 												  									
								</select>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>Vigência Inicial</label>
								<input name="txtDtVigenciaInicial" id="txtDtVigenciaInicial"  type="text" class="form-control" placeholder="Digite a Data Inícial Vigência">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>Vigência Final</label>
								<input name="txtDtVigenciaFinal" id="txtDtVigenciaFinal"  type="text" class="form-control" placeholder="Digite a Data Final Vigência">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label title="NOVO | EM COTAÇÃO | COTAÇÃO PRONTA | APROVADA | EMITIDA | CANCELADA">Status Cotação</label>
								<input name="txtStatusCotacao" id="txtStatusCotacao" disabled type="text" class="form-control" value="NOVO" >
							</div>
						</div>
					</div>
					<div class="row">
					
						<div class="col-md-6">
							<button type="button" name="btnGravar" id="btnGravar" class="btn btn-cyan mb-5" onclick="ValidarStatusEmCotacao()" disabled>Gravar</button>
							<button type="button" name="btnEnviar" id="btnEnviar" class="btn btn-yellow mb-5" onclick="EnviarCotacao()"  disabled>Enviar</button>
							<button type="button" name="btnPDF" id="btnPDF" class="btn btn-warning mb-5" onclick="BaixarPDF()" disabled>PDF</button>
							<button type="button" name="btnClonar" id="btnClonar" class="btn btn-brown mb-5" onclick="ClonarCotacao()" disabled>Clonar</button>
							<button type="button" class="btn btn-danger mb-5" onclick="Voltar()">Voltar</button>
						</div>
						<div class="col-md-6">
							<input name="txtMensagemCotacao" id="txtMensagemCotacao"  type="text" class="form-control" value="Cotação não gravada" disabled>
						</div>
					</div>
					
						
				</div>
					<%--Dados Segurado--%>
					<div class="tab-pane active" id="segurado" role="tabpanel">
						<div class="pad">
                            <%--<section class="content">--%>
                            <div class="row">		
							<div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Dados Segurado</h4>			
				                    <ul class="box-controls pull-right">
				                      <%--<li><a class="box-btn-close" href="#"></a></li>
				                      <li><a class="box-btn-slide" href="#"></a></li>	--%>
				                      <%--<li><a class="box-btn-fullscreen" href="#"></a></li>--%>
									  <li><button type="button" id="btnLocalizarCliente" class="btn btn-primary mb-5" data-toggle="modal" data-target="#modal-localizar-indicado" onclick="CarregarListaIndicados()">LOCALIZAR CLIENTE</button></li>
				                    </ul>
									
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <%--<h4 class="box-title text-info"><i class="ti-user mr-15"></i> Informações Pessoais                </h4>--%>
										
					                    <hr class="my-15">
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>CPF</label>
												<asp:TextBox name="txtIdClienteIndicador" id="txtIdClienteIndicador" type="hidden" runat="server"></asp:TextBox>
												<asp:TextBox name="txtNomeClienteIndicador" id="txtNomeClienteIndicador" type="hidden" runat="server"></asp:TextBox>
												<asp:TextBox name="txtIdCotacao" id="txtIdCotacao" type="hidden" runat="server"></asp:TextBox>

												<input name="txtIdClienteCotacao" id="txtIdClienteCotacao" type="hidden">
												<input name="txtCotacaoAutomovel" id="txtCotacaoAutomovel" type="hidden" value="0">
												<input name="txtTipoVeiculoFipe" id="txtTipoVeiculoFipe" type="hidden">
												<input name="txtPDFCotacao" id="txtPDFCotacao" type="hidden">
						                      <input id="txtCPF" type="text" class="form-control" placeholder="Digite seu CPF" readonly>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Nome</label>
						                      <input name="txtNome" id="txtNome" type="text" class="form-control" placeholder="Digite seu Nome" readonly>
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >E-mail</label>
						                      <input name="txtEmail" id="txtEmail" type="text" class="form-control" placeholder="Digite seu E-mail" readonly>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Telefone Celular</label>
						                      <input name="txtTelefoneCelular" id="txtTelefoneCelular" type="text" class="form-control" placeholder="Digite seu Telefone Celular" readonly>
						                    </div>
					                      </div>
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Data de Nascimento</label>
						                      <input name="txtDataNascimento" id="txtDataNascimento" type="text" class="form-control" placeholder="Digite sua Data de Nascimento" readonly>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Telefone Celular 2</label>
						                      <input name="txtTelefoneCelular2" id="txtTelefoneCelular2" type="text" class="form-control" placeholder="Digite seu Telefone2" readonly>
						                    </div>
					                      </div>
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Gênero</label>
						                      <input name="txtGenero" id="txtGenero" type="text" class="form-control" placeholder="Selecione seu Gênero" readonly>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Estado Civil</label>
						                      <input name="txtEstadoCivil" id="txtEstadoCivil" type="text" class="form-control" placeholder="Selecione seu Estado Civil" readonly>
						                    </div>
					                      </div>
					                    </div>
					                   
				                    </div>
				                    <!-- /.box-body -->
				                    <%--<div class="box-footer">
					                    <input type="button" class="btn btn-success" onclick="InserirDadosCliente()">
					                      <i class="ti-save-alt"></i> Grave
					                    </input>
				                    </div>  --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                    <div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Endereço do Segurado</h4>			
				                    <ul class="box-controls pull-right">
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <%--<h4 class="box-title text-info"><i class="ti-location-pin mr-15"></i> Principal</h4>--%>
										<%--<button type="button" class="btn btn-success mb-5" onclick="GravarCotacao()">Gravar Cotação</button>
										<button type="button" class="btn btn-danger mb-5" onclick="Voltar()">Voltar</button>--%>
					                    <hr class="my-15">
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>CEP</label>
						                      <input name="txtCEP" id="txtCEP" type="text" class="form-control" placeholder="Digite seu CEP" readonly>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Endereço</label>
						                      <input name="txtEndereco" id="txtEndereco" type="text" class="form-control" placeholder="Endereço" readonly>
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Numero</label>
						                      <input name="txtNumeroEndereco" id="txtNumeroEndereco" type="text" class="form-control" placeholder="Digite o numero" readonly>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Complemento</label>
						                      <input name="txtComplemento" id="txtComplemento" type="text" class="form-control" placeholder="Complemento" readonly>
						                    </div>
					                      </div>
					                    </div>
										   <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Bairro</label>
						                      <input name="txtBairro" id="txtBairro" type="text" class="form-control" placeholder="Bairro" readonly>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Cidade-UF</label>
						                      <input name="txtCidadeUF" id="txtCidadeUF" type="text" class="form-control" placeholder="Cidade-UF" readonly>
						                    </div>
					                      </div>
					                    </div>
					                </div>
				                    <!-- /.box-body -->
				                    <%--<div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div> --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div>	
                            
                            </div>
                            <%--</section>--%>
						</div>
					</div> 
					<%--Dados Veiculo--%>
					<div class="tab-pane" id="veiculo" role="tabpanel">
                        <div class="pad">
                            <%--<section class="content">--%>
                            <div class="row">		
							<div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Dados Veículo</h4>			
				                    <ul class="box-controls pull-right">
				                      <%--<li><a class="box-btn-close" href="#"></a></li>
				                      <li><a class="box-btn-slide" href="#"></a></li>	--%>
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <%--<h4 class="box-title text-info"><i class="ti-car mr-15"></i> Veículo</h4>--%> 
										
					                    <hr class="my-15">
					                    <div class="row">
					                      <div class="col-md-12">
											<div class="form-group">
											<label>Tipo Veículo</label> <br>
												<INPUT TYPE="Radio" Name="rdoTipoVeiculo" ID="rdoTipoVeiculoCarro" Value="1" onclick="CarregarMarcas()"/><label for="rdoTipoVeiculoCarro">Automóvel</label>				
												<INPUT TYPE="Radio" Name="rdoTipoVeiculo" ID="rdoTipoVeiculoMoto" Value="2" onclick="CarregarMarcas()" /><label for="rdoTipoVeiculoMoto">Moto</label>				
												<INPUT TYPE="Radio" Name="rdoTipoVeiculo" ID="rdoTipoVeiculoCaminhao" Value="3" onclick="CarregarMarcas()"/><label for="rdoTipoVeiculoCaminhao">Caminhão</label>				
						                    </div>
						                  
					                      </div>
					                      
					                    </div>
										<div class="row">
					                      <div class="col-md-6">
											<div class="form-group">
						                      <label>Ano Fabricação</label>
						                      <input name="txtAnoFabricacao" id="txtAnoFabricacao" type="text" class="form-control" placeholder="Digite o Ano Fabricação" maxlength ="4" onkeypress="return somenteNumeros(event)"  onkeyup="CarregaAnoModelo()" onchange="onchange_aba_veiculo()" > <%--onkeyup="CarregaAnoModelo()"--%>
						                    </div>
						                  
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Ano Modelo</label>
												<select name="ddlAnoModelo" id="ddlAnoModelo" class="form-control" onchange="onchange_aba_veiculo()" >
												  <option value="">Selecione..</option> 												  
												</select>						                      
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
											  <div class="form-group">
												<label>Marca</label>
												<select name="ddlMarca" id="ddlMarca" class="form-control select2" style="width: 100%;" onchange="CarregarModelosCombo()" > <%--onchange="CarregarModelos()"--%>
												  <option selected="selected">MARCA NÃO CARREGADA</option>
												</select>
											 </div>
						                    
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Modelo</label>
						                      <select name="ddlModelo" id="ddlModelo" class="form-control select2" style="width: 100%;" onchange="onchange_aba_veiculo()" >
												  <option selected="selected">MODELO NÃO CARREGADO</option>
												</select>
						                    </div>
					                      </div>
					                    </div>
										 <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Numero Chassi</label>
						                      <input name="txtChassi" id="txtChassi" type="text" class="form-control" placeholder="Selecione a versão" onchange="onchange_aba_veiculo()" >
												
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
												<label >Zero KM</label>
						                      <select name="ddlZeroKM" id="ddlZeroKM" class="form-control" onchange="onchange_aba_veiculo()" >
												  <option value="">Selecione..</option> 												  
												  <option value="SIM">SIM</option> 												  
												  <option selected value="NÃO">NÃO</option> 												  
												</select>
						                      
						                    </div>
					                      </div>
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
												<label title="Estado do Veículo">Estado</label>
						                      <select name="ddlEstadoVeiculo" id="ddlEstadoVeiculo" class="form-control" onchange="onchange_aba_veiculo()" >
												  <option selected value="">Selecione..</option> 												  
													<option value="SP">SP</option>
													<option value="AC">AC</option>
													<option value="AL">AL</option>
													<option value="AP">AP</option>
													<option value="AM">AM</option>
													<option value="BA">BA</option>
													<option value="CE">CE</option>
													<option value="DF">DF</option>
													<option value="ES">ES</option>
													<option value="GO">GO</option>
													<option value="MA">MA</option>
													<option value="MT">MT</option>
													<option value="MS">MS</option>
													<option value="MG">MG</option>
													<option value="PA">PA</option>
													<option value="PB">PB</option>
													<option value="PR">PR</option>
													<option value="PE">PE</option>
													<option value="PI">PI</option>
													<option value="RJ">RJ</option>
													<option value="RN">RN</option>
													<option value="RS">RS</option>
													<option value="RO">RO</option>
													<option value="RR">RR</option>
													<option value="SC">SC</option>
													<option value="SE">SE</option>
													<option value="TO">TO</option> 												  
												</select>
						                      
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Placa (opcional)</label>
						                      <input  name="txtPlaca" id="txtPlaca" type="text" class="form-control" placeholder="Digite a Placa (opcional)">
						                    </div>
					                      </div>
					                    </div>
                                        
				                    </div>

				                    <%--<!-- /.box-body -->
				                    <div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div>  --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                    <div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Sobre o Veiculo</h4>			
				                    <ul class="box-controls pull-right">
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <%--<h4 class="box-title text-info"><i class="ti-check mr-15"></i> Principal</h4>--%>
					                    <hr class="my-15">
										<div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label title="Combustível">Combustível</label>
						                      <select name="ddlBLR" id="ddlCombustivel" class="form-control" onchange="onchange_aba_veiculo()" >
												  <option selected value="">Selecione..</option> 												  
												  <option value="Gasolina e Álcool (FLEX)">Gasolina e Álcool (FLEX)</option> 												  
												  <option value="Gasolina">Gasolina</option> 												  
												  <option value="Álcool">Álcool</option> 												  
												  <option value="Diesel">Diesel</option> 												  
												  <option value="Gás">Gás</option> 												  
												  <option value="Elétrico">Elétrico</option> 												  
												  <option value="Hibrido">Hibrido</option> 												  
												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Portas</label>
						                      <select name="ddlPortas" id="ddlPortas" class="form-control" onchange="onchange_aba_veiculo()" >
												  <option selected value="">Selecione..</option> 												  
												  <option value="0">0</option> 												  
												  <option value="2">2</option> 												  
												  <option value="4">4</option> 												  												  
												</select>
						                    </div>

					                      </div>
					                    </div>
										<div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                     <label >Ultilização do Veículo</label>
						                      <select name="ddlUtilizacaoVeiculo" id="ddlUtilizacaoVeiculo" class="form-control" onchange="onchange_aba_veiculo()" >
												  <option selected value="">Selecione..</option> 												  
												  <option value="Exercício do Trabalho">Exercício do Trabalho</option> 												  
												  <option value="Locomoção Diária">Locomoção Diária</option> 												  
												  <option value="Somente Lazer">Somente Lazer</option> 												  
												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >CEP Pernoite</label>
						                     <input name="txtCepPernoite" id="txtCepPernoite" type="text" class="form-control" placeholder="Digite o CEP Pernoite" onchange="onchange_aba_veiculo()" >
						                    </div>

					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Financiado</label>
						                      <select name="ddlFinanciado" id="ddlFinanciado" class="form-control" onchange="onchange_aba_veiculo()" >
												  <option selected value="">Selecione..</option> 												  
												  <option value="SIM">SIM</option> 												  
												  <option value="NÃO">NÃO</option> 												  
												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Kit Gás</label>
						                      <select name="ddlKitGas" id="ddlKitGas" class="form-control" onchange="onchange_aba_veiculo()" >
												  <option selected value="">Selecione..</option> 												  
												  <option value="SIM">SIM</option> 												  
												  <option selected value="NÃO">NÃO</option> 												  
												</select>
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Taxi</label>
						                      <select name="ddlTaxi" id="ddlTaxi" class="form-control" onchange="onchange_aba_veiculo()" >
												  <option value="">Selecione..</option> 												  
												  <option value="SIM">SIM</option> 												  
												  <option selected value="NÃO">NÃO</option> 												  
												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Aplicativo (Uber,99,Cabify)</label>
						                      <select name="ddlAplicativo" id="ddlAplicativo" class="form-control" onchange="onchange_aba_veiculo()" >
												  <option value="">Selecione..</option> 												  
												  <option value="SIM">SIM</option> 												  
												  <option selected value="NÃO">NÃO</option> 												  
												</select>
						                    </div>

					                      </div>
					                    </div>
										 <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label title="Blindado, Leilão ou Remarcado">Blindado\Leilão\Remarcado</label>
						                      <select name="ddlBLR" id="ddlBLR" class="form-control" onchange="onchange_aba_veiculo()"  >
												  <option value="">Selecione..</option> 												  
												  <option value="SIM">SIM</option> 												  
												  <option selected value="NÃO">NÃO</option> 												  
												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Isento de Imposto (PCD)</label>
						                      <select name="ddlIsento" id="ddlIsento" class="form-control"  onchange="onchange_aba_veiculo()" >
												  <option value="">Selecione..</option> 												  
												  <option value="SIM">SIM</option> 												  
												  <option selected value="NÃO">NÃO</option> 												  
												</select>
						                    </div>

					                      </div>
					                    </div>
										
										
					                </div>
				                   <%-- <!-- /.box-body -->
				                    <div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div> --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div>	
                            
                            </div>
                            <%--</section>--%>
						</div>
					</div>
					<%--Dados Perfil--%>
					<div class="tab-pane" id="perfil" role="tabpanel">
						<div class="pad">
                            <%--<section class="content">--%>
                            <div class="row">		
							<div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Dados Perfil</h4>			
				                    <ul class="box-controls pull-right">
				                      <%--<li><a class="box-btn-close" href="#"></a></li>
				                      <li><a class="box-btn-slide" href="#"></a></li>	--%>
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                   <%-- <h4 class="box-title text-info"><i class="ti-info-alt mr-15"></i> Informações para Analise</h4>--%>
					                    <hr class="my-15">
										<div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label title ="CEP Circulação, Ex.: Trabalho, Escola">CEP Circulação</label>
						                      <input name="txtCEPFrequencia" id="txtCEPFrequencia" type="text" class="form-control" placeholder="Digite o CEP mais Frequente" onchange="onchange_aba_perfil()">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >CEP Residência</label>
						                      <input name="txtCEPResidencia" id="txtCEPResidencia" type="text" class="form-control" placeholder="Digite o CEP Pernoite" onchange="onchange_aba_perfil()">
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Você é o proprietário</label>
						                      <select name="ddlProprietario" id="ddlProprietario" class="form-control" onchange="onchange_aba_perfil()">
												  <option value="">Selecione..</option> 												  
												  <option selected value="SIM">SIM</option> 												  
												  <option value="NÃO">NÃO</option> 												  
												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Você é o principal condutor</label>
						                      <select name="ddlPrincipalCondutor" id="ddlPrincipalCondutor" class="form-control"  onchange="CarregaCondutor()">
												  <option selected value="">Selecione..</option> 												  
												  <option value="SIM">SIM</option> 												  
												  <option value="NÃO">NÃO</option> 												  
												</select>
						                    </div>
					                      </div>
					                    </div>

										 <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Relação com o Prorietário</label>
						                      <select name="ddlRelacaoProprietario" id="ddlRelacaoProprietario" class="form-control"  onchange="onchange_aba_perfil()">
												  <option selected value="">Selecione..</option> 												  
												  <option value="1">O próprio c/ CRV no nome do Segurado</option> 												  
												  <option value="2">Empregado</option> 												  
												  <option value="3">Empresa x Sócio/Diretor</option> 												  
												  <option value="4">Espólio</option> 												  
												  <option value="5">Flho(a)/Enteado(a)</option> 												  
												  <option value="6">O próprio c/ CRV em transferência</option> 												  
												  <option value="7">Operação de Leasing ou Locadora</option> 												  
												  <option value="8">Outros</option> 												  
												  <option value="9">Pai/Mãe</option> 												  
												  <option value="10">Sem Informação</option> 	 												  

												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label title="Pessoa na mesma residência de 18 a 25 anos que dirige?">Motorista de 18 a 25 anos</label>
						                      <select name="ddl18a25" id="ddl18a25" class="form-control"  onchange="onchange_aba_perfil()">
												  <option selected value="">Selecione..</option> 												  
												  <option value="SIM">SIM</option> 												  
												  <option value="NÃO">NÃO</option> 												  
												</select>
						                    </div>
					                      </div>
					                    </div>

					                   
                                        
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Mora em...</label>
						                      <select name="ddlMoraEm" id="ddlMoraEm" class="form-control"  onchange="onchange_aba_perfil()">
												  <option selected value="">Selecione..</option> 												  
												 											  
												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
											   <div class="form-group">
						                      <label >Local Pernoite</label>
						                      <select name="ddlLocalPernoite" id="ddlLocalPernoite" class="form-control"  onchange="onchange_aba_perfil()">
												  <option selected value="">Selecione..</option> 												  
												  									  
												</select>
						                    </div>
						                   
					                      </div>
					                    </div>
					                   
				                    </div>
				                   <%-- <!-- /.box-body -->
				                    <div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div>  --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                    <div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Complemento</h4>			
				                    <ul class="box-controls pull-right">
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <%--<h4 class="box-title text-info"><i class="ti-info-alt mr-15"></i> Informações para Renovação</h4>--%>
					                    <hr class="my-15">
										<div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label title ="Lazer / Trabalho / Estudo" >Utilização Perfil</label>
						                      <select name="ddlUtilizacao" id="ddlUtilizacao" class="form-control"  onchange="onchange_aba_perfil()">
												  <option selected value="">Selecione..</option>
												  


												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Garagem na Residência</label>
						                      <select name="ddlGaragemResidencia" id="ddlGaragemResidencia" class="form-control"  onchange="onchange_aba_perfil()">
												  <option value="">Selecione..</option> 												  
												  <option value="SIM">SIM</option> 												  
												  <option selected value="NÃO">NÃO</option> 												  
												</select>
						                    </div>
					                      </div>

					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
											  <label >Garagem Trabalho</label>
						                      <select name="ddlGaragemTrabalho" id="ddlGaragemTrabalho" class="form-control"  onchange="onchange_aba_perfil()">
												  <option selected value="">Selecione..</option> 												  
												  <option value="SIM">SIM</option> 												  
												  <option value="NÃO">NÃO</option> 												  
												</select>
						                    </div>
						                      
					                      </div>
					                      <div class="col-md-6">
											  <div class="form-group">
						                      <label >Garagem Escola/Faculdade</label>
						                      <select name="ddlGaragemEscola" id="ddlGaragemEscola" class="form-control" style="width: 100%;"  onchange="onchange_aba_perfil()">
												  <option selected value="">Selecione..</option> 												  
												  <option value="SIM">SIM</option> 												  
												  <option value="NÃO">NÃO</option> 												  
												</select>
						                    </div>
						                    
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>KM Média Mensal</label>
						                      <input name="txtKmMediaMensal" id="txtKmMediaMensal"  type="text" class="form-control" placeholder="Digite a KM Média Mensal" maxlength ="4" onkeypress="return somenteNumeros(event)"  onchange="onchange_aba_perfil()">
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                     <label >Idade 1ª Habilitação</label>
						                      <input name="txtIdadePHabilitacao" id="txtIdadePHabilitacao" type="text" class="form-control" placeholder="Digite a Idade" maxlength ="2" onkeypress="return somenteNumeros(event)"  onchange="onchange_aba_perfil()">
						                    </div>
					                      </div>

					                    </div>
									
					                      
										
									
					                </div>
				                    <!-- /.box-body -->
				                   <%-- <div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div> --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div>	
                            
                            </div>
                            <%--</section>--%>
						</div>
					</div>
					<%--Dados Condutor--%>
					<div class="tab-pane" id="condutor" role="tabpanel">
						<div class="pad">
                            <%--<section class="content">--%>
                            <div class="row">		
							<div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Dados Condutor Principal</h4>			
				                    <ul class="box-controls pull-right">
				                      <%--<li><a class="box-btn-close" href="#"></a></li>
				                      <li><a class="box-btn-slide" href="#"></a></li>	--%>
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <%--<h4 class="box-title text-info"><i class="ti-info-alt mr-15"></i> Informações para Analise</h4>--%>
					                    <hr class="my-15">
					                    <div class="row">
											<div class="col-md-6">
						                    <div class="form-group">
						                      <label>Relação com o Segurado</label>
						                      <select name="ddlRelComSegurado" id="ddlRelComSegurado" class="form-control" onchange="onchange_aba_condutor()">
												  <option selected value="">Selecione..</option> 												  
												  <option value="O próprio">O próprio</option> 												  
												  <option value="Cônjuge">Cônjuge</option> 												  
												  <option value="Filho(a)">Filho(a)</option> 												  
												  <option value="Pai/Mãe">Pai/Mãe</option> 												  
												  <option value="Sócio/Dirigente/Proprietário">Sócio/Dirigente/Proprietário</option> 												  
												  <option value="Funcionário/Empregado">Funcionário/Empregado</option> 												  
												  <option value="Motorista Particular">Motorista Particular</option> 												  
												  <option value="Outros">Outros</option> 												  
												  <option value="Não informado">Não informado</option> 												  
												  
												</select>
						                    </div>
					                      </div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Data Nascimento</label>
													<input name="txtDataNascimentoCondutor" id="txtDataNascimentoCondutor" type="text" class="form-control" placeholder="00/00/0000" maxlength ="10" onblur="onchange_aba_condutor()">
												</div>
												</div>
											
					                      
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <%--<label >Idade 1ª Habilitação</label>
						                      <input name="txtIdadePHabilitacao" id="txtIdadePHabilitacao" type="text" class="form-control" placeholder="Digite a Idade" maxlength ="2" onkeypress="return somenteNumeros(event)" >--%>
											<div class="form-group">
						                      <label >CPF Condutor Principal</label>
						                      <input name="txtCPFCondutorPrincipal" id="txtCPFCondutorPrincipal" type="text" class="form-control" placeholder="Digite CPF do Condutor Principal" onchange="onchange_aba_condutor()">
						                    </div>
												
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                   <label >Nome do Condutor</label>
						                      <input name="txtNomeCondutoPrincipal" id="txtNomeCondutoPrincipal" type="text" class="form-control" placeholder="Digite o nome do Condutor Principal" onchange="onchange_aba_condutor()"> 
					                      </div>
					                    </div>
										<div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label title ="">Genêro</label>
						                       <select name="ddlGeneroCondutorPricipal" id="ddlGeneroCondutorPricipal" class="form-control"  onchange="onchange_aba_condutor()">
												  <option selected value="">Selecione..</option> 												  
												  <option value="Masculino">Masculino</option> 												  
												  <option value="Feminino">Feminino</option> 												  												  
												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Estado Civil</label>
						                      <select name="ddlEstadoCivilCondutorPricipal" id="ddlEstadoCivilCondutorPricipal" class="form-control"  onchange="onchange_aba_condutor()">
												  <option selected value="">Selecione..</option> 												  
												  <option value="Casado(a)">Casado(a)</option> 												  
												  <option value="Solteiro(a)">Solteiro(a)</option> 												  												  
												  <option value="Divorciado(a)">Divorciado(a)</option> 												  												  
												  <option value="Viúvo">Viúvo</option> 												  												  
												</select>
						                    </div>
					                      </div>
					                    </div>
										<div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                       <label >Profissão</label>
						                      <select name="ddlProfissao" id="ddlProfissao" class="form-control" style="width: 100%;"  onchange="onchange_aba_condutor()">
												  <option selected value="">Selecione..</option> 												  
												  <option value="0">Acougueiro</option>
													<option value="1">Adido&nbsp;Estrangeiro</option>
													<option value="2">Adjunto&nbsp;Administrativo</option>
													<option value="3">Administrador</option>
													<option value="4">Adubado</option>
													<option value="5">Advogado</option>
													<option value="6">Aeromoca</option>
													<option value="7">Aeronauta</option>
													<option value="8">Aeroviario</option>
													<option value="9">Afiador&nbsp;De&nbsp;Ferramentas</option>
													<option value="10">Afiador&nbsp;De&nbsp;Metais&nbsp;Preciosos</option>
													<option value="11">Agenciador</option>
													<option value="12">Agenciador&nbsp;de&nbsp;propaganda</option>
													<option value="13">Agente&nbsp;administrativo</option>
													<option value="14">Agente&nbsp;de&nbsp;servicos&nbsp;funerarios&nbsp;e&nbsp;embalsamador</option>
													<option value="15">Agente&nbsp;de&nbsp;viagem&nbsp;e&nbsp;guia&nbsp;de&nbsp;turismo</option>
													<option value="16">Agricultor</option>
													<option value="17">Agrimensor</option>
													<option value="18">Agroindustrial</option>
													<option value="19">Agronomo</option>
													<option value="20">Agronomo&nbsp;E&nbsp;Afins</option>
													<option value="21">Agropecuarista</option>
													<option value="22">Ajudante&nbsp;De&nbsp;Caminhao</option>
													<option value="23">Ajudante&nbsp;Geral</option>
													<option value="24">Ajustado&nbsp;Mecanico</option>
													<option value="25">Alfaiate</option>
													<option value="26">Almoxarife</option>
													<option value="27">Ambulante</option>
													<option SELECTED value="28">Analista</option>
													<option value="29">Analista&nbsp;de&nbsp;sistemas</option>
													<option value="30">Antropolo</option>
													<option value="31">Apicultor</option>
													<option value="32">Aplicador&nbsp;De&nbsp;Sinteco</option>
													<option value="33">Apontador</option>
													<option value="34">Aposentado</option>
													<option value="35">Aposentado&nbsp;(exceto&nbsp;funcinario&nbsp;publico)</option>
													<option value="36">Apresentador</option>
													<option value="37">Armador</option>
													<option value="38">Armazenador</option>
													<option value="39">Armeiro</option>
													<option value="40">Arqueolo</option>
													<option value="41">ArqueologoMuseologo</option>
													<option value="42">Arquiteto</option>
													<option value="43">Arquivista</option>
													<option value="44">Arquivolo</option>
													<option value="45">Arranjador</option>
													<option value="46">Arrendatario</option>
													<option value="47">Arrumadeira</option>
													<option value="48">Arrumador</option>
													<option value="49">Artesao</option>
													<option value="50">Artista</option>
													<option value="51">Artista&nbsp;Pintor</option>
													<option value="52">Artista&nbsp;Plastico</option>
													<option value="53">Ascensorista</option>
													<option value="54">Assessor</option>
													<option value="55">Assessor&nbsp;Postal&nbsp;Telegrafico</option>
													<option value="56">Assistente</option>
													<option value="57">Assistente&nbsp;social</option>
													<option value="58">Astrologo,&nbsp;Numerologo&nbsp;e&nbsp;Afins</option>
													<option value="59">Astronauta</option>
													<option value="60">Astronomo</option>
													<option value="61">Astronomo&nbsp;e&nbsp;meteorologista</option>
													<option value="62">Atacadista</option>
													<option value="63">Atendente</option>
													<option value="64">Atleta&nbsp;profissional&nbsp;e&nbsp;tecnico&nbsp;em&nbsp;desportos</option>
													<option value="65">Atleta.&nbsp;Desportista</option>
													<option value="66">Ator</option>
													<option value="67">Ator&nbsp;e&nbsp;diretor&nbsp;de&nbsp;espetaculos&nbsp;publicos</option>
													<option value="68">Atriz</option>
													<option value="69">Atuario</option>
													<option value="70">Atuario&nbsp;e&nbsp;matematico</option>
													<option value="71">Auditor</option>
													<option value="72">Autonomo</option>
													<option value="73">Auxiliar</option>
													<option value="74">Auxiliar&nbsp;de&nbsp;escritorio&nbsp;e&nbsp;assemalhados</option>
													<option value="75">Auxiliar&nbsp;de&nbsp;laboratorio</option>
													<option value="76">Avaliador</option>
													<option value="77">Avicultor</option>
													<option value="78">Azulejador</option>
													<option value="79">Baba</option>
													<option value="80">Bailarino</option>
													<option value="81">Balconista</option>
													<option value="82">Bancario</option>
													<option value="83">Bancario&nbsp;e&nbsp;economiario</option>
													<option value="84">Banqueiro</option>
													<option value="85">Baptista</option>
													<option value="86">Barbeiro</option>
													<option value="87">Barman</option>
													<option value="88">Barqueiro</option>
													<option value="89">Baterista</option>
													<option value="90">Bibliotecario</option>
													<option value="91">Bibliotecario,&nbsp;arquivista,&nbsp;museologo&nbsp;e&nbsp;arqueologo</option>
													<option value="92">Bilheteiro</option>
													<option value="93">Biolo</option>
													<option value="94">Biologo&nbsp;e&nbsp;biomedico</option>
													<option value="95">Biomedico&nbsp;E&nbsp;Afins</option>
													<option value="96">Bioquimico</option>
													<option value="97">Bloquista</option>
													<option value="98">Boiadeiro</option>
													<option value="99">Bolsista</option>
													<option value="100">Bolsista,&nbsp;estagiario&nbsp;e&nbsp;assemelhados</option>
													<option value="101">Bombeiro</option>
													<option value="102">Bombeiro&nbsp;e&nbsp;instalador&nbsp;de&nbsp;gas,&nbsp;agua,&nbsp;esgoto&nbsp;e&nbsp;assemalhados</option>
													<option value="103">Bordador</option>
													<option value="104">Borracheiro</option>
													<option value="105">Botanico</option>
													<option value="106">Business</option>
													<option value="107">Cabeleireiro,&nbsp;barbeiro,&nbsp;manicure,&nbsp;pedicure,&nbsp;maquilador,&nbsp;esteticista&nbsp;e&nbsp;massagista</option>
													<option value="108">Cabelereiro.&nbsp;Barbeiro</option>
													<option value="109">Cacador</option>
													<option value="110">Caixa</option>
													<option value="111">Caixeiro</option>
													<option value="112">Caixeiro&nbsp;Viajante</option>
													<option value="113">Caixeiro-Viajante</option>
													<option value="114">Calculista</option>
													<option value="115">Caldeireiro</option>
													<option value="116">Camareiro</option>
													<option value="117">Cambista</option>
													<option value="118">Camelo</option>
													<option value="119">Caminhoneiro</option>
													<option value="120">Camiseiro</option>
													<option value="121">Campeiro</option>
													<option value="122">Canoeiro</option>
													<option value="123">Cantor&nbsp;e&nbsp;compositor</option>
													<option value="124">Capitalista</option>
													<option value="125">Capitalistas,&nbsp;recebendo&nbsp;rendimento&nbsp;de&nbsp;aplicacao&nbsp;de&nbsp;capital&nbsp;em&nbsp;ativos&nbsp;financeiros</option>
													<option value="126">Capoteiro</option>
													<option value="127">Carcereiro</option>
													<option value="128">Carpinteiro</option>
													<option value="129">Carregador</option>
													<option value="130">Carreteiro</option>
													<option value="131">Carroceiro</option>
													<option value="132">Cartazista</option>
													<option value="133">Carteiro</option>
													<option value="134">Cartorario</option>
													<option value="135">Carvoeiro</option>
													<option value="136">Caseiro</option>
													<option value="137">Catador&nbsp;De&nbsp;Papel</option>
													<option value="138">Cenarista</option>
													<option value="139">Cenografo</option>
													<option value="140">Ceramista</option>
													<option value="141">Cerealista</option>
													<option value="142">Cervejeiro</option>
													<option value="143">Chacareiro</option>
													<option value="144">Chapeador</option>
													<option value="145">Chapeleiro</option>
													<option value="146">Chapista</option>
													<option value="147">Charreteiro</option>
													<option value="148">Chaveiro</option>
													<option value="149">Chef&nbsp;De&nbsp;Cozinha</option>
													<option value="150">Chefe&nbsp;intermediario</option>
													<option value="151">Cicerone</option>
													<option value="152">Ciclista</option>
													<option value="153">Cientista</option>
													<option value="154">Cineasta</option>
													<option value="155">Cinegrafista</option>
													<option value="156">Cinetecnico</option>
													<option value="157">Cirurgiao</option>
													<option value="158">Cisterneiro</option>
													<option value="159">Co&nbsp;Piloto</option>
													<option value="160">Cob.&nbsp;Fiscal&nbsp;Insp.</option>
													<option value="161">Cobrador</option>
													<option value="162">Coletor</option>
													<option value="163">Colhedor</option>
													<option value="164">Colocador&nbsp;De&nbsp;Andaimes</option>
													<option value="165">Colono</option>
													<option value="166">Comandante</option>
													<option value="167">Comandante&nbsp;de&nbsp;embarcacoes</option>
													<option value="168">Comerciante</option>
													<option value="169">Comerciario</option>
													<option value="170">Comissario</option>
													<option value="171">Comissario&nbsp;de&nbsp;bordo</option>
													<option value="172">Comissionista</option>
													<option value="173">Compositor&nbsp;Mecanico</option>
													<option value="174">Compositor&nbsp;Musical</option>
													<option value="175">Comunicacao</option>
													<option value="176">Comunicologo</option>
													<option value="177">Condutor</option>
													<option value="178">Condutor&nbsp;De&nbsp;Malas</option>
													<option value="179">Confeiteiro</option>
													<option value="180">Conferente&nbsp;De&nbsp;Cais&nbsp;Do&nbsp;Porto</option>
													<option value="181">Construtor</option>
													<option value="182">Consul</option>
													<option value="183">Consultor</option>
													<option value="184">Contador</option>
													<option value="185">Continuo</option>
													<option value="186">Contorcionista</option>
													<option value="187">Contra&nbsp;Almirante</option>
													<option value="188">Contramestre&nbsp;de&nbsp;embarcacoes</option>
													<option value="189">Controlador&nbsp;De&nbsp;Producao</option>
													<option value="190">Copeiro</option>
													<option value="191">Coreografo</option>
													<option value="192">Coreografo&nbsp;e&nbsp;bailarino</option>
													<option value="193">Correeiro</option>
													<option value="194">Corretor</option>
													<option value="195">Corretor&nbsp;de&nbsp;imoveis,&nbsp;seguros,&nbsp;titulos&nbsp;e&nbsp;valores</option>
													<option value="196">Corretor&nbsp;de&nbsp;Seguros</option>
													<option value="197">Corretor&nbsp;de&nbsp;Titulos&nbsp;e&nbsp;Valores</option>
													<option value="198">Cosedor</option>
													<option value="199">Costureira</option>
													<option value="200">Cozinheiro&nbsp;Hotel/Restaurante</option>
													<option value="201">Criador&nbsp;De&nbsp;Gado</option>
													<option value="202">Cronista</option>
													<option value="203">Dancarino</option>
													<option value="204">Datilografo</option>
													<option value="205">Decorador</option>
													<option value="206">Defensor&nbsp;Publico</option>
													<option value="207">Delegado&nbsp;de&nbsp;policia</option>
													<option value="208">Demonstrador</option>
													<option value="209">Dentista</option>
													<option value="210">Deputado</option>
													<option value="211">Deputado&nbsp;Estadual/Vereador</option>
													<option value="212">Desembargador</option>
													<option value="213">Desempregado</option>
													<option value="214">Desenhista</option>
													<option value="215">Desenhista&nbsp;comercial</option>
													<option value="216">Desenhista&nbsp;industrial</option>
													<option value="217">Desenhista&nbsp;tecnico</option>
													<option value="218">Desenvolvedor&nbsp;De&nbsp;Software</option>
													<option value="219">Designer</option>
													<option value="220">Despachante</option>
													<option value="221">Despachante,&nbsp;inclusive&nbsp;o&nbsp;aduaneiro</option>
													<option value="222">Desportista</option>
													<option value="223">Detetive</option>
													<option value="224">Diagramador</option>
													<option value="225">Diarista</option>
													<option value="226">Digitador</option>
													<option value="227">Diplomata</option>
													<option value="228">Diplomata&nbsp;E&nbsp;Afins</option>
													<option value="229">Diretor</option>
													<option value="230">Diretor&nbsp;de&nbsp;empresas</option>
													<option value="231">Diretor&nbsp;de&nbsp;estabelecimento&nbsp;de&nbsp;ensino</option>
													<option value="232">Diretor,&nbsp;superintendente,&nbsp;gerente</option>
													<option value="233">Dirigente&nbsp;Da&nbsp;Administracao&nbsp;Publica</option>
													<option value="234">Distribuidor&nbsp;De&nbsp;Jornal</option>
													<option value="235">Do&nbsp;Lar</option>
													<option value="236">Doceiro</option>
													<option value="237">Documentalista</option>
													<option value="238">Economiario</option>
													<option value="239">Economista</option>
													<option value="240">Editor</option>
													<option value="241">Educadora</option>
													<option value="242">Eletricista</option>
													<option value="243">Eletricista&nbsp;Ap.&nbsp;Eletroeletronicos</option>
													<option value="244">Eletricista&nbsp;de&nbsp;manutencao&nbsp;de&nbsp;veiculos&nbsp;automotores,&nbsp;maquinas&nbsp;e&nbsp;aparelhos&nbsp;eletricos,&nbsp;eletronicos&nbsp;e&nbsp;de&nbsp;</option>
													<option value="245">Eletricista&nbsp;e&nbsp;assemelhados</option>
													<option value="246">Eletricista&nbsp;Telecomunicações</option>
													<option value="247">Eletricitario</option>
													<option value="248">Eletromecanico</option>
													<option value="249">Eletrotecnico</option>
													<option value="250">Embaixador</option>
													<option value="251">Embalador</option>
													<option value="252">Embalsamador</option>
													<option value="253">Empacotador</option>
													<option value="254">Empapelador</option>
													<option value="255">Empilhador</option>
													<option value="256">Empregado&nbsp;domestico</option>
													<option value="257">Empreiteiro</option>
													<option value="258">Empresário</option>
													<option value="259">Empresario&nbsp;E&nbsp;Produtor&nbsp;De&nbsp;Espetaculos</option>
													<option value="260">Empresario&nbsp;e&nbsp;produtor&nbsp;de&nbsp;espetaculos&nbsp;publicos</option>
													<option value="261">Encadernador</option>
													<option value="262">Encaixotador</option>
													<option value="263">Encanador</option>
													<option value="264">Encarregado</option>
													<option value="265">Enfermeiro</option>
													<option value="266">Enfermeiro&nbsp;e&nbsp;nutricionista</option>
													<option value="267">Engarrafador</option>
													<option value="268">Engenheiro</option>
													<option value="269">Entalhador</option>
													<option value="270">Entregador</option>
													<option value="271">Envernizador</option>
													<option value="272">Escafrandista</option>
													<option value="273">Escrevente</option>
													<option value="274">Escritor</option>
													<option value="275">Escriturario</option>
													<option value="276">Escrivao</option>
													<option value="277">Escrive</option>
													<option value="278">Escultor</option>
													<option value="279">Escultor,&nbsp;pintor&nbsp;e&nbsp;assemalhados</option>
													<option value="280">Especialista&nbsp;De&nbsp;Beleza</option>
													<option value="281">Especialista&nbsp;Em&nbsp;Informatica</option>
													<option value="282">Espolios</option>
													<option value="283">Esportista</option>
													<option value="284">Estafeta</option>
													<option value="285">Estagiario</option>
													<option value="286">Estagiario&nbsp;E&nbsp;Afins</option>
													<option value="287">Estampador</option>
													<option value="288">Estatistico</option>
													<option value="289">Estereotipista</option>
													<option value="290">Esteticista</option>
													<option value="291">Estilista</option>
													<option value="292">Estivador</option>
													<option value="293">Estivador,&nbsp;carregador,&nbsp;embalador&nbsp;e&nbsp;assemelhados</option>
													<option value="294">Estocador&nbsp;De&nbsp;Gesso</option>
													<option value="295">Estofador</option>
													<option value="296">Estudante</option>
													<option value="297">Etiquetador</option>
													<option value="298">Exportador</option>
													<option value="299">Extrativista&nbsp;Florestal</option>
													<option value="300">Faqueiro</option>
													<option value="301">Farmacêutico</option>
													<option value="302">Farmaceutico</option>
													<option value="303">Faroleiro</option>
													<option value="304">Faturista</option>
													<option value="305">Faxineiro</option>
													<option value="306">Faxineiro&nbsp;de&nbsp;edificio</option>
													<option value="307">Fazendeiro</option>
													<option value="308">Feirante</option>
													<option value="309">Feirante</option>
													<option value="310">Ferramenteiro</option>
													<option value="311">Ferreiro</option>
													<option value="312">Ferroviario</option>
													<option value="313">Fiador</option>
													<option value="314">Fiandeira</option>
													<option value="315">Financista</option>
													<option value="316">Fiscal</option>
													<option value="317">Fisico</option>
													<option value="318">Fisioterapeuta</option>
													<option value="319">Fisioterapeuta&nbsp;e&nbsp;terapeuta&nbsp;ocupacional</option>
													<option value="320">Floricultor</option>
													<option value="321">Foguista</option>
													<option value="322">Foguista&nbsp;Locomotivas/Embarcac</option>
													<option value="323">Fonoaudiologo</option>
													<option value="324">Forjador</option>
													<option value="325">Fotografo</option>
													<option value="326">Frentista</option>
													<option value="327">Freteiro</option>
													<option value="328">Funcionário&nbsp;Itaú</option>
													<option value="329">Funcionario&nbsp;Publico</option>
													<option value="330">Funcionario&nbsp;publico&nbsp;civil&nbsp;aposentado</option>
													<option value="331">Fundidor</option>
													<option value="332">Funileiro</option>
													<option value="333">Fuzileiro&nbsp;Naval</option>
													<option value="334">Galvanizador</option>
													<option value="335">Garagista</option>
													<option value="336">Garagista&nbsp;de&nbsp;edificio</option>
													<option value="337">Garcom</option>
													<option value="338">Garçom&nbsp;de&nbsp;Hotel/Restaurante</option>
													<option value="339">Garconete</option>
													<option value="340">Gari</option>
													<option value="341">Garimpeiro</option>
													<option value="342">Geneticista</option>
													<option value="343">Geofisico</option>
													<option value="344">Geografo</option>
													<option value="345">Geologista</option>
													<option value="346">Geologo</option>
													<option value="347">Gerente</option>
													<option value="348">Gesseiro</option>
													<option value="349">Governanta&nbsp;de&nbsp;hotel,&nbsp;camareiro,&nbsp;porteiro,&nbsp;cozinheiro&nbsp;e&nbsp;garcom</option>
													<option value="350">Grafico</option>
													<option value="351">Graniteiro</option>
													<option value="352">Granjeiro</option>
													<option value="353">Gravador</option>
													<option value="354">Graxeiro</option>
													<option value="355">Guarda</option>
													<option value="356">Guia&nbsp;De&nbsp;Turismo</option>
													<option value="357">Guilhotinado</option>
													<option value="358">Guincheiro</option>
													<option value="359">Guitarrista</option>
													<option value="360">Historiador</option>
													<option value="361">Imediato&nbsp;De&nbsp;Navio</option>
													<option value="362">Imobiliario</option>
													<option value="363">Importador</option>
													<option value="364">Impressor</option>
													 <option value="365">Incorporador</option>
													<option value="366">Industrial</option>
													<option value="367">Industriario</option>
													<option value="368">Inspetor</option>
													<option value="369">Instrumentista</option>
													<option value="370">Instrutor</option>
													<option value="371">Insufilmador&nbsp;De&nbsp;Veiculo</option>
													<option value="372">Interprete</option>
													<option value="373">Jardineiro</option>
													<option value="374">Joalheiro</option>
													<option value="375">Joalheiros&nbsp;e&nbsp;ourives</option>
													<option value="376">Jogador&nbsp;De&nbsp;Futebol</option>
													<option value="377">Joquei</option>
													<option value="378">Jornaleiro</option>
													<option value="379">Jornalista</option>
													<option value="380">Jubilado</option>
													<option value="381">Juiz</option>
													<option value="382">Juiz&nbsp;De&nbsp;Futebol</option>
													<option value="383">Jurista</option>
													<option value="384">Ladrilheiro</option>
													<option value="385">Laminador</option>
													<option value="386">Lanterneiro</option>
													<option value="387">Lanterneiro&nbsp;e&nbsp;pintor&nbsp;de&nbsp;veiculos&nbsp;metalicos</option>
													<option value="388">Lapidario</option>
													<option value="389">Lavadeira</option>
													<option value="390">Lavador&nbsp;De&nbsp;Carros</option>
													<option value="391">Lavourista</option>
													<option value="392">Lavrador</option>
													<option value="393">Leiloeiro</option>
													<option value="394">Leiloeiro,&nbsp;avaliador&nbsp;e&nbsp;assemalhados</option>
													<option value="395">Leiteiro</option>
													<option value="396">Leiturista</option>
													<option value="397">Lenhador</option>
													<option value="398">Linotipista</option>
													<option value="399">Litografo</option>
													<option value="400">Livreiro</option>
													<option value="401">Lixador</option>
													<option value="402">Locutor&nbsp;e&nbsp;comentarista&nbsp;de&nbsp;radio&nbsp;e&nbsp;televisao&nbsp;e&nbsp;radialista</option>
													<option value="403">Locutor.&nbsp;Comentarista</option>
													<option value="404">Lustrador</option>
													<option value="405">Lutador</option>
													<option value="406">Madeireiro</option>
													<option value="407">Maestro</option>
													<option value="408">Magarefe</option>
													<option value="409">Magistrado</option>
													<option value="410">Manequim</option>
													<option value="411">Manicure.&nbsp;Pedicure</option>
													<option value="412">Manicure/Pedicure</option>
													<option value="413">Manipulador&nbsp;Produto&nbsp;Quimico</option>
													<option value="414">Maquetista</option>
													<option value="415">Maquilador</option>
													<option value="416">Maquinista</option>
													<option value="417">Maquinista&nbsp;e&nbsp;foguista&nbsp;de&nbsp;embarcacoes,&nbsp;locomotivas&nbsp;e&nbsp;assemelhados</option>
													<option value="418">Marceneiro</option>
													<option value="419">Marinheiro</option>
													<option value="420">Marinheiro&nbsp;e&nbsp;assemelhados</option>
													<option value="421">Maritimo</option>
													<option value="422">Marmorista</option>
													<option value="423">Massagista</option>
													<option value="424">Massoterapeuta</option>
													<option value="425">Matematico</option>
													<option value="426">Mecanico</option>
													<option value="427">Mecanico&nbsp;de&nbsp;manutencao&nbsp;de&nbsp;veiculos&nbsp;automotores&nbsp;e&nbsp;maquinas</option>
													<option value="428">Mecanico&nbsp;de&nbsp;manutencao,&nbsp;montador,&nbsp;preparador&nbsp;e&nbsp;operador&nbsp;de&nbsp;maquinas&nbsp;e&nbsp;aparelhos&nbsp;de&nbsp;producao&nbsp;industri</option>
													<option value="429">Mecanografo</option>
													<option value="430">Medico</option>
													<option value="431">Membro&nbsp;Do&nbsp;Ministerio&nbsp;Publico</option>
													<option value="432">Membros&nbsp;do&nbsp;poder&nbsp;executivo:&nbsp;presidente&nbsp;da&nbsp;republica,&nbsp;ministro&nbsp;de&nbsp;estado,&nbsp;governador&nbsp;de&nbsp;estado,&nbsp;secre</option>
													<option value="433">Membros&nbsp;do&nbsp;poder&nbsp;judiciario:&nbsp;ministro&nbsp;de&nbsp;tribunal&nbsp;superior,&nbsp;desembargador&nbsp;e&nbsp;juiz</option>
													<option value="434">Membros&nbsp;do&nbsp;poder&nbsp;legislativo:&nbsp;senador,&nbsp;deputado&nbsp;federal,&nbsp;deputado&nbsp;estadual&nbsp;e&nbsp;vereador</option>
													<option value="435">Mensageiro</option>
													<option value="436">Mergulhador</option>
													<option value="437">Mestre&nbsp;De&nbsp;Obra</option>
													<option value="438">Mestre&nbsp;De&nbsp;Panificacao</option>
													<option value="439">Mestre&nbsp;e&nbsp;contramestre</option>
													<option value="440">Mestre&nbsp;Hotel</option>
													<option value="441">Meteorologista</option>
													<option value="442">Metereologista</option>
													<option value="443">Microbiologista</option>
													<option value="444">Microempresario</option>
													<option value="445">Militar</option>
													<option value="446">Militar&nbsp;em&nbsp;geral</option>
													<option value="447">Militar&nbsp;reformado</option>
													<option value="448">Mineiro</option>
													<option value="449">Ministro</option>
													<option value="450">Ministro&nbsp;de&nbsp;Tribunal&nbsp;Superior</option>
													<option value="451">Ministro/Governador/Prefeito</option>
													<option value="452">Missionario</option>
													<option value="453">Modelista&nbsp;e/ou&nbsp;Cortador&nbsp;-&nbsp;Vestuario</option>
													<option value="454">Modelo</option>
													<option value="455">Modelo&nbsp;de&nbsp;modas</option>
													<option value="456">Modista</option>
													<option value="457">Moldador</option>
													<option value="458">Montador</option>
													<option value="459">Mordomo</option>
													<option value="460">Moto&nbsp;Boy</option>
													<option value="461">Motociclista&nbsp;(Transp.&nbsp;de&nbsp;Mercadorias)&nbsp;e/ou</option>
													<option value="462">Motorista</option>
													<option value="463">Motorista&nbsp;de&nbsp;veiculos&nbsp;de&nbsp;transporte&nbsp;de&nbsp;carga</option>
													<option value="464">Motorista&nbsp;de&nbsp;veiculos&nbsp;de&nbsp;transporte&nbsp;de&nbsp;passageiros</option>
													<option value="465">Motorista&nbsp;Profissional</option>
													<option value="466">Motorista/Operador&nbsp;de&nbsp;Maquinas&nbsp;Pesadas</option>
													<option value="467">Motorneiro</option>
													<option value="468">Mototaxista</option>
													<option value="469">Museolo</option>
													<option value="470">Musico</option>
													<option value="471">Não&nbsp;trabalha</option>
													<option value="472">Naturalista</option>
													<option value="473">Navegador</option>
													<option value="474">Neciante</option>
													<option value="475">Nutricionista</option>
													<option value="476">Oceanografo</option>
													<option value="477">Ocupacao&nbsp;Nao&nbsp;Classificada</option>
													<option value="478">Ocupante&nbsp;de&nbsp;cargo&nbsp;de&nbsp;direcao&nbsp;e&nbsp;assessoramento&nbsp;intermediario</option>
													<option value="479">Ocupante&nbsp;de&nbsp;cargo&nbsp;de&nbsp;direcao&nbsp;e&nbsp;assessoramento&nbsp;superior</option>
													<option value="480">Odontologo</option>
													<option value="481">Office&nbsp;Boy</option>
													<option value="482">Oficiais&nbsp;das&nbsp;forcas&nbsp;armadas&nbsp;e&nbsp;forcas&nbsp;auxiliares</option>
													<option value="483">Oficial</option>
													<option value="484">Oficial&nbsp;de&nbsp;Justica</option>
													<option value="485">Oftalmologista</option>
													<option value="486">Oleiro</option>
													<option value="487">Operador</option>
													<option value="488">Operador&nbsp;de&nbsp;cameras&nbsp;de&nbsp;cinema&nbsp;e&nbsp;televisao</option>
													<option value="489">Operador&nbsp;de&nbsp;Computadores</option>
													<option value="490">Operador&nbsp;de&nbsp;Maquinas&nbsp;Agropecuarias</option>
													<option value="491">Operador&nbsp;de&nbsp;Telemarketing</option>
													<option value="492">Optico</option>
													<option value="493">Orientador&nbsp;Educacional</option>
													<option value="494">Ornitologo</option>
													<option value="495">Ourives</option>
													<option value="496">Outros</option>
													<option value="497">Outros</option>
													<option value="498">Outros&nbsp;Profissionais&nbsp;Do&nbsp;Espetaculo&nbsp;E&nbsp;Das&nbsp;Artes</option>
													<option value="499">Outros&nbsp;trabalhadores&nbsp;de&nbsp;nivel&nbsp;superior&nbsp;ligados&nbsp;ao&nbsp;ensino</option>
													<option value="500">Padeiro</option>
													<option value="501">Padre</option>
													<option value="502">Paisagista</option>
													<option value="503">Papiloscopista</option>
													<option value="504">Parasitologista</option>
													<option value="505">Parteira</option>
													<option value="506">Passador</option>
													<option value="507">Pasteleiro</option>
													<option value="508">Pastor</option>
													<option value="509">Patinador</option>
													<option value="510">Patologista</option>
													<option value="511">Peao</option>
													<option value="512">Pecuarista</option>
													<option value="513">Peda</option>
													<option value="514">Pedagogo</option>
													<option value="515">Pedreiro</option>
													<option value="516">Peixeiro</option>
													<option value="517">Peleteiro</option>
													<option value="518">Pensionista</option>
													<option value="519">Perfurador</option>
													<option value="520">Perfurador&nbsp;De&nbsp;Pocos&nbsp;Petroleo</option>
													<option value="521">Perito</option>
													<option value="522">Personal&nbsp;Trainner</option>
													<option value="523">Pescador</option>
													<option value="524">Pesq/Produc&nbsp;de&nbsp;Mudas&nbsp;ou&nbsp;Sement&nbsp;Fiscalizada</option>
													<option value="525">Pesq/Produc&nbsp;de&nbsp;Semem&nbsp;para&nbsp;Inseminacao&nbsp;Arti</option>
													<option value="526">Piloto</option>
													<option value="527">Piloto&nbsp;de&nbsp;aeronaves</option>
													<option value="528">Pintor</option>
													<option value="529">Pintor&nbsp;Artisticos&nbsp;E&nbsp;Afins</option>
													<option value="530">Pintor&nbsp;De&nbsp;Quadros</option>
													<option value="531">Piscicultor</option>
													<option value="532">Pizzaiollo</option>
													<option value="533">Plainador</option>
													<option value="534">Policial</option>
													<option value="535">Polidor</option>
													<option value="536">Politico</option>
													<option value="537">Porteiro</option>
													<option value="538">Porteiro&nbsp;de&nbsp;edificio,&nbsp;ascensorista,&nbsp;garagista&nbsp;e&nbsp;faxineiro</option>
													<option value="539">Porteiro&nbsp;de&nbsp;Hotel/Restaurante</option>
													<option value="540">Portuario</option>
													<option value="541">Pracista</option>
													<option value="542">Prefeito</option>
													<option value="543">Prensador</option>
													<option value="544">Presidente&nbsp;Da&nbsp;Republica</option>
													<option value="545">Prest&nbsp;Serv&nbsp;de&nbsp;Inseminacao&nbsp;Artificial,&nbsp;em&nbsp;I</option>
													<option value="546">Prest&nbsp;Serv&nbsp;Mecanizad,Natural,Rural&nbsp;Inclusi</option>
													<option value="547">Prestador&nbsp;De&nbsp;Servicos&nbsp;Do&nbsp;Comercio</option>
													<option value="548">Procurador</option>
													<option value="549">Procurador&nbsp;e&nbsp;assemelhados</option>
													<option value="550">Produtor&nbsp;De&nbsp;Cinema</option>
													<option value="551">Produtor&nbsp;De&nbsp;Tv</option>
													<option value="552">Produtor&nbsp;Na&nbsp;Exploracao&nbsp;Agropecuaria</option>
													<option value="553">Produtor&nbsp;Rural</option>
													<option value="554">Professor</option>
													<option value="555">Professor&nbsp;de&nbsp;ensino&nbsp;de&nbsp;primeiro&nbsp;e&nbsp;segundo&nbsp;graus</option>
													<option value="556">Professor&nbsp;de&nbsp;ensino&nbsp;superior</option>
													<option value="557">Profissionais&nbsp;de&nbsp;letras&nbsp;e&nbsp;de&nbsp;artes</option>
													<option value="558">Profissional&nbsp;Da&nbsp;Comercializacao</option>
													<option value="559">Profissional&nbsp;Da&nbsp;Educacao&nbsp;Fisica&nbsp;(Exceto&nbsp;Professor)</option>
													<option value="560">Profissional&nbsp;De&nbsp;Marketing</option>
													<option value="561">Profissional&nbsp;De&nbsp;Publicidade</option>
													<option value="562">Programador</option>
													<option value="563">Projetista</option>
													<option value="564">Promotor</option>
													<option value="565">Promotor&nbsp;De&nbsp;Eventos</option>
													<option value="566">Promotor&nbsp;De&nbsp;Justica</option>
													<option value="567">Promotor&nbsp;De&nbsp;Vendas</option>
													<option value="568">Promotor&nbsp;Juridico</option>
													<option value="569">Promotor&nbsp;Publico</option>
													<option value="570">Propagandista</option>
													<option value="571">Proprietario&nbsp;de&nbsp;estabelecimento&nbsp;agricola,&nbsp;da&nbsp;pecuaria&nbsp;e&nbsp;florestal</option>
													<option value="572">Proprietario&nbsp;de&nbsp;estabelecimento&nbsp;comercial</option>
													<option value="573">Proprietario&nbsp;de&nbsp;estabelecimento&nbsp;de&nbsp;prestacao&nbsp;de&nbsp;servicos</option>
													<option value="574">Proprietario&nbsp;de&nbsp;estabelecimento&nbsp;industrial</option>
													<option value="575">Proprietario&nbsp;de&nbsp;imovel,&nbsp;recebendo&nbsp;rendimento&nbsp;de&nbsp;aluguel</option>
													<option value="576">Proprietario&nbsp;de&nbsp;microempresa</option>
													<option value="577">Protetico</option>
													<option value="578">Psicanalista</option>
													<option value="579">Psicologo</option>
													<option value="580">Psiquiatra</option>
													<option value="581">Publicitario</option>
													<option value="582">Pugilista</option>
													<option value="583">Quimico</option>
													<option value="584">Quitandeiro</option>
													<option value="585">Radialista</option>
													<option value="586">Radiotecnico</option>
													<option value="587">Radiotelegrafista</option>
													<option value="588">Recenseador</option>
													<option value="589">Recepcionista</option>
													<option value="590">Redator</option>
													<option value="591">Regente&nbsp;De&nbsp;Orquestra&nbsp;Ou&nbsp;Coral</option>
													<option value="592">Relacoes&nbsp;publicas</option>
													<option value="593">Religioso</option>
													<option value="594">Relojoeiro</option>
													<option value="595">Remador</option>
													<option value="596">Rendeiro</option>
													<option value="597">Rentista&nbsp;ou&nbsp;Locador</option>
													<option value="598">Reparador</option>
													<option value="599">Reporter</option>
													<option value="600">Repositor</option>
													<option value="601">Representante&nbsp;Comercial</option>
													<option value="602">Representante&nbsp;De&nbsp;Vendas</option>
													<option value="603">Retificador&nbsp;De&nbsp;Motor</option>
													<option value="604">Reverendo</option>
													<option value="605">Revisor&nbsp;Grafico</option>
													<option value="606">Rodoviario</option>
													<option value="607">Sacerdote</option>
													<option value="608">Sacerdote&nbsp;ou&nbsp;membro&nbsp;de&nbsp;ordens&nbsp;ou&nbsp;seitas&nbsp;religiosas</option>
													<option value="609">Salgadeiro</option>
													<option value="610">Salva&nbsp;Vidas</option>
													<option value="611">Sapateiro</option>
													<option value="612">Secretario</option>
													<option value="613">Secretario&nbsp;Estadual&nbsp;e&nbsp;Municipal</option>
													<option value="614">Secretario&nbsp;Federal</option>
													<option value="615">Secretario,&nbsp;estenografo,&nbsp;recepcionista,&nbsp;telefonista&nbsp;e&nbsp;trabalhadores</option>
													<option value="616">Securitario</option>
													<option value="617">Seguranca</option>
													<option value="618">Sem&nbsp;Ocupacao</option>
													<option value="619">Senador</option>
													<option value="620">Sericultor</option>
													<option value="621">Serigrafista</option>
													<option value="622">Seringueiro</option>
													<option value="623">Serrador</option>
													<option value="624">Serralheiro</option>
													<option value="625">Servente</option>
													<option value="626">Serventuario&nbsp;Da&nbsp;Justica</option>
													<option value="627">Serventuario&nbsp;de&nbsp;justica</option>
													<option value="628">Servicos&nbsp;Gerais</option>
													<option value="629">Servidor&nbsp;Publico</option>
													<option value="630">Servidor&nbsp;publico&nbsp;estadual</option>
													<option value="631">Servidor&nbsp;publico&nbsp;federal</option>
													<option value="632">Servidor&nbsp;publico&nbsp;municipal</option>
													<option value="633">Sociologo</option>
													<option value="634">Soldador</option>
													<option value="635">Sonoplasta</option>
													<option value="636">Sorveteiro</option>
													<option value="637">Sub-Gerente</option>
													<option value="638">Sucateiro</option>
													<option value="639">Superintendente</option>
													<option value="640">Supervisor</option>
													<option value="641">Supervisor&nbsp;Compras&nbsp;e&nbsp;Vendas</option>
													<option value="642">Supervisores,&nbsp;inspetor&nbsp;e&nbsp;agente&nbsp;de&nbsp;compras&nbsp;e&nbsp;vendas</option>
													<option value="643">Tabeliao</option>
													<option value="644">Tabeliao&nbsp;E&nbsp;Demais&nbsp;Serventuarios&nbsp;De&nbsp;Justica</option>
													<option value="645">Tanoeiro</option>
													<option value="646">Tapeceiro</option>
													<option value="647">Taquigrafo</option>
													<option value="648">Taxista</option>
													<option value="649">Tecelao</option>
													<option value="650">Tecnico</option>
													<option value="651">Tecnico&nbsp;Agricola</option>
													<option value="652">Tecnico&nbsp;de&nbsp;biologia</option>
													<option value="653">Tecnico&nbsp;de&nbsp;contabilidade&nbsp;e&nbsp;de&nbsp;estatistica</option>
													<option value="654">Tecnico&nbsp;de&nbsp;Edificacoes</option>
													<option value="655">Tecnico&nbsp;de&nbsp;eletricidade,&nbsp;eletronica&nbsp;e&nbsp;telecomunicacoes</option>
													<option value="656">Tecnico&nbsp;de&nbsp;Enfermagem</option>
													<option value="657">Tecnico&nbsp;De&nbsp;Futebol</option>
													<option value="658">Tecnico&nbsp;de&nbsp;laboratorio&nbsp;e&nbsp;raios&nbsp;x</option>
													<option value="659">Tecnico&nbsp;de&nbsp;mecanica</option>
													<option value="660">Tecnico&nbsp;de&nbsp;quimica</option>
													<option value="661">Tecnico&nbsp;em&nbsp;agronomia&nbsp;e&nbsp;agrimensura</option>
													<option value="662">Tecnico&nbsp;em&nbsp;Audio&nbsp;e&nbsp;cenografia</option>
													<option value="663">Tecnico&nbsp;em&nbsp;Desportos</option>
													<option value="664">Tecnico&nbsp;em&nbsp;Seguranca&nbsp;do&nbsp;Trabalho</option>
													<option value="665">Tecnolo&nbsp;Em&nbsp;Saneamento&nbsp;Basico&nbsp;E&nbsp;Obras&nbsp;Hidraulicas</option>
													<option value="666">Tecnologo</option>
													<option value="667">Telefonista</option>
													<option value="668">Telegrafista</option>
													<option value="669">Terapeuta&nbsp;Ocupacional</option>
													<option value="670">Tesoureiro</option>
													<option value="671">Tintureiro</option>
													<option value="672">Tipografo</option>
													<option value="673">Topografo</option>
													<option value="674">Torneiro</option>
													<option value="675">Torneiro&nbsp;Mecanico</option>
													<option value="676">Trabalhador&nbsp;agricola</option>
													<option value="677">Trabalhador&nbsp;da&nbsp;pecuaria</option>
													<option value="678">Trabalhador&nbsp;da&nbsp;pesca</option>
													<option value="679">Trabalhador&nbsp;de&nbsp;artes&nbsp;graficas</option>
													<option value="680">Trabalhador&nbsp;de&nbsp;construcao&nbsp;civil</option>
													<option value="681">Trabalhador&nbsp;de&nbsp;Extracao&nbsp;de&nbsp;Minerios</option>
													<option value="682">Trabalhador&nbsp;de&nbsp;Extracao&nbsp;Vegetal</option>
													<option value="683">Trabalhador&nbsp;de&nbsp;Fabrica&nbsp;Prod.&nbsp;Plastico</option>
													<option value="684">Trabalhador&nbsp;de&nbsp;fabricacao&nbsp;de&nbsp;artefatos&nbsp;de&nbsp;madeira</option>
													<option value="685">Trabalhador&nbsp;de&nbsp;fabricacao&nbsp;de&nbsp;calcados&nbsp;e&nbsp;artefatos&nbsp;de&nbsp;couro</option>
													<option value="686">Trabalhador&nbsp;de&nbsp;fabricacao&nbsp;de&nbsp;papel&nbsp;e&nbsp;papelao</option>
													<option value="687">Trabalhador&nbsp;de&nbsp;fabricacao&nbsp;de&nbsp;produtos&nbsp;de&nbsp;borracha&nbsp;e&nbsp;plastico</option>
													<option value="688">Trabalhador&nbsp;de&nbsp;fabricacao&nbsp;de&nbsp;produtos&nbsp;texteis&nbsp;(exceto&nbsp;roupas)</option>
													<option value="689">Trabalhador&nbsp;de&nbsp;fabricacao&nbsp;de&nbsp;roupas</option>
													<option value="690">Trabalhador&nbsp;de&nbsp;fabricacao&nbsp;e&nbsp;preparacao&nbsp;de&nbsp;alimentos&nbsp;e&nbsp;bebidas</option>
													<option value="691">Trabalhador&nbsp;de&nbsp;instalacoes&nbsp;de&nbsp;processamento&nbsp;quimico</option>
													<option value="692">Trabalhador&nbsp;de&nbsp;tratamento&nbsp;de&nbsp;fumo&nbsp;e&nbsp;de&nbsp;fabricacao&nbsp;de&nbsp;cigarros&nbsp;e&nbsp;charutos</option>
													<option value="693">Trabalhador&nbsp;de&nbsp;usinagem&nbsp;de&nbsp;metais</option>
													<option value="694">Trabalhador&nbsp;dos&nbsp;servicos&nbsp;de&nbsp;contabilidade,&nbsp;de&nbsp;caixa&nbsp;e&nbsp;trabalhadores&nbsp;assemelhados</option>
													<option value="695">Trabalhador&nbsp;florestal</option>
													<option value="696">Trabalhador&nbsp;metalurgico&nbsp;e&nbsp;siderurgico</option>
													<option value="697">Tradutor</option>
													<option value="698">Tratorista</option>
													<option value="699">Turismo</option>
													<option value="700">Vaqueiro</option>
													<option value="701">Varejista</option>
													<option value="702">Vendedor</option>
													<option value="703">Vendedor&nbsp;de&nbsp;comercio&nbsp;varejista&nbsp;e&nbsp;atacadista</option>
													<option value="704">Vendedor&nbsp;pracista,&nbsp;representante&nbsp;comercial,&nbsp;caixeiro-viajante&nbsp;e&nbsp;trabalhadores&nbsp;assemelhados</option>
													<option value="705">Vereador</option>
													<option value="706">vernador</option>
													<option value="707">vernanta</option>
													<option value="708">Veterinario</option>
													<option value="709">Veterinario&nbsp;e&nbsp;zootecnista</option>
													<option value="710">Vice-Governador&nbsp;de&nbsp;Estado/Distrito&nbsp;Federal</option>
													<option value="711">Vice-Prefeito&nbsp;Municipal</option>
													<option value="712">Vice-Presidente&nbsp;da&nbsp;Republica</option>
													<option value="713">Vidraceiro</option>
													<option value="714">Vidreiro</option>
													<option value="715">Vigia</option>
													<option value="716">Vigilante</option>
													<option value="717">Vitrinista</option>
													<option value="718">Vulcanizado</option>
													<option value="719">Zelador</option>
													<option value="720">Zootecnista</option> 												  
												</select>
						                    </div>
						                    </div>
											 <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Detalhe da Profissão</label>
						                      <input name="txtDetalheProfissao" id="txtDetalheProfissao" type="text" class="form-control" placeholder="Detalhe da sua Profissão"  onchange="onchange_aba_condutor()">
												
					                      </div>
					                    </div>
					                      </div>
										
					                   
				                    </div>
				                   <%-- <!-- /.box-body -->
				                    <div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div>  --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                    <div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Complemento</h4>			
				                    <ul class="box-controls pull-right">
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <%--<h4 class="box-title text-info"><i class="ti-info-alt mr-15"></i> Informações para Renovação</h4>--%>
					                    <hr class="my-15">
										<div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
											  <label >Reside em</label>
						                      <select name="ddlCondutorResideEm" id="ddlCondutorResideEm" class="form-control"  onchange="onchange_aba_condutor()">
												  <option selected value="">Selecione..</option> 												  
												  <option value="Apartamento/Flat com Porteiro ou Portão Automático">Apartamento/Flat com Porteiro ou Portão Automático</option> 												  
												  <option value="Casa ou Sobrado">Casa ou Sobrado</option> 												  
												  <option value="Casa em Condomínio Fechado">Casa em Condomínio Fechado</option> 												  
												  <option value="Chácara, Fazenda ou Sítio">Chácara, Fazenda ou Sítio</option> 												  
												  <option value="Outros">Outros</option> 												  
												</select>
						                    </div>
						                      
					                      </div>
					                      <div class="col-md-6">
											  <div class="form-group">
						                      <label >Condutor Considerado...</label>
						                      <select name="ddlCondutorConsiderado" id="ddlCondutorConsiderado" class="form-control" style="width: 100%;"  onchange="onchange_aba_condutor()" >
												  <option selected value="">Selecione..</option> 												  
												  <option value="Dirige o veículo por mais de 85% do tempo de uso semanal">Dirige o veículo por mais de 85% do tempo de uso semanal</option> 												  
												  <option value="Dirige ABAIXO de 85% da semana">Dirige ABAIXO de 85% da semana</option> 												  
												</select>
						                    </div>
						                    
					                      </div>
					                    </div>
										<div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
											  <label >Existem Condutores > de 25 anos</label>
						                      <select name="ddlCondutorAcima25" id="ddlCondutorAcima25" class="form-control"  onchange="onchange_aba_condutor()">
												  <option selected value="1">NÃO</option> 												  
												  <option value="2">SIM</option> 												  												  
												</select>
						                    </div>
						                      
					                      </div>
					                      <div class="col-md-6">
											  <div class="form-group">
						                      <label >Total de Veiculos na Residência</label>
						                      <select name="ddlTotalVeiculos" id="ddlTotalVeiculos" class="form-control" style="width: 100%;"  onchange="onchange_aba_condutor()">
												  <option selected value="">Selecione..</option> 												  
												  <option value="1">1</option> 												  
												  <option value="2">2</option> 												  
												  <option value="3">3</option> 												  
												  <option value="4">4</option> 												  
												  <option value="5">5</option> 												  
												</select>
						                    </div>
						                    
					                      </div>
					                    </div>
										<div class="row">
											<div class="col-md-6">
						                    <div class="form-group">
						                      <label>Número R.G.</label>
						                      <input name="txtRgCondutorPrinicpal" id="txtRgCondutorPrinicpal" type="text" class="form-control" placeholder="Digite o Nº do R.G." maxlength ="15"  onchange="onchange_aba_condutor()">
						                    </div>
					                      </div>
											<div class="col-md-3">
												<div class="form-group">
													<label>Dt. Emissão</label>
													<input name="txtDataEmissaoRgCondutorPrincipal" id="txtDataEmissaoRgCondutorPrincipal" type="text" class="form-control" placeholder="00/00/0000" maxlength ="10"  onblur="onchange_aba_condutor()">
												</div>
												</div>
											<div class="col-md-3">
												<div class="form-group">
													<label>Emissor R.G.</label>
													<input name="txtEmissorRG" id="txtEmissorRG" type="text" class="form-control" placeholder="Digite o Emiisor do R.G." maxlength ="15"  onchange="onchange_aba_condutor()">
												</div>
												</div>
					                      
					                    </div>
										<div class="row">
											<div class="col-md-6">
						                    <div class="form-group">
						                      <label>Número C.N.H.</label>
						                      <input name="txtCnhCondutorPrinicpal" id="txtCnhCondutorPrinicpal" type="text" class="form-control" placeholder="Digite o Nº da C.N.H." maxlength ="11" onkeypress="return somenteNumeros(event)"  onchange="onchange_aba_condutor()">
						                    </div>
					                      </div>
											
											<div class="col-md-6">
												<div class="form-group">
													<label>Data da Habilitação</label>
													<input name="txtDataHabilitacao" id="txtDataHabilitacao" type="text" class="form-control" placeholder="00/00/0000" maxlength ="10"  onblur="onchange_aba_condutor()">
												</div>
												</div>
					                      
					                    </div>
                                       
					                </div>
				                    <!-- /.box-body -->
				                   <%-- <div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div> --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div>	
                            
                            </div>
                            <%--</section>--%>
						</div>
					</div>
					<%--Dados Coberturas--%>
					<div class="tab-pane" id="cobertura" role="tabpanel">
						<div class="pad">
                            <%--<section class="content">--%>
                            <div class="row">		
							<div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title">Cobertura Veículo</h4>			
				                    <ul class="box-controls pull-right">
				                      <%--<li><a class="box-btn-close" href="#"></a></li>
				                      <li><a class="box-btn-slide" href="#"></a></li>	--%>
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <%--<h4 class="box-title text-info"><i class="ti-info-alt mr-15"></i> Informações para Analise</h4>--%>
					                    <hr class="my-15">
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Cobertura</label>
						                      <select name="ddlCobertura" id="ddlCobertura" class="form-control" >
												  <option selected  value="1">Compreensiva</option> 												  
												  <option value="2">Roubo/Furto</option> 												  
												  <option value="3">Apenas RCF</option> 												  
												  <option value="4">Incendio/Roubo</option> 												  
												  <option value="5">Perda Total</option> 												  
												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Valor do Veículo</label>
						                      <select name="ddlValorMercado" id="ddlValorMercado" class="form-control" >
												  <option selected value="Mercado (Fipe) 100%">Mercado (Fipe) 100%</option> 												  
												  <option value="Mercado (Fipe) 115%">Mercado (Fipe) 115%</option> 												  
												  <option value="Mercado (Fipe) 110%">Mercado (Fipe) 110%</option> 												  
												  <option value="Mercado (Fipe) 105%">Mercado (Fipe) 105%</option> 												  
												  <option value="Mercado (Fipe) 95%">Mercado (Fipe)  95%</option> 												  
												  <option value="Mercado (Fipe) 90%">Mercado (Fipe)  90%</option> 												  
												  <option value="Mercado (Fipe) 85%">Mercado (Fipe)  85%</option> 												  
												</select>
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Valor Acessórios</label>
						                      <select name="ddlValorAcessorios" id="ddlValorAcessorios" class="form-control" >
												  <option selected value="0,00">0,00</option> 												  
												  <option value="500,00">500,00</option> 												  
												  <option value="1.000,00">1.000,00</option>
												  <option value="2.500,00">2.500,00</option>
												  <option value="5.000,00">5.000,00</option>
												  <option value="7.500,00">7.500,00</option>
												  <option value="10.000,00">10.000,00</option>
												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Valor Vidros</label>
						                      <select name="ddlValorVidros" id="ddlValorVidros" class="form-control" >
												   <option selected value="0,00">0,00</option> 												  
												  <option value="500,00">500,00</option> 												  
												  <option value="1.000,00">1.000,00</option>
												  <option value="1.500,00">1.500,00</option>
												  <option value="2.000,00">2.000,00</option>
												  <option value="2.500,00">2.500,00</option>
												  <option value="3.000,00">3.000,00</option> 												  
												</select>
						                    </div>
					                      </div>
					                    </div>
                                         <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Valor Equipamentos</label>
						                      <select name="ddlValorEquipamentos" id="ddlValorEquipamentos" class="form-control" >
												  <option selected value="0,00">0,00</option> 												  
												  <option value="500,00">500,00</option> 												  
												  <option value="1.000,00">1.000,00</option>
												  <option value="2.500,00">2.500,00</option>
												  <option value="5.000,00">5.000,00</option>
												  <option value="7.500,00">7.500,00</option>
												  <option value="10.000,00">10.000,00</option> 												  
												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Valor Despesas Extras</label>
						                      <select name="ddlValorDespExtras" id="ddlValorDespExtras" class="form-control" >
												   <option selected value="0,00">0,00</option> 												  
												  <option value="500,00">500,00</option> 												  
												  <option value="1.000,00">1.000,00</option>
												  <option value="2.500,00">2.500,00</option>
												  <option value="5.000,00">5.000,00</option>
												  <option value="7.500,00">7.500,00</option>
												  <option value="10.000,00">10.000,00</option> 												  
												</select>
						                    </div>
					                      </div>
					                    </div>
										<div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Carro Reserva</label>
						                      <select name="ddlCarroReserva" id="ddlCarroReserva" class="form-control" >
												  <option value="SIM">SIM</option> 												  
												  <option selected value="NÃO">NÃO</option> 												  												  
												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >Assistência</label>
						                      <select name="ddlAssistencia" id="ddlAssistencia" class="form-control" >
												  <option selected value="Básica">Básica</option> 												  
												  <option value="Intermediária">Intermediária</option> 												  
												  <option value="Vip">Vip</option> 												  
												</select>
						                    </div>
					                      </div>
					                    </div>
                                       
					                   
				                    </div>
				                   <%-- <!-- /.box-body -->
				                    <div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div>  --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                    <div class="col-lg-6 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
			                      <h4 class="box-title" aria-label="teste label">Responsabilidade Civil Facultativa (RCF-V) e APP</h4>			
				                    <ul class="box-controls pull-right">
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                    <div class="box-body">
					                    <%--<h4 class="box-title text-info"><i class="ti-info-alt mr-15"></i> Informações para Renovação</h4>--%>
					                    <hr class="my-15">
										<div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label >RCF - Danos Materiais</label>
						                      <select name="ddlDanosMateriais" id="ddlDanosMateriais" class="form-control" >
												    <option value="10.000,00">10.000,00</option>
													<option value="12.000,00">12.000,00</option>
													<option value="14.000,00">14.000,00</option>
													<option value="16.000,00">16.000,00</option>
													<option value="18.000,00">18.000,00</option>
													<option value="20.000,00">20.000,00</option>
													<option value="25.000,00">25.000,00</option>
													<option value="30.000,00">30.000,00</option>
													<option value="35.000,00">35.000,00</option>
													<option value="40.000,00">40.000,00</option>
													<option value="45.000,00">45.000,00</option>
													<option value="50.000,00">50.000,00</option>
													<option value="55.000,00">55.000,00</option>
													<option value="60.000,00">60.000,00</option>
													<option value="65.000,00">65.000,00</option>
													<option value="70.000,00">70.000,00</option>
													<option value="75.000,00">75.000,00</option>
													<option value="80.000,00">80.000,00</option>
													<option value="85.000,00">85.000,00</option>
													<option value="90.000,00">90.000,00</option>
													<option value="95.000,00">95.000,00</option>
													<option SELECTED value="100.000,00">100.000,00</option>
													<option value="125.000,00">125.000,00</option>
													<option value="150.000,00">150.000,00</option>
													<option value="175.000,00">175.000,00</option>
													<option value="200.000,00">200.000,00</option>
													<option value="250.000,00">250.000,00</option>
													<option value="300.000,00">300.000,00</option>
													<option value="350.000,00">350.000,00</option>
													<option value="400.000,00">400.000,00</option>
													<option value="450.000,00">450.000,00</option>
													<option value="500.000,00">500.000,00</option>
													<option value="600.000,00">600.000,00</option>
													<option value="700.000,00">700.000,00</option>
													<option value="800.000,00">800.000,00</option>
													<option value="900.000,00">900.000,00</option>
													<option value="1.000.000,00">1.000.000,00</option>
													<option value="1.200.000,00">1.200.000,00</option>
													<option value="1.400.000,00">1.400.000,00</option>
													<option value="1.600.000,00">1.600.000,00</option>												  
												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>RCF - Danos Corporais</label>
						                      <select name="ddlDanosCorporais" id="ddlDanosCorporais" class="form-control" >
												    <option value="10.000,00">10.000,00</option>
													<option value="12.000,00">12.000,00</option>
													<option value="14.000,00">14.000,00</option>
													<option value="16.000,00">16.000,00</option>
													<option value="18.000,00">18.000,00</option>
													<option value="20.000,00">20.000,00</option>
													<option value="25.000,00">25.000,00</option>
													<option value="30.000,00">30.000,00</option>
													<option value="35.000,00">35.000,00</option>
													<option value="40.000,00">40.000,00</option>
													<option value="45.000,00">45.000,00</option>
													<option value="50.000,00">50.000,00</option>
													<option value="55.000,00">55.000,00</option>
													<option value="60.000,00">60.000,00</option>
													<option value="65.000,00">65.000,00</option>
													<option value="70.000,00">70.000,00</option>
													<option value="75.000,00">75.000,00</option>
													<option value="80.000,00">80.000,00</option>
													<option value="85.000,00">85.000,00</option>
													<option value="90.000,00">90.000,00</option>
													<option value="95.000,00">95.000,00</option>
													<option SELECTED value="100.000,00">100.000,00</option>
													<option value="125.000,00">125.000,00</option>
													<option value="150.000,00">150.000,00</option>
													<option value="175.000,00">175.000,00</option>
													<option value="200.000,00">200.000,00</option>
													<option value="250.000,00">250.000,00</option>
													<option value="300.000,00">300.000,00</option>
													<option value="350.000,00">350.000,00</option>
													<option value="400.000,00">400.000,00</option>
													<option value="450.000,00">450.000,00</option>
													<option value="500.000,00">500.000,00</option>
													<option value="600.000,00">600.000,00</option>
													<option value="700.000,00">700.000,00</option>
													<option value="800.000,00">800.000,00</option>
													<option value="900.000,00">900.000,00</option>
													<option value="1.000.000,00">1.000.000,00</option>
													<option value="1.200.000,00">1.200.000,00</option>
													<option value="1.400.000,00">1.400.000,00</option>
													<option value="1.600.000,00">1.600.000,00</option> 	 												  
												</select>
						                    </div>
					                      </div>

					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
											  <label >RCF - Dados Morais</label>
						                       <select name="ddlDanosMorais" id="ddlDanosMorais" class="form-control" >
													<option selected value="1">0,00</option>
													<option value="1.000,00">1.000,00</option>
													<option value="3.000,00">3.000,00</option>
													<option value="5.000,00">5.000,00</option> 												  
													<option value="7.500,00">7.500,00</option> 	 												  
													<option value="10.000,00">10.000,00</option> 	 												  
												</select>
						                    </div>
						                    </div>
						                      
					                      <div class="col-md-6">
											  <div class="form-group">
						                      <label >Diária Paralisação</label>
						                      <select name="ddlValorDiaParalisacao" id="ddlValorDiaParalisacao" class="form-control" >
												  <option selected value="1">0,00</option>
													<option value="200,00">200,00</option>
													<option value="500,00">500,00</option>
													<option value="1.000,00">1.000,00</option> 												  
													<option value="1.500,00">1.500,00</option> 	 												  
													<option value="2.000,00">2.000,00</option> 	 												  
												</select>
						                    </div>
						                    
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>APP - Passageiros</label>
												<select name="ddlPassageiros" id="ddlPassageiros" class="form-control" >
												  <option value="1">1</option> 												  
												  <option value="2">2</option> 												  
												  <option value="3">3</option> 												  
												  <option value="4">4</option> 												  
												  <option selected value="5">5</option> 												  												  
												</select>
						                      
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>APP - Valor Morte</label>
						                      <select name="ddlValorMorte" id="ddlValorMorte" class="form-control" >
												  <option selected value="5.000,00">5.000,00</option> 												  
												  <option value="7.500,00">7.500,00</option> 												  
												  <option value="10.000,00">10.000,00</option> 												  
												  <option value="15.000,00">15.000,00</option> 												  
												  <option value="20.000,00">20.000,00</option> 												  												  
												</select>
						                    </div>
					                      </div>
					                    </div>
										<div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>APP - Valor Invalidez</label>
												 <select name="ddlValorInvalidez" id="ddlValorInvalidez" class="form-control" >
												  <option value="0,00">0,00</option> 												  
												  <option selected value="5.000,00">5.000,00</option> 												  
												  <option value="7.500,00">7.500,00</option> 												  
												  <option value="10.000,00">10.000,00</option> 												  
												  <option value="15.000,00">15.000,00</option> 												  
												  <option value="20.000,00">20.000,00</option> 													  												  
												</select>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>APP - Valor Despesas Médicas</label>
						                      <select name="ddlValorDespesasMedicas" id="ddlValorDespesasMedicas" class="form-control" >
												  <option selected value="0,00">0,00</option>
												  <option value="5.000,00">5.000,00</option> 												  
												  <option value="7.500,00">7.500,00</option> 												  
												  <option value="10.000,00">10.000,00</option> 												  
												  <option value="15.000,00">15.000,00</option> 												  
												  <option value="20.000,00">20.000,00</option> 												  
												</select>
						                    </div>
					                      </div>
					                    </div>
										



					                </div>
				                    <!-- /.box-body -->
				                   <%-- <div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div> --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div>	
                            
                            </div>
                            <%--</section>--%>
						</div>
					</div>
					
					<%--Dados Calculo--%>
					<div class="tab-pane" id="calculo" role="tabpanel">
						<div class="pad">
                            <%--<section class="content">--%>
                            <div class="row">		
							<div class="col-lg-12 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
									
			                      <h4 class="box-title">Resultado Calculo</h4>	
									<ul class="box-title">
										 <% if (TemPermissao("ADMRESCAL")) { %>
				                      <button type="button" name="btnInsereCotacao" id="btnInsereCotacao" class="btn btn-blue mb-5" onclick="CarregaTelaInsereCotacao()" hidden >Inserir</button>
										<button type="button" name="btnLimparItensCotacao" id="btnLimparItensCotacao" class="btn btn-blue mb-5" onclick="CarregaTelaLimparItensCotacao()" hidden >Excluir Todos</button>
										<button type="button" name="btnUploadPDF" id="btnUploadPDF" class="btn btn-blue mb-5" onclick="AbrePopupUploadPDF()" hidden>Sobe PDF</button>
										<button type="button" name="btnFinalizaCotacao" id="btnFinalizaCotacao" class="btn btn-blue mb-5" onclick="FinalizaCotacao()" hidden>Finalizar Cotação</button>
										 <% }%>
				                    </ul>
									<ul class="box-controls pull-right"></ul>
										
									

				                    <ul class="box-controls pull-right">
				                      <%--<li><a class="box-btn-close" href="#"></a></li>
				                      <li><a class="box-btn-slide" href="#"></a></li>	--%>
				                      <li><a class="box-btn-fullscreen" href="#"></a></li>
				                    </ul>
			                    </div>
			                    <!-- /.box-header -->
			                    <form class="form">
				                     <div class="box">
			 
										<div class="box-body">		
            								<div class="table-responsive">
											  <table id="grdCotacaoAutomovelItens" class="table table-bordered table-striped display nowrap margin-top-10" style="width:100%">
												<thead>
													<tr>
														<th></th>
														<th>Seguradora</th>
														<th>Pagamento</th>
														<th style="text-align: right;">Franquia Reduzida</th>
														<th style="text-align: right;">Franquia Normal</th>														
													</tr>
												</thead>
											  </table>
            								</div>
										</div>
            <!-- /.box-body -->
								</div>
				                   <%-- <!-- /.box-body -->
				                    <div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div>  --%>
			                    </form>
		                      </div>
		                      <!-- /.box -->			
		                    </div> 
		                
                            
                            </div>
                            <%--</section>--%>
						</div>
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

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 
    <!-- /.content -->
  <%--</div>--%>
  <!-- /.content-wrapper -->
</asp:Content>
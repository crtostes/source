function ValidarStatusEmCotacao() {
    if (ValidarCamposCotacao() == false) {
        EmProcessamento(false);
        //alert("Validar Cotação errro");
        return false;
    }

    if ($("#txtStatusCotacao").val() == "COTAÇÃO PRONTA") {
        //MensagemActoSimples("COTAÇÃO PRONTA!!", "Deseja realmente alterar a cotação?");


        swal({
            title: "GRAVAR COTAÇÂO",
            text: "COTACAO PRONTA\n ao GRAVAR, você perderá a cotação atual.\nDeseja realmente GRAVAR?",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "CONFIRMA",
            cancelButtonText: "CANCELA",
            closeOnConfirm: true,
            closeOnCancel: false
        }, function (isConfirm) {
            if (isConfirm) {

                GravarCotacao();
            }
            else {
                MostraAbaCotacao("calculo");
                swal("GRAVAÇÃO CANCELADA", "VERIFIQUE AS COTAÇÕES E APROVE A MELHOR OPÇÃO!!", "");
                //alert("CACELADA");
                //MensagemActoSimples("COTAÇÃO PRONTA!!", "Aprove esta Cotação o quanto antes!!");
            }

        });

    }
    else {
        //GravarCotacao();
        if ($("#txtStatusCotacao").val() != "NOVO") {
            //MensagemActoSimples("COTAÇÃO PRONTA!!", "Deseja realmente alterar a cotação?");
            swal({
                title: "GRAVAR COTAÇÂO",
                text: "Deseja realmente GRAVAR as alterações?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "SIM",
                cancelButtonText: "NÂO",
                closeOnConfirm: true,
                closeOnCancel: false
            }, function (isConfirm) {
                if (isConfirm) {
                    GravarCotacao();
                }
                else {
                    swal("GRAVAÇÃO CANCELADA", "", "");
                }
            });

        }
        else
        {
            GravarCotacao();
        }
    }
}

function ValidarbtnCancelar() {
    //if (ValidarCamposCotacao() == false) {
    //    EmProcessamento(false);
    //    return false;
    //}

    swal({
        title: "CANCELAR COTAÇÂO",
        text: "Você deseja realmente CANCELAR esta Cotação?",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "SIM",
        cancelButtonText: "NÃO",
        closeOnConfirm: true,
        closeOnCancel: false
    }, function (isConfirm) {
        if (isConfirm) {

            CancelarCotacao();
        }
        else {
            swal("A COTAÇÃO NÃO SERÁ CANCELADA", "", "");
            //alert("CACELADA");
            //MensagemActoSimples("COTAÇÃO PRONTA!!", "Aprove esta Cotação o quanto antes!!");
        }

    });

}

function ValidarCamposCotacao() {

    if ($('#ddlTipoSeguro').val() == 'Renovação') {
        if (ValidarRenovacao() == false) {
            $('#modal-renovacao').modal('show');
            return false;
     }        
}

   //************validar cabeçario*********************

    
    
    //alert(document.getElementById("txtDtVigenciaInicial").value);
    //alert(ConvertDataJstoDB(document.getElementById("txtDtVigenciaInicial").value));
    // Valida Data de Vigencia Inicial e Final
    if (ValidaData(ConvertDataJstoDB(document.getElementById("txtDtVigenciaInicial").value)) == false) {
        MensagemActoSimples("Gravar Cotação", "Data da Vigência Inícial Inválida!");
        return false;
    }
    if (ValidaData(ConvertDataJstoDB(document.getElementById("txtDtVigenciaFinal").value)) == false) {
        //alert("Data da Vigencia final Invalida.");
        MensagemActoSimples("Gravar Cotação", "Data da Vigência Final Inválida.");
        return false;
    }

    //var str1 = "28/02/2020";
    //var dateDtVIni = $("#txtDtVigenciaInicial").val().split('/').reverse().join('');
    //var dateDtVFim = $("#txtDtVigenciaFinal").val().split('/').reverse().join('');
    var dateDtVIni = ConvertDataJstoDB(document.getElementById("txtDtVigenciaInicial").value).split('/').reverse().join('');
    var dateDtVFim = ConvertDataJstoDB(document.getElementById("txtDtVigenciaFinal").value).split('/').reverse().join('');
    var dateAgora = dataAtualFormatada(0).split('/').reverse().join('');
    //var novaData = new Date();
    //alert("data aqui" + dateAgora);
    if (dateDtVIni > dateDtVFim) {
        MensagemActoSimples("Gravar Cotação", "Data Vigência Início não pode ser maior que Final.");
        return false
    }
    if (dateDtVIni == dateDtVFim) {
        MensagemActoSimples("Gravar Cotação", "Data Vigência Início não pode ser igual a Final.");
        return false
    }
    if (dateAgora > dateDtVIni) {
        
        MensagemActoSimples("Gravar Cotação", "Data Vigência Início não pode ser menor que Hoje.");
        return false
    }
    //************FIM validar cabeçario********************* //valida cabeçario

    //************validar SEGURADO*********************
    if ($("#txtIdClienteCotacao").val() == "") {
        MensagemActoSimples("Gravar Cotação", "Cliente não localizado, clique no botão 'LOCALIZAR CLIENTE' e Informe o Indicado.");
        return false;
    }
    //************FIM validar SEGURADO********************* //validar segurado

   //************validar VEICULO*********************
    // Validação dos Campos
    var TipoVeiculo = "";
    if (document.getElementById("rdoTipoVeiculoCarro").checked) {
        TipoVeiculo = $("#rdoTipoVeiculoCarro").val();
    }
    if (document.getElementById("rdoTipoVeiculoMoto").checked) {
        TipoVeiculo = $("#rdoTipoVeiculoMoto").val();
    }
    if (document.getElementById("rdoTipoVeiculoCaminhao").checked) {
        TipoVeiculo = $("#rdoTipoVeiculoCaminhao").val();
    }
    if (TipoVeiculo == "") {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Escolha um Tipo de Veículo.");
        return false;
    }

    if ($("#txtAnoFabricacao").val() == "") {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Digite o Ano de fabricação.");
        //alert("Na aba VEICULO\nDigite o Ano de fabricação.");
        return false;
    }

    var ano = $("#txtAnoFabricacao").val();

    if ((ano.length == 4 && ano > 1900 && ano < 2100) == false) {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Digite o Ano de Fabricação corretamente.");
        return false;
    }

    if ($.trim($('#ddlAnoModelo').val()) == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Selecione o Ano Modelo.");
       // alert('Na aba VEICULO\n.');
        return false;
    }

    if ($.trim($('#ddlMarca').val()) == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Selecione a Marca.");
        //alert('Na aba VEICULO\n');
        return false;
    }

    if ($.trim($('#ddlModelo').val()) == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Selecione o Modelo.");
        //alert('Na aba VEICULO\n');
        return false;
    }

    if ($.trim($('#txtChassi').val()) == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Informe o número chassi do Veículo.");
        //alert('Na aba VEICULO\n');
        return false;
    }

    if ($.trim($('#ddlZeroKM').val()) == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Informe se o Veículo é zero Km.");
        //alert('Na aba VEICULO\n');
        return false;
    }

    if ($.trim($('#ddlEstadoVeiculo').val()) == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Informe se o Estado do Veículo.");
        //alert('Na aba VEICULO\n');
        return false;
    }

    if ($.trim($('#ddlCombustivel').val()) == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Informe qual é o Combustível do Veículo.");
        //alert('Na aba VEICULO\n');
        return false;
    }

    if ($.trim($('#ddlPortas').val()) == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Informe a quantidade de portas do Veículo.");
        //alert('Na aba VEICULO\n');
        return false;
    }

    if ($.trim($('#ddlUtilizacaoVeiculo').val()) == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Selecione qual a real Utilização do Veículo.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    //Verifica CEP
    if ($("#txtCepPernoite").val() == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Informe o CEP do Pernoite do Veículo.");
        //alert("");
        return false;
    }

    if (IsCEP($("#txtCepPernoite").val()) == false) {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Informe o CEP do Pernoite do Veículo corretamente.");
        //alert("");
        return false;
    }

    if ($.trim($('#ddlFinanciado').val()) == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Informe se o Veículo está Financiado.");
        //alert('Na aba VEICULO\n');
        return false;
    }

    if ($.trim($('#ddlKitGas').val()) == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Informe se o Veículo tem KitGás.");
        //alert('Na aba VEICULO\n');
        return false;
    }

    if ($.trim($('#ddlTaxi').val()) == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Informe se o Veículo é ddlTaxi.");
        //alert('Na aba VEICULO\n');
        return false;
    }

    if ($.trim($('#ddlAplicativo').val()) == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Informe se o Veículo é de Aplicativo.");
        //alert('Na aba VEICULO\n');
        return false;
    }

    if ($.trim($('#ddlBLR').val()) == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Informe se o Veículo é Blindado, foi de Leilão ou tem Chassi Remarcado.");
        //alert('Na aba VEICULO\n');
        return false;
    }

    if ($.trim($('#ddlIsento').val()) == '') {
        MensagemActoSimples("Gravar Cotação - VEICULO", "Informe se o Veículo é Isento de Impostos ou PCD.");
        //alert('Na aba VEICULO\n');
        return false;
    }

    //************FIM validar VEICULO********************* //validar veiculo

   //************validar PERFIL*********************

    if ($.trim($('#txtCEPFrequencia').val()) == '') {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe a o CEP de Circulação.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if (IsCEP($("#txtCEPFrequencia").val()) == false) {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe o CEP de Circulação do Veículo corretamente.");
        //alert("Na aba PERFIL\n");
        return false;
    }

    if ($.trim($('#txtCEPResidencia').val()) == '') {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe a o CEP de Residência.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if (IsCEP($("#txtCEPResidencia").val()) == false) {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe o CEP de Residência do Veículo corretamente.");
        //alert("Na aba PERFIL\n");
        return false;
    }

    if ($.trim($('#ddlProprietario').val()) == '') {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe se o proponente é o Proprietário.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if ($.trim($('#ddlPrincipalCondutor').val()) == '') {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe se o proponente é o Principal Condutor.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if ($.trim($('#ddlRelacaoProprietario').val()) == '') {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe a real Relação do proponente com o Prorietário.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if ($.trim($('#ddl18a25').val()) == '') {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe se há na Residência motoristas de 18 a 25 anos.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if ($.trim($('#ddlMoraEm').val()) == '') {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe como mora o proponente.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if ($.trim($('#ddlLocalPernoite').val()) == '') {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe o Local do Pernoite do Veículo.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if ($.trim($('#ddlUtilizacao').val()) == '') {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe a real Utilização para este Perfil.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if ($.trim($('#ddlGaragemResidencia').val()) == '') {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe se há Garagem na Residência Informada.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if ($.trim($('#ddlGaragemTrabalho').val()) == '') {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe o Veículo fica em Garagem no Trabalho.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if ($.trim($('#ddlGaragemEscola').val()) == '') {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe o Veículo fica em Garagem durante o estudo.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if ($.trim($('#txtKmMediaMensal').val()) == '') {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe a Km média de uso por Mês.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if ($.trim($('#txtIdadePHabilitacao').val()) == '') {
        MensagemActoSimples("Gravar Cotação - PERFIL", "Informe a Idade quando da 1ª Habilitação.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    //************FIM validar PERFIL********************* //validar perfil

    //************validar CONDUTOR PRINCIPAL*********************

    if ($.trim($('#ddlRelComSegurado').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe a real Relação do proponente com o Segurado.");
        //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if (ValidaData($("#txtDataNascimentoCondutor").val()) == false) {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Data de Nascimento do Condutor Inválida.");
        //alert("Na aba CONDUTOR PRINCIPAL\n");
        return false;
    }

    if ($.trim($('#txtNomeCondutoPrincipal').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe o Nome do Condutor Principal.");
        //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if ($.trim($('#txtCPFCondutorPrincipal').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe a o CPF do CONDUTOR PRINCIPAL.");
        //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if (validarCPF($("#txtCPFCondutorPrincipal").val()) == false) {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "CPF do CONDUTOR PRINCIPAL Inválido.");
        //alert("Na aba CONDUTOR PRINCIPAL\n");
        return false;
    }


    if ($.trim($('#ddlGeneroCondutorPricipal').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe o Genêro do Condutor Principal.");
        //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if ($.trim($('#ddlEstadoCivilCondutorPricipal').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe o Estado Civil do Condutor Principal.");
        //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if ($.trim($('#ddlProfissao').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe a Profissão do Condutor Principal.");
        //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if ($.trim($('#txtDetalheProfissao').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe um complemento da Profissão do Condutor Principal.");
        //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if ($.trim($('#ddlCondutorResideEm').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe onde Reside o Condutor Principal.");
        //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if ($.trim($('#ddlCondutorConsiderado').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe qual o tempo de uso semanal do Condutor Principal.");
        //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if ($.trim($('#ddlCondutorAcima25').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe se Existe outros condutores > de 25 anos.");
        //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if ($.trim($('#ddlTotalVeiculos').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe o Total de Veículos na Residência .");
        //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if ($.trim($('#txtRgCondutorPrinicpal').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe o Nº dp R.G. do Condutor Principal.");
        //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if ($.trim($('#txtDataEmissaoRgCondutorPrincipal').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe a Data de Emissão do R.G. do Condutor Principal.");
        //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if (ValidaData($("#txtDataEmissaoRgCondutorPrincipal").val()) == false) {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Data da Emissão R.G. Condultor Principal é Inválida.");
        //
        //alert("Data da Vigencia final Invalida.");

    }
    if ($.trim($('#txtEmissorRG').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe o Emissor do R.G. do Condutor Principal.");
    //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if ($.trim($('#txtCnhCondutorPrinicpal').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe o Nº do C.N.H. do Condutor Principal.");
    //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if ($.trim($('#txtDataHabilitacao').val()) == '') {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "Informe a 1ª Data da Habilitação do Condutor Principal.");
    //alert('Na aba CONDUTOR PRINCIPAL\n');
        return false;
    }

    if (ValidaData($("#txtDataHabilitacao").val()) == false) {
        MensagemActoSimples("Gravar Cotação - CONDUTOR", "1º Data da Habilitação Condultor Principal é Inválida.");
    }
        //************FIM validar CONDUTOR PRINCIPAL********************* //validar condutor principal

        //************validar COBERTURAS*********************
            
        //************FIM validar COBERTURAS*********************

        //************Validar REGRAS DE INCLUSÃO************

    
        if ($.trim($('#ddlProprietario').val()) == 'SIM') {
            if (($.trim($('#ddlRelacaoProprietario').val()) != '1') && ($.trim($('#ddlRelacaoProprietario').val()) != '6')) {
                MensagemActoSimples("Gravar Cotação - PERFIL", "Se cliente é PROPRIETÁRIO \n então a RELAÇÃO COM O PROPRIETÁRIO somente pode ser \nO PRÓPRIO");
                //alert('Na aba PERFIL\n');
                return false;
            }
        } else
        {
            if (($.trim($('#ddlRelacaoProprietario').val()) == '1') || ($.trim($('#ddlRelacaoProprietario').val()) == '6')) {
                MensagemActoSimples("Gravar Cotação - PERFIL", "Se cliente é NÃO É PROPRIETÁRIO \n então a RELAÇÃO COM O PROPRIETÁRIO NÃO pode ser \nO PRÓPRIO");
                //alert('Na aba PERFIL\n');
                return false;
            }
        }
        //************FIM Validar REGRAS DE INCLUSÃO************


        return true;


    
}

function onchange_aba_veiculo() {
    var resultado = true;
    var TipoVeiculo = "";
    if (document.getElementById("rdoTipoVeiculoCarro").checked) {
        TipoVeiculo = $("#rdoTipoVeiculoCarro").val();
    }
    if (document.getElementById("rdoTipoVeiculoMoto").checked) {
        TipoVeiculo = $("#rdoTipoVeiculoMoto").val();
    }
    if (document.getElementById("rdoTipoVeiculoCaminhao").checked) {
        TipoVeiculo = $("#rdoTipoVeiculoCaminhao").val();
    }
    if (TipoVeiculo == "") { resultado = false; }

    if ($("#txtAnoFabricacao").val() == "") { resultado = false; }

    var ano = $("#txtAnoFabricacao").val();

    if ((ano.length == 4 && ano > 1900 && ano < 2100) == false) { resultado = false; }

    if ($.trim($('#ddlAnoModelo').val()) == '') { resultado = false; }

    if ($.trim($('#ddlMarca').val()) == '') { resultado = false; }

    if ($.trim($('#ddlModelo').val()) == '') { resultado = false; }

    if ($.trim($('#txtChassi').val()) == '') { resultado = false; }

    if ($.trim($('#ddlZeroKM').val()) == '') { resultado = false; }

    if ($.trim($('#ddlEstadoVeiculo').val()) == '') { resultado = false; }

    if ($.trim($('#ddlCombustivel').val()) == '') { resultado = false; }

    if ($.trim($('#ddlPortas').val()) == '') { resultado = false; }

    if ($.trim($('#ddlUtilizacaoVeiculo').val()) == '') { resultado = false; }

    //Verifica CEP
    if ($("#txtCepPernoite").val() == '') { resultado = false; }

    if (IsCEP($("#txtCepPernoite").val()) == false) { resultado = false; }

    if ($.trim($('#ddlFinanciado').val()) == '') { resultado = false; }

    if ($.trim($('#ddlKitGas').val()) == '') { resultado = false; }

    if ($.trim($('#ddlTaxi').val()) == '') { resultado = false; }

    if ($.trim($('#ddlAplicativo').val()) == '') { resultado = false; }

    if ($.trim($('#ddlBLR').val()) == '') { resultado = false; }

    if ($.trim($('#ddlIsento').val()) == '') { resultado = false; }
    
    if (resultado) {
        document.getElementById("imgVeiculo").className = "fa fa-check";
    }
    else {
        document.getElementById("imgVeiculo").className = "fa fa-bomb";
    }

}

function onchange_aba_perfil() {
    var resultado = true;

    if ($.trim($('#txtCEPFrequencia').val()) == '') { resultado = false;}

    if (IsCEP($("#txtCEPFrequencia").val()) == false) { resultado = false;}

    if ($.trim($('#txtCEPResidencia').val()) == '') { resultado = false;}

    if (IsCEP($("#txtCEPResidencia").val()) == false) { resultado = false;}

    if ($.trim($('#ddlProprietario').val()) == '') { resultado = false;}

    if ($.trim($('#ddlPrincipalCondutor').val()) == '') { resultado = false;}

    if ($.trim($('#ddlRelacaoProprietario').val()) == '') { resultado = false;}

    if ($.trim($('#ddl18a25').val()) == '') { resultado = false;}

    if ($.trim($('#ddlMoraEm').val()) == '') { resultado = false;}

    if ($.trim($('#ddlLocalPernoite').val()) == '') { resultado = false;}

    if ($.trim($('#ddlUtilizacao').val()) == '') { resultado = false;}

    if ($.trim($('#ddlGaragemResidencia').val()) == '') { resultado = false;}

    if ($.trim($('#ddlGaragemTrabalho').val()) == '') { resultado = false;}

    if ($.trim($('#ddlGaragemEscola').val()) == '') { resultado = false;}

    if ($.trim($('#txtKmMediaMensal').val()) == '') { resultado = false;}

    if ($.trim($('#txtIdadePHabilitacao').val()) == '') { resultado = false;}

    if (resultado) {
        document.getElementById("imgPerfil").className = "fa fa-check";
    }
    else {
        document.getElementById("imgPerfil").className = "fa fa-bomb";
    }
}

function onchange_aba_condutor() {
    var resultado = true;
    if ($.trim($('#ddlRelComSegurado').val()) == '') { resultado = false; }

    if (ValidaData($("#txtDataNascimentoCondutor").val()) == false) { resultado = false; }

    if ($.trim($('#txtNomeCondutoPrincipal').val()) == '') { resultado = false; }

    if ($.trim($('#txtCPFCondutorPrincipal').val()) == '') { resultado = false; }

    if (validarCPF($("#txtCPFCondutorPrincipal").val()) == false) { resultado = false; }

    if ($.trim($('#ddlGeneroCondutorPricipal').val()) == '') { resultado = false; }

    if ($.trim($('#ddlEstadoCivilCondutorPricipal').val()) == '') { resultado = false; }

    if ($.trim($('#ddlProfissao').val()) == '') { resultado = false; }

    if ($.trim($('#txtDetalheProfissao').val()) == '') { resultado = false; }

    if ($.trim($('#ddlCondutorResideEm').val()) == '') { resultado = false; }

    if ($.trim($('#ddlCondutorConsiderado').val()) == '') { resultado = false; }

    if ($.trim($('#ddlCondutorAcima25').val()) == '') { resultado = false; }

    if ($.trim($('#ddlTotalVeiculos').val()) == '') { resultado = false; }

    if ($.trim($('#txtRgCondutorPrinicpal').val()) == '') { resultado = false; }

    if ($.trim($('#txtDataEmissaoRgCondutorPrincipal').val()) == '') { resultado = false; }

    if (ValidaData($("#txtDataEmissaoRgCondutorPrincipal").val()) == false) { resultado = false; }

    if ($.trim($('#txtEmissorRG').val()) == '') { resultado = false; }

    if ($.trim($('#txtCnhCondutorPrinicpal').val()) == '') { resultado = false; }

    if ($.trim($('#txtDataHabilitacao').val()) == '') { resultado = false; }

    if (ValidaData($("#txtDataHabilitacao").val()) == false) { resultado = false; }
    if (resultado) {
        document.getElementById("imgCondutor").className = "fa fa-check";
    }
    else {
        document.getElementById("imgCondutor").className = "fa fa-bomb";
    }
}

function onchange_aba_cobertura() {
    //alert("Teste Tipo Seguro " + $('#ddlTipoSeguro').val()); //$.trim($('#ddlModelo').val()) 

    $('#modal-renovacao').modal('show');

}

function ValidarRenovacao() {
    
    if ($.trim($('#ddlSeguradoraRenovacao').val()) == '') {
        MensagemActoSimples("Gravar Cotação - RENOVAÇÃO", "Selecione o Seguro vigente da apolice para renovar.");
        //alert('Na aba Renovação\n');
        return false;
    }

    if ($.trim($('#ddlBonusAnterior').val()) == '') {
        MensagemActoSimples("Gravar Cotação - RENOVAÇÃO", "Informe a Classe de Bônus Anterior.");
        //alert('Na aba Renovação\n');
            return false;
    }

    if ($.trim($('#ddlBonusAtual').val()) == '') {
        MensagemActoSimples("Gravar Cotação - RENOVAÇÃO", "Informe a Classe de Bônus atual.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if (ValidaData($("#txtDataVigenciaAnteriorInicio").val()) == false) {
        MensagemActoSimples("Gravar Cotação - RENOVAÇÃO", "Data do Inicio da Vigência Anterior.");
        //alert("Na aba PERFIL\n");
        return false;
    }

    if (ValidaData($("#txtDataVigenciaAnteriorFim").val()) == false) {
        MensagemActoSimples("Gravar Cotação - RENOVAÇÃO", "Data do Fim da Vigência Anterior.");
        //alert("Na aba PERFIL\n");
        return false;
    }

    if ($.trim($('#txtApoliceRenovacao').val()) == '') {
        MensagemActoSimples("Gravar Cotação - RENOVAÇÃO", "Informe a Apólice atual.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if ($.trim($('#txtApoliceRenovacaoItem').val()) == '') {
        MensagemActoSimples("Gravar Cotação - RENOVAÇÃO", "Informe o Item da Apólice atual.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    if ($.trim($('#txtApoliceRenovacaoCI').val()) == '') {
        MensagemActoSimples("Gravar Cotação - RENOVAÇÃO", "Informe a C. I. que consta na Apolice par Renovação.");
        //alert('Na aba PERFIL\n');
        return false;
    }

    $('#modal-renovacao').modal('hide');
}


function ValidarAprovarCotacao() {

    if ($("#txtIdFormaPagamento").val() == '3') {
        //verifica Debito em Conta
        if ($.trim($('#ddlDadosDC').val()) == '') {
            MensagemActoSimples("APROVAR COTAÇÃO", "Selecione a opção Dados Débito em Conta.");
            return false;
        }

        if ($.trim($('#ddlParanteTitularDC').val()) == '') {
            MensagemActoSimples("APROVAR COTAÇÃO", "Selecione a opção Parentesco Titular da Conta.");
            return false;
        }

        if ($.trim($('#txtTitularContaDC').val()) == '') {
            MensagemActoSimples("APROVAR COTAÇÃO", "Preencha o Titular da Conta (Nome).");
            return false;
        }

        if ($.trim($('#ddlTipoPessoaDC').val()) == '') {
            MensagemActoSimples("APROVAR COTAÇÃO", "Selecione o Tipo Pessoa.");
            return false;
        }

        if ($.trim($('#txtCPFTitularDC').val()) == '') {
            MensagemActoSimples("APROVAR COTAÇÃO", "Informe o CPF do Titular da Conta.");
            return false;
        }

        if (validarCPF($("#txtCPFTitularDC").val()) == false) {
            MensagemActoSimples("APROVAR COTAÇÃO", "CPF do Titular da Conta Inválido.");
            return false;
        }

        if ($.trim($('#ddlBancoDC').val()) == '') {
            MensagemActoSimples("APROVAR COTAÇÃO", "Informe o Banco do Titular da Conta.");
            return false;
        }

        if ($.trim($('#txtNrAgenciaDC').val()) == '') {
            MensagemActoSimples("APROVAR COTAÇÃO", "Informe o número da Agência da Conta.");
            return false;
        }

        if ($.trim($('#txtNrContaDC').val()) == '') {
            MensagemActoSimples("APROVAR COTAÇÃO", "Informe o número da Conta.");
            return false;
        }

        if ($.trim($('#txtNrContaDigDC').val()) == '') {
            MensagemActoSimples("APROVAR COTAÇÃO", "Informe o Dígito da Conta.");
            return false;
        }


    }
    if ($("#txtIdFormaPagamento").val() == '1') {
        if ($.trim($('#ddlBandeiraCC').val()) == '') {
            MensagemActoSimples("APROVAR COTAÇÃO", "Escolha a Bandeira do Cartão de Crédito do Pagamento.");
            return false;
        }
        
        var digitosCC = $('#txtNrCartaoCC').val().replaceAll(".", "");
        if (($.trim($('#txtNrCartaoCC').val()) == '') || ($.trim(digitosCC).length < 16)) {
            MensagemActoSimples("APROVAR COTAÇÃO", "Preencha o número do Cartão de Crédito corretamente.");
            return false;
        }

        if ($.trim($('#txtCPFCC').val()) == '') {
            MensagemActoSimples("APROVAR COTAÇÃO", "Informe o CPF do Cartão de Crédito.");
            return false;
        }

        if (validarCPF($("#txtCPFCC").val()) == false) {
            MensagemActoSimples("APROVAR COTAÇÃO", "CPF do Cartão de Crédito Inválido.");
            return false;
        }

        if ($.trim($('#txtNomeCC').val()) == '') {
            MensagemActoSimples("APROVAR COTAÇÃO", "Informe o Nome (Como aparece no cartão).");
            return false;
        }

    }
    return true;
}

function CancelarRenovacao_onclick() {
    $('#ddlTipoSeguro').val('Seguro Novo');
    $('#modal-renovacao').modal('hide');
}

function onchange_tipo_seguro() {
    //alert("Teste Tipo Seguro " + $('#ddlTipoSeguro').val()); //$.trim($('#ddlModelo').val()) 
    if ($('#ddlTipoSeguro').val() == 'Renovação') {
        $('#modal-renovacao').modal('show');
    }
}


function InsereCotacao(){
    $('#modal-insere-cotacao').modal('show');
}


//funções ACTOSEG
function somenteNumeros(e) {
    var charCode = e.charCode ? e.charCode : e.keyCode;
    // charCode 8 = backspace   
    // charCode 9 = tab
    if (charCode != 8 && charCode != 9) {
        // charCode 48 equivale a 0   
        // charCode 57 equivale a 9
        if (charCode < 48 || charCode > 57) {
            return false;
        }

    }



}
function checkNumber(valor) {
    var regra = /^[0-9]+$/;
    if (valor.match(regra)) {
        return true;
    } else {
        return false;
    }
};
function Trim(strTexto) {
    // Substitúi os espaços vazios no inicio e no fim da "', por vazio.
    return strTexto.replace(/^s+|s+$/g, '');
}

function dataAtualFormatada(anoFuturo) {

    var data = new Date(),
        dia = data.getDate().toString().padStart(2, '0'),
        mes = (data.getMonth() + 1).toString().padStart(2, '0'), //+1 pois no getMonth Janeiro começa com zero.
        ano = data.getFullYear() + anoFuturo;

    return dia + "/" + mes + "/" + ano;
}
function dataAtualFormatadaToDate(anoFuturo) {

    var data = new Date(),
        dia = data.getDate().toString().padStart(2, '0'),
        mes = (data.getMonth() + 1).toString().padStart(2, '0'), //+1 pois no getMonth Janeiro começa com zero.
        ano = data.getFullYear() + anoFuturo;

    return ano + "-" + mes + "-" + dia;
}
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
function validarCPF(cpf) {
    cpf = cpf.replace(/[^\d]+/g, '');
    if (cpf == '') return false;
    // Elimina CPFs invalidos conhecidos	
    if (cpf.length != 11 ||
        cpf == "00000000000" ||
        cpf == "11111111111" ||
        cpf == "22222222222" ||
        cpf == "33333333333" ||
        cpf == "44444444444" ||
        cpf == "55555555555" ||
        cpf == "66666666666" ||
        cpf == "77777777777" ||
        cpf == "88888888888" ||
        cpf == "99999999999")
        return false;
    // Valida 1o digito	
    add = 0;
    for (i = 0; i < 9; i++)
        add += parseInt(cpf.charAt(i)) * (10 - i);
    rev = 11 - (add % 11);
    if (rev == 10 || rev == 11)
        rev = 0;
    if (rev != parseInt(cpf.charAt(9)))
        return false;
    // Valida 2o digito	
    add = 0;
    for (i = 0; i < 10; i++)
        add += parseInt(cpf.charAt(i)) * (11 - i);
    rev = 11 - (add % 11);
    if (rev == 10 || rev == 11)
        rev = 0;
    if (rev != parseInt(cpf.charAt(10)))
        return false;
    return true;
}
function ValidaData(data) {
    reg = /[^\d\/\.]/gi;                  // Mascara = dd/mm/aaaa | dd.mm.aaaa
    var valida = data.replace(reg, '');    // aplica mascara e valida só numeros
    if (valida && valida.length == 10) {  // é válida, então ;)
        var ano = data.substr(6),
            mes = data.substr(3, 2),
            dia = data.substr(0, 2),
            M30 = ['04', '06', '09', '11'],
            v_mes = /(0[1-9])|(1[0-2])/.test(mes),
            v_ano = /(19[1-9]\d)|(20\d\d)|2100/.test(ano),
            rexpr = new RegExp(mes),
            fev29 = ano % 4 ? 28 : 29;

        if (v_mes && v_ano) {
            if (mes == '02') return (dia >= 1 && dia <= fev29);
            else if (rexpr.test(M30)) return /((0[1-9])|([1-2]\d)|30)/.test(dia);
            else return /((0[1-9])|([1-2]\d)|3[0-1])/.test(dia);
        }
    }
    return false                           // se inválida :(
}
function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}
function MensagemActoSimples(titulo, texto ) {
swal({
    title: titulo,
    text: texto,
    type: "warning",
    showCancelButton: false,
    confirmButtonColor: "#363abf", 
    confirmButtonText: "OK",
    closeOnConfirm: true
}, function () {
});
}

function MensagemActoSucesso(titulo, texto) {
    swal({
        title: titulo,
        text: texto,
        type: "success",
        showCancelButton: false,
        confirmButtonColor: "#363abf",
        confirmButtonText: "OK",
        closeOnConfirm: true
    }, function () {
    });
}

//function MensagemActoDecisaobtnGravar(titulo, texto, textoSIM, textoNAO) {
//    swal({
//        title: titulo,
//        text: texto,
//        type: "warning",
//        showCancelButton: true,
//        confirmButtonColor: "#DD6B55",
//        confirmButtonText: textoSIM,
//        cancelButtonText: textoNAO,
//        closeOnConfirm: true,
//        closeOnCancel: false
//    }, function (isConfirm) {
//            if (isConfirm) {
//                $("#txtStatusCotacao").val("");
//                GravarCotacao();
//            //swal("Deleted!", "Your imaginary file has been deleted.", "success");
//            } else {
                
//            swal("GRAVAÇÃO CANCELADA", "", "");
//        }
//    });
//}


function TravaCampos() {
    document.getElementById("ddlTipoSeguro").disabled = true;
    document.getElementById("txtDtVigenciaInicial").disabled = true;
    document.getElementById("txtDtVigenciaFinal").disabled = true;

    document.getElementById("btnLocalizarCliente").hidden = true;

    document.getElementById("rdoTipoVeiculoCarro").disabled = true;
    document.getElementById("rdoTipoVeiculoMoto").disabled = true;
    document.getElementById("rdoTipoVeiculoCaminhao").disabled = true;
    document.getElementById("txtAnoFabricacao").disabled = true;
    document.getElementById("ddlAnoModelo").disabled = true;
    document.getElementById("ddlMarca").disabled = true;
    document.getElementById("ddlModelo").disabled = true;
    document.getElementById("txtChassi").disabled = true;
    document.getElementById("ddlZeroKM").disabled = true;
    document.getElementById("ddlEstadoVeiculo").disabled = true;
    document.getElementById("txtPlaca").disabled = true;
    document.getElementById("ddlCombustivel").disabled = true;
    document.getElementById("ddlPortas").disabled = true;
    document.getElementById("ddlUtilizacaoVeiculo").disabled = true;
    document.getElementById("txtCepPernoite").disabled = true;
    document.getElementById("ddlFinanciado").disabled = true;
    document.getElementById("ddlKitGas").disabled = true;
    document.getElementById("ddlTaxi").disabled = true;
    document.getElementById("ddlAplicativo").disabled = true;
    document.getElementById("ddlBLR").disabled = true;
    document.getElementById("ddlIsento").disabled = true;
    document.getElementById("txtCEPFrequencia").disabled = true;
    document.getElementById("txtCEPResidencia").disabled = true;
    document.getElementById("ddlProprietario").disabled = true;
    document.getElementById("ddlPrincipalCondutor").disabled = true;
    document.getElementById("ddlRelacaoProprietario").disabled = true;
    document.getElementById("ddl18a25").disabled = true;
    document.getElementById("ddlMoraEm").disabled = true;
    document.getElementById("ddlLocalPernoite").disabled = true;
    document.getElementById("ddlUtilizacao").disabled = true;
    document.getElementById("ddlGaragemResidencia").disabled = true;
    document.getElementById("ddlGaragemTrabalho").disabled = true;
    document.getElementById("ddlGaragemEscola").disabled = true;
    document.getElementById("txtKmMediaMensal").disabled = true;
    document.getElementById("txtIdadePHabilitacao").disabled = true;
    document.getElementById("ddlRelComSegurado").disabled = true;
    document.getElementById("txtDataNascimentoCondutor").disabled = true;
    document.getElementById("txtCPFCondutorPrincipal").disabled = true;
    document.getElementById("txtNomeCondutoPrincipal").disabled = true;
    document.getElementById("ddlGeneroCondutorPricipal").disabled = true;
    document.getElementById("ddlEstadoCivilCondutorPricipal").disabled = true;
    document.getElementById("ddlProfissao").disabled = true;
    document.getElementById("txtDetalheProfissao").disabled = true;
    document.getElementById("ddlCondutorResideEm").disabled = true;
    document.getElementById("ddlCondutorConsiderado").disabled = true;
    document.getElementById("ddlCondutorAcima25").disabled = true;
    document.getElementById("ddlTotalVeiculos").disabled = true;
    document.getElementById("txtRgCondutorPrinicpal").disabled = true;
    document.getElementById("txtDataEmissaoRgCondutorPrincipal").disabled = true;
    document.getElementById("txtEmissorRG").disabled = true;
    document.getElementById("txtCnhCondutorPrinicpal").disabled = true;
    document.getElementById("txtDataHabilitacao").disabled = true;
    document.getElementById("ddlCobertura").disabled = true;
    document.getElementById("ddlValorMercado").disabled = true;
    document.getElementById("ddlValorAcessorios").disabled = true;
    document.getElementById("ddlValorVidros").disabled = true;
    document.getElementById("ddlValorEquipamentos").disabled = true;
    document.getElementById("ddlValorDespExtras").disabled = true;
    document.getElementById("ddlCarroReserva").disabled = true;
    document.getElementById("ddlAssistencia").disabled = true;
    document.getElementById("ddlDanosMateriais").disabled = true;
    document.getElementById("ddlDanosCorporais").disabled = true;
    document.getElementById("ddlDanosMorais").disabled = true;
    document.getElementById("ddlValorDiaParalisacao").disabled = true;
    document.getElementById("ddlPassageiros").disabled = true;
    document.getElementById("ddlValorMorte").disabled = true;
    document.getElementById("ddlValorInvalidez").disabled = true;
    document.getElementById("ddlValorDespesasMedicas").disabled = true;

}
function formatarMoeda(id) {
    var elemento = document.getElementById(id);
    var valor = elemento.value;

    valor = valor + '';
    valor = parseInt(valor.replace(/[\D]+/g, ''));
    valor = valor + '';
    valor = valor.replace(/([0-9]{2})$/g, ",$1");

    if (valor.length > 6) {
        valor = valor.replace(/([0-9]{3}),([0-9]{2}$)/g, ".$1,$2");
    }

    elemento.value = valor;
    if (valor == 'NaN') elemento.value = '';
}
function MostraAbaCotacao(aba) {
    //veiculo
    //perfil
    //condutor 
    //cobertura
    //calculo

    if (aba == "veiculo") {
        document.getElementById("segurado").className = "tab-pane";
        document.getElementById("veiculo").className = "tab-pane active";
        document.getElementById("perfil").className = "tab-pane";
        document.getElementById("condutor").className = "tab-pane";
        document.getElementById("cobertura").className = "tab-pane";
        document.getElementById("calculo").className = "tab-pane";

        document.getElementById("tablinksegurado").className = "nav-link";
        document.getElementById("tablinkveiculo").className = "nav-link active";
        document.getElementById("tablinkperfil").className = "nav-link";
        document.getElementById("tablinkcondutor").className = "nav-link";
        document.getElementById("tablinkcobertura").className = "nav-link";
        document.getElementById("tablinkcalculo").className = "nav-link";
    }
    if (aba == "perfil") {
        document.getElementById("segurado").className = "tab-pane";
        document.getElementById("veiculo").className = "tab-pane";
        document.getElementById("perfil").className = "tab-pane active";
        document.getElementById("condutor").className = "tab-pane";
        document.getElementById("cobertura").className = "tab-pane";
        document.getElementById("calculo").className = "tab-pane";

        document.getElementById("tablinksegurado").className = "nav-link";
        document.getElementById("tablinkveiculo").className = "nav-link";
        document.getElementById("tablinkperfil").className = "nav-link active";
        document.getElementById("tablinkcondutor").className = "nav-link";
        document.getElementById("tablinkcobertura").className = "nav-link";
        document.getElementById("tablinkcalculo").className = "nav-link";
    }
    if (aba == "condutor") {
        document.getElementById("segurado").className = "tab-pane";
        document.getElementById("veiculo").className = "tab-pane";
        document.getElementById("perfil").className = "tab-pane";
        document.getElementById("condutor").className = "tab-pane active";
        document.getElementById("cobertura").className = "tab-pane";
        document.getElementById("calculo").className = "tab-pane";

        document.getElementById("tablinksegurado").className = "nav-link";
        document.getElementById("tablinkveiculo").className = "nav-link";
        document.getElementById("tablinkperfil").className = "nav-link";
        document.getElementById("tablinkcondutor").className = "nav-link active";
        document.getElementById("tablinkcobertura").className = "nav-link";
        document.getElementById("tablinkcalculo").className = "nav-link";
    }
    if (aba == "cobertura") {
        document.getElementById("segurado").className = "tab-pane";
        document.getElementById("veiculo").className = "tab-pane";
        document.getElementById("perfil").className = "tab-pane";
        document.getElementById("condutor").className = "tab-pane";
        document.getElementById("cobertura").className = "tab-pane active";
        document.getElementById("calculo").className = "tab-pane";

        document.getElementById("tablinksegurado").className = "nav-link";
        document.getElementById("tablinkveiculo").className = "nav-link";
        document.getElementById("tablinkperfil").className = "nav-link";
        document.getElementById("tablinkcondutor").className = "nav-link";
        document.getElementById("tablinkcobertura").className = "nav-link active";
        document.getElementById("tablinkcalculo").className = "nav-link";
    }
    if (aba == "calculo") {
        document.getElementById("segurado").className = "tab-pane";
        document.getElementById("veiculo").className = "tab-pane";
        document.getElementById("perfil").className = "tab-pane";
        document.getElementById("condutor").className = "tab-pane";
        document.getElementById("cobertura").className = "tab-pane";
        document.getElementById("calculo").className = "tab-pane active";

        document.getElementById("tablinksegurado").className = "nav-link";
        document.getElementById("tablinkveiculo").className = "nav-link";
        document.getElementById("tablinkperfil").className = "nav-link";
        document.getElementById("tablinkcondutor").className = "nav-link";
        document.getElementById("tablinkcobertura").className = "nav-link";
        document.getElementById("tablinkcalculo").className = "nav-link active";
    }

}

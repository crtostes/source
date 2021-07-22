<%@ Page Language="C#"  MasterPageFile="~/main/pages/Principal.Master" AutoEventWireup="true" CodeBehind="MeuCadastro.aspx.cs" Inherits="actoseg.main.pages.MeuCadastro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<script>
		function CarregarNovaCotacao(pid_cliente) {
			window.location.href = "IncluirCotacao.aspx?ClienteCotacaoNova=" + pid_cliente;
        }
        function EmProcessamento(Habilitado) {

            if (Habilitado) {
                $('#modal-em-processamento').modal('show');
            }
            else {
                $('#modal-em-processamento').modal('hide');
            }

        }
    </script>

    <script>
        $(document).ready(function () {
            CarregarGridClientes();
        });
        function MensagemActoSimples(titulo, texto) {
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
        function formatarCPFCNPJ(campoTexto) {
            if (campoTexto.value.length <= 11) {
                campoTexto.value = mascaraCpf(campoTexto.value);
            } else {
                campoTexto.value = mascaraCnpj(campoTexto.value);
            }
            return campoTexto;
        }
        function retirarFormatacao(campoTexto) {
            campoTexto.value = campoTexto.value.replace(/(\.|\/|\-)/g, "");
        }
        function mascaraCpf(valor) {
            return valor.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/g, "\$1.\$2.\$3\-\$4");
        }
        function mascaraCnpj(valor) {
            return valor.replace(/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/g, "\$1.\$2.\$3\/\$4\-\$5");
        }

        function validaTelefone($phone)
        {
            //^(\(11\) [9][0-9]{4}-[0-9]{4})|(\(1[2-9]\) [5-9][0-9]{3}-[0-9]{4})|(\([2-9][1-9]\) [5-9][0-9]{3}-[0-9]{4})$

            //turn preg_match('/^(?:(?:\+|00)?(55)\s?)?(?:\(?([1-9][0-9])\)?\s?)?(?:((?:9\d|[2-9])\d{3})\-?(\d{4}))$/', $phone);

            //$phone = '(11)99999-9999';
            var isValid = /^(?:(?:\+|00)?(55)\s?)?(?:\(?([1-9][0-9])\)?\s?)?(?:((?:9\d|[2-9])\d{3})\-?(\d{4}))$/.test($phone)

            return isValid;
        }

        function phoneValidate($phone) {
            $regex = '/^(?:(?:\+|00)?(55)\s?)?(?:\(?([1-9][0-9])\)?\s?)?(?:((?:9\d|[2-9])\d{3})\-?(\d{4}))$/';
            alert("teste1" + $phone);
            if (preg_match($regex, $phone) == false) {
                alert("teste1" + "false");
                // O número não foi validado.
                return false;
            } else {
                alert("teste1" + "true");
                // Telefone válido.
                return true;
            }
        }
        function valida_email2() {
            var filter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
            if (!filter.test(document.getElementById("email").value)) {
                alert('Por favor, digite o email corretamente');
                document.getElementById("email").focus();
                return false
            }
        }

        /*função valida email*/
        function valida_email1() {
            var x = document.forms["myForm"]["email"].value;
            var atpos = x.indexOf("@");
            var dotpos = x.lastIndexOf(".");
            if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
                alert("Não é um endereço de e-mail válido");
                return false;
            }
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
        function validarCNPJ(cnpj) {

            cnpj = cnpj.replace(/[^\d]+/g, '');

            if (cnpj == '') return false;

            if (cnpj.length != 14)
                return false;

            // Elimina CNPJs invalidos conhecidos
            if (cnpj == "00000000000000" ||
                cnpj == "11111111111111" ||
                cnpj == "22222222222222" ||
                cnpj == "33333333333333" ||
                cnpj == "44444444444444" ||
                cnpj == "55555555555555" ||
                cnpj == "66666666666666" ||
                cnpj == "77777777777777" ||
                cnpj == "88888888888888" ||
                cnpj == "99999999999999")
                return false;

            // Valida DVs
            tamanho = cnpj.length - 2
            numeros = cnpj.substring(0, tamanho);
            digitos = cnpj.substring(tamanho);
            soma = 0;
            pos = tamanho - 7;
            for (i = tamanho; i >= 1; i--) {
                soma += numeros.charAt(tamanho - i) * pos--;
                if (pos < 2)
                    pos = 9;
            }
            resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
            if (resultado != digitos.charAt(0))
                return false;

            tamanho = tamanho + 1;
            numeros = cnpj.substring(0, tamanho);
            soma = 0;
            pos = tamanho - 7;
            for (i = tamanho; i >= 1; i--) {
                soma += numeros.charAt(tamanho - i) * pos--;
                if (pos < 2)
                    pos = 9;
            }
            resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
            if (resultado != digitos.charAt(1))
                return false;

            return true;

        }
        function mascaraCnpj(valor) {
            return valor.replace(/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/g, "\$1.\$2.\$3\/\$4\-\$5");
        }
    </script>


    <script>
        function LimpaCampos() {
            $("#txtIdCliente").val("");
			$("#txtNome").val("");
            $("#txtEmail").val("");
            $("#txtTelefoneCelular").val("");
            $("#txtTelefoneCelular2").val("");
            $("#txtDataNascimento").val("");
            $("#cboGenero").val("");
            $("#cboEstadoCivil").val("");
			$("#cboEmpresa").val("N");
            $("#txtCPF").val("");
            $("#txtNumeroRG").val("");
            $("#txtDataExpedicao").val("");
            $("#txtEmissao").val("");
            $("#txtCNH").val("");
			$("#txtDataPrimeiraHabilitacao").val("");
            $("#txtDataInclusao").val("");
            $("#txtDataatualizacao").val("");
			
            $("#cboTipoEndereco").val("");
            $("#txtCep").val("");
            $("#txtEndereco").val("");
            $("#txtNumeroEndereco").val("");
            $("#txtComplemento").val("");
            $("#txtBairro").val("");
            $("#txtCidade").val("");
            $("#cboEstado").val("");
			$("#cboProfissao").val("");
            
            let selText = document.getElementById('cboProfissao').options[document.getElementById('cboProfissao').selectedIndex].text;
			document.getElementById('cboProfissao').options[document.getElementById('cboProfissao').selectedIndex].remove();
			selProfissao = "selected='selected'";
            $('#cboProfissao').append('<option Value=""' + selProfissao + '>' + selText + '</option>');

			$("#txtComplementoProfissao").val("");
            $("#txtNomePai").val("");
            $("#txtNomeMae").val("");
            $("#txtNomeConjuge").val("");

            $("#txtCNPJ").val("");
            $("#txtNomeEmpresa").val("");
            $("#txtEnderecoEmpresa").val("");
            $("#txtEnderecoEmpresa").val("");
            $("#txtCidadeEmpresa").val("");
            $("#cboEstadoEmpresa").val("");

        }
        function TravaCampos(trava) {

            document.getElementById("txtNome").disabled = trava;
            document.getElementById("txtTelefoneCelular").disabled = trava;
            document.getElementById("txtTelefoneCelular2").disabled = trava;
            document.getElementById("txtDataNascimento").disabled = trava;
            document.getElementById("cboGenero").disabled = trava;
            document.getElementById("cboEstadoCivil").disabled = trava;
            document.getElementById("cboEmpresa").disabled = trava;
            

            document.getElementById("txtNumeroRG").disabled = trava;
            document.getElementById("txtDataExpedicao").disabled = trava;
            document.getElementById("txtEmissao").disabled = trava;
            document.getElementById("txtCNH").disabled = trava;
            document.getElementById("txtDataPrimeiraHabilitacao").disabled = trava;

            document.getElementById("cboTipoEndereco").disabled = trava;
            document.getElementById("txtCep").disabled = trava;
            document.getElementById("txtEndereco").disabled = trava;
            document.getElementById("txtNumeroEndereco").disabled = trava;
            document.getElementById("txtComplemento").disabled = trava;
            document.getElementById("txtBairro").disabled = trava;
            document.getElementById("txtCidade").disabled = trava;
            document.getElementById("cboEstado").disabled = trava;

            document.getElementById("cboProfissao").disabled = trava;
            document.getElementById("txtComplementoProfissao").disabled = trava;
            document.getElementById("txtNomePai").disabled = trava;
            document.getElementById("txtNomeMae").disabled = trava;
            document.getElementById("txtNomeConjuge").disabled = trava;
            document.getElementById("chkPai").disabled = trava;
            document.getElementById("chkMae").disabled = trava;

        }
        function MostraAba(aba) {
            if (aba == "cliente") {
                document.getElementById("cliente").className = "tab-pane active";
                document.getElementById("endereco").className = "tab-pane";
                document.getElementById("listaclientes").className = "tab-pane";
                document.getElementById("tablinkcliente").className = "nav-link active";
                document.getElementById("tablinkendereco").className = "nav-link";
                document.getElementById("tablinklistaclientes").className = "nav-link";
            }
            if (aba == "endereco") {
                document.getElementById("cliente").className = "tab-pane";
                document.getElementById("endereco").className = "tab-pane active";
                document.getElementById("listaclientes").className = "tab-pane";
                document.getElementById("tablinkcliente").className = "nav-link";
                document.getElementById("tablinkendereco").className = "nav-link active";
                document.getElementById("tablinklistaclientes").className = "nav-link";
            }
            if (aba == "listaclientes") {
                document.getElementById("cliente").className = "tab-pane";
                document.getElementById("endereco").className = "tab-pane";
                document.getElementById("listaclientes").className = "tab-pane active";
                document.getElementById("tablinkcliente").className = "nav-link";
                document.getElementById("tablinkendereco").className = "nav-link";
                document.getElementById("tablinklistaclientes").className = "nav-link active";
            }

        }
        function CarregarGridClientes() {
            LimpaCampos();
            TravaCampos(true);
            //data: "{id_cliente: " + $("#txtIdClienteIndicador").val() + "}",
            $.ajax({
                type: "POST",
                url: "MeuCadastro.aspx/wmListarClientesIndicados",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessCarregarGridClientes,
                error: function (request, status, error) {
                    alert("CarregarGridClientes: " + request.responseText);
                }
            });
        }
        function OnSuccessCarregarGridClientes(data, status) {

            $('#grdClientes').DataTable().destroy();

            var Jsondata = JSON.parse(data.d);


            var table = $('#grdClientes').DataTable({
                "data": Jsondata,
                "searching": true,
                "paging": true,
                "info": true,
                select: "single",
                "columns": [
                    //{
                    //    "className": '',
                    //    "orderable": false,
                    //    "data": null,
                    //    "defaultContent": '',
                    //    "render": function () {
                    //        return '';
                    //    },
                    //    width: "15px"
                    //},
                    { "data": "img_CadOK", width: "15px" },
                    { "data": "nr_cpf_cnpj", },
                    { "data": "ds_nome" },
                    { "data": "ds_email", className: "text-right" },
                    { "data": "ds_telefone_celular", className: "text-right" },
					{ "data": "bt_atualizar", className: "text-center" },
                    { "data": "bt_NovaCotacao", className: "text-center"},
                    //{ "data": "ds_email", className: "text-right" },
                ]
            });
            document.getElementById("btnGravar").hidden = true;
            document.getElementById("btnNovo").hidden = false;
        }
        function CarregarCliente(pid_cliente) {
            TravaCampos(false);
            
            $.ajax({
                type: "POST",
                url: "MeuCadastro.aspx/wmConsultarCliente",
                data: "{id_cliente: '" + pid_cliente + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessCarregarCliente,
                error: function (request, status, error) {
                    alert("CarregarCliente: " + request.responseText);
                }
            });
        }
        function OnSuccessCarregarCliente(data, status) {
			TravaCampos(false);
            document.getElementById("btnGravar").hidden = false;
            document.getElementById("btnNovo").hidden = true;
            MostraAba("cliente");
            //$('p').html("Sobrenome:" + data.d._sobreNome + " idade:" + data.d._idade + "");
            $("#txtIdCliente").val(data.d.id_cliente);
            $("#txtNome").val(data.d.ds_nome);
            $("#txtEmail").val(data.d.ds_email);
            $("#txtCPF").val(data.d.nr_cpf_cnpj);
            $("#txtDataNascimento").val(data.d.dt_nascimento);

            $("#cboTipoPessoa").val(data.d.ds_telefone_celular);

            $("#txtTelefoneCelular").val(data.d.ds_telefone_celular);
            $("#txtTelefoneCelular2").val(data.d.ds_telefone_comercial);
            
            $("#cboGenero").val(data.d.id_genero);
            


            $("#txtNumeroRG").val(data.d.ds_rg);
            $("#txtEmissao").val(data.d.ds_emissao);
            $("#txtDataExpedicao").val(data.d.dt_emissao_rg);
			$("#cboEstadoCivil").val(data.d.id_estado_civil);
            if ($("#cboEstadoCivil").val() == 2) {
                document.getElementById("txtNomeConjuge").disabled = false;
            }
            else {
                document.getElementById("txtNomeConjuge").disabled = true;
			}

            $("#txtDataInclusao").val(data.d.dt_inclusao);
            $("#txtDataAtualizacao").val(data.d.dt_atualizacao);

            $("#txtCNH").val(data.d.ds_cnh);
            $("#txtDataPrimeiraHabilitacao").val(data.d.dt_1_habilitacao);
            $("#cboTipoEndereco").val(data.d.ds_tipo_endereco);
            $("#txtCep").val(data.d.ds_cep);
            $("#txtEndereco").val(data.d.ds_endereco);
            $("#txtNumeroEndereco").val(data.d.ds_numero);
            $("#txtComplemento").val(data.d.ds_complemento);
            $("#txtBairro").val(data.d.ds_bairro);
            $("#txtCidade").val(data.d.ds_cidade);
            $("#cboEstado").val(data.d.ds_estado);
			$("#cboProfissao").val(data.d.ds_profissao);
            //document.getElementById('cboProfissao').options[document.getElementById('cboProfissao').selectedIndex].selected = "true";

            //$("#cboProfissao option:selected").attr("selected", "selected");
            

			//$("#cboProfissao").text(selText);
			//alert(selText);
            //document.getElementById('cboProfissao').value = data.d.ds_profissao;
            //document.getElementById('cboProfissao').options[document.getElementById('cboProfissao').selectedIndex].setAttribute("selected", "selected");
			let selText = document.getElementById('cboProfissao').options[document.getElementById('cboProfissao').selectedIndex].text;
			document.getElementById('cboProfissao').options[document.getElementById('cboProfissao').selectedIndex].remove();
            selProfissao = "selected='selected'";
            $('#cboProfissao').append('<option Value="' + data.d.ds_profissao + '"' + selProfissao + '>' + selText + '</option>');
			$("#txtComplementoProfissao").val(data.d.ds_profissao_complemento);
            $("#txtNomePai").val(data.d.ds_nome_pai);
			$("#txtNomeMae").val(data.d.ds_nome_mae);

			if ($("#txtNomePai").val() == "NÃO CONSTA") {
				document.getElementById("chkPai").checked = true;
				document.getElementById("txtNomePai").disabled = true;
            }
			if ($("#txtNomeMae").val() == "NÃO CONSTA") {
				document.getElementById("chkMae").checked = true;
                document.getElementById("txtNomeMae").disabled = true;
			}

            $("#txtNomeConjuge").val(data.d.ds_nome_conjuge);
			$("#cboEmpresa").val(data.d.tp_tem_empresa);
			
			

            if (data.d.tp_tem_empresa == "S") {
                    $.ajax({
                        type: "POST",
                        url: "MeuCadastro.aspx/wmConsultarEmpresaCliente",
                        data: "{id_cliente: '" + data.d.id_cliente + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: OnSuccessCarregarEmpresaCliente,
                        error: function (request, status, error) {
                            alert(request.responseText);
                        }
                    });

                
            }
            

        }
        function OnSuccessCarregarEmpresaCliente(data, status) {
            $("#txtCNPJ").val(data.d.nr_cnpj);
            $("#txtNomeEmpresa").val(data.d.ds_nome_empresa);
            $("#txtEnderecoEmpresa").val(data.d.ds_endereco);
            $("#txtCidadeEmpresa").val(data.d.ds_cidade);
            $("#cboEstadoEmpresa").val(data.d.ds_estado);
        }
        function Voltar() {
            window.location.href = "Default.aspx";
		}
        function Proximo() {
            MostraAba("endereco");
		}
        function Anterior() {
            MostraAba("cliente");
		}
		function VerificaEstadoCivil() {
			if ($("#cboEstadoCivil").val() == 2)
			{
                $("#txtNomeConjuge").val("");
				document.getElementById("txtNomeConjuge").disabled = false;
			}
			else
			{
                $("#txtNomeConjuge").val("Não consta");
                document.getElementById("txtNomeConjuge").disabled = true;
			}
				
		}
		function VerificachkPai() {
			if (document.getElementById('chkPai').checked)
			{
				$("#txtNomePai").val("NÃO CONSTA");
                document.getElementById("txtNomePai").disabled = true;

			}
			else
			{
				$("#txtNomePai").val("");
                document.getElementById("txtNomePai").disabled = false;
			}
		}
		function VerificachkMae() {
			if (document.getElementById('chkMae').checked)
			{
				$("#txtNomeMae").val("NÃO CONSTA");
                document.getElementById("txtNomeMae").disabled = true;

			}
			else
			{
                $("#txtNomeMae").val("");
                document.getElementById("txtNomeMae").disabled = false;
            }
        }
        function VerificaDadosCliente() {
			$("#frmDadosCliente")[0].reportValidity();	

            // Verifica Nome
            if ($("#txtNome").val() == '') {
                //alert("Informe o Endereço.");
                MostraAba("cliente");
                MensagemActoSimples("Dados Cliente","Nome em branco. Por favor, preencha o nome do cliente.");
                return false;
            }

            // Valida Telefone Celular 1
			if (validaTelefone($("#txtTelefoneCelular").val()) == false) {
                MostraAba("cliente");
                MensagemActoSimples("Dados Cliente", "Telefone Celular Inválido.");
                return false;
            }

            // Valida Data de Nascimento
            if (ValidaData($("#txtDataNascimento").val()) == false) {
                MostraAba("cliente");
                MensagemActoSimples("Dados Cliente", "Data de Nascimento Inválida.");
                return false;
            }

            //if (validaTelefone($("#txtTelefoneFixo").val()) == false) {
            //    alert("Telefone Fixo Inválido!");
            //    return false;
            //}

            // Validação dos Campos
           
            if ($('#cboGenero').val() == "") {
                MostraAba("cliente");
                MensagemActoSimples("Dados Cliente", "Escolha um Genêro.");
                return false;
            }

            // Validar Estado Civil
            if ($.trim($('#cboEstadoCivil').val()) == '') {
                MostraAba("cliente");
                MensagemActoSimples("Dados Cliente", "Informe o Estado Civil");
                return false;
            }
			$("#frmDocumentos")[0].reportValidity();
            
            //Verifica Numero RG
            if ($("#txtNumeroRG").val() == "") {
                MostraAba("cliente");
                MensagemActoSimples("Documentos", "Informe o número do RG.");
                return false;
            }

            // Valida Data de Emissão do RG
            if (ValidaData($("#txtDataExpedicao").val()) == false) {
                MostraAba("cliente");
                MensagemActoSimples("Documentos", "Data da Expedição do R.G. do cliente Inválida.");
                return false;
            }

            //Verifica Local Emissor RG
            if ($("#txtEmissao").val() == "") {
                MostraAba("cliente");
                MensagemActoSimples("Documentos", "Informe a descrição do Emissor do RG do cliente.");
                return false;
            }

            //Verifica CNH
            if ($("#txtCNH").val() == "") {
                MostraAba("cliente");
                MensagemActoSimples("Documentos", "Informe o numero da CNH do cliente.");
                return false;
            }
            
            // Valida Data de 1ª Habilitação
            if (ValidaData($("#txtDataPrimeiraHabilitacao").val()) == false) {
                MostraAba("cliente");
                MensagemActoSimples("Documentos", "Data da primeira habilitação Inválida.");
                return false;
            }

			$("#frmDadosEndereco")[0].reportValidity();

            //Verifica Tipo Endereço
            if ($("#cboTipoEndereco").val() == '') {
                MostraAba("endereco");
                MensagemActoSimples("Endereço", "Informe o Tipo de Endereço do cliente.");
                return false;
            }

            //Verifica CEP
            if ($("#txtCep").val() == '') {
                MostraAba("endereco");
                MensagemActoSimples("Endereço", "Informe o CEP.");
                return false;
            }
            if (IsCEP($("#txtCep").val()) == false) {
                MostraAba("endereco");
                MensagemActoSimples("Endereço", "Informe o CEP corretamente.");
                return false;
            }

            // Verifica Endereço
            if ($("#txtEndereco").val() == '') {
                MostraAba("endereco");
                MensagemActoSimples("Endereço", "Informe o Endereço do cliente.");
                return false;
            }

            // Verifica Endereço
            if ($("#txtNumeroEndereco").val() == '') {
                MostraAba("endereco");
                MensagemActoSimples("Endereço", "Informe o número do endereço.");
                return false;
            }
            if (checkNumber($("#txtNumeroEndereco").val()) == false) {
                MostraAba("endereco");
                MensagemActoSimples("Endereço", "Informe o número do endereço corretamente.");
                return false;
            }

            // Verifica Complemento
            if ($("#txtComplemento").val() == '') {
                MostraAba("endereco");
                MensagemActoSimples("Endereço", "Informe o Complemento.");
                return false;
            }
            // Verifica Bairro
            if ($("#txtBairro").val() == '') {
                MostraAba("endereco");
                MensagemActoSimples("Endereço", "Informe o Bairro.");
                return false;
            }
            // Verifica Cidade
            if ($("#txtCidade").val() == '') {
                MostraAba("endereco");
                MensagemActoSimples("Endereço", "Informe a Cidade.");
                return false;
            }
            // Verifica Estado
            if ($("#cboEstado").val() == '') {
                MostraAba("endereco");
                MensagemActoSimples("Endereço", "Informe o Estado.");
                return false;
            }
            $("#frmComplemento")[0].reportValidity();
            // Verifica Profissão
            if ($("#cboProfissao").val() == '') {
                MostraAba("endereco");
                MensagemActoSimples("Complemento", "Informe a profissão do cliente.");
                return false;
            }

            // Verifica Profissao Complemento
            if ($("#txtComplementoProfissao").val() == '') {
                MostraAba("endereco");
                MensagemActoSimples("Complemento", "Informe o complemento da Profissão do cliente.");
                return false;
            }

            // Verifica Nome Pai
            if ($("#txtNomePai").val() == '') {
                MostraAba("endereco");
                MensagemActoSimples("Complemento", "Informe o nome do pai do cliente.");
                return false;
            }

            // Verifica Noe Mãe
            if ($("#txtNomeMae").val() == '') {
                MostraAba("endereco");
                MensagemActoSimples("Complemento", "Informe o nome da mãe do cliente.");
                return false;
            }

            // Verifica NomeConjuge
			if ($("#txtNomeConjuge").val() == '') {
                //var $myForm = $('#frmComplemento');
				//$("#txtNomeConjuge")[0].checkValidity();	
				//$myForm.find(':submit').click();
                //if ($("#frmComplemento")[0].checkValidity())
                //    alert('sucess');
                //else
                    //Validate Form
				
                //$("form")[0].reportValidity()
                MostraAba("endereco");
                MensagemActoSimples("Complemento", "Informe o nome do(a) Conjuge do cliente.");
                return false;
            }

            //Verificar Cadastro da Empresa
            if ($("#cboEmpresa").val() == "S") {
                if (validarCNPJ($("#txtCNPJ").val()) == false) {
                    $('#modal-empresa').modal('show');
                    MensagemActoSimples("Cadastro da Empresa", "CNPJ da empresa inválido.");
                    return false;
                }
                if ($("#txtNomeEmpresa").val() == "") {
                    $('#modal-empresa').modal('show');
                    MensagemActoSimples("Cadastro da Empresa", "Informe o nome da Empresa");
                    return false;
                }
                if ($("#txtEnderecoEmpresa").val() == "") {
                    $('#modal-empresa').modal('show');
                    MensagemActoSimples("Cadastro da Empresa", "Informe o endereço completo da Empresa.");
                    return false;
                }
                if ($("#txtCidade").val() == '') {
                    $('#modal-empresa').modal('show');
                    MensagemActoSimples("Cadastro da Empresa", "Informe a Cidade da Empresa.");
                    return false;
                }
                if ($("#cboEstadoEmpresa").val() == '') {
                    $('#modal-empresa').modal('show');
                    MensagemActoSimples("Cadastro da Empresa", "Informe o Estado da Empresa.");
                    return false;
                }
            }
            else
            {
                $("#txtCNPJ").val("");
                $("#txtNomeEmpresa").val("");
                $("#txtEnderecoEmpresa").val("");
                $("#txtCidadeEmpresa").val("");
                $("#cboEstadoEmpresa").val("");
            }
            return true;
        }

        function AtualizarCliente() {
            if (VerificaDadosCliente() == false) {
                return false;
            }
            
            $.ajax({
                type: "POST",
                url: "MeuCadastro.aspx/wmAtualizarCliente",
                data: "{pid_cliente: '" + $("#txtIdCliente").val() +
                    "', pds_nome: '" + $("#txtNome").val() + 
                    "', pdt_nascimento: '" + $("#txtDataNascimento").val() + 
                    "', pds_rg: '" + $("#txtNumeroRG").val() +
                    "', pds_emissao: '" + $("#txtEmissao").val() +
                    "', pdt_emissao_rg: '" + $("#txtDataExpedicao").val() + 
                    "', pds_telefone_celular: '" + $("#txtTelefoneCelular").val() +
                    "', pds_telefone_comercial: '" + $("#txtTelefoneCelular2").val() +
                    "', pid_estado_civil: '" + $("#cboEstadoCivil").val() +
                    "', pid_genero: '" + $("#cboGenero").val() +
                    "', pds_cnh: '" + $("#txtCNH").val() +
                    "', pdt_1_habilitacao: '" + $("#txtDataPrimeiraHabilitacao").val() +
                    "', pds_profissao: '" + $("#cboProfissao").val() +
                    "', pds_profissao_complemento: '" + $("#txtComplementoProfissao").val() +
                    "', pds_nome_pai: '" + $("#txtNomePai").val() +
                    "', pds_nome_mae: '" + $("#txtNomeMae").val() +
                    "', pds_nome_conjuge: '" + $("#txtNomeConjuge").val() +
                    "', pds_tipo_endereco: '" + $("#cboTipoEndereco").val() +
                    "', pds_cep: '" + $("#txtCep").val() +
                    "', pds_endereco: '" + $("#txtEndereco").val() +
                    "', pds_numero: '" + $("#txtNumeroEndereco").val() +
                    "', pds_complemento: '" + $("#txtComplemento").val() +
                    "', pds_bairro: '" + $("#txtBairro").val() +
                    "', pds_cidade: '" + $("#txtCidade").val() +
                    "', pds_estado: '" + $("#cboEstado").val() +
                    "', pEmpresaSimNao: '" + $("#cboEmpresa").val() +
                    "', pCNPJ: '" + $("#txtCNPJ").val() + 
                    "', pNomeEmpresa: '" + $("#txtNomeEmpresa").val() + 
                    "', pEnderecoEmpresa: '" + $("#txtEnderecoEmpresa").val() +
                    "', pCidadeEmpresa: '" + $("#txtCidadeEmpresa").val() +
                    "', pEstadoEmpresa: '" + $("#cboEstadoEmpresa").val() +
					"'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessAtualizarCliente,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });

            return false;
        }
        function OnSuccessAtualizarCliente(data, status) {
            MostraAba("listaclientes");

            if (data.d == "OK") {
                CarregarGridClientes();
                MensagemActoSucesso("Atualização Cadastral do Cliente", "Executada com Sucesso, faça uma cotação agora!");
			}
			else
			{
				alert("CLIENTE não foi atualizado, houve um problema sistêmico.");
            }

            return false;
        }
        function MostraTelaEmpresa() {
            
            if ($("#cboEmpresa").val() == "S") {
                
                $('#modal-empresa').modal('show');
            }
        }
        function VerificaEmpresaPopup() {

            
            if (validarCNPJ($("#txtCNPJ").val()) == false) {
                alert("CNPJ da empresa inválido.");
                return false;
            }
            if ($("#txtNomeEmpresa").val() == "") {
                alert("Informe o nome da Empresa");
                return false;
            }

            if ($("#txtEnderecoEmpresa").val() == "") {
                alert("Informe o endereço completo da Empresa.");
                return false;
            }

            // Verifica Cidade
            if ($("#txtCidadeEmpresa").val() == '') {
                alert("Informe a Cidade da Empresa.");
                return false;
            }
            // Verifica Estado
            if ($("#cboEstadoEmpresa").val() == '') {
                alert("Informe o Estado da Empresa.");
                return false;
            }

            $('#modal-empresa').modal('hide');

            }
        function IncluirCliente() {

            $.ajax({
                type: "POST",
                url: "MeuCadastro.aspx/wmIncluirCliente",
                data: "{nome: '" + $("#txtNomeNovo").val() + "', cpf: '" + $("#txtCpfNovo").val() + "',  email: '" + $("#txtEmailNovo").val() + "', confirmar_email: '" + $("#txtEmailConfirmeNovo").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessIncluir,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });

            return false;
        }
        function OnSuccessIncluir(data, status) {
            
			if (isNumeric(data.d) && data.d != "0") {
				$('#txtIdCliente').val(data.d);
                MensagemActoSimples("Inclusão de Novo Cliente", "Cliente incluído com sucesso! Complete o cadastro em seguida.");
                $('#modal-incluir-indicado').modal('hide');
            }
            else {
                MensagemActoSimples("Inclusão de Novo Cliente", data.d);
                return false;
            }
			CarregarGridClientes();
			CarregarCliente(data.d);
            
        }

     
        
     
        $(document).ready(function () {
            jQuery.support.cors = true;
        });

          
    </script>
   <script>
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
       function isNumeric(n) {
           return !isNaN(parseFloat(n)) && isFinite(n);
       }
       function Voltar() {
           window.location.href = "Default.aspx";
       }
       //function AtualizarEndereco() {

       //function OnSuccessEndereco(data, status) {

       //    if (data.d == "OK") {
       //        alert("Meus dados atualizado com sucesso!");
       //    }
       //    else {
       //        alert("Meus dados não foi atualizado, houve um problema sistêmico.");
       //    }
       //}
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
        <li class="breadcrumb-item"><a href="#">Cadastro</a></li>
        <li class="breadcrumb-item active">Meu Cadastro</li>
		  
      </ol>
    </section>
	<!-- Modal EM PROCESSAMENTO... -->
				<div class="modal center-modal fade" data-backdrop="static" id="modal-em-processamento" tabindex="-2" style='justify-content: center;align-items: center;' data-keyboard="false" >
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
     <!-- Modal Empresa -->
		<div class="modal center-modal fade" id="modal-empresa" tabindex="-1">
				  <div class="modal-dialog">
					<div class="modal-content">
					  <div class="modal-header">
						<h5 class="modal-title">Digite as principais informações da empresa, em seguida salve a informação.</h5>
						<button type="button" class="close" data-dismiss="modal">
						  <span aria-hidden="true">&times;</span>
						</button>
					  </div>
					  <div class="modal-body">
                        <div class="form-group">
                            <label>CNPJ:</label>
						        <input id="txtCNPJ" type="text" class="form-control" placeholder="" >
                        </div>
                          <div class="form-group">
                            <label>Nome da Empresa:</label>
						        <input id="txtNomeEmpresa" type="text" class="form-control" placeholder="Nome Empresa">
                        </div>
                          <div class="form-group">
                            <label>Endereço:</label>
						        <input id="txtEnderecoEmpresa" type="text" class="form-control" placeholder="Endereço Empresa">
                        </div>
                        
					<div class="form-group">
					  <label>Cidade:</label>		
					  <input id="txtCidadeEmpresa" class="form-control" type="text"  placeholder="Digite a Cidade Empresa">					  
					</div>

				<div class="form-group">
					  <label>Estado:</label>	 	
						 <select name="cboEstadoEmpresa" id="cboEstadoEmpresa" class="form-control" onchange="onchange_aba_veiculo()" >
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
					  <div class="modal-footer modal-footer-uniform">
                          <button type="button" class="btn btn-bold btn-secondary"  onclick="VerificaEmpresaPopup()" >Fechar</button>
						<%--<button type="button" class="btn btn-bold btn-secondary" data-dismiss="modal" onclick="VerificaEmpresaPopup()" >Fechar</button>
						<button type="button" class="btn btn-bold btn-primary float-right" onclick="VerificaEmpresaPopup()" >Gravar Empresa</button>--%>
					  </div>
					</div>
				  </div>
				</div>
       <!-- /.modal -->
     <!-- Modal CLIENTES INDICADOS -->
				<div class="modal center-modal fade" id="modal-incluir-indicado" tabindex="-1">
				  <div class="modal-dialog">
					<div class="modal-content">
					  <div class="modal-header">
						<h5 class="modal-title">Digite as principais informações do Indicado, em seguida continue o cadastro.</h5>
						<button type="button" class="close" data-dismiss="modal">
						  <span aria-hidden="true">&times;</span>
						</button>
					  </div>
					  <div class="modal-body">
						
                           <div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-user"></i></span>
								</div>
								<input id="txtCpfNovo" type="text" class="form-control" placeholder="000.000.000-00">
								<%--<asp:TextBox ID="txtCpfNovo" runat="server" class="form-control" placeholder="CPF"></asp:TextBox>--%>
							</div>
						</div>
                          <div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-user"></i></span>
								</div>
								<input id="txtNomeNovo" type="text" class="form-control" placeholder="Nome">
								<%--<asp:TextBox ID="txtNomeNovo" runat="server" class="form-control" placeholder="Nome"></asp:TextBox>--%>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-email"></i></span>
								</div>
								<input id="txtEmailNovo" type="email" class="form-control" placeholder="E-mail">
								<%--<asp:TextBox ID="txtEmailNovo" type="email" runat="server" class="form-control" placeholder="E-mail"></asp:TextBox>--%>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success border-success"><i class="ti-email"></i></span>
								</div>
								<input id="txtEmailConfirmeNovo" type="email" class="form-control" placeholder="E-mail Confirme">
								<%--<asp:TextBox ID="<%--txtEmailConfirmeNovo" type="email" runat="server" class="form-control" placeholder="Confirme o E-mail"></asp:TextBox>--%>
							</div>
						</div>
					  </div>
					  <div class="modal-footer modal-footer-uniform">
						
                        <button type="button" class="btn btn-primary" data-toggle="modal" onclick="IncluirCliente()">Incluir Cliente</button>
                         <%--<button type="button" class="btn btn-bold btn-primary float-right" onclick="IncluirCliente()" >Gravar Indicado</button>--%>
                        <button type="button" class="btn btn-bold btn-secondary" data-dismiss="modal">Fechar</button>
					  </div>
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
					<li class="nav-item"> <a class="nav-link active" data-toggle="tab" id="tablinklistaclientes" href="#listaclientes" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">CLIENTES CADASTRADOS</span> </a></li>					
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" id="tablinkcliente" href="#cliente" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">DADOS PRINCIPAIS</span> </a></li>					
                    <li class="nav-item"> <a class="nav-link" data-toggle="tab" id="tablinkendereco" href="#endereco" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> <span class="hidden-xs-down">ENDEREÇO e COMPLEMENTO</span> </a></li>					
				</ul>

				<!-- Tab panes -->
				<div class="tab-content tabcontent-border">
				<div class="box-body box-outline-gray">
					
					<div class="row">
					
						<div class="col-md-6">
                            <button type="button" id="btnNovo" class="btn btn-primary" data-toggle="modal" data-target="#modal-incluir-indicado">Novo</button>
                            <button type="button" id="btnGravar" class="btn btn-success" onclick="AtualizarCliente()" hidden>Gravar</button>	
							<button type="button" class="btn btn-danger" onclick="Voltar()">Voltar</button>
                            
                            <%--<asp:TextBox name="txtIdCliente" id="txtIdCliente" type="hidden" runat="server"></asp:TextBox>
                            <asp:TextBox name="txtIdClienteIndicador" id="txtIdClienteIndicador" type="hidden" runat="server"></asp:TextBox>--%>
                            
                            <input name="txtIdCliente" id="txtIdCliente"  type="hidden">
                            <%--<input name="txtIdClienteIndicador" id="txtIdClienteIndicador"  type="hidden">--%>
							<%--<button type="button" name="btnGravar" id="btnGravar" class="btn btn-cyan mb-5" onclick="ValidarStatusEmCotacao()" disabled>Gravar</button>
							<button type="button" name="btnEnviar" id="btnEnviar" class="btn btn-yellow mb-5" onclick="EnviarCotacao()"  disabled>Enviar</button>
							<button type="button" name="btnPDF" id="btnPDF" class="btn btn-warning mb-5" onclick="BaixarPDF()" disabled>PDF</button>
							<button type="button" name="btnClonar" id="btnClonar" class="btn btn-brown mb-5" onclick="ClonarCotacao()" disabled>Clonar</button>
							<button type="button" class="btn btn-danger mb-5" onclick="Voltar()">Voltar</button>--%>
						</div>
						<div class="col-md-6">
							<%--<input name="txtMensagemCotacao" id="txtMensagemCotacao"  type="text" class="form-control" value="Cotação não gravada" disabled>--%>
						</div>
					</div>
					
						
				</div>
					 <%--Dados LISTA DE CLIENTES--%>
					<div class="tab-pane active" id="listaclientes" role="tabpanel">
						<div class="pad">
                            <%--<section class="content">--%>
                            <div class="row">		
							<div class="col-lg-12 col-12">
		                      <div class="box">
			                    <div class="box-header with-border bg-light">
									
			                      <h4 class="box-title">CLIENTES CADASTRADOS</h4>	
									<ul class="box-title">
										 
				                     <%-- <button type="button" name="btnInsereCotacao" id="btnInsereCotacao" class="btn btn-blue mb-5" onclick="CarregaTelaInsereCotacao()" hidden >Inserir</button>
										<button type="button" name="btnLimparItensCotacao" id="btnLimparItensCotacao" class="btn btn-blue mb-5" onclick="CarregaTelaLimparItensCotacao()" hidden >Excluir Todos</button>
										<button type="button" name="btnUploadPDF" id="btnUploadPDF" class="btn btn-blue mb-5" onclick="AbrePopupUploadPDF()" hidden>Sobe PDF</button>
										<button type="button" name="btnFinalizaCotacao" id="btnFinalizaCotacao" class="btn btn-blue mb-5" onclick="FinalizaCotacao()" hidden>Finalizar Cotação</button>
										--%> 
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
											  <table id="grdClientes" class="table table-bordered table-striped display nowrap margin-top-10" style="width:100%">
												<thead>
													<tr>
														<th></th>
														<th>CPF</th>
														<th>Nome</th>
														<th>E-MAIL</th>
														<th>Telefone</th>														
                                                        <th></th>
														<th></th>
                                                        														
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
            <!-- /.box-body -->
          </div>
					<%--Dados cliente--%>
					<div class="tab-pane" id="cliente" role="tabpanel">
						<div class="pad">
                            <%--<section class="content">--%>
                            <div class="row">		
							<div class="col-lg-6 col-12">
                           
		                      <div class="box">
			                    
			                    <!-- /.box-header -->
			                    <form class="form" id="frmDadosCliente">
                                    
                            
				                    <div class="box-body">
                                         <h4 class="page-header">Dados Cliente</h4>
					                    <div class="row">
					                      <div class="col-md-12">
						                    <div class="form-group">

						                      <label>Nome</label>
						                        <input id="txtNome" type="text" class="form-control" placeholder="Nome Completo" required>
						                        
						                    </div>
					                      </div>
					                      
					                    </div>
                                        <div class="row">
					                      <div class="col-md-12">
						                    <div class="form-group">
						                      <label>E-mail</label>
						                        <input id="txtEmail" type="email" class="form-control" placeholder="E-mail" disabled ="disabled" >
						                        
						                    </div>
					                      </div>
					                      
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Telefone Celular</label>	
						                        <input type="text" class="form-control" id="txtTelefoneCelular" placeholder="Digite o Nº Telefone" required>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Telefone Celular 2</label>							
						                        <input type="text" class="form-control" id="txtTelefoneCelular2" placeholder="Opcional">
						                    </div>
					                      </div>
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                     <label>Data de Nascimento</label>
					                          <input id="txtDataNascimento" class="form-control" type="text" placeholder="DD/MM/AAAA" required>
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Genêro</label>
						                        <select  name="cboGenero" id="cboGenero" class="form-control" required>
							                        <option selected value="">Selecione...</option>
                                                    <option value="1">Masculino</option>
							                        <option value="2">Feminino</option>							                       
						                          </select>	
					                      </div>
					                    </div>
                                        </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Estado Civil</label>		
					                          <select  name="cboEstadoCivil" id="cboEstadoCivil" class="form-control" OnChange="VerificaEstadoCivil()" required>
							                        <option selected value="">Selecione</option>
							                        <option value="1">Solteiro(a)</option>
							                        <option value="2">Casado(a) / União estável</option>
							                        <option value="3">Divorciado(a)</option>
							                        <option value="4">Viúvo(a)</option>
						                            <option value="5">Outros</option>
						                          </select>	
						                    </div>
					                      </div>
					                      <div class="col-md-3">
						                    <div class="form-group">
						                      <label>Empresa aberta</label>
						                        <select  name="cboEmpresa" id="cboEmpresa" class="form-control" onchange="MostraTelaEmpresa();">
							                        <option value="S">SIM</option>
							                        <option selected value="N">NÃO</option>							                       
						                          </select>	

					                      </div>
					                    </div>
                                            <div class="col-md-3">
						                    <div class="form-group">
						                      <label>Usuário</label>
						                        <select  name="cboUsuario" id="cboUsuario" class="form-control" disabled ="disabled">
							                        <option value="SIM">SIM</option>
							                        <option selected value="NÃO">NÃO</option>							                       
						                          </select>	

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
			                    
			                    <!-- /.box-header -->
			                    <form class="form" id="frmDocumentos">
				                    <div class="box-body">
                                       <h4 class="page-header">Documentos</h4>      
						                <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>CPF</label>							
						                        <input id="txtCPF" type="text" class="form-control" placeholder="000.000.000-00" disabled ="disabled">
						                        
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Número do R.G.</label>							
						                        <input type="text" id="txtNumeroRG" class="form-control" placeholder="Digite o Nº do RG" required>
                                                
						                    </div>
					                      </div>
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Data de Expedição</label>		
					                          <input class="form-control" id="txtDataExpedicao" type="text" placeholder="DD/MM/AAAA" required>					  
                                              
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Emissão</label>							
						                        <input type="text" id="txtEmissao" class="form-control" placeholder="Ex.: SSS/SP" required>
                                                
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>CNH</label>							
						                        <input id="txtCNH" type="text" class="form-control" placeholder="Digite o Nº do CNH" onkeypress="return somenteNumeros(event)" maxlength="14" required>
						                        
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Data 1ª Habilitação</label>							
						                        <input type="text" id="txtDataPrimeiraHabilitacao" class="form-control" placeholder="DD/MM/AAAA" required>
                                                
						                    </div>
					                      </div>
					                    </div>
                                        <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Data da Inclusão</label>		
					                          <input class="form-control" type="text" value="" id="txtDataInclusao" disabled="disabled" >			
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                     <label>Atualização</label>		
					                          <input class="form-control" type="text" value="" id="txtDataAtualizacao" disabled="disabled" >			
						                    </div>
					                      </div>
					                    </div>
										<div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                     <button type="button" id="btnProximo" class="btn btn-primary" onclick="Proximo()">Próximo</button>
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
                    <%--Dados ENDERECO--%>
					<div class="tab-pane" id="endereco" role="tabpanel">
						<div class="pad">
                            <%--<section class="content">--%>
                            <div class="row">		
							<div class="col-lg-6 col-12">
                           
		                      <div class="box">
			                    
			                    <!-- /.box-header -->
			                    <form class="form" id="frmDadosEndereco">
                                    
				                    <div class="box-body">
                                    <h4 class="page-header">Dados Endereço</h4>
					                <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Tipo Endereço</label>	
                                               <%-- 
						                        <asp:DropDownList id="cboTipoEndereco" AutoPostBack="False" runat="server" CssClass="form-control">
							                        <asp:ListItem Selected="True" Value="">Selecione...</asp:ListItem>
							                        <asp:ListItem Value="1">Residencial</asp:ListItem>
							                        <asp:ListItem Value="2">Comercial</asp:ListItem>
						                        </asp:DropDownList>--%>
                                                <select  name="cboTipoEndereco" id="cboTipoEndereco" class="form-control" required>
							                        <option value="">Selecione</option>
							                        <option value="1">Residencial</option>
							                        <option value="2">Comercial</option>							                       
						                          </select>	
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>CEP</label>
						                        <input id="txtCep" type="text" class="form-control" placeholder="Digite o Cep" required>
						                        
						                    </div>
					                      </div>
					                    </div>
					                <div class="row">
					                    <div class="col-md-9">
						                <div class="form-group">
						                    <label>Endereço</label>
						                    <input id="txtEndereco" type="text" class="form-control" placeholder="Digite o Endereço" required>
						                    </div>
					                    </div>
					                    <div class="col-md-3">
						                <div class="form-group">
						                    <label>Numero</label>
						                    <input id="txtNumeroEndereco" type="text" class="form-control" placeholder="Digite Nº" onkeypress="return somenteNumeros(event)" maxlength="6" required>
						                    
						                </div>
					                    </div>
					                </div>
									<div class="row">
					                    <div class="col-md-6">
						                <div class="form-group">
						                    <label>Complemento</label>							
						                    <input id="txtComplemento" type="text" class="form-control" placeholder="Digite o complemento" required>
						                </div>
					                    </div>
					                    <div class="col-md-6">
						                <div class="form-group">
						                    <label>Bairro</label>		
					                        <input id="txtBairro" class="form-control" type="text"  placeholder="Digite o Bairro" required>					  
						                    
						                </div>
					                    </div>
					                </div>
                                    <div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                      <label>Cidade</label>		
					                          <input id="txtCidade" class="form-control" type="text"  placeholder="Digite a Cidade" required>					  
						                        
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                    <label>Estado</label>		
						                    <select name="cboEstado" id="cboEstado" class="form-control" onchange="onchange_aba_veiculo()" required>
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

                                             
					                    </div>
										<div class="row">
					                      <div class="col-md-6">
						                    <div class="form-group">
						                     <button type="button" id="btnAnterior" class="btn btn-primary" onclick="Anterior()">Anterior</button> 
						                    </div>
					                      </div>
					                      <div class="col-md-6">
						                    <div class="form-group">
						                     
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
			                    
			                    <!-- /.box-header -->
			                    <form class="form" id="frmComplemento">
				                    <div class="box-body">
                                        <h4 class="page-header">Complemento</h4>
                                        <div class="row">
					                      <div class="col-md-9">
						                    <div class="form-group">
						                      <label>Profissão</label>		
						                    <select name="cboProfissao" id="cboProfissao" class="form-control select2" style="width: 100%;" required>
												  <option value="">Selecione..</option> 												  
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
													<option value="28">Analista</option>
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
                                          <div class="col-md-3">
						                    <div class="form-group">
						                      
                                                <label>Complemento</label>		
					                           <input id="txtComplementoProfissao" class="form-control" type="text"  placeholder="" required>
						                        
						                    </div>

						                    </div>
					                      </div>
                                        
					                    <div class="row">
					                      <div class="col-md-12">
						                    <div class="form-group">
						                      <label>Nome do Pai		|</label> <input type="checkbox" id="chkPai" OnChange="VerificachkPai()"> <label for="chkPai">Não consta</label>		
					                          <input id="txtNomePai" class="form-control" type="text"  placeholder="" required>					  
						                    </div>
						                    </div>
					                      </div>
                                        <div class="row">
					                      <div class="col-md-12">
						                    <div class="form-group">
						                      <label>Nome do Mãe		|</label>
												<input type="checkbox" id="chkMae" OnChange="VerificachkMae()" >
												<label for="chkMae">Não consta</label>		
					                          <input id="txtNomeMae" class="form-control" type="text"  placeholder="" required>					  
						                        
						                    </div>
					                      </div>
					                    </div>
					                    <div class="row">
					                      <div class="col-md-12">
						                    <div class="form-group">
						                      <label>Nome do Conjuge</label>		
					                          <input id="txtNomeConjuge" class="form-control" type="text"  placeholder="" required>					  
						                        
						                    </div>
						                      
						                    </div>
					                      </div>
					                     
					                </div>
                                   
				                    <!-- /.box-body -->
				                    <%--<div class="box-footer">
					                    <button type="submit" class="btn btn-success">
					                      <i class="ti-save-alt"></i> Grave
					                    </button>
				                    </div>
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







    <!-- Main content Cadastro -->
    <%--<section class="content">--%>
        
      
      <!-- /.row -->
      
    <%--</section>--%>
    	
    <!-- /.content -->
  <%--</div>--%>
  <!-- /.content-wrapper -->
</asp:Content>


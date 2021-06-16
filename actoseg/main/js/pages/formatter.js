// Mask / Formatter


$(function () {
  'use strict';

	
	$('#txtDtFimVigencia').formatter({
		'pattern': '{{99}}/{{99}}/{{9999}}',
		'persistent': false
	});

	//Date dd/mm/yyyy
	$('#ContentPlaceHolder1_txtDataNascimento').formatter({
		'pattern': '{{99}}/{{99}}/{{9999}}',
		'persistent': false
	});
	$('#txtDataNascimento').formatter({
		'pattern': '{{99}}/{{99}}/{{9999}}',
		'persistent': false
	});

	
	$('#txtDataPrimeiraHabilitacao').formatter({
		'pattern': '{{99}}/{{99}}/{{9999}}',
		'persistent': false
	});

	//Date dd/mm/yyyy
	$('#ContentPlaceHolder1_txtDataExpedicao').formatter({
		'pattern': '{{99}}/{{99}}/{{9999}}',
		'persistent': false
	});

	$('#txtDataExpedicao').formatter({
		'pattern': '{{99}}/{{99}}/{{9999}}',
		'persistent': false
	});

	//$('#txtDtVigenciaInicial').formatter({
	//	'pattern': '{{99}}/{{99}}/{{9999}}',
	//	'persistent': false
	//});

	//$('#txtDtVigenciaFinal').formatter({
	//	'pattern': '{{99}}/{{99}}/{{9999}}',
	//	'persistent': false
	//});

	$('#txtDataNascimentoCondutor').formatter({
		'pattern': '{{99}}/{{99}}/{{9999}}',
		'persistent': false
	});
	
	$('#txtDataEmissaoRgCondutorPrincipal').formatter({
		'pattern': '{{99}}/{{99}}/{{9999}}',
		'persistent': false
	});
		
	$('#txtDataHabilitacao').formatter({
		'pattern': '{{99}}/{{99}}/{{9999}}',
		'persistent': false
	});

	$('#txtDataVigenciaAnteriorInicio').formatter({
		'pattern': '{{99}}/{{99}}/{{9999}}',
		'persistent': false
	});

	
	$('#txtDataVigenciaAnteriorFim').formatter({
		'pattern': '{{99}}/{{99}}/{{9999}}',
		'persistent': false
	});

	//Date dd/mm/yyyy
	$('#date').formatter({
	  'pattern': '{{99}}/{{99}}/{{9999}}',
	  'persistent': true
	});
	
	//Date 2 yyyy-mm-dd
	$('#date2').formatter({
	  'pattern': '{{9999}}-{{99}}-{{99}}',
	  'persistent': true
	});

	

	//Time hh:mm
	$('#time').formatter({
	  'pattern': '{{99}}:{{99}}',
	  'persistent': true
	});
	
	//Date time dd/mm/yyyy hh:mm
	$('#date-time').formatter({
	  'pattern': '{{99}}/{{99}}/{{9999}} {{99}}:{{99}}',
	  'persistent': true
	});
	
	//Phone E.g. (123) 456-7890
	$('#phone').formatter({
		'pattern': '({{99}}) {{9}}-{{9999}}-{{9999}}',
	  'persistent': true
	});
	
	$('#txtTelefoneCelular').formatter({
		'pattern': '({{99}}) {{99999}}-{{9999}}',
		'persistent': false
	});

	$('#txtTelefoneCelular2').formatter({
		'pattern': '({{99}}) {{99999}}-{{9999}}',
		'persistent': false
	});

	$('#ContentPlaceHolder1_txtTelefoneCelular').formatter({
		'pattern': '({{99}}) {{99999}}-{{9999}}',
		'persistent': false
	});
	$('#ContentPlaceHolder1_txtTelefoneCelular2').formatter({
		'pattern': '({{99}}) {{99999}}-{{9999}}',
		'persistent': false
	});

	$('#txtTelefoneFixo').formatter({
		'pattern': '({{99}}) {{9999}}-{{9999}}',
		'persistent': false
	});

	$('#ContentPlaceHolder1_txtTelefoneFixo').formatter({
		'pattern': '({{99}}) {{9999}}-{{9999}}',
		'persistent': false
	});
	//Phone 2 E.g. +1 123-456-7890
	$('#phone2').formatter({
	  'pattern': '+1 {{999}}-{{999}}-{{999}}',
	  'persistent': true
	});
	
	//Percent E.g. %25.36
	$('#percent').formatter({
	  'pattern': '%{{99}}.{{99}}',
	  'persistent': true
	});
	
	//Username 8 character
	$('#username').formatter({
	  'pattern': '{{aaaaaaaa}}',
	  'persistent': true
	});
	
	//Price E.g. $ 999.99
	//$('#price').formatter({
	//	'pattern': '{{999}},{{999}},{{99}}',
	//  'persistent': true
	//});
	


	$('#price').formatter({
		'pattern': '$ {{999}}.{{99}}',
		'persistent': true
	});

	//Credit card
	$('#creditcard').formatter({
	  'pattern': '{{9999}}-{{9999}}-{{9999}}-{{9999}}',
	  'persistent': true
	});
	
	$('#txtNrCartaoCC').formatter({
		'pattern': '{{9999}}.{{9999}}.{{9999}}.{{9999}}',
		'persistent': false
	});

	$('#txtValidadeCC').formatter({
		'pattern': '{{99}}/{{99}}',
		'persistent': false
	});

	//SSN E.g. 123-45-6789
	$('#ssn').formatter({
	  'pattern': '{{999}}-{{99}}-{{9999}}',
	  'persistent': true
	});
	
	//Product key E.g. PN 123 4567
	$('#productkey').formatter({
	  'pattern': 'P{{a}} {{999}} {{9999}}',
	  'persistent': true
	});

	$('#ContentPlaceHolder1_txtCep').formatter({
		'pattern': '{{99999}}-{{999}}',
		'persistent': false
	});

	$('#txtCEPFrequencia').formatter({
		'pattern': '{{99999}}-{{999}}',
		'persistent': false
	});

	$('#txtCepPernoite').formatter({
		'pattern': '{{99999}}-{{999}}',
		'persistent': false
	});
	
	$('#txtCep').formatter({
		'pattern': '{{99999}}-{{999}}',
		'persistent': false
	});

	$('#txtCEPResidencia').formatter({
		'pattern': '{{99999}}-{{999}}',
		'persistent': false
	});

	$('#ContentPlaceHolder1_txtCNPJ').formatter({
		'pattern': '{{99}}.{{999}}.{{999}}/{{9999}}-{{99}}',
		'persistent': false
	});
	$('#txtCNPJ').formatter({
		'pattern': '{{99}}.{{999}}.{{999}}/{{9999}}-{{99}}',
		'persistent': false
	});
	$('#txtCPFCondutorPrincipal').formatter({
		'pattern': '{{999}}.{{999}}.{{999}}-{{99}}',
		'persistent': false
	});
	$('#txtCpfNovo').formatter({
		'pattern': '{{999}}.{{999}}.{{999}}-{{99}}',
		'persistent': false
	});
	$('#txtCPFTitularDC').formatter({
		'pattern': '{{999}}.{{999}}.{{999}}-{{99}}',
		'persistent': false
	});

	$('#txtCPFCC').formatter({
		'pattern': '{{999}}.{{999}}.{{999}}-{{99}}',
		'persistent': false
	});


	
});// End of use strict
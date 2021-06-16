<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="teste.aspx.cs" Inherits="actoseg.teste" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%-- <script src="Scripts/jquery-3.4.1.min.js" type="text/javascript"></script>--%>
   <%-- <script src ="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
    <script>

        function abreTelaAjuda(urlDoSeuPDFAjuda) {

            window.open(urlDoSeuPDFAjuda,
                "",
                "toolbar=no, location=no, status=no, menubar=yes, " +
                "scrollbars=yes, resizable=no, width=680, " +
                "height=650, left=180, top=50");

        }
        function Download(url) {
            //alert(url);
    document.getElementById('my_iframe').src = url;
};
function convertToBase64() {
        
        //Read File
        var selectedFile = $("#FileUpload1")[0].files;
        alert("base");
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
                //console.log(base64);
                alert(base64);
            };
            // Convert data to base64
            fileReader.readAsDataURL(fileToLoad);
        }
    }


function saveData() {

    var file = $("#FileUpload1")[0].files[0];
    var txtName = "teste.pdf";
    var conteudo = "";
    

 //Read File
        var selectedFile = $("#FileUpload1")[0].files;
        alert("base");
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
                //console.log(base64);
                
                conteudo = base64;
                alert("conteundo----" + conteudo);
                 $.ajax({
                    url: 'teste.aspx/SaveData',
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    data: "{file:'" + conteudo + "',name:'teset'}",
                    dataType: "json",
                    success: OnSuccess ,
                    error: function () {
                         alert(request.responseText);
                    }
                });
            };
            // Convert data to base64
            fileReader.readAsDataURL(fileToLoad);
    }

}

        


  <%-- $.ajax({
        url: 'teste.aspx/SaveData',
        type: 'POST',
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({  Name: txtName, fileData: file }),
        success: function () {
            alert("Data Added Successfully");
        },
        error: function (request, status, error) {
                    alert(request.responseText);
        }
    });}--%>

function OnSuccess(data, status) {
           //alert(data.d);
            //alert(status);
           
        }
        if (1 === 1) 
        {
            //alert(Number("1") - 1 == 0);
        }

function enviar() {
        alert("teste 1");


            var fileUpload = $("#FileUpload1").get(0);
                var files = fileUpload.files;

                // Create FormData object  
                var fileData = new FormData();
                for (var i = 0; i < files.length; i++) {
                    fileData.append(files[i].name, files[i]);
                    alert(files[i].name + " 2");
                }
                var file = files[0];
                alert(file.name);

                <%--$.ajax({
                type: "POST",
                url: "teste.aspx/UploadPDF",
                data: "{file:" + file + "}",
                contentType: "application/json; multipart/form-data",
                dataType: "json",
                success: OnSuccess,
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });--%>
            function OnSuccess()
            {
                alert("funcionou porra!!");
            }


               <%-- $.ajax({
                        url: 'teste.aspx/UploadPDF',
                        enctype: 'multipart/form-data',
                        method: 'post',
                        data: "{file:'" + file + "'}",
                        //data: '{Diesel: ' + JSON.stringify(Diesel_log) + '}',
                        contentType: false,
                        dataType: "json",
                        success: function () {
                            alert("Data Send Successfully")
                        },
                        error: function (err) {
                            console.log(err);
                        }

                    });--%>
               <%-- $.ajax({
                    url: 'teste.aspx/UploadPDF',
                    type: "POST",
                    contentType: false, // Not to set any content header  
                    processData: false, // Not to process data  
                    data: fileData,
                    success: function (result) {
                        alert(result);
                    },
                    error: function (err) {
                        alert(err.statusText);
                    }
                });--%>
}
   

   
        function Buscar() {

            
            

           

            //alert("teste");

            //$.ajax({
            //    type: "POST",
            //    url: "teste.aspx/BuscaCliente",
            //    data: "{Codigo: '" + $("#txtCodigo").val() + "'}",
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: OnSuccess,
            //    error: function (request, status, error) {
            //        alert(request.responseText);
            //    }
            //});

            return false;
        }

        

     

        $(document).ready(function () {
            jQuery.support.cors = true;
        });

        function SomaData() {
            stringToSplit = $("#txtDtIni").val();
            var arrayOfStrings = stringToSplit.split("/");
            var dt = new Date(arrayOfStrings[2], arrayOfStrings[1]-1, arrayOfStrings[0]);
            var dia = dt.getDate().toString().padStart(2, '0'),
            mes = (dt.getMonth()+1).toString().padStart(2, '0'), //+1 pois no getMonth Janeiro começa com zero.
            ano = dt.getFullYear() + 1;
            $("#txtDtFim").val(dia + "/" + mes + "/" + ano);
        }

        function dataAtualFormatada(anoFuturo) {

            var data = new Date(),
                dia = data.getDate().toString().padStart(2, '0'),
                mes = (data.getMonth() + 1).toString().padStart(2, '0'), //+1 pois no getMonth Janeiro começa com zero.
                ano = data.getFullYear() + anoFuturo;

            return dia + "/" + mes + "/" + ano;
        }
    </script>
    
</head>
    
<body>
    <style>
       * table, tr, td {
            border: 1px solid white;
           background-color: white;
            font-family: Arial, Helvetica, sans-serif;
        }
        td.label {
            border: 5px solid lightgray;
            background-color: lightgray;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
        }
        td.texto {
            
            border: 1px solid lightgray;
            background-color: white;
            font-family: Arial, Helvetica, sans-serif;
            
        }
        td.cabecalho {
            color:white;
            border: 5px solid royalblue;
            background-color: royalblue;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
        }
        body {
            
            background-image: url(odonto300x250.jpg);
            background-attachment: fixed;
            background-size: 100%;
            background-repeat: no-repeat;
            background-color: white;
        }

        div#circulo {
            height: 100%;
            width: 100%;
            background-image: url(odonto300x250.jpg);
            background-attachment: fixed;
            background-size: 100%;
            background-repeat: no-repeat;
            background-color: white;
        }
    </style>
    <div>
   <%-- <input id="txtCodigo" />
    <input id="txtDescricao" readonly="true"/>
    <input id="btnBuscar" type="button" value="buscar" onclick="Buscar()">
    <input type="file" id="FileUpload1" />  
    <input type="button" id="btnUpload" value="Uploadviar()" onclick="saveData()" />  
    <input type="button" id="BTNconvertToBase64" value="convertToBase64" onclick="convertToBase64()" />  
    <iframe id="my_iframe" style="display:none;"></iframe>
    <input type="button" id="BTNdownload" value="baixa pdf" onclick="javascript: abreTelaAjuda('upload/file.pdf')" />
        </div>
    <input type="button" id="btnSomaData" value="Soma Data" onclick="SomaData()" />
     <div>Data Inicio:<input id="txtDtIni" type="text" onchange="SomaData()" />Data Fim<input id="txtDtFim" /></div>
    <input id="date" type="date" value="2017-06-28">
    <div id="messagebody"><div class="message-htmlpart"><!-- html ignored --><!-- head ignored --><!-- meta ignored --><!-- meta ignored --><style type="text/css">       #messagebody div.rcmBody {          margin: 20px 20px;
          font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
       }    </style>
<div class="rcmBody">    Prezado(a) #ReceiverName#,    <p>    #Message#    </p>   <p>    #Description#    </p>    <p>       
    <a href="#Url#">Clique aqui para resolver sua pendência.</a>    </p>    Atenciosamente,<br />    Setor de Tecnologia da Informação --%>
    <table border="1">
        <tr >
            <td class="cabecalho" colspan="8">CAPA DA COTAÇÃO DE AUTOMÓVEL</td>    

        </tr>
        <tr>
            <td class="label">Segurado:</td>
            <td class="texto" colspan="3">CHARLES RICARDO TOSTES</td>
            <td class="label">Tipo Pessoa:</td>
            <td class="texto">F</td>
            <td class="label">CPF:</td>
            <td class="texto">16252708879</td>   
        </tr>
        <tr>
            <td class="label">E-mail:</td>
            <td class="texto">crtostes@globo.com</td>    

        </tr>
        <tr>
            <td class="label">Celular:</td>
            <td class="texto">(11) 97720-0000</td>    </tr>
        <tr>
            <td class="label">Vigência Inicial:</td>
            <td class="texto">07/07/2021</td>
            <td class="label">Vigência Final:</td>
            <td class="texto">07/07/2022</td>
            <td class="label">Tipo Seguro:</td>
            <td class="texto">Seguro Novo</td>    

        </tr>
        <tr>
            <td class="cabecalho" colspan="8">ITEM DE CALCULO DE AUTOMÓVEL</td>    

        </tr>
        <tr>
            <td class="label">Tipo:</td><td>Automóvel</td><td class="label">Fab./Mod.:</td><td>2015/2015</td><td class="label">Marca/Modelo:</td><td>VW - VOLKSWAGEN/AMAROK T. DARK LABEL CD 2.0 4X4 DIES AUT</td>    

        </tr>
        <tr>
            <td class="label">Chassi:</td><td>000000000</td><td class="label">Combustível:</td><td>DESC COMBUSTIVEL</td><td class="label">Financiado:</td><td>NÃO</td>    

        </tr>
        <tr>
            <td class="label">CEP Pernoite:</td><td>04750-060</td><td class="label">CEP Circulação:</td><td>04750-060</td><td class="label">CEP Residência:</td><td>04750-060</td>    
        </tr>
        <tr>
            <td class="cabecalho" colspan="4">COBERTURA CASCO</td><td class="cabecalho" colspan="4">COBERTURA RCF</td>    

        </tr>
        <tr>
            <td class="label">Cobertura:</td><td>Compreensiva</td><td class="label">Casco:</td><td>Mercado (Fipe) 100%</td><td class="label">Danos Materiais:</td><td>100.000,00</td><td class="label">Danos Passageiros:</td><td>100.000,00</td>    

        </tr>
        <tr>
            <td>Acessórios:</td><td>0,00</td><td>Cobertura de Vidros:</td><td>0,00</td><td>Danos Corporais:</td><td>100.000,00</td><td>Morte:</td><td>5.000,00</td>    

        </tr>
        <tr>
            <td>Equipamentos:</td><td>0,00</td><td>Desespesas Extras:</td><td>0,00</td><td>Danos Morais:</td><td>1</td><td>Invalidez:</td><td>5.000,00</td>    

        </tr>
        <tr>
            <td></td><td></td><td>Blindagem:</td><td>NÃO</td><td>Dias de Paralisação:</td><td>1</td><td>D.Méd.Hospitalar:</td><td>0,00</td>    

        </tr>
        <tr>
            <td class="cabecalho" colspan="8">PERFIL INTEGRADO</td><td></td><td></td><td></td>        
        </tr>
        <tr>
            <td>Utilização Veiculo:</td><td>Exercício do Trabalho</td><td></td><td> </td><td> </td><td>Garagem na Residência:</td><td>NÃO</td>    
        </tr>
        <tr>
            <td>Km por Mês:</td><td>1000</td><td></td><td> </td><td> </td><td>Garagem Escola/Faculdade:</td><td>NÃO</td>    

        </tr>
        <tr>
            <td></td><td></td><td></td><td> </td><td> </td><td>Garagem Trabalho:</td><td>NÃO</td>    
        </tr>
        <tr>
            <td class="cabecalho" colspan="8">SEGURADO</td><td></td><td></td><td></td>    
        </tr>
        <tr>
            <td>Relação com o Proprietário:</td><td>1</td> <td></td><td></td> <td></td><td></td> <td>Cobertura 18 a 25 Anos:</td><td>NÃO</td>    
        </tr>
        <tr>
            <td>Data Nacimento:</td><td>DATA NASC CLIENTE</td><td>Sexo:</td><td>GENERO CLIENTE</td><td>Estado Cívil:</td><td>ESTADO CIVIL</td> <td></td><td></td>    

        </tr>
        <tr>
            <td class="cabecalho" colspan="8">CONDUTOR PRINCIPAL</td><td></td><td></td><td></td>    

        </tr>
        <tr>
            <td>Relação com o Segurado:</td><td>O próprio</td> <td></td><td></td> <td></td><td></td> <td></td><td></td>    

        </tr>
        <tr>
            <td>Nome:</td><td>CHARLES RICARDO TOSTES</td> <td>CPF:</td><td>162.527.088-79</td> <td></td><td></td> <td>Nascimento:</td><td>06/01/1977</td>    

        </tr>
        <tr>
            <td>Sexo:</td><td>Masculino</td> <td>Estado Civil:</td><td>Casado(a)</td> <td></td><td></td> <td>Habilitado há:</td><td>HABILITADO HÁ</td>    

        </tr>
        <tr>
            <td>Profissão:</td><td>undefined</td> <td></td><td></td> <td></td><td></td><td>Total Veículos Residência:</td><td>1</td>   

        </tr>
        <tr>
            <td>Detalhe Profissão:</td><td>SENIOR</td> <td></td><td></td> <td></td><td></td> <td>CNH:</td><td>0101</td>    

        </tr>
        <tr>
            <td>Reside em:</td><td>Apartamento/Flat com Porteiro ou Portão Automático</td> <td></td><td></td> <td></td><td></td> <td>1ª CNH Data:</td><td>20/03/1995</td>    

        </tr>
        <tr>
            <td>Condutor Considerado:</td><td>Dirige o veículo por mais de 85% do tempo de uso semanal</td> <td></td><td></td> <td></td><td></td> <td>RG:</td><td>27.254.077-8</td>    

        </tr>
        <tr>
            <td>Condutores &gt; 25 anos:</td><td>1</td> <td></td><td></td> <td></td><td></td> <td>Data Emissão RG:</td><td>15/03/2015</td>    

        </tr>
        <tr>
            <td>Condutores Entre 17 e 25 anos:</td><td>NÃO</td> <td></td><td></td> <td></td><td></td> <td>Emissor RG:</td><td>SSP/SP</td>    

        </tr>

    </table></div><!-- html ignored --><p> DADOS CLIENTE:<br />Nome:  CHARLES RICARDO TOSTES <br /> Email : crtostes@globo.com <br /> Telefone : (11) 97720-0000 <br /> Tipo Cotação : Seguro Novo</p></div>
</div>
</body>
</html>



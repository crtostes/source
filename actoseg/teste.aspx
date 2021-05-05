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
            alert(url);
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
           alert(data.d);
            alert(status);
           
        }
        if (1 === 1) 
        {
            alert(Number("1") - 1 == 0);
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

            
            

           

            alert("teste");

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

          
    </script>
</head>
<body>
    <input id="txtCodigo" />
    <input id="txtDescricao" readonly="true"/>
    <input id="btnBuscar" type="button" value="buscar" onclick="Buscar()">
    <input type="file" id="FileUpload1" />  
    <input type="button" id="btnUpload" value="Uploadviar()" onclick="saveData()" />  
    <input type="button" id="BTNconvertToBase64" value="convertToBase64" onclick="convertToBase64()" />  
    <iframe id="my_iframe" style="display:none;"></iframe>
    <input type="button" id="BTNdownload" value="baixa pdf" onclick="javascript: abreTelaAjuda('upload/file.pdf')" />
     
    
</body>
</html>


/body>
</html>
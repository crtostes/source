<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="teste.aspx.cs" Inherits="actoseg.teste" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%-- <script src="Scripts/jquery-3.4.1.min.js" type="text/javascript"></script>--%>
    <script src ="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script>
        function Buscar() {

           // alert("teste");

            $.ajax({
                type: "POST",
                url: "teste.aspx/BuscaCliente",
                data: "{Codigo: '" + $("#txtCodigo").val() + "'}",
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
            //alert(data.d);
            $('#txtDescricao').val(data.d);
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
</body>
</html>



<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Pos.Hr.Reports.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <script src="../PL/Scripts/jquery-1.12.4.js"></script>
    <link href="../PL/Styles/jquery-ui.css" rel="stylesheet" />
    <script src="../PL/Scripts/jquery-ui.js"></script>
    <script src="../PL/Scripts/bootstrap.min.js"></script>
    <link href="../PL/Styles/bootstrap.min.css" rel="stylesheet" />
    

    <script type="text/javascript">
        $(function () {
            $('.datepicker').datepicker();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtEndDate" class="datepicker" runat="server" /> 
    </div>
    </form>
</body>
</html>

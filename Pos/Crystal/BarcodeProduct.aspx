<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BarcodeProduct.aspx.cs" Inherits="Pos.Crystal.BarcodeProduct" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Print" OnClick="Button1_Click" />
    
    </div>
        <div>


            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />


        </div>
    </form>
</body>
</html>

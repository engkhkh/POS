<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceByUser.aspx.cs" Inherits="Pos.Crystal.InvoiceByUser" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    


   <!--     <asp:DropDownList ID="DropDownList1" runat="server" DataTextField = "cUserName" AutoPostBack="true"  DataValueField = "cId"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="True">
            <asp:ListItem Text="choose one" Selected="False"></asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="show" />-->
    


        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="العوده للمبيعات" />
    


        <br />
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
    
    </div>
    </form>
</body>
</html>

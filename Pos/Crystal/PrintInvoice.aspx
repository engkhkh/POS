<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintInvoice.aspx.cs" Inherits="Pos.Crystal.PrintInvoice" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <asp:TextBox ID="TextBoxorderid" runat="server" AutoComplete="off" ></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Print" OnClick="Button1_Click" />
        </div>
    <div>
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
    </div>
    </form>
</body>
</html>

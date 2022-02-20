<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintInvoice.aspx.cs" Inherits="Pos.Reports.PrintInvoice" %>

<!DOCTYPE html>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="TextBoxorderid" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="اطبع" OnClick="Button1_Click" />
         <asp:ScriptManager ID="ScriptManager1" runat="server">
          </asp:ScriptManager>
    <div>
      <rsweb:reportviewer id="ReportViewer1" Enabled="false" runat="server" font-names="Verdana" font-size="8pt" waitmessagefont-names="Verdana" waitmessagefont-size="14pt" width="790px" asyncrendering="False">
                <LocalReport  ReportPath="Reports/Invoice.rdlc">
                    
                </LocalReport>
                 
            </rsweb:reportviewer>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceForm1.aspx.cs" Inherits="Pos.Reports.InvoiceForm1" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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

<%@ Page Language="C#" AutoEventWireup="true" Codefile="WebForm.aspx.cs" Inherits="WebApplication1.WebForm" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    

        test report
    <asp:ScriptManager ID="ScriptManager1" runat="server">
          </asp:ScriptManager>

    </div>
        <div>
           

            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="790px" AsyncRendering="False" >
                <LocalReport ReportPath="Report1.rdlc">
                    
                </LocalReport>
                 
            </rsweb:ReportViewer>

        </div>
    </form>
</body>
</html>

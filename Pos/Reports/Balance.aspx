<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Balance.aspx.cs" Inherits="Pos.Reports.Balance" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:Calendar ID="Calendar1" runat="server"  SelectionMode="DayWeekMonth" onselectionchanged="Calendar1_SelectionChanged">
            </asp:Calendar>
        <asp:Label ID="lblbday" runat="server" Enabled="false" Text="تحديد بداية الوردية"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="show/عرض الرصيد" OnClick="Button1_Click" />
        <%--<asp:Button ID="Button2" runat="server" Text="Back/ العوده للمبيعات " OnClick="Button2_Click" />--%>
        <br /><br /><br />
   <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
          </asp:ScriptManager>

    </div>
        <div>
           

            <rsweb:reportviewer id="ReportViewer1" Enabled="false" runat="server" font-names="Verdana" font-size="8pt" waitmessagefont-names="Verdana" waitmessagefont-size="14pt" width="790px" asyncrendering="False">
                <LocalReport  ReportPath="Reports/Report3.rdlc">
                    
                </LocalReport>
                 
            </rsweb:reportviewer>

        </div>
    </form>
</body>
</html>

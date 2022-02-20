<%@ Page Title="" Language="C#" MasterPageFile="~/WorkFlow/PL/WorkFlowLayout.Master" AutoEventWireup="true" CodeBehind="LeaveReport2.aspx.cs" Inherits="Pos.WorkFlow.Reports.LeaveReport2" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head111" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder111" runat="server">
     <br /><br /><br />
   <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
          </asp:ScriptManager>

    </div>
        <div>
           

            <rsweb:reportviewer id="ReportViewer1" Enabled="True" runat="server" font-names="Verdana" font-size="8pt" waitmessagefont-names="Verdana" waitmessagefont-size="14pt" width="790px" asyncrendering="False" >
                <LocalReport ReportPath="WorkFlow/Reports/LeaveReportFlow.rdlc">
                    
                </LocalReport>
                 
            </rsweb:reportviewer>

        </div>
</asp:Content>

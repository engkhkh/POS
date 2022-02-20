<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BpStatement.aspx.cs" Inherits="Pos.Hr.Reports.BpStatement" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
*,::after,::before{box-sizing:inherit}*,::after,::before{text-shadow:none!important;box-shadow:none!important}button,input{overflow:visible}button,input,optgroup,select,textarea{margin:0;font-family:inherit;font-size:inherit;line-height:inherit}[role=button],a,area,button,input,label,select,summary,textarea{-ms-touch-action:manipulation;touch-action:manipulation}[type=reset],[type=submit],button,html [type=button]{-webkit-appearance:button}
tbody tr th {
  color: #373757;
  font-family: 'Roboto', sans-serif;
  font-weight: normal;
}
th{text-align:left}button,select{text-transform:none}textarea{overflow:auto;resize:vertical}
        .auto-style2 {
            width: 229px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">



    <table align="center" cellspacing="4"  dir="rtl">
        <tr>
            <td>
                <asp:Label ID="Label14" runat="server" Text="من/From" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:textbox id="TextBox1" runat="server"></asp:textbox>
<asp:Button ID="Button4" runat="server" Text="..." OnClick="Button4_Click" />
<asp:Panel id="pnlCalendar" runat="server" 

     style="POSITION: absolute">
 <asp:calendar id="Calendar1" runat="server" 

      BorderColor="#999999" Font-Names="Verdana" Font-Size="8pt" 

      Height="180px" ForeColor="Black" 

      Width="200px" BackColor="White" OnSelectionChanged="Calendar1_SelectionChanged" CellPadding="4" DayNameFormat="Shortest">
  <TodayDayStyle ForeColor="Black" BackColor="#CCCCCC"></TodayDayStyle>
  <NextPrevStyle VerticalAlign="Bottom"></NextPrevStyle>
  <DayHeaderStyle Font-Bold="True" Font-Size="7pt" BackColor="#CCCCCC">
  </DayHeaderStyle>
  <SelectedDayStyle ForeColor="White" BackColor="#666666" Font-Bold="True">
  </SelectedDayStyle>
     <SelectorStyle BackColor="#CCCCCC" />
  <TitleStyle Font-Bold="True" BackColor="#999999" BorderColor="Black">
  </TitleStyle>
  <OtherMonthDayStyle ForeColor="#808080"></OtherMonthDayStyle>
     <WeekendDayStyle BackColor="#FFFFCC" />
 </asp:calendar>
</asp:Panel>
</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label15" runat="server" Text="الي/To" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:textbox id="TextBox2" runat="server"></asp:textbox>
<asp:Button ID="Button5" runat="server"  Text="..." OnClick="Button5_Click" />
                <asp:Panel id="Panel1" runat="server" 

     style="POSITION: absolute">
 <asp:calendar id="Calendar2" runat="server" 

      BorderColor="#999999" Font-Names="Verdana" Font-Size="8pt" 

      Height="180px" ForeColor="Black" 

      Width="200px" BackColor="White" OnSelectionChanged="Calendar2_SelectionChanged" CellPadding="4" DayNameFormat="Shortest">
  <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black"></TodayDayStyle>
  <NextPrevStyle VerticalAlign="Bottom"></NextPrevStyle>
  <DayHeaderStyle Font-Bold="True" Font-Size="7pt" BackColor="#CCCCCC">
  </DayHeaderStyle>
  <SelectedDayStyle ForeColor="White" BackColor="#666666" Font-Bold="True">
  </SelectedDayStyle>
     <SelectorStyle BackColor="#CCCCCC" />
  <TitleStyle Font-Bold="True" BorderColor="Black" BackColor="#999999">
  </TitleStyle>
  <OtherMonthDayStyle ForeColor="#808080"></OtherMonthDayStyle>
     <WeekendDayStyle BackColor="#FFFFCC" />
 </asp:calendar>
</asp:Panel>


</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="الفرع /Company" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:DropDownList ID="ddlcompch" runat="server"  AppendDataBoundItems="true" DataTextField="cCompName" DataValueField="cCompany" AutoPostBack="True" OnSelectedIndexChanged="ddlcompch_SelectedIndexChanged"  >
                    <asp:ListItem Text="- Select a branche -تحديد الفرع" Selected="False" />
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label16" runat="server" Text="شريك العمل /BP" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:DropDownList ID="ddlcompch0" runat="server"  AppendDataBoundItems="true" DataTextField="cCompName" DataValueField="cCompany" AutoPostBack="True" OnSelectedIndexChanged="ddlcompch0_SelectedIndexChanged"  >
                    <asp:ListItem Text="- Select a BP -تحديد شريك العمل" Selected="False" />
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
             
                <asp:Label ID="Label9" runat="server" ForeColor="Lime"></asp:Label>
                <asp:Label ID="Label10" runat="server" ForeColor="Red"></asp:Label>
             
            </td>
            <td class="auto-style2">
               
                <asp:Button ID="Button1" runat="server" Text="طباعة" OnClick="Button1_Click" />
               
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="auto-style2">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="auto-style2">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="auto-style2">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="auto-style2">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        </table>
        <table align="center" cellspacing="4"  dir="rtl">
            <tr>
                <td>
                    <div>
<div>   <asp:ScriptManager ID="ScriptManager1" runat="server">
          </asp:ScriptManager></div>
         <rsweb:reportviewer id="ReportViewer1" Enabled="false" runat="server" font-names="Verdana" font-size="8pt" waitmessagefont-names="Verdana" waitmessagefont-size="14pt" width="790px" asyncrendering="False">
                <LocalReport  ReportPath="Finance/Reports/bp.rdlc">
                    
                </LocalReport>
                 
            </rsweb:reportviewer>
    </div>

                </td>
            </tr>
            </table>
   

    
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintInvoicePeriod.aspx.cs" Inherits="Pos.Crystal.PrintInvoicePeriod" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

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
                <asp:Label ID="Label14" runat="server" Text="فترة بداية " ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:textbox id="TextBox1" runat="server"></asp:textbox>
<asp:Button ID="Button4" runat="server" Text="..." OnClick="Button4_Click" />
<asp:Panel id="pnlCalendar" runat="server" 

     style="POSITION: absolute">
 <asp:calendar id="Calendar1" runat="server" 

      BorderColor="Black" Font-Names="Verdana" Font-Size="9pt" 

      Height="250px" ForeColor="Black" 

      Width="330px" BackColor="White" OnSelectionChanged="Calendar1_SelectionChanged" BorderStyle="Solid" CellSpacing="1" NextPrevFormat="ShortMonth">
  <TodayDayStyle ForeColor="White" BackColor="#999999"></TodayDayStyle>
     <DayStyle BackColor="#CCCCCC" />
  <NextPrevStyle Font-Size="8pt" ForeColor="White" Font-Bold="True"></NextPrevStyle>
  <DayHeaderStyle ForeColor="#333333" Height="8pt" Font-Bold="True" Font-Size="8pt">
  </DayHeaderStyle>
  <SelectedDayStyle ForeColor="White" BackColor="#333399">
  </SelectedDayStyle>
  <TitleStyle Font-Bold="True" BackColor="#333399" Font-Size="12pt" ForeColor="White" Height="12pt" BorderStyle="Solid">
  </TitleStyle>
  <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>
 </asp:calendar>
</asp:Panel>
</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label15" runat="server" Text="فترة نهاية " ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:textbox id="TextBox2" runat="server"></asp:textbox>
<asp:Button ID="Button5" runat="server"  Text="..." OnClick="Button5_Click" />
                <asp:Panel id="Panel1" runat="server" 

     style="POSITION: absolute">
 <asp:calendar id="Calendar2" runat="server" 

      BorderColor="White" Font-Names="Verdana" Font-Size="9pt" 

      Height="190px" ForeColor="Black" 

      Width="350px" BackColor="White" BorderWidth="1px" OnSelectionChanged="Calendar2_SelectionChanged" NextPrevFormat="FullMonth">
  <TodayDayStyle BackColor="#CCCCCC"></TodayDayStyle>
  <NextPrevStyle Font-Size="8pt" ForeColor="#333333" Font-Bold="True" VerticalAlign="Bottom"></NextPrevStyle>
  <DayHeaderStyle Font-Bold="True" Font-Size="8pt">
  </DayHeaderStyle>
  <SelectedDayStyle ForeColor="White" BackColor="#333399">
  </SelectedDayStyle>
  <TitleStyle Font-Bold="True" BorderColor="Black" BackColor="White" BorderWidth="4px" Font-Size="12pt" ForeColor="#333399">
  </TitleStyle>
  <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>
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

        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
    </div>

                </td>
            </tr>
            </table>
   

    
    </form>
</body>
</html>

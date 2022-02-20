<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/PL/HrLayout.Master" AutoEventWireup="true" CodeBehind="AttendenceEmp.aspx.cs" Inherits="Pos.Hr.Reports.AttendenceEmp" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head111" runat="server">
      
 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder111" runat="server">

    <table align="center" cellspacing="4"  dir="rtl">
    <tr style="page-break-inside: avoid">
        <td class="auto-style1">
            <asp:Label ID="Label1" runat="server" Text="الفرع /Company" ForeColor="Red"></asp:Label>
        </td>
        <td class="auto-style1">
            <asp:DropDownList ID="ddlcompch" runat="server"  AppendDataBoundItems="true" DataTextField="cCompName" DataValueField="cCompany" AutoPostBack="True" OnSelectedIndexChanged="ddlcompch_SelectedIndexChanged"   >
                <asp:ListItem Text="- Select a branche -تحديد الفرع" Selected="False" />
            </asp:DropDownList>
        </td>
        <td class="auto-style1"></td>
    </tr>
    <tr style="page-break-inside: avoid">
        <td class="auto-style1">
            <asp:Label ID="Label13" runat="server" Text="الموظف /Emp" ForeColor="Red"></asp:Label>
        </td>
        <td class="auto-style1">
            <asp:TextBox ID="TextBox1" autocomplete="off" runat="server"></asp:TextBox>
            <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
             <asp:ListItem Text="Select  -تحديد " Selected="False" />
            </asp:DropDownList>
            <p id="para"></p>
        </td>
        <td class="auto-style1">&nbsp;</td>
    </tr>
    <tr style="page-break-inside: avoid">
        <td>
            <asp:Label ID="Label3" runat="server" Text=" الشيفت/ShiftName" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox2" ReadOnly="true" autocomplete="off" runat="server"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr style="page-break-inside: avoid">
        <td>
            <asp:Label ID="Label11" runat="server" Text="من/From" ForeColor="Red"></asp:Label>
        </td>
        <td>
        <asp:TextBox ID="txtStartDate" autocomplete="off" class="datepicker" runat="server" />  
            <asp:Button ID="Button29" runat="server" Text=".." OnClick="Button29_Click" />
                                    <asp:Panel ID="Panel13" runat="server" style="POSITION: absolute">
                                    <asp:Calendar ID="Calendar10" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="12pt" ForeColor="#003399" Height="18px" OnSelectionChanged="Calendar10_SelectionChanged" Width="18px">
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                <WeekendDayStyle BackColor="#CCCCFF" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                            </asp:Calendar>
                                        </asp:Panel>  
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr style="page-break-inside: avoid">
        <td>
            <asp:Label ID="Label12" runat="server" Text="الي/To" ForeColor="Red"></asp:Label>
        </td>
        <td>
        <asp:TextBox ID="txtEndDate" class="datepicker" autocomplete="off" runat="server" />   
            <asp:Button ID="Button2" runat="server" Text=".." OnClick="Button2_Click" />
                                    <asp:Panel ID="Panel1" runat="server" style="POSITION: absolute">
                                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="12pt" ForeColor="#003399" Height="18px" OnSelectionChanged="Calendar1_SelectionChanged" Width="18px">
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                <WeekendDayStyle BackColor="#CCCCFF" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                            </asp:Calendar>
                                        </asp:Panel>  
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr style="page-break-inside: avoid">
        <td>
            &nbsp;</td>
        <td>
           
            <asp:Button ID="Button1" runat="server" Text="طباعة/Print" OnClick="Button1_Click"  />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr style="page-break-inside: avoid">
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
        <tr>
            <td>

            </td>
            <td>

      <rsweb:reportviewer id="ReportViewer1" Enabled="false" runat="server" font-names="Verdana" font-size="8pt" waitmessagefont-names="Verdana" waitmessagefont-size="14pt" width="790px" asyncrendering="False">
                <LocalReport  ReportPath="Hr/Reports/AttendenceEmp1.rdlc">
                    
                </LocalReport>
                 
            </rsweb:reportviewer>
       <asp:ScriptManager ID="ScriptManager1" runat="server">

          </asp:ScriptManager>
             


            </td>
            <td>

                 <div>
    </div>


            </td>
        </tr>
</table>
   
 
    <script src="../../assets/jQueryv3.3.1.js"></script>
     <script type="text/javascript">
         $(function () {
             var $txt = $('input[id$=TextBox1]');
             var $ddl = $('select[id$=DropDownList2]');
             var $items = $('select[id$=DropDownList2] option');

             $txt.keyup(function () {
                 searchDdl($txt.val());
             });

             function searchDdl(item) {
                 $ddl.empty();
                 var exp = new RegExp(item, "i");
                 var arr = $.grep($items,
                     function (n) {
                         return exp.test($(n).text());
                     });

                 if (arr.length > 0) {
                     countItemsFound(arr.length);
                     $.each(arr, function () {
                         $ddl.append(this);
                         $ddl.get(0).selectedIndex = 0;
                     }
                     );
                 }
                 else {
                     countItemsFound(arr.length);
                     $ddl.append("<option>No Items Found/لم يتم العثور </option>");
                 }
             }

             function countItemsFound(num) {
                 $("#para").empty();
                 if ($txt.val().length) {
                     $("#para").html(num + " items found");
                 }

             }
         });
        </script>

      
</asp:Content>

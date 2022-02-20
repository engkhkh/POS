<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/PL/HrLayout.Master" AutoEventWireup="true" CodeBehind="EmployeeDependent.aspx.cs" Inherits="Pos.Hr.PL.EmployeeDependent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head111" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder111" runat="server">
    <table align="center" cellspacing="4" dir="rtl" __designer:mapid="99e">
        <tr style="page-break-inside: avoid" __designer:mapid="99f">
            <td class="auto-style1" __designer:mapid="9a0">
                <asp:Label ID="Label45" runat="server" ForeColor="Red" Text="اكتب رقم او اسم الموظف:"></asp:Label>
            </td>
            <td class="auto-style1" __designer:mapid="9a1">
                <asp:TextBox ID="TextBoxId0" runat="server"  Width="176px"></asp:TextBox>
            </td>
            <td class="auto-style1" __designer:mapid="9a9">&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid" __designer:mapid="99f">
            <td class="auto-style1" __designer:mapid="9a0">&nbsp;</td>
            <td class="auto-style1" __designer:mapid="9a1">
                <asp:DropDownList ID="DropDownList4" runat="server" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem  Text="اختار الموظف/Choose EmpId"   Selected="False" />
                    
                </asp:DropDownList>
                  <br />
        <p id="para"></p>
        <br /><br />
            </td>
            <td class="auto-style1" __designer:mapid="9a9">&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid" __designer:mapid="9b2">
            <td __designer:mapid="9b3">
                &nbsp;</td>
            <td class="auto-style1" __designer:mapid="9b5">
                &nbsp;</td>
            <td __designer:mapid="9b7" class="auto-style1">
                &nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid" __designer:mapid="9b9">
            <td __designer:mapid="9ba">
                <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="الأسم:"></asp:Label>
            </td>
            <td class="auto-style1" __designer:mapid="9bc">
                <asp:TextBox ID="TextBoxName" autocomplete="off" runat="server" Width="213px"></asp:TextBox>
            </td>
            <td __designer:mapid="9be" class="auto-style1">
                <asp:Label ID="Label16" runat="server" ForeColor="Red" Text=":Name"></asp:Label>
            </td>
        </tr>
        <tr style="page-break-inside: avoid" __designer:mapid="9c0">
            <td __designer:mapid="9c1">
                <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="تاريخ الميلاد:"></asp:Label>
            </td>
            <td class="auto-style1" __designer:mapid="9c3">
                <asp:textbox id="TextBoxDATE" runat="server"></asp:textbox>
                <asp:Button ID="Button12" runat="server" Text="..." OnClick="Button12_Click" />
                <asp:Panel id="pnlCalendar" runat="server" 

     style="POSITION: absolute">
                    <asp:calendar id="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="25px" Width="123px" CellPadding="1" SelectionMode="DayWeekMonth">
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:calendar>
                </asp:Panel>
            </td>
            <td __designer:mapid="9cf" class="auto-style1">
                <asp:Label ID="Label17" runat="server" ForeColor="Red" Text=":Date Of Birth"></asp:Label>
            </td>
        </tr>
        <tr style="page-break-inside: avoid" __designer:mapid="9d1">
            <td class="auto-style1" __designer:mapid="9d2"><%-- <asp:Label ID="Label13" runat="server" ForeColor="Red" Text="Account Group:"></asp:Label>--%>
                        <asp:Label ID="Label18" runat="server" ForeColor="Red" Text="السن:"></asp:Label>
            </td>
            <td class="auto-style1" __designer:mapid="9d5"><%--  <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                        </asp:DropDownList>--%>
                        <asp:TextBox ID="TextBoxage" autocomplete="off" runat="server" Width="54px"></asp:TextBox>
            </td>
            <td class="auto-style1" __designer:mapid="9d8">
                <asp:Label ID="Label19" runat="server" ForeColor="Red" Text=":Age"></asp:Label>
            </td>
        </tr>
        <tr style="page-break-inside: avoid" __designer:mapid="9da">
            <td class="auto-style1" __designer:mapid="9db"><%--  <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                        </asp:DropDownList>--%>
                        <asp:Label ID="Label20" runat="server" ForeColor="Red" Text="النوع-الجنس:"></asp:Label>
            </td>
            <td class="auto-style1" __designer:mapid="9de"><%--  <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                        </asp:DropDownList>--%>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Text="MALE-ذكر" Value="ذكر" Selected="True" />
                            <asp:ListItem Text="Female-انثي" Value="أنثي" Selected="False" />
                </asp:DropDownList>
            </td>
            <td class="auto-style1" __designer:mapid="9e3">
                <asp:Label ID="Label21" runat="server" ForeColor="Red" Text=":Gender"></asp:Label>
            </td>
        </tr>
        <tr style="page-break-inside: avoid" __designer:mapid="9e5">
            <td class="auto-style1" __designer:mapid="9e6">
                <asp:Label ID="Label22" runat="server" ForeColor="Red" Text="الجنسية:"></asp:Label>
            </td>
            <td class="auto-style1" __designer:mapid="9e8">
                <asp:TextBox ID="TextBoxphonenationality" autocomplete="off" runat="server" Width="125px"></asp:TextBox>
            </td>
            <td class="auto-style1" __designer:mapid="9ea">
                <asp:Label ID="Label23" runat="server" ForeColor="Red" Text=":Nationality"></asp:Label>
            </td>
        </tr>
        <tr style="page-break-inside: avoid" __designer:mapid="9ec">
            <td class="auto-style1" __designer:mapid="9ed">
                <asp:Label ID="Label24" runat="server" ForeColor="Red" Text="رقم الاقامة:"></asp:Label>
            </td>
            <td class="auto-style1" __designer:mapid="9ef">
                <asp:TextBox ID="TextBoxIDENTITYID" autocomplete="off" runat="server" Width="125px"></asp:TextBox>
            </td>
            <td class="auto-style1" __designer:mapid="9f4">
                <asp:Label ID="Label25" runat="server" ForeColor="Red" Text=":IdentityID"></asp:Label>
            </td>
        </tr>
        <tr style="page-break-inside: avoid" __designer:mapid="9f6">
            <td class="auto-style1" __designer:mapid="9f7">
                <asp:Label ID="Label27" runat="server" ForeColor="Red" Text="تاريخ انتهاء الاقامة:"></asp:Label>
            </td>
            <td class="auto-style1" __designer:mapid="9f9">
                <asp:TextBox ID="TextBoxdebendent" runat="server" Width="124px"></asp:TextBox>
                 <asp:Button ID="Button13" runat="server" Text="..." OnClick="Button13_Click" />
                <asp:Panel id="Panel1" runat="server" 

     style="POSITION: absolute">
                    <asp:calendar id="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="25px" Width="123px" CellPadding="1" SelectionMode="DayWeekMonth">
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:calendar>
                </asp:Panel>
            </td>
            <td class="auto-style1" __designer:mapid="9fb">
                <asp:Label ID="Label28" runat="server" ForeColor="Red" Text=":ExpiryIdentity"></asp:Label>
            </td>
        </tr>
        <tr style="page-break-inside: avoid" __designer:mapid="9fd">
            <td class="auto-style1" __designer:mapid="9fe">
                <asp:Label ID="Label29" runat="server" ForeColor="Red" Text="رقم جواز السفر :"></asp:Label>
            </td>
            <td class="auto-style1" __designer:mapid="a00">
                <asp:TextBox ID="TextBoxhome" runat="server" autocomplete="off" Width="213px"></asp:TextBox>
            </td>
            <td class="auto-style1" __designer:mapid="a02">
                <asp:Label ID="Label30" runat="server" ForeColor="Red" Text=":NoPassport"></asp:Label>
            </td>
        </tr>
        <tr style="page-break-inside: avoid" __designer:mapid="a04">
            <td class="auto-style1" __designer:mapid="a05">
                <asp:Label ID="Label31" runat="server" ForeColor="Red" Text="تاريخ انتهاء جواز السفر :"></asp:Label>
            </td>
            <td class="auto-style1" __designer:mapid="a07">
                <asp:TextBox ID="TextBoxcurrent" runat="server" Width="213px"></asp:TextBox>
                <asp:Button ID="Button14" runat="server" Text="..." OnClick="Button14_Click" />
                <asp:Panel id="Panel2" runat="server" 

     style="POSITION: absolute">
                    <asp:calendar id="Calendar3" runat="server" OnSelectionChanged="Calendar3_SelectionChanged" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="25px" Width="123px" CellPadding="1" SelectionMode="DayWeekMonth">
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:calendar>
                </asp:Panel>
            </td>
            <td class="auto-style1" __designer:mapid="a09">
                <asp:Label ID="Label32" runat="server" ForeColor="Red" Text=":ExpiryPassport"></asp:Label>
            </td>
        </tr>
        <tr style="page-break-inside: avoid" __designer:mapid="a0b">
            <td class="auto-style1" __designer:mapid="a0c">
                <asp:Label ID="Label33" runat="server" ForeColor="Red" Text="صلة القرابة :"></asp:Label>
            </td>
            <td class="auto-style1" __designer:mapid="a0e">
                <asp:TextBox ID="TextBoxphone" runat="server" autocomplete="off" Width="153px"></asp:TextBox>
            </td>
            <td class="auto-style1" __designer:mapid="a10">
                <asp:Label ID="Label34" runat="server" ForeColor="Red" Text=":Relative Relation"></asp:Label>
            </td>
        </tr>
        <tr style="page-break-inside: avoid" __designer:mapid="a2e">
            <td __designer:mapid="a2f">
                <asp:Label ID="Label9" runat="server" ForeColor="Lime"></asp:Label>
            </td>
            <td class="auto-style1" __designer:mapid="a31">
                <asp:Button ID="Button15" runat="server" OnClick="Button15_Click" Text="تسجيل البيانات/Save" />
            </td>
            <td __designer:mapid="a33" class="auto-style1">&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid" __designer:mapid="a34">
            <td __designer:mapid="a35">
                <asp:Label ID="Label10" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style1" __designer:mapid="a37">&nbsp;</td>
            <td __designer:mapid="a38" class="auto-style1">&nbsp;</td>
        </tr>
    </table>
    <script src="../../assets/jQueryv3.3.1.js"></script>
    <script type="text/javascript">
        $(function() {
            var $txt = $('input[id$=TextBoxId0]');
            var $ddl = $('select[id$=DropDownList4]');
            var $items = $('select[id$=DropDownList4] option');
 
            $txt.keyup(function() {
                searchDdl($txt.val());
            });
 
            function searchDdl(item) {
                $ddl.empty();
                var exp = new RegExp(item, "i");
                var arr = $.grep($items,
                    function(n) {
                        return exp.test($(n).text());
                    });
 
                if (arr.length > 0) {
                    countItemsFound(arr.length);
                    $.each(arr, function() {
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

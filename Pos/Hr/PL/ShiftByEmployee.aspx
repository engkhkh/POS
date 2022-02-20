<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/PL/HrLayout.Master" AutoEventWireup="true" CodeBehind="ShiftByEmployee.aspx.cs" Inherits="Pos.Hr.PL.ShiftByEmployee" %>
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
                <asp:Label ID="Label11" runat="server" Text="اسم الشيفت /Shift " ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="TextBox1" autoomplete="off" placeholder="بحث باااسم الشيفت  " runat="server"></asp:TextBox>
                <asp:DropDownList ID="ddlcompch0" runat="server"  AppendDataBoundItems="true" DataTextField="cCompName" DataValueField="cCompany" AutoPostBack="True" OnSelectedIndexChanged="ddlcompch0_SelectedIndexChanged"   >
                    <asp:ListItem Text="- Select تحديد " Selected="False" />
                </asp:DropDownList>
                <p id="para">
                </p>
            </td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                <asp:Label ID="Label3" runat="server" Text="الموظف/Emp" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" autocomplete="off" placeholder="بحث باااسم الموظف  " runat="server"></asp:TextBox>
                <asp:DropDownList ID="ddlcompch1" runat="server"  AppendDataBoundItems="true" DataTextField="cCompName" DataValueField="cCompany" AutoPostBack="True" OnSelectedIndexChanged="ddlcompch1_SelectedIndexChanged"   >
                    <asp:ListItem Text="- Select تحديد " Selected="False" />
                </asp:DropDownList>
                <p id="para1">
                </p>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                <asp:Label ID="Label9" runat="server" ForeColor="Lime"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="تسجيل البيانات/Save" OnClick="Button1_Click"  />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                <asp:Label ID="Label10" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>






      <script src="../../assets/jQueryv3.3.1.js"></script>
    <script type="text/javascript">
        $(function() {
            var $txt = $('input[id$=TextBox1]');
            var $ddl = $('select[id$=ddlcompch0]');
            var $items = $('select[id$=ddlcompch0] option');
 
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
    <script type="text/javascript">
        $(function () {
            var $txt = $('input[id$=TextBox2]');
            var $ddl = $('select[id$=ddlcompch1]');
            var $items = $('select[id$=ddlcompch1] option');

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
                $("#para1").empty();
                if ($txt.val().length) {
                    $("#para1").html(num + " items found");
                }

            }
        });
        </script>


</asp:Content>

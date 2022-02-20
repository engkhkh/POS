<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/PL/HrLayout.Master" AutoEventWireup="true" CodeBehind="Shifts.aspx.cs" Inherits="Pos.Hr.PL.Shifts" %>
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
        <td>
            <asp:Label ID="Label3" runat="server" Text="اسم الشيفت/ShiftName" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxshift" runat="server" placeholder=""  autocomplete="off" ></asp:TextBox>
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

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Finance/PL/FinanceLayout.Master" AutoEventWireup="true" CodeBehind="AddLevel.aspx.cs" Inherits="Pos.Hr.PL.AddLevel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            <asp:Label ID="Label2" runat="server" Text="الكود/Code" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxlevelid" runat="server" ReadOnly="True" ></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr style="page-break-inside: avoid">
        <td>
            <asp:Label ID="Label3" runat="server" Text="المستوي/Level" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxlevelName" runat="server" autocomplete="off" ></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr style="page-break-inside: avoid">
        <td class="auto-style1">&nbsp;</td>
        <td class="auto-style1">&nbsp;</td>
        <td class="auto-style1"></td>
    </tr>
    <tr style="page-break-inside: avoid">
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>
            <asp:Label ID="Label11" runat="server" Text=" "></asp:Label>
        </td>
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

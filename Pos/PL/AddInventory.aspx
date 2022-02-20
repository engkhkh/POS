<%@ Page Title="" Language="C#" MasterPageFile="../PL/SalesLayout.master" AutoEventWireup="true" CodeBehind="AddInventory.aspx.cs" Inherits="Pos.PL.AddInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
table{border-collapse:collapse}*,::after,::before{box-sizing:inherit}*,::after,::before{text-shadow:none!important;box-shadow:none!important}
        .auto-style1 {
            height: 28px;
        }
    tbody tr td {
  font-family: 'Roboto', sans-serif;
  color: #868e96;
}
button,select{text-transform:none}button,input,optgroup,select,textarea{margin:0;font-family:inherit;font-size:inherit;line-height:inherit}button,input{overflow:visible}[type=reset],[type=submit],button,html [type=button]{-webkit-appearance:button}</style>
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
                <asp:Label ID="Label2" runat="server" Text="كود المخزن/InventoryId" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxInventID" runat="server" ReadOnly="True" ></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                <asp:Label ID="Label3" runat="server" Text="اسم المخزن/InventoryName" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxInventName" runat="server" autocomplete="off" ></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                <asp:Label ID="Label12" runat="server" Text="تفاصيل/Details" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxInventDetails" runat="server" autocomplete="off" TextMode="MultiLine" ></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>&nbsp;</td>
            <td>&nbsp;&nbsp;</td>
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

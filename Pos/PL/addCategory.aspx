<%@ Page Title="" Language="C#" MasterPageFile="../PL/SalesLayout.master" AutoEventWireup="true" CodeBehind="addCategory.aspx.cs" Inherits="Pos.PL.addCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div>

    <table align="center" cellspacing="4"  dir="rtl">
    <tr>
        <td class="auto-style1">
            <asp:Label ID="Label1" runat="server" Text="الفرع /Company" ForeColor="Red"></asp:Label>
        </td>
        <td class="auto-style1">
            <asp:DropDownList ID="ddlcompch" runat="server"  AppendDataBoundItems="true" DataTextField="cCompName" DataValueField="cCompany" AutoPostBack="True" OnSelectedIndexChanged="ddlcompch_SelectedIndexChanged"   > <asp:ListItem Text="- Select a branche -تحديد الفرع" Selected="False" />   
            </asp:DropDownList>
        </td>
        <td class="auto-style1"></td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="رقم الصنف/CategoryID" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxCATID" runat="server" ReadOnly="True" ></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="اسم الصنف/CategoryName" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxCATNAME" runat="server" autocomplete="off" ></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;&nbsp;</td>
        <td>
            <asp:Label ID="Label11" runat="server" Text=" "></asp:Label>
        </td>
       
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label9" runat="server" ForeColor="Lime"></asp:Label>
        </td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="حفظ الصنف /Save" OnClick="Button1_Click"  />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label10" runat="server" ForeColor="Red"></asp:Label>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>


    </div>

</asp:Content>

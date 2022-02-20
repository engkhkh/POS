<%@ Page Title="" Language="C#" MasterPageFile="../PL/SalesLayout.master" AutoEventWireup="true" CodeBehind="addUser.aspx.cs" Inherits="Pos.PL.addUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <table align="center" cellspacing="4"  dir="rtl">
        <tr>
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
        <tr>
            <td>
                <asp:Label ID="Label15" runat="server" Text="رقم الموظف/EmpNO" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxUserno" runat="server" ReadOnly="True" ></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="الاسم المستخدم للدخول/UserNameLogin" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxUserNameLogin" runat="server" autocomplete="off"  ></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="الباسورد/Password" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxPassword" runat="server" autocomplete="off" ></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="نوع المستخدم/UserNameType" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlcompUSERTYPE" runat="server"  AppendDataBoundItems="true"  AutoPostBack="True" OnSelectedIndexChanged="ddlcompch1_SelectedIndexChanged"   >
                     <asp:ListItem Text="user" Selected="True" />
                    <asp:ListItem Text="admin" Selected="False" />
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label13" runat="server" Text="اسم الموظف/FullName" ForeColor="Red"></asp:Label>
            </td>
            <td>&nbsp;&nbsp;<asp:TextBox ID="TextBoxfullname" runat="server" autocomplete="off" ></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Label11" runat="server" Text=" "></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label14" runat="server" Text="عنوان الموظف/EmpDetails" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxaddress" runat="server" autocomplete="off" ></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" ForeColor="Lime"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="حفظ  /Save" OnClick="Button1_Click"  />
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



</asp:Content>

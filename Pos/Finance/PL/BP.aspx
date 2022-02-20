<%@ Page Title="" Language="C#" MasterPageFile="~/Finance/PL/FinanceLayout.Master" AutoEventWireup="true" CodeBehind="BP.aspx.cs" Inherits="Pos.Hr.PL.BP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Button ID="Button2" runat="server" Text="Group/مجموعة " Width="100px" OnClick="Button2_Click" /> 
    <asp:Button ID="Button3" runat="server" Text="BP/شريك" OnClick="Button3_Click" />
    <asp:Button ID="Button4" runat="server" Text="Button" />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table align="center" cellspacing="4" dir="rtl">
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="الفرع /Company"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlcompch" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddlcompch_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a branche -تحديد الفرع" />
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="الكود/Code"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxlevelid" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="المجموعة/Bp Group Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxlevelName" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <%--<asp:Label ID="Label12" runat="server" ForeColor="Red" Text="DayBook"></asp:Label>--%>
                    </td>
                    <td class="auto-style1">
                       <%-- <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                            <asp:ListItem Text="JV" Value="111" Selected="False" />
                             <asp:ListItem Text="pv" Value="111"  Selected="False" />
                        </asp:DropDownList>--%>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                       <%-- <asp:Label ID="Label13" runat="server" ForeColor="Red" Text="Account Group:"></asp:Label>--%>
                    </td>
                    <td class="auto-style1">
                      <%--  <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                        </asp:DropDownList>--%>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label14" runat="server" ForeColor="Red" Text="Account:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" AutoPostBack="True">

                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label15" runat="server" ForeColor="Red" Text="BP Type:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList4" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                             <asp:ListItem Text="Supplier" Value="300" Selected="False" />
                             <asp:ListItem Text="Customer" Value="400" Selected="False" />
                            <asp:ListItem Text="Other" Value="500" Selected="False" />
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label9" runat="server" ForeColor="Lime"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="تسجيل البيانات/Save" />
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
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table align="center" cellspacing="4" dir="rtl">
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label16" runat="server" ForeColor="Red" Text="الفرع /Company"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlcompch0" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddlcompch0_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a branche -تحديد الفرع" />
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label18" runat="server" ForeColor="Red" Text="المجموعة/Bp Group Name"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList7" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged">
                         <asp:ListItem Selected="False" Text="- Select a group -تحديد المجموعة" />
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label17" runat="server" ForeColor="Red" Text="الكود/Code"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxBPID" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label24" runat="server" ForeColor="Red" Text="الاسم/name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxBPNAME" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1"><%--<asp:Label ID="Label12" runat="server" ForeColor="Red" Text="DayBook"></asp:Label>--%>
                        <asp:Label ID="Label25" runat="server" ForeColor="Red" Text="الايميل/email"></asp:Label>
                    </td>
                    <td class="auto-style1"><%-- <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                            <asp:ListItem Text="JV" Value="111" Selected="False" />
                             <asp:ListItem Text="pv" Value="111"  Selected="False" />
                        </asp:DropDownList>--%>
                        <asp:TextBox ID="TextBoxBPEMAIL" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1"><%-- <asp:Label ID="Label13" runat="server" ForeColor="Red" Text="Account Group:"></asp:Label>--%>
                        <asp:Label ID="Label26" runat="server" ForeColor="Red" Text="الهاتف/phone"></asp:Label>
                    </td>
                    <td class="auto-style1"><%--  <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                        </asp:DropDownList>--%>
                        <asp:TextBox ID="TextBoxBPPHONE" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label27" runat="server" ForeColor="Red" Text="المدينه/city"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxBPCITY" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label28" runat="server" ForeColor="Red" Text="---/zipcode"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxBPZIP" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label21" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label22" runat="server" ForeColor="Lime"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="تسجيل البيانات/Save" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label23" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server"></asp:View>
    </asp:MultiView>


</asp:Content>

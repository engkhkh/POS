<%@ Page Title="" Language="C#" MasterPageFile="~/Finance/PL/FinanceLayout.Master" AutoEventWireup="true" CodeBehind="ChartOfAccounts.aspx.cs" Inherits="Pos.Hr.PL.ChartOfAccounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button1" runat="server" Text="اضافة المستوي الثاني " OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="اضافة المستوي الثالث" OnClick="Button2_Click" />
    <asp:Button ID="Button3" runat="server" Text="اضافة المستوي لرابع " OnClick="Button3_Click" />
    <asp:Button ID="Button4" runat="server" Text="اضافة المستوي الخامس " OnClick="Button4_Click" />
    <asp:TreeView ID="TreeView1" runat="server">

    </asp:TreeView>
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
                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="المجموعة/Group"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddllevel2" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddllevel2_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a group -تحديد المجموعة" />
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label44" runat="server" ForeColor="Red" Text="اضافته بعد هذه المجموعة"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddllevel12" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddllevel12_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a group -تحديد المجموعة" />
                         
                                
                             
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="الكود/Code"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxcode" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label12" runat="server" ForeColor="Red" Text="اسم المجموعة"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxgroupnameA" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label13" runat="server" ForeColor="Red" Text="المجموعة بالانجليزي"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxgroupnameE" runat="server" autocomplete="off"></asp:TextBox>
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
                        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="تسجيل البيانات/Save" />
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
                        <asp:Label ID="Label14" runat="server" ForeColor="Red" Text="الفرع /Company"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlcompch0" runat="server" AppendDataBoundItems="true" AutoPostBack="True"  OnSelectedIndexChanged="ddlcompch0_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a branche -تحديد الفرع" />
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label15" runat="server" ForeColor="Red" Text="المجموعة/Group"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddllevel3" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddllevel3_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a group -تحديد المجموعة" />
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label22" runat="server" ForeColor="Red" Text="يضاف بعد هذه المجموعة"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddllevel4" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddllevel4_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a group -تحديد المجموعة" />
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label16" runat="server" ForeColor="Red" Text="الكود/Code"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxcode0" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label17" runat="server" ForeColor="Red" Text="اسم المجموعة"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxgroupnameA0" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label18" runat="server" ForeColor="Red" Text="المجموعة بالانجليزي"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxgroupnameE0" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label19" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label20" runat="server" ForeColor="Lime"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="تسجيل البيانات/Save" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label21" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <table align="center" cellspacing="4" dir="rtl">
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label23" runat="server" ForeColor="Red" Text="الفرع /Company"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlcompch1" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddlcompch1_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a branche -تحديد الفرع" />
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label24" runat="server" ForeColor="Red" Text="المجموعة/Group"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddllevel5" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddllevel5_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a group -تحديد المجموعة" />
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label25" runat="server" ForeColor="Red" Text="يضاف بعد هذا الحساب "></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddllevel6" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddllevel6_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a account -تحديد الحساب" />
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label26" runat="server" ForeColor="Red" Text="الكود/Code"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxcode1" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label27" runat="server" ForeColor="Red" Text="اسم الحساب "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxgroupnameA1" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label28" runat="server" ForeColor="Red" Text="الحساب بالانجليزي"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxgroupnameE1" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label29" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label30" runat="server" ForeColor="Lime"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="تسجيل البيانات/Save" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label31" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <table align="center" cellspacing="4" dir="rtl">
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label33" runat="server" ForeColor="Red" Text="الفرع /Company"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlcompch2" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddlcompch2_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a branche -تحديد الفرع" />
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label34" runat="server" ForeColor="Red" Text="المجموعة/Group"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddllevel8" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddlcompch_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a group -تحديد المجموعة" />
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label35" runat="server" ForeColor="Red" Text="المجموعة/Group"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddllevel9" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddlcompch_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a group -تحديد المجموعة" />
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label36" runat="server" ForeColor="Red" Text="المجموعة/Group"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddllevel10" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddlcompch_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a group -تحديد المجموعة" />
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label43" runat="server" ForeColor="Red" Text="المجموعة/Group"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddllevel11" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddlcompch_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a group -تحديد المجموعة" />
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label37" runat="server" ForeColor="Red" Text="الكود/Code"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxcode2" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label38" runat="server" ForeColor="Red" Text="أسم الحساب "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxgroupnameA2" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label39" runat="server" ForeColor="Red" Text="أسم الحساب بالانجليزي"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxgroupnameE2" runat="server" autocomplete="off"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label40" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label41" runat="server" ForeColor="Lime"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="Button8" runat="server" OnClick="Button1_Click" Text="تسجيل البيانات/Save" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label42" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

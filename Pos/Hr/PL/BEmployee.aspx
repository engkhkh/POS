<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/PL/HrLayout.Master" AutoEventWireup="true" CodeBehind="BEmployee.aspx.cs" Inherits="Pos.Hr.PL.BEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head111" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder111" runat="server">

   

    <table align="center" class="auto-style1" dir="ltr">
        <tr>
            <td>&nbsp;</td>
            <td>

                
                <asp:TextBox ID="TextBox1" autocomplete="off" placeholder="EmpID /Emp Name" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="بحث /Search" OnClick="Button1_Click" />

                
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6"  OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5"   >
                    <Columns>  
               
                        <asp:TemplateField HeaderText="EmpID/الرقم الوظيفي " >  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ID"  runat="server" Text='<%#Eval("cEmpId") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="EmpName/أسم الموظف ">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_prodname" runat="server" BackColor="#98FA05" Text='<%#Eval("cEmpAname") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                         <asp:TemplateField HeaderText="BasicData/البيانات الاساسية ">  
                    <ItemTemplate>  
                        <asp:LinkButton ID="lnkView" runat="server" Text="Update/تحديث " CommandName="Select"  OnCommand="lnkView_Click" CommandArgument='<%#Eval("cEmpId") %>'/> 
                    </ItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="Dependent/المعالين ">  
                    <ItemTemplate>  
                        <asp:LinkButton ID="lnkView2" runat="server" Text="Update/تحديث" CommandName="Select" OnCommand="lnkView2_Click" CommandArgument='<%#Eval("cEmpId") %>' /> 
                    </ItemTemplate>  
                </asp:TemplateField>
                          <asp:TemplateField HeaderText="Employement/بيانات التوظيف والعقد ">  
                    <ItemTemplate>  
                        <asp:LinkButton ID="lnkView3" runat="server" Text="Update/تحديث" CommandName="Select" OnCommand="lnkView3_Click" CommandArgument='<%#Eval("cEmpId") %>' /> 
                    </ItemTemplate>  
                </asp:TemplateField>

                         
                       
                         
                        </Columns>
                     <HeaderStyle BackColor="" ForeColor="black"/>  
            
                </asp:GridView>
              </td>
        </tr>
    </table>



</asp:Content>

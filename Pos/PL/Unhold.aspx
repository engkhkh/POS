<%@ Page Title="" Language="C#" MasterPageFile="~/PL/SalesLayout.Master" AutoEventWireup="true" CodeBehind="Unhold.aspx.cs" Inherits="Pos.PL.Unhold" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <table align="center" cellspacing="4"  dir="rtl">
    <tr>
        <td class="auto-style1">
            <asp:Label ID="Label16" runat="server" Text="نوع الفاتورة " ForeColor="Red"></asp:Label>
        </td>
        <td class="auto-style1">
            <asp:RadioButton ID="RadioButton1" runat="server" Text="معلقة" />
            <asp:RadioButton ID="RadioButton2" runat="server" Text="مرتجع" />
        </td>
        <td class="auto-style1">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style1">
            <asp:Label ID="Label1" runat="server" Text="الفرع /Company" ForeColor="Red"></asp:Label>
        </td>
        <td class="auto-style1">
            <asp:DropDownList ID="ddlcompch" runat="server"  AppendDataBoundItems="true" DataTextField="cCompName" DataValueField="cCompany" AutoPostBack="True"    >
                <asp:ListItem Text="تحديد الفرع" Selected="False" />
            </asp:DropDownList>
        </td>
        <td class="auto-style1"></td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="الكاشير" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddluser" runat="server"  AppendDataBoundItems="true"  AutoPostBack="True" OnSelectedIndexChanged="ddluser_SelectedIndexChanged"    >
                <asp:ListItem Text="تحديد الكاشير" Selected="False" />
            </asp:DropDownList>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label17" runat="server" Text="الفواتير المعلقة بواسطة الكاشير " ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlinvoiceholding" runat="server"  AppendDataBoundItems="true"  AutoPostBack="True" OnSelectedIndexChanged="ddlinvoiceholding_SelectedIndexChanged"    >
                <asp:ListItem Text="تحديد الفاتورة" Selected="False" />
            </asp:DropDownList>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label15" runat="server" Text="ادخال رقم الفاتورة في حالة المرتجع" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxOrderId" runat="server" autocomplete="off" ></asp:TextBox>
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
            <asp:Label ID="Label9" runat="server" ForeColor="Lime"></asp:Label>
            <asp:Label ID="Label10" runat="server" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="عرض" OnClick="Button1_Click"  />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;&nbsp;</td>
        <td>
            <asp:Label ID="Label11" runat="server" Text=" "></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6"  OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanging="GridView1_SelectedIndexChanging"   >
                    <Columns>  
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="*" CommandName="Edit" />  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="تحديث" CommandName="Update"/>  
                        <asp:Button ID="btn_Cancel" runat="server" Text="حذف" CommandName="Cancel"/>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="كود الصنف" Visible="false">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ID" Visible="false" runat="server" Text='<%#Eval("cPId") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="الصنف">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_prodname" runat="server" BackColor="#98FA05" Text='<%#Eval("cProdName") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                         <asp:TemplateField HeaderText="الكمية">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("cQty") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_qty" TextMode="Number"  min="0" max="100" step="1" Width="60px" autocomplete="off" runat="server" Text='<%#Eval("cQty") %>'></asp:TextBox>  
                        
                    </EditItemTemplate>  
                </asp:TemplateField> 
                        <asp:TemplateField HeaderText="السعر">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_price" runat="server" Text='<%#Eval("cPrice") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_price" TextMode="Number"  min="1" max="1000" step=".5" Width="60px" autocomplete="off"  runat="server" Text='<%#Eval("cPrice") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                        <asp:TemplateField HeaderText="السعر الكلي">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_pricet" runat="server" Text='<%#Eval("cTotal") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_pricet" Width="50px" ReadOnly="true" autocomplete="off"  runat="server" Text='<%#Eval("cPrice") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 

                        </Columns>
                     <HeaderStyle BackColor="" ForeColor="black"/>  
            
                  <RowStyle BackColor=""/> 

                </asp:GridView>
            </td>
        <td>
            <asp:DropDownList ID="DropDownListclient" runat="server" Visible="False">
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownListpaymenttype" runat="server" Visible="False">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>قيمة الضريبة<asp:TextBox ID="TextBoxvat" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:Button ID="btnhsaved" runat="server" OnClick="btnhsaved_Click" Text="حفظ البيانات لانهاء فاتورة معلقة " Visible="False" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            عدد العناصر
            <asp:Label ID="Labeltotalitems" runat="server"></asp:Label>
        </td>
        <td>
            <asp:Button ID="btnsaveorders" runat="server" OnClick="btnsaveorders_Click" Text="حفظ البيانات لانهاء فاتورة مرتجعة" Visible="False" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>اجمالي السعر
            <asp:Label ID="Labeltotal" runat="server"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>



</asp:Content>

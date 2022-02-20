<%@ Control Language="C#" AutoEventWireup="true" Codefile="ProductsInventoryUserControl.ascx.cs" Inherits="Pos.PL.ProductsInventoryUserControl" %>
<style type="text/css">
    .auto-style1 {
        height: 28px;
    }
</style>




<table align="center" cellspacing="4"  dir="rtl">
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="الفرع /Company" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlcompch" runat="server"  AppendDataBoundItems="true" DataTextField="cCompName" DataValueField="cCompany" AutoPostBack="True" OnSelectedIndexChanged="ddlcompch_SelectedIndexChanged"  > <asp:ListItem Text="- Select a branche -تحديد الفرع" Selected="False" />   
            </asp:DropDownList>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label12" runat="server" Text="المخزن/Inventory" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlInventory" runat="server" AutoPostBack="True" > <asp:ListItem Text="Inventory - اختار المخزن" Selected="False" />  
            </asp:DropDownList>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="الصنف/Category" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlcateg" runat="server" AutoPostBack="True" > <asp:ListItem Text="-  Category - الصنف" Selected="False" />  
            </asp:DropDownList>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style1">
            <asp:Label ID="Label3" runat="server" Text="رقم الصنف/ProductID" ForeColor="Red"></asp:Label>
        </td>
        <td class="auto-style1">
            <asp:TextBox ID="TextBoxpid" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
        <td class="auto-style1"></td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label4" runat="server" Text="المنتج/ProductName" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxpdname" runat="server" EnableViewState="false" autocomplete="off" ></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label5" runat="server" Text="الكمية بالمخزن /ProductQuantity" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxpdqty" runat="server" EnableViewState="false" autocomplete="off" ></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label13" runat="server" Text="الوحدة/Unit" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlunit" runat="server" AutoPostBack="True" > <asp:ListItem Text="type - النوع" Selected="False" />  
            </asp:DropDownList>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label6" runat="server" Text="سعر الشراء/PurchsePricePerUnit" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxpdpurchaseprice" runat="server" EnableViewState="false" autocomplete="off" ></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label7" runat="server" Text="سعر البيع/SalesPricePerUnit" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxpdsalesprice" runat="server" EnableViewState="false" autocomplete="off" ></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label14" runat="server" Text="معرف الباركود/BarCodeId" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxpdbarcode" runat="server" EnableViewState="false" autocomplete="off" ></asp:TextBox>
          </td>
        <td>
            <asp:Label ID="Label11" runat="server" Text=" "></asp:Label>
        </td>
       
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label15" runat="server" Text="المورد/Supplier" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlsup" runat="server" AutoPostBack="True" > <asp:ListItem Text="Supplier - المورد" Selected="False" />  
            </asp:DropDownList>
        </td>
        <td>
            &nbsp;</td>
       
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label9" runat="server" ForeColor="Lime"></asp:Label>
        </td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="تسجيل المنتج/Save" OnClick="Button1_Click" />
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





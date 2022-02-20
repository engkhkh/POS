<%@ Control Language="C#" AutoEventWireup="true" Codefile="Itemusercontrol.ascx.cs" Inherits="Pos.PL.Itemusercontrol" %>




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
            <asp:Label ID="Label2" runat="server" Text="الصنف/Category" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlcateg" runat="server" AutoPostBack="True" > <asp:ListItem Text="-  Category - الصنف" Selected="False" />  
            </asp:DropDownList>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="رقم الصنف/ProductID" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxpid" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
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
            <asp:Label ID="Label5" runat="server" Text="الكمية الافتراضية /ProductQuantity" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxpdqty" runat="server" EnableViewState="false" autocomplete="off" ></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label12" runat="server" Text="الوحدة/Unit" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlunit" runat="server" AutoPostBack="True" > <asp:ListItem Text="-  type - النوع" Selected="False" />  
            </asp:DropDownList>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label6" runat="server" Text="سعر البيع للوحدة/ProductSalesPrice" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxpdprice" runat="server" EnableViewState="false" autocomplete="off" ></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label13" runat="server" Text="سعر التكلفة للوحدة/ProductCost" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxpdcost" runat="server" EnableViewState="false" autocomplete="off" ></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label7" runat="server" Text="معرف الباركود/Barcode" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxpdbarcode" runat="server" EnableViewState="false" autocomplete="off" ></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label8" runat="server" Text="صورة المنتج/ProductImage" ForeColor="Red"></asp:Label>
        </td>
        <td>
            <input id="File1" type="file" runat = "server" />
            &nbsp;</td>
        <td>
            <asp:Label ID="Label11" runat="server" Text=" "></asp:Label>
            <asp:Image ID="Imageprod" runat="server" Width="79px" />
        </td>
       
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label9" runat="server" ForeColor="Lime"></asp:Label>
        </td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="حفظ المنتج دون مخزن/Save" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="افتح الكيبورد" OnClick="Button2_Click" />
            <asp:HyperLink ID="HyperLink1" NavigateUrl="/PL/ItemsInventory.aspx" Target="_top" runat="server">جرد المنتجات </asp:HyperLink>
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




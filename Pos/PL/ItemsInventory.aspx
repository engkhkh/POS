<%@ Page Title="" Language="C#" MasterPageFile="../PL/SalesLayout.master" AutoEventWireup="true" CodeBehind="ItemsInventory.aspx.cs" Inherits="Pos.PL.ItemsInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <table align="center" cellspacing="4"  dir="rtl">
        <tr>
            <td>
                <asp:Label ID="Label14" runat="server" Text="فترة بداية الجرد" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:textbox id="TextBox1" runat="server"></asp:textbox>
<asp:Button ID="Button4" runat="server" Text="..." OnClick="Button4_Click" />
<asp:Panel id="pnlCalendar" runat="server" 

     style="POSITION: absolute">
 <asp:calendar id="Calendar1" runat="server" CellPadding="1" 

      BorderColor="#3366CC" Font-Names="Verdana" Font-Size="8pt" 

      Height="10px" ForeColor="#003399" DayNameFormat="Shortest" 

      Width="10px" BackColor="White" BorderWidth="1px" OnSelectionChanged="Calendar1_SelectionChanged">
  <TodayDayStyle ForeColor="White" BackColor="#99CCCC"></TodayDayStyle>
  <SelectorStyle BackColor="#99CCCC" ForeColor="#336666"></SelectorStyle>
  <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF"></NextPrevStyle>
  <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px">
  </DayHeaderStyle>
  <SelectedDayStyle Font-Bold="True" ForeColor="#CCFF99" BackColor="#009999">
  </SelectedDayStyle>
  <TitleStyle Font-Bold="True" BorderColor="#3366CC" BackColor="#003399" BorderWidth="1px" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px">
  </TitleStyle>
  <WeekendDayStyle BackColor="#CCCCFF"></WeekendDayStyle>
  <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>
 </asp:calendar>
</asp:Panel>
</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label15" runat="server" Text="فترة نهاية الجرد" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:textbox id="TextBox2" runat="server"></asp:textbox>
<asp:Button ID="Button5" runat="server" Enabled="false" Text="..." OnClick="Button5_Click" />
                <asp:Panel id="Panel1" runat="server" 

     style="POSITION: absolute">
 <asp:calendar id="Calendar2" runat="server" CellPadding="1" 

      BorderColor="#3366CC" Font-Names="Verdana" Font-Size="8pt" 

      Height="10px" ForeColor="#003399" DayNameFormat="Shortest" 

      Width="10px" BackColor="White" BorderWidth="1px" OnSelectionChanged="Calendar2_SelectionChanged">
  <TodayDayStyle ForeColor="White" BackColor="#99CCCC"></TodayDayStyle>
  <SelectorStyle BackColor="#99CCCC" ForeColor="#336666"></SelectorStyle>
  <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF"></NextPrevStyle>
  <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px">
  </DayHeaderStyle>
  <SelectedDayStyle Font-Bold="True" ForeColor="#CCFF99" BackColor="#009999">
  </SelectedDayStyle>
  <TitleStyle Font-Bold="True" BorderColor="#3366CC" BackColor="#003399" BorderWidth="1px" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px">
  </TitleStyle>
  <WeekendDayStyle BackColor="#CCCCFF"></WeekendDayStyle>
  <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>
 </asp:calendar>
</asp:Panel>


</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="الفرع /Company" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlcompch" runat="server"  AppendDataBoundItems="true" DataTextField="cCompName" DataValueField="cCompany" AutoPostBack="True" OnSelectedIndexChanged="ddlcompch_SelectedIndexChanged"  >
                    <asp:ListItem Text="- Select a branche -تحديد الفرع" Selected="False" />
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="الصنف/Category" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlcateg" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlcateg_SelectedIndexChanged" >
                    <asp:ListItem Text="-  Category - الصنف" Selected="False" />
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label16" runat="server" Text="المنتج/Product" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlproduct" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlproduct_SelectedIndexChanged" >
                    <asp:ListItem Text="Product - المنتج" Selected="False" />
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
                <asp:TextBox ID="TextBoxpdname" runat="server" ReadOnly="True" EnableViewState="false" autocomplete="off" ></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="الكمية الافتراضية /ProductQuantity" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxpdqty" runat="server"  EnableViewState="false" autocomplete="off" ></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="الوحدة/Unit" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlunit" runat="server" AutoPostBack="True" >
                    <asp:ListItem Text="-  type - النوع" Selected="False" />
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
                <asp:Label ID="Label7" runat="server" Text="الكمية المباعة " ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxpdsaleditem" runat="server"  EnableViewState="false" autocomplete="off" ></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label17" runat="server" Text="الكمية المتبقية" ForeColor="Red"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="TextBoxpdremaining" runat="server"  EnableViewState="false" autocomplete="off" ></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Label11" runat="server" Text=" "></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label18" runat="server" Text="الكمية الجديدة " ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxpdnew" runat="server" EnableViewState="false" autocomplete="off" ></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label19" runat="server" Text="بيان الجرد" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxpdTOPIC" runat="server" EnableViewState="false" autocomplete="off" TextMode="MultiLine" ></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" ForeColor="Lime"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="تحديث /Save" OnClick="Button1_Click" />
               <!-- <asp:Button ID="Button2" runat="server" Text="افتح الكيبورد" OnClick="Button2_Click" />-->
               <!-- <asp:HyperLink ID="HyperLink1" NavigateUrl="/PL/ItemsInventory.aspx" Target="_top" runat="server">الجرد</asp:HyperLink>-->
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

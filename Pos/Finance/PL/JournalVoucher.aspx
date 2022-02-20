<%@ Page Title="" Language="C#" MasterPageFile="~/Finance/PL/FinanceLayout.Master" AutoEventWireup="true" CodeBehind="JournalVoucher.aspx.cs" Inherits="Pos.Hr.PL.JournalVoucher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    
   
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
            <td class="auto-style3">
                <asp:Label ID="Label12" runat="server" Text="التاريخ /Date" ForeColor="Red"></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style1"><asp:Button ID="Button4" runat="server" Text="..." OnClick="Button4_Click" />
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
</asp:Panel></td>
            <td class="auto-style1">
                
                <asp:Button ID="Button6"  runat="server" BackColor="Lime" OnClick="Button6_Click" Text="قيد جديد /New Entry"  />
                
            </td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                <asp:Label ID="Label2" runat="server" Text="نوع القيد/VoucherType" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Text="JV" Value="100" Selected="True" />
                    <asp:ListItem Text="PV" Value="200" Selected="False" />
                    <asp:ListItem Text="RV" Value="300" Selected="False" />
                </asp:DropDownList>
            </td>
            <td >
                <asp:Label ID="Label13" runat="server" Text="تسلسل القيد/Voucher Series " ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Text="2018" Value="2018" Selected="False" />
                    <asp:ListItem Text="2019" Value="2019" Selected="False" />
                    <asp:ListItem Text="2020" Value="2020" Selected="True" />
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                <asp:Label ID="Label14" runat="server" Text="Currency And Exchange Rate :" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Text="USD" Value="100" Selected="False" />
                    <asp:ListItem Text="EUR" Value="200" Selected="False" />
                    <asp:ListItem Text="SAR" Value="300" Selected="True" />
                </asp:DropDownList>
            </td>
            <td class="auto-style4">
                <asp:DropDownList ID="DropDownList4" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                     <asp:ListItem Text="3.75" Value="3.75" Selected="False" />
                    <asp:ListItem Text="1.0" Value="1.0" Selected="True" />
                </asp:DropDownList>
            </td>
            <td>
               <asp:DropDownList ID="DropDownList7" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                      <asp:ListItem Text="- Select cost center -تحديد مركز التكلفة" Selected="False" />
                </asp:DropDownList>
                <br />
        <p id="para1"></p>
        <br /><br />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td class="auto-style1">
                <asp:Label ID="Label15" runat="server" Text="بيان القيد/Narration" ForeColor="Red"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="auto-style3">
                <asp:Label ID="Label16" runat="server" Text="نوع الدفع/PaymentMode" ForeColor="Red"></asp:Label>
            </td>
            <td >
                <asp:DropDownList ID="DropDownList5" runat="server" AppendDataBoundItems="True" AutoPostBack="True" Width="75px">
                    <asp:ListItem Text="Cahche " Value="100" Selected="False" />
                    <asp:ListItem Text="Cheque " Value="200" Selected="False" />
                    <asp:ListItem Text="Online" Value="300" Selected="True" />
                </asp:DropDownList>
            </td>
            <td >
                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="..." />
                <asp:TextBox ID="TextBox5" runat="server" ></asp:TextBox>
                <asp:Panel ID="pnlCalendar0" runat="server" style="POSITION: absolute">
                    <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="10px" OnSelectionChanged="Calendar2_SelectionChanged" Width="10px">
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                    </asp:Calendar>
                </asp:Panel>
            </td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td class="auto-style5">
                <asp:Label ID="Label17" runat="server" Text="الحساب/Account" ForeColor="#003300"></asp:Label>
                <br />
&nbsp;</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtNew" runat="server" placeholder="اكتب اسم الحساب" ToolTip="Enter Text Here"></asp:TextBox><br />
                <asp:DropDownList ID="DropDownList6" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged">
                     <asp:ListItem Text="- Select account -تحديد الحساب" Selected="False" />

                </asp:DropDownList>
                <br />
        <p id="para"></p>
        <br /><br />
            </td>
            <td >
                
            </td>
            <td >
                
                 <asp:TextBox ID="TextNEW1" runat="server" placeholder="اكتب اسم شريك العمل " ToolTip="Enter Text Here"></asp:TextBox><br />
                <asp:DropDownList ID="DropDownList8" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList8_SelectedIndexChanged">
                     <asp:ListItem Text="Choose bp/تحديد " Value="00" Selected="False" />
                  
                    
                </asp:DropDownList>
            </td>
            <td ></td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label19" runat="server" Text="دائن/Credit" ForeColor="#003300"></asp:Label>
                <asp:TextBox ID="TextBox2" autocomplete="off" runat="server" onKeyDown="Button1_Click"  >0.0</asp:TextBox>
                <br />
            </td>
            <td >
                <asp:Label ID="Label20" runat="server" Text="مدين/debit" ForeColor="#003300"></asp:Label>
                <asp:TextBox ID="TextBox3" autocomplete="off"  runat="server" onKeyDown="Button1_Click" >0.0</asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Label10" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label9" runat="server" ForeColor="Lime"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="تسجيل البيانات/Save" OnClick="Button1_Click"  />
            </td>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="Label21" runat="server"></asp:Label>
                <br />
                <asp:Label ID="Label22" runat="server"></asp:Label>
            </td>
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
                        <asp:TemplateField HeaderText="رقم القيد/ID" Visible="true">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ID" Visible="true" runat="server" Text='<%#Eval("VoucherID") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="البيان/Narrition">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_NAR" runat="server" BackColor="#98FA05" Text='<%#Eval("Narrition") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                         <asp:TemplateField HeaderText="مدين/Debit">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_DEB" runat="server" Text='<%#Eval("Debit") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_DEB"  Width="60px" autocomplete="off" runat="server" Text='<%#Eval("Debit") %>'></asp:TextBox>  
                        
                    </EditItemTemplate>  
                </asp:TemplateField> 
                        <asp:TemplateField HeaderText="دائن/Credit">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_CRED" runat="server" Text='<%#Eval("Credit") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_CRED"  Width="60px" autocomplete="off"  runat="server" Text='<%#Eval("Credit") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                       

                        </Columns>
                     <HeaderStyle BackColor="" ForeColor="black"/>  
            
                  <RowStyle BackColor=""/> 

                </asp:GridView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td colspan="5">
                &nbsp;</td>
        </tr>
    </table>
     <script src="../../assets/jQueryv3.3.1.js"></script>
    <script type="text/javascript">
        $(function() {
            var $txt = $('input[id$=txtNew]');
            var $ddl = $('select[id$=DropDownList6]');
            var $items = $('select[id$=DropDownList6] option');
 
            $txt.keyup(function() {
                searchDdl($txt.val());
            });
 
            function searchDdl(item) {
                $ddl.empty();
                var exp = new RegExp(item, "i");
                var arr = $.grep($items,
                    function(n) {
                        return exp.test($(n).text());
                    });
 
                if (arr.length > 0) {
                    countItemsFound(arr.length);
                    $.each(arr, function() {
                        $ddl.append(this);
                        $ddl.get(0).selectedIndex = 0;
                    }
                    );
                }
                else {
                    countItemsFound(arr.length);
                    $ddl.append("<option>No Items Found/لم يتم العثور </option>");
                }
            }
 
            function countItemsFound(num) {
                $("#para").empty();
                if ($txt.val().length) {
                    $("#para").html(num + " items found");
                }
 
            }
        });
        </script>
     <script type="text/javascript">
         $(function () {
             var $txt = $('input[id$=TextNEW1]');
             var $ddl = $('select[id$=DropDownList8]');
             var $items = $('select[id$=DropDownList8] option');

             $txt.keyup(function () {
                 searchDdl($txt.val());
             });

             function searchDdl(item) {
                 $ddl.empty();
                 var exp = new RegExp(item, "i");
                 var arr = $.grep($items,
                     function (n) {
                         return exp.test($(n).text());
                     });

                 if (arr.length > 0) {
                     countItemsFound(arr.length);
                     $.each(arr, function () {
                         $ddl.append(this);
                         $ddl.get(0).selectedIndex = 0;
                     }
                     );
                 }
                 else {
                     countItemsFound(arr.length);
                     $ddl.append("<option>No Items Found/لم يتم العثور </option>");
                 }
             }

             function countItemsFound(num) {
                 $("#para1").empty();
                 if ($txt.val().length) {
                     $("#para1").html(num + " items found");
                 }

             }
         });
        </script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/PL/HrLayout.Master" AutoEventWireup="true" CodeBehind="Leave Request Pending.aspx.cs" Inherits="Pos.Hr.PL.Leave_Request_Pending" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head111" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder111" runat="server">
     <label >
    <asp:Button ID="Button8" runat="server"  Enabled="false" ToolTip="اضافة" CssClass="imageButton8" OnClick="Button8_Click" /> 
    <asp:Button ID="Button9" runat="server" Enabled="false"  ToolTip="تعديل" CssClass="imageButton9" OnClick="Button9_Click" />
    <asp:Button ID="Button10" runat="server" Enabled="false"  ToolTip="حذف" CssClass="imageButton10" OnClick="Button10_Click" />
    <asp:Button ID="Button11" runat="server" Enabled="false" ToolTip="ارسال" CssClass="imageButton11" OnClick="Button11_Click" />
    <asp:Button ID="Button12" runat="server"  ToolTip="طباعة الموافقات" CssClass="imageButton12" OnClick="Button12_Click" />
   <asp:Button ID="Button13" runat="server"  ToolTip="طباعة تفاصيل الطلب" CssClass="imageButton13" OnClick="Button13_Click" />
    
        
        </label>

     <asp:Panel ID="Panel5" runat="server" style="POSITION: absolute">
        <asp:TextBox ID="TextBox7" autocomplete="off" placeholder=" بحث بالاسم او رقم الطلب او البيان" runat="server"></asp:TextBox>
        <asp:Button ID="Button4" runat="server" Text="بحث" OnClick="Button4_Click" />
        <table align="center" cellspacing="4" dir="rtl">
            <tr>
                <td></td>
                <td> 

                    <br />

                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataKeyNames="cRequestId" OnRowCommand="GridView1_RowCommand" AutoGenerateSelectButton="true" selectedindex="0" OnPageIndexChanging="GridView1_PageIndexChanging1" PageSize="5" AutoGenerateColumns="False"  OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanging="GridView1_SelectedIndexChanging"  OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                        <PagerSettings Mode="NextPreviousFirstLast"  />
                        <Columns>  
                         
                         <asp:TemplateField HeaderStyle-ForeColor="#3399ff">  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Enabled="false" CssClass="imageButton9" Text="" CommandName="Edit" />  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" CssClass="imageButton9"  Text="تحديث/Update " CommandName="Update"/>  
                        <asp:Button ID="btn_Cancel"  CssClass="imageButton10" runat="server" Text="حذف/Delete" CommandName="Cancel"/>  
                    </EditItemTemplate>  
                             <HeaderStyle ForeColor="#3399FF" />
                </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-ForeColor="#3399ff" HeaderText="رقم طلب الأجازة " >
                                <ItemTemplate>
                                    <asp:Label ID="comid" Visible="false" runat="server" Text='<%#Eval("cCompany") %>'>'></asp:Label>
                                       <asp:Label ID="Label1" Visible="false" runat="server" Text='<%#Eval("cParam") %>'>'></asp:Label>
                                    
                                   
                                    <asp:Label ID="lblrequestid" runat="server" Text='<%#Eval("cRequestId") %>'>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle ForeColor="#3399FF" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-ForeColor="#3399ff" HeaderText="تاريخ الطلب ">
                                <ItemTemplate>
                                    <asp:Label ID="lblrequestdate" runat="server" Text='<%#Eval("cRequestDate") %>'>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle ForeColor="#3399FF" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-ForeColor="#3399ff" HeaderText="مقدم الطلب ">
                                <ItemTemplate>
                                    <asp:Label ID="lblrequestfor" runat="server" Text='<%#Eval("cRequestFor") %>'>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle ForeColor="#3399FF" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-ForeColor="#3399ff" HeaderText="البيان">
                                <ItemTemplate>
                                    <asp:Label ID="lblrequesttopic" runat="server" Text='<%#Eval("cRequestTopic") %>'>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtrequesttopic" runat="server" TextMode="MultiLine" Text='<%#Eval("cRequestTopic") %>'>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle ForeColor="#3399FF" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-ForeColor="#3399ff" HeaderText="بداية الأجازة" >
                                <ItemTemplate>
                                    <asp:Label ID="lblvacationstrart" runat="server" Text='<%#Eval("cVacationStart") %>'>' ></asp:Label> 
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="vacationstartdate" runat="server" AutoComplete="off" text='<%#Eval("cVacationStart") %>'>' ></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle ForeColor="#3399FF" />
                            </asp:TemplateField>

                             <asp:TemplateField HeaderStyle-ForeColor="#3399ff" HeaderText="نهاية الأجازة" >
                                <ItemTemplate>
                                    <asp:Label ID="lblvacationend" runat="server" Text='<%#Eval("cVacationEnd") %>'>' ></asp:Label> 
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="vacationstartend" runat="server" AutoComplete="off" text='<%#Eval("cVacationEnd") %>'>' ></asp:TextBox>
                                </EditItemTemplate>
                                 <HeaderStyle ForeColor="#3399FF" />
                            </asp:TemplateField>
                            
                            </Columns>
                        <SelectedRowStyle BackColor="Black" ForeColor="#3366FF" Font-Bold="True" />
                        

                    </asp:GridView>
                    <br/>
            
      <asp:label id="MessageLabel"
        forecolor="blue"
        runat="server"/>
                   
                </td>
               <td></td>
            </tr>
           
            
        </table>
        </asp:Panel>









     <script type="text/javascript">
        $(function () {
            var $txt = $('input[id$=TextBox3]');
            var $ddl = $('select[id$=DropDownList1]');
            var $items = $('select[id$=DropDownList1] option');

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
    <style type="text/css">
        .imageButton8 {
            border: none;
                    background-color: transparent;
                    padding: 5px 10px 5px 35px; /* Adjust based on the size of your image */
            background-image: url("../../Images/add.jpg");
            background-repeat:no-repeat;
        }
        .imageButton9 {
            border: none;
                    background-color: transparent;
                    padding: 5px 10px 5px 35px; /* Adjust based on the size of your image */
            background-image: url("../../Images/edit.jpg");
            background-repeat:no-repeat;
        }
        .imageButton10 {
            border: none;
                    background-color: transparent;
                    padding: 5px 10px 5px 35px; /* Adjust based on the size of your image */
            background-image: url("../../Images/delete.jpg");
            background-repeat:no-repeat;
        }
         .imageButton11 {
            border: none;
                    background-color: transparent;
                    padding: 5px 10px 5px 35px; /* Adjust based on the size of your image */
            background-image: url("../../Images/send.jpg");
            background-repeat:no-repeat;
        }
         .imageButton12 {
            border: none;
                    background-color: transparent;
                    padding: 5px 10px 5px 35px; /* Adjust based on the size of your image */
            background-image: url("../../Images/printapproval.jpg");
            background-repeat:no-repeat;
        }
         .imageButton13 {
            border: none;
                    background-color: transparent;
                    padding: 5px 10px 5px 35px; /* Adjust based on the size of your image */
            background-image: url("../../Images/printrequest.jpg");
            background-repeat:no-repeat;
        }
        .auto-style1 {
            height: 48px;
        }
    </style>
</asp:Content>

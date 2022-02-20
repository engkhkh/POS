<%@ Page Title="" Language="C#" MasterPageFile="~/WorkFlow/PL/WorkFlowLayout.Master" AutoEventWireup="true" CodeBehind="Approve.aspx.cs" Inherits="Pos.WorkFlow.PL.Approve" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head111" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder111" runat="server">
   
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
                        <asp:Button ID="btn_Edit" Enabled="false" runat="server" CssClass="imageButton9" Text="" CommandName="Edit" />  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" CssClass="imageButton9" Text="تحديث/Update " CommandName="Update"/>  
                        <asp:Button ID="btn_Cancel"  CssClass="imageButton10" runat="server" Text="حذف/Delete" CommandName="Cancel"/>  
                    </EditItemTemplate>  
                             <HeaderStyle ForeColor="#3399FF" />
                </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-ForeColor="#3399ff" HeaderText="نوع الطلب  " >
                                <ItemTemplate>
                                    <asp:Label ID="comid" Visible="false" runat="server" Text='<%#Eval("cCompany") %>'>'></asp:Label>
                                    <asp:Label ID="Label1" Visible="false" runat="server" Text='<%#Eval("cParam") %>'>'></asp:Label>
                                    <asp:Label ID="Label2" Visible="false" runat="server" Text='<%#Eval("cEmpId") %>'>'></asp:Label>
                                    <asp:Label ID="lblNarriation" runat="server" Text='<%#Eval("cNarriation") %>'>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle ForeColor="#3399FF" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-ForeColor="#3399ff" HeaderText="تاريخ انشاء الطلب  ">
                                <ItemTemplate>
                                    <asp:Label ID="lblrequestdate" runat="server" Text='<%#Eval("cCreatedDate") %>'>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle ForeColor="#3399FF" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-ForeColor="#3399ff" HeaderText="مقدم الطلب ">
                                <ItemTemplate>
                                    <asp:Label ID="lblrequestfor" runat="server" Text='<%#Eval("cRequestFor") %>'>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle ForeColor="#3399FF" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-ForeColor="#3399ff" HeaderText="مستوي الموافقة ">
                                <ItemTemplate>
                                    <asp:Label ID="lblcLevelId" runat="server" Text='<%#Eval("cLevelId") %>'>'></asp:Label>
                                </ItemTemplate>
                                
                                <HeaderStyle ForeColor="#3399FF" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-ForeColor="#3399ff" HeaderText="رقم الطلب " >
                                <ItemTemplate>
                                    <asp:Label ID="lblcRequestId" runat="server" Text='<%#Eval("cRequestId") %>'>' ></asp:Label> 
                                </ItemTemplate>
                                
                                <HeaderStyle ForeColor="#3399FF" />
                            </asp:TemplateField>

                             
                            
                            </Columns>
                        <SelectedRowStyle BackColor="Black" ForeColor="#3366FF" Font-Bold="True" />
                        

                    </asp:GridView>
                    <br/>
            
      <asp:label id="MessageLabel"
        forecolor="Red"
        runat="server"/>
                   
                </td>
               <td></td>
            </tr>
           
            
        </table>
        </asp:Panel>



    <script src="../../assets/jQueryv3.3.1.js"></script>

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
   
     
</asp:Content>

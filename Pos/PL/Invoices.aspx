<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoices.aspx.cs" Inherits="Pos.PL.Invoices" %>




<!DOCTYPE html>
<html lang="en">
<head>
    
    <script>
        function doPrint()
        {
            var prtContent = document.getElementById('<%= GridView1.ClientID %>');
            prtContent.border = 0; //set no border here
            var WinPrint = window.open('','','left=100,top=100,width=1000,height=1000,toolbar=0,scrollbars=1,status=0,resizable=1');
            WinPrint.document.write(prtContent.outerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
</script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, ">
<title>Sales-المبيعات</title>
   

    <link href="../assets/bootstrap.min.css" rel="stylesheet" /> 
     <script src="../assets/bootstrap.min.js"></script>
    <script src="../assets/popper.js"></script>
    <script src="../assets/jQueryv3.3.1.js"></script>

<style>
    /*<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> */
	/* Some custom styles to beautify this example*/
    .main-content{
		min-height: 230px;
        background: white;
        overflow-y: scroll;
        height: 600px; 
        
    }
    .sidebar-content{
        min-height: 100px;
        margin-bottom: 30px;
        background: white;
        overflow-y: scroll;
        height: 300px; 
        width: 550px;
    }
    .sidebar-nav{

         overflow-x: scroll;
          overflow-y: scroll;
        height: 600px; 
        width: 200px;
    }
     .sidebar-nav1{

         overflow-x: scroll;
          overflow-y: scroll;
        height: 600px; 
        width: 400px;
    }
     .table  
        {  
            border: 1px solid #ccc;  
            border-collapse: collapse;  
            width: 100px;  
        }  
        .table th  
        {  
            background-color: #F7F7F7;  
            color: #333;  
            font-weight: bold;  
        }  
        .table th, .table td  
        {  
            padding: 5px;  
            border: 1px solid #ccc;  
        } 
    .auto-style1 {
        width: 100%;
        float: right;
        background-color: #00FF00;
    }
</style>
    <script>
    function submitButton(e) {
        if (e.keyCode == 13) {
            $("#Button44").click(); //jquery
            document.getElementById("Button44").click(); //javascript
        }
    }
        </script>
</head>
<body >
    <form runat="server" id="form1">
<div class="container mt-3">
    <div class="row">
        <div class="col-sm-6">
            <div class="main-content">
                <asp:TextBox ID="TXTBXSCANER" placeholder="BarcodeScanner" runat="server"  autocomplete="off"   AutoPostBack="True" OnTextChanged="TXTBXSCANER_TextChanged" onkeypress="submitButton(e)" ></asp:TextBox>
                <asp:Button ID="Button44" Visible="false" runat="server" Text="Button" onclick="Button44_Click" />
          <!--     <asp:Button ID="btnPrint" runat="server" Text="View/عرض " OnClientClick="doPrint()" />
		    <asp:Button ID="Button1" runat="server" Text="لوحة المفاتيح" OnClick="Button1_Click" />
                <asp:Button ID="Button6" runat="server" Visible="true" BackColor="Lime" Text="طباعة" OnClick="Button6_Click" />
				<asp:Button ID="Button3" Enabled="true" runat="server" Visible="true" BackColor="Lime" Text="عرض"  OnClick="Button3_Click" />
                <asp:Button ID="Button4" runat="server" Text=" رصيد الوردية " OnClick="Button4_Click" />-->
                <asp:Button ID="Button2" runat="server" Visible="true" BackColor="Lime" Text="Save/حفظ" Width="100px" OnClick="Button2_Click" />
				<asp:HyperLink ID="HyperLink2" NavigateUrl="../Reports/InvoiceForm1.aspx" Target="framename" runat="server">Print/طباعة</asp:HyperLink>
				<asp:Button ID="Button5" runat="server" Text="Exit/خروج" OnClick="Button5_Click" />
				<asp:DropDownList ID="DropDownList1" runat="server" ></asp:DropDownList>
				 <asp:DropDownList ID="ddlcompch" runat="server" AppendDataBoundItems="true" DataTextField="cPaymentType" DataValueField="cPaymentId" AutoPostBack="True" Visible="true"  OnSelectedIndexChanged="ddlcompch_SelectedIndexChanged"></asp:DropDownList>
				 
                
                
                <br />
                <table align="center" class="auto-style1" style="background-color:white"  dir="ltr">
                    <tr><td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6"  OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanging="GridView1_SelectedIndexChanging"   >
                    <Columns>  
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="*" CommandName="Edit" />  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="تحديث الكمية " CommandName="Update"/>  
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
                        <asp:TextBox ID="txt_qty" TextMode="Number"  min="0" max="100000" step="1" Width="60px" autocomplete="off" runat="server" Text='<%#Eval("cQty") %>'></asp:TextBox>  
                        
                    </EditItemTemplate>  
                </asp:TemplateField> 
                        <asp:TemplateField HeaderText="السعر">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_price" runat="server" Text='<%#Eval("cPrice") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_price" ReadOnly="true"  TextMode="Number"  min="1" max="100000" step=".5" Width="60px" autocomplete="off"  runat="server" Text='<%#Eval("cPrice") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                        <asp:TemplateField HeaderText="السعر الكلي">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_pricet" runat="server" Text='<%#Eval("cTotal") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_pricet" Width="50px" ReadOnly="true" autocomplete="off"  runat="server" Text='<%#Eval("cTotal") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 

                        </Columns>
                     <HeaderStyle BackColor="" ForeColor="black"/>  
            
                  <RowStyle BackColor=""/> 

                </asp:GridView>
                        </td></tr></table>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
				 <br />
                <br />
                <br />
                <br />
                <br />
                
               
               
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <table align="center" dir="ltr">
                            <!-- class="auto-style1"-->
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" ForeColor="black" runat="server" Text="عدد العناصر"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" ForeColor="black" Text="الاجمالي "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" ForeColor="black" Text="خصم"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" ForeColor="black" Text="اجمالي الضريبة"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label6" runat="server" ForeColor="black" Text="الصافي"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Labeltotalitems" runat="server" ForeColor="black"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Labeltotal" runat="server" ForeColor="black"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxdisc" TextMode="Number"  min="0" max="100" step="1" autocomplete="off" Text="0" runat="server" Width="45px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxvat"  ReadOnly="true" runat="server" Width="45px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="Labeltotalpaybale" runat="server" ForeColor="black"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="Buttoncancel" runat="server" BackColor="#FF0066" Text=" الغاءالفاتورة" Width="100px" OnClick="Buttoncancel_Click" />
                                </td>
                                <td>
                                    
                                     <asp:Button ID="Buttonpayment" Enabled="false" runat="server" BackColor="Lime" Text="دفع " Width="100px" OnClick="Buttonpayment_Click" />
                                </td>
                                <td><asp:Button ID="Buttonhold" runat="server" BackColor="#9900FF" Text="فاتورة معلقة" Width="100px" OnClick="Buttonhold_Click" /></td>
                                <td>
                                    <asp:Button ID="Button12" Enabled="false" runat="server" BackColor="#9900FF" Text="انهاء معلقة" /></td>
                                
                                <td><asp:Button ID="Button11" runat="server" Enabled="false" BackColor="Red" Text="مرتجع" /> </td>
                            </tr>
                            
                            <tr><td><asp:HyperLink ID="HyperLink22" NavigateUrl="../Finance/PL/BP.aspx" Target="framename" runat="server">اضف عميل </asp:HyperLink></td><td><asp:HyperLink ID="HyperLink21" NavigateUrl="../Finance/Reports/BpStatement.aspx" Target="framename" runat="server">كشف حساب </asp:HyperLink></td><td>الباقي</td><td>الصافي</td><td>المدفوع</td></tr>
                           
                            <tr>
                                <td>
								
                                    <!--<asp:HyperLink ID="HyperLink1" NavigateUrl="/Reports/ReportInvoice.aspx" Target="_top" runat="server">Print</asp:HyperLink>--> </td>
                                <td>
                                    </td>
                                <td>
								<asp:TextBox ID="TextBoxremaining" placeholder="الباقي" ReadOnly="true" Visible="true" autocomplete="off" runat="server" Width="55px"></asp:TextBox>
                                  </td>
                                
								<td>
								 <asp:TextBox ID="TextBoxnet" placeholder="الصافي" Visible="true" ReadOnly="true" autocomplete="off" runat="server" Width="55px"></asp:TextBox>
                                   </td>
                               
									
									
								<td>
                                    <asp:TextBox ID="TextBoxpaid" placeholder="المدفوع" TextMode="Number"  min="0" max="10000" step="5" Visible="true" autocomplete="off" runat="server" Text="0" Width="55px"></asp:TextBox></td>
									
                            </tr>
                   
                        </table>
                </asp:View>
                    
                </asp:MultiView>
            </div>
        </div>
        <div class="col-sm-6">
            <!--Nested rows within a column-->
            <div class="row">
               <div class="col-8">
                           <!-- Sidebar -->
            <div id="sidebar-wrapper1">
                <ul class="sidebar-nav1">

                     <asp:DataList ID="DataList1" runat="server"  RepeatColumns="3"   CellSpacing="1" OnItemCommand="DataList1_ItemCommand"    >  
        <ItemTemplate> 

            <table class="table" >  
                <tr>  
                    <th colspan="1"  >  
                        <b>  <!--CommandName="Item"-->
                             <asp:LinkButton ID="lnkPname"  Text='<%# Eval("cPName") %>' runat="server" BackColor="Yellow"  >
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkcPId" Text='<%# Eval("cPId") %>' runat="server" Visible="false" BackColor="Yellow" >
                            </asp:LinkButton>
                            </b>  
                    </th>  
                </tr> </table>
        </ItemTemplate></asp:DataList>





                    </ul></div>
             
            </div>
                   
        
               
              
                <div class="col-4">
                     
              
              
                 <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                        

                    
                    <asp:DataList ID="dlInvoices" runat="server"  RepeatColumns="1"   CellSpacing="1"  OnItemCommand="dlInvoices_ItemCommand" >  
        <ItemTemplate>  
            <table class="table">  
                <tr>  
                    <th colspan="1">  
                        <b>   <asp:LinkButton ID="lnkDesc" Text='<%# Eval("cCDesc") %>' runat="server">
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkId" Text='<%# Eval("cCId") %>' runat="server" Visible="false">
                            </asp:LinkButton>
                      </b> 
                    </th>  
                </tr>  
             <!--   <tr>  
                    <td colspan="2">  
                        <%# Eval("cComp") %>,  
                        <%# Eval("cComp") %><br />  
                    </td>  
                </tr>  
                <tr>  
                    <td>  
                       Salary:  
                    </td>  
                    <td>  
                      <%# Eval("cComp")%> 
                    </td>  
                </tr>  
                <tr>  
                    <td>  
                       Designation:  
                    </td>  
                    <td>  
                   <%# Eval("cComp")%>  
                    </td>  
                </tr>  -->
            </table>  
        </ItemTemplate>  
    </asp:DataList>  
                    </ul>
                </div>
                 
            </div>
       <!--     <div class="row">
                <div class="col-12">
                    <div class="sidebar-content">
                        


                    </div>
                </div>
                
                <div class="col-2">
                    <div class="sidebar-content"></div>
                </div>  -->
            </div>
        </div>
    </div>
</div>
        </form>
</body>
</html>                            

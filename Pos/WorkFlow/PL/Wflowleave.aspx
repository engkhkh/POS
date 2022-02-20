<%@ Page Title="" Language="C#" MasterPageFile="~/WorkFlow/PL/WorkFlowLayout.Master" AutoEventWireup="true" CodeBehind="Wflowleave.aspx.cs" Inherits="Pos.WorkFlow.PL.Wflowleave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head111" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder111" runat="server">
     <label >
    <asp:Button ID="Button8" runat="server" Enabled="false"  ToolTip="اضافة" CssClass="imageButton8" OnClick="Button8_Click" /> 
    <asp:Button ID="Button9" runat="server" Enabled="false"  ToolTip="تعديل" CssClass="imageButton9" OnClick="Button9_Click" />
    <asp:Button ID="Button10" runat="server" Enabled="false"  ToolTip="حذف" CssClass="imageButton10" OnClick="Button10_Click" />
    <asp:Button ID="Button11" runat="server" enabled="false" ToolTip="ارسال" CssClass="imageButton11" OnClick="Button11_Click" />
    <asp:Button ID="Button12" runat="server"  ToolTip="طباعة الموافقات" CssClass="img-fluid" OnClick="Button12_Click" />
   <asp:Button ID="Button13" runat="server"  ToolTip="طباعة تفاصيل الطلب" CssClass="imageButton13" OnClick="Button13_Click" />
    
        
        </label>
    <asp:Panel ID="Panel5" runat="server" style="POSITION: absolute">
       
        <table align="center" cellspacing="4" dir="rtl">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="رقم الطلب "></asp:Label>
                </td>
                <td class="auto-style2"> 

                   
                    <asp:TextBox ID="TextBoxrequestId" ReadOnly="true" runat="server"></asp:TextBox>

                   
                </td>
               <td>
                   <asp:Label ID="Label2" runat="server" Text="RequestId"></asp:Label>
                </td>
            </tr>
           <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="مقدم الطلب "></asp:Label>
                </td>
                <td class="auto-style2"> 

                   
                    <asp:TextBox ID="TextBoxrequestfor" runat="server" ReadOnly="true"></asp:TextBox>

                   
                </td>
               <td>
                   <asp:Label ID="Label3" runat="server" Text="RequestFor"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="بيان الطلب "></asp:Label>
                </td>
                <td class="auto-style2"> 

                   
                    <asp:TextBox ID="TextBoxrequestNotice" runat="server" Height="44px" ReadOnly="true" TextMode="MultiLine"></asp:TextBox>

                   
                </td>
               <td>
                   <asp:Label ID="Label6" runat="server" Text="Notice"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="بداية الاجازة "></asp:Label>
                </td>
                <td class="auto-style2"> 

                   
                    <asp:TextBox ID="TextBoxLeaveStart" runat="server" ReadOnly="true"></asp:TextBox>

                   
                </td>
               <td>
                   <asp:Label ID="Label9" runat="server" Text="LeaveStart"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="نهاية الاجازة "></asp:Label>
                </td>
                <td class="auto-style2"> 

                   
                    <asp:TextBox ID="TextBoxLeaveEnd" runat="server" ReadOnly="true"></asp:TextBox>

                   
                </td>
               <td>
                   <asp:Label ID="Label10" runat="server" Text="LeaveEnd"></asp:Label>
                </td>
            </tr>
            <tr>
                <td></td>
                <td class="auto-style2"> 

                   
                </td>
               <td></td>
            </tr>
            <tr>
                <td></td>
                <td class="auto-style2"> 

                   
                    <asp:TextBox ID="TextBoxrequestNoticeapproval" runat="server" Height="44px"  TextMode="MultiLine"></asp:TextBox>

                   
                </td>
               <td></td>
            </tr>

            
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="Button14" runat="server" Text="موافق" OnClick="Button14_Click" />
                    <asp:Button ID="Button15" runat="server" Text="رفض" OnClick="Button15_Click" />
                    <asp:Button runat="server" Text="الغاء" />
                </td>
                <td>&nbsp;</td>
            </tr>

            
        </table>
        </asp:Panel>

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
         .auto-style2 {
             width: 164px;
         }
    </style>
</asp:Content>

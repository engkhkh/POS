<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/PL/HrLayout.Master" AutoEventWireup="true" CodeBehind="UEmployeeDependent.aspx.cs" Inherits="Pos.Hr.PL.UEmployeeDependent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head111" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder111" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>  
                         <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="*" CommandName="Edit" />  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="تحديث/Update " CommandName="Update"/>  
                        <asp:Button ID="btn_Cancel"  runat="server" Text="حذف/Delete" CommandName="Cancel"/>  
                    </EditItemTemplate>  
                </asp:TemplateField>
               
                        <asp:TemplateField HeaderText="EmpID/الرقم الوظيفي " >  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ID"  runat="server" Text='<%#Eval("cEmpId") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="اسم المرافق /Dependent Name ">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_cDepenName" runat="server" BackColor="#98FA05" Text='<%#Eval("cDepenName") %>'></asp:Label>  
                    </ItemTemplate> 
                             <EditItemTemplate>  
                        <asp:TextBox ID="txt_cDepenName" readonly="true" Width="100px" autocomplete="off"  runat="server" Text='<%#Eval("cDepenName") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate> 
                </asp:TemplateField>
                         <asp:TemplateField HeaderText="تاريخ الميلاد /birthdate">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_cDepenJoinDate" runat="server" Text='<%#Eval("cDepenJoinDate") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_cDepenJoinDate" Width="100px" autocomplete="off"  runat="server" Text='<%#Eval("cDepenJoinDate") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 
                         <asp:TemplateField HeaderText="العمر/Age">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_cDepenAge" runat="server" Text='<%#Eval("cDepenAge") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_cDepenAge"  Width="100px" autocomplete="off"  runat="server" Text='<%#Eval("cDepenAge") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 
                        <asp:TemplateField HeaderText="الجنسية /Nationality">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_cDepenNationality" runat="server" Text='<%#Eval("cDepenNationality") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_cDepenNationality"  Width="100px" autocomplete="off"  runat="server" Text='<%#Eval("cDepenNationality") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText=" رقم الاقامة /identityID">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_cDepenIdentityId" runat="server" Text='<%#Eval("cDepenIdentityId") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_cDepenIdentityId"  Width="100px" autocomplete="off"  runat="server" Text='<%#Eval("cDepenIdentityId") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="تاريخ الانتهاء /IdentityExpiry">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_cDepenIdentityExpiry" runat="server" Text='<%#Eval("cDepenIdentityExpiry") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_cDepenIdentityExpiry"  Width="100px" autocomplete="off"  runat="server" Text='<%#Eval("cDepenIdentityExpiry") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="جواز السغر /PassportId">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_cDepenPassportId" runat="server" Text='<%#Eval("cDepenPassportId") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_cDepenPassportId"  Width="100px" autocomplete="off"  runat="server" Text='<%#Eval("cDepenPassportId") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                         <asp:TemplateField HeaderText="انتهاء جواز السفر /passportExpiry">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_cDepenpassportExpiry" runat="server" Text='<%#Eval("cDepenpassportExpiry") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_cDepenpassportExpiry"  Width="100px" autocomplete="off"  runat="server" Text='<%#Eval("cDepenpassportExpiry") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="العلاقة /cDepenRelative">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_cDepenRelative" runat="server" Text='<%#Eval("cDepenRelative") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_cDepenRelative"  Width="100px" autocomplete="off"  runat="server" Text='<%#Eval("cDepenRelative") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                         

                         
                       
                         
                        </Columns>

                </asp:GridView>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/PL/HrLayout.Master" AutoEventWireup="true" CodeBehind="UEmployee.aspx.cs" Inherits="Pos.Hr.PL.UEmployee" %>
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
                        <asp:Button ID="btn_Cancel" Enabled="false" runat="server" Text="حذف/Delete" CommandName="Cancel"/>  
                    </EditItemTemplate>  
                </asp:TemplateField>
               
                        <asp:TemplateField HeaderText="EmpID/الرقم الوظيفي " >  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ID"  runat="server" Text='<%#Eval("cEmpId") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="الاسم بالعربي/Arbic ">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_prodname" runat="server" BackColor="#98FA05" Text='<%#Eval("cEmpAname") %>'></asp:Label>  
                    </ItemTemplate> 
                             <EditItemTemplate>  
                        <asp:TextBox ID="txt_EmpNamearabic"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cEmpAname") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate> 
                </asp:TemplateField>
                         <asp:TemplateField HeaderText="الاسم بالانجليزي /English Name">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_empnameenglish" runat="server" Text='<%#Eval("cEmpEname") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_empnameenglish" Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cEmpEname") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 
                         <asp:TemplateField HeaderText="تاريخ الميلاد /BirthDate">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_birthdate" runat="server" Text='<%#Eval("cEmpBirthdate") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_birthdate"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cEmpBirthdate") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 
                        <asp:TemplateField HeaderText="العمر /Age">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_age" runat="server" Text='<%#Eval("cEmpAge") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_age"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cEmpAge") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="الجنسية /Nationality">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Nationality" runat="server" Text='<%#Eval("cEmpNationality") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Nationality"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cEmpNationality") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="عدد المعالين /Dependent">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_dependent" runat="server" Text='<%#Eval("cEmpDependent") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_dependent"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cEmpDependent") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="عنوان الاصل/homeAddress">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_homeAddress" runat="server" Text='<%#Eval("cEmpHomeCountry") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_homeAddress"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cEmpHomeCountry") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                         <asp:TemplateField HeaderText="العنوان الحالي /currentAddress">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_currentAddress" runat="server" Text='<%#Eval("cEmpCurrentCountry") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_currentAddress"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cEmpCurrentCountry") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="التلفون/phone">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_phone" runat="server" Text='<%#Eval("cEmpPhone") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_phone"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cEmpPhone") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                         <asp:TemplateField HeaderText="الايميل/e-mail">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_email" runat="server" Text='<%#Eval("cEmpEmail") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_email"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cEmpEmail") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                            <asp:TemplateField HeaderText="حالة التائشيرة/visa-status">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_visa" runat="server" Text='<%#Eval("cEmpVisa") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_visa"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cEmpVisa") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="رخصة القيادة/Lisence">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_liscence" runat="server" Text='<%#Eval("cEmpLisence") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_liscence"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cEmpLisence") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="تفاصيل السيارة /car details">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_car" runat="server" Text='<%#Eval("cEmpCar") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_car"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cEmpCar") %>' TextMode="MultiLine"></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                        

                         
                       
                         
                        </Columns>

                </asp:GridView>
        

</asp:Content>

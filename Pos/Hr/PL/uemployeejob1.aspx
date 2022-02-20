<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/PL/HrLayout.Master" AutoEventWireup="true" CodeBehind="uemployeejob1.aspx.cs" Inherits="Pos.Hr.PL.uemployeejob1" %>
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
            <asp:TemplateField HeaderText="الوظيفة بالاقامة/Title In Iqama">
                <ItemTemplate>
                    <asp:Label ID="lbl_Emptitleiniqama" runat="server" BackColor="#98FA05" Text='<%#Eval("cTitleJobInIqama") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Emptitleiniqama"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cTitleJobInIqama") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الوظيفة الفعلية /Actual Job">
                <ItemTemplate>
                    <asp:Label ID="lbl_empcurrentjob" runat="server" Text='<%#Eval("cTitleCurrentJob") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_empcurrentjob" Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cTitleCurrentJob") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="مهنة اضافية /ExtraJob">
                <ItemTemplate>
                    <asp:Label ID="lbl_ExtraJob" runat="server" Text='<%#Eval("cTitleExtraJob") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_ExtraJob"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cTitleExtraJob") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الأدارة/Management">
                <ItemTemplate>
                    <asp:Label ID="lbl_cManagementName" runat="server" Text='<%#Eval("cManagementName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListmaanagement" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="القسم/Department">
                <ItemTemplate>
                    <asp:Label ID="lbl_cDepartmentName" runat="server" Text='<%#Eval("cDepartmentName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListDepartmentName" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText=" رئيس مباشر /cDirectMnager">
                <ItemTemplate>
                    <asp:Label ID="lbl_cDirectMnager" runat="server" Text='<%#Eval("cDirectMnager") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListDirectmanager" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="رئيس القسم /cHeadOfDepartment">
                <ItemTemplate>
                    <asp:Label ID="lbl_cHeadOfDepartment" runat="server" Text='<%#Eval("cHeadOfDepartment") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListheaddepartment" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="مدير الأدارة /cManagerDirector">
                <ItemTemplate>
                    <asp:Label ID="lbl_cManagerDirector" runat="server" Text='<%#Eval("cManagerDirector") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListManagerDirector" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="نوع العقد/cContractType">
                <ItemTemplate>
                    <asp:Label ID="lbl_cContractType" runat="server" Text='<%#Eval("cContractType") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListcContractType" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="بداية العقد/cStartingContract">
                <ItemTemplate>
                    <asp:Label ID="lbl_cStartingContract" runat="server" Text='<%#Eval("cStartingContract") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_cStartingContract"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cStartingContract") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="مدة العقد/cContractDuration">
                <ItemTemplate>
                    <asp:Label ID="lbl_cContractDuration" runat="server" Text='<%#Eval("cContractDuration") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_cContractDuration"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cContractDuration") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تاريخ المباشرة /cDirectAcion">
                <ItemTemplate>
                    <asp:Label ID="lbl_cDirectAcion" runat="server" Text='<%#Eval("cDirectAcion") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_cDirectAcion"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cDirectAcion") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="1تفاصيل السكن /cHouseCompany">
                <ItemTemplate>
                    <asp:Label ID="lbl_cHouseCompany" runat="server" Text='<%#Eval("cHouseCompany") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_cHouseCompany"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cHouseCompany") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="2تفاصيل السكن /cCompanyDetails">
                <ItemTemplate>
                    <asp:Label ID="lbl_cCompanyDetails" runat="server" Text='<%#Eval("cCompanyDetails") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_cCompanyDetails"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cCompanyDetails") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="نوع التائمين /cInshuranceType">
                <ItemTemplate>
                    <asp:Label ID="lbl_cInshuranceType" runat="server" Text='<%#Eval("cInshuranceType") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListcInshuranceType"  runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="رقم التائمين /InsuranceID">
                <ItemTemplate>
                    <asp:Label ID="lbl_cInsuranceID" runat="server" Text='<%#Eval("cInsuranceID") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_cInsuranceID"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cInsuranceID") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الخبرة العملية 1/Exprience1">
                <ItemTemplate>
                    <asp:Label ID="lbl_cExprience1" runat="server" Text='<%#Eval("cExprience1") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_cExprience1"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cExprience1") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الخبرة العملية 2/Exprience2">
                <ItemTemplate>
                    <asp:Label ID="lbl_cExprience2" runat="server" Text='<%#Eval("cExprience2") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_cExprience2"  Width="150px" autocomplete="off"  runat="server" Text='<%#Eval("cExprience2") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

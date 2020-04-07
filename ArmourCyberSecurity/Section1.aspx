<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section1.aspx.cs" Inherits="ArmourCyberSecurity.Section1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Global Regulations">
        <h5>The following questions deal with the region in which you do buisness, which includes both where your office resides and where your customers reside.
            <br>
            For the purpose of this report, we will be focusing on GDPR (Europe), PIPEDA (Canada), CCPA (California), and LGPD (Brazil. This said, between the global reach of many companies and the fact that more countries and regional oversight are coming to law, following the best practice suggestions laid out in this assessment will benefit you regardless of region.

        </h5>

        <h4>SECTION GOAL:
            <br>
            To establish which legislations are required, determined by both your company location and that of your customers. Qualify your company against those legislations to determine your company’s ‘role’ with respect to the data (GDPR Ex. Processor or Controller).

            Note: If you deal with medical data, then there are separate regulations that are specific to these kinds of records. They are typical labeled Health Insurance Portability and Accountability Act, or the like.

        </h4>

        <h3>STAKEHOLDERS REQUIRED:
            <br>
            To fill out this section you will need a knowledge of the locations of the company and the people who use your product/service.
        </h3>

        <h2>Regional specific questions</h2>

        <asp:Label ID="lblQues1" runat="server" Text="" />
        <asp:CheckBoxList ID="chkbxAns1" runat="server" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="chkbxAns1_SelectedIndexChanged" RepeatDirection="Horizontal">
        </asp:CheckBoxList>
        <asp:CustomValidator runat="server" ID="cvDemoList" ErrorMessage="* Required" ForeColor="Red"></asp:CustomValidator>
        <br />

        <asp:Label ID="lblQues2" runat="server" Text="" />
        <asp:CheckBoxList ID="chkbxAns2" runat="server" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="chkbxAns2_SelectedIndexChanged" RepeatDirection="Horizontal">
        </asp:CheckBoxList>
        <asp:CustomValidator runat="server" ID="cvDemoList2" ErrorMessage="* Required" ForeColor="Red"></asp:CustomValidator>
        <br />

        <asp:Label ID="lblQues3" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns3">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns3" ControlToValidate="ddlAns3" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />

        <asp:Label ID="lblQues4" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns4">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns4" ControlToValidate="ddlAns4" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />

        <asp:Label ID="lblQues5" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns5">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns5" ControlToValidate="ddlAns5" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />

        <asp:Label ID="lblQues6" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns6">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns6" ControlToValidate="ddlAns6" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />

        <h2>Regional Fines</h2>

        <asp:Label ID="lblQues7" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns7">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns7" ControlToValidate="ddlAns7" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />

        <asp:Label ID="lblQues8" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns8">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns8" ControlToValidate="ddlAns8" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />

        <asp:Label ID="lblQues9" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns9">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns9" ControlToValidate="ddlAns9" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />

        <asp:Label ID="lblQues10" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns10">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns10" ControlToValidate="ddlAns10" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />

        <h2>Roles</h2>

        <asp:Label ID="lblQues11" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns11">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns11" ControlToValidate="ddlAns11" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />

        <asp:Label ID="lblQues12" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns12">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns12" ControlToValidate="ddlAns12" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />

        <asp:Label ID="lblQues13" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns13">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns13" ControlToValidate="ddlAns13" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />

        <asp:Label ID="lblQues14" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns14">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns14" ControlToValidate="ddlAns14" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />

        <asp:Button ID="btn_Save1" runat="server" Text="Save" OnClick="btn_Save1_Click" />
    </div>
</asp:Content>

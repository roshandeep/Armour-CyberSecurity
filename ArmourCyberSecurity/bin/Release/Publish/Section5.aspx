﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section5.aspx.cs" Inherits="ArmourCyberSecurity.Section5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        $(document).ready(function () {
            $("#sec2Div").hide();
        });

        $(document).on('click', '[id*=btn_part1]', function () {
            var v1 = document.getElementById("<%=reqAns1.ClientID%>");
            var v2 = document.getElementById("<%=reqAns2.ClientID%>");
            var v3 = document.getElementById("<%=reqAns3.ClientID%>");
            var v4 = document.getElementById("<%=reqAns4.ClientID%>");
            var v5 = document.getElementById("<%=reqAns5.ClientID%>");
            var v6 = document.getElementById("<%=reqAns6.ClientID%>");
            var v7 = document.getElementById("<%=reqAns7.ClientID%>");
            var v8 = document.getElementById("<%=reqAns8.ClientID%>");
            var v9 = document.getElementById("<%=reqAns9.ClientID%>");
            var v10 = document.getElementById("<%=reqAns10.ClientID%>");
            var v11 = document.getElementById("<%=reqAns11.ClientID%>");
            var v12 = document.getElementById("<%=reqAns12.ClientID%>");
            var v13 = document.getElementById("<%=reqAns13.ClientID%>");
            var v14 = document.getElementById("<%=reqAns14.ClientID%>");
            var v15 = document.getElementById("<%=reqAns15.ClientID%>");
            var v16 = document.getElementById("<%=reqAns16.ClientID%>");
            var v17 = document.getElementById("<%=reqAns17.ClientID%>");
            var v18 = document.getElementById("<%=reqAns18.ClientID%>");
            var v19 = document.getElementById("<%=reqAns19.ClientID%>");
            var v20 = document.getElementById("<%=reqAns20.ClientID%>");
            ValidatorValidate(v1);
            ValidatorValidate(v2);
            ValidatorValidate(v3);
            ValidatorValidate(v4);
            ValidatorValidate(v5);
            ValidatorValidate(v6);
            ValidatorValidate(v7);
            ValidatorValidate(v8);
            ValidatorValidate(v9);
            ValidatorValidate(v10);
            ValidatorValidate(v11);
            ValidatorValidate(v12);
            ValidatorValidate(v13);
            ValidatorValidate(v14);
            ValidatorValidate(v15);
            ValidatorValidate(v16);
            ValidatorValidate(v17);
            ValidatorValidate(v18);
            ValidatorValidate(v19);
            ValidatorValidate(v20);
            if (v1.isvalid && v2.isvalid && v3.isvalid && v4.isvalid && v5.isvalid && v6.isvalid && v7.isvalid && v8.isvalid && v9.isvalid && v10.isvalid && v11.isvalid && v12.isvalid && v13.isvalid && v14.isvalid && v15.isvalid && v16.isvalid && v17.isvalid && v18.isvalid && v19.isvalid && v20.isvalid) {
                $("#sec1Div").slideUp(1000);
                $("#sec2Div").slideDown(1000);
            }
            else {
                alert("Fill in all the questions before moving ahead");
            }
        });


    </script>
    <div>
        <h5>The following questions deal with how your company responds to and addresses a privacy incident. 
        </h5>
        <h5>SECTION GOAL:
            <br />
            To ensure that your company has an adequate incident response management plan in place before you experience an incident.
        </h5>
        <h5>STAKEHOLDERS REQUIRED:
            <br />
            To fill out this section you will need a knowledge of the following:
            <br />
            * the stakeholders needed to address an incident
            <br />
            * the names of third parties, including legal and forensics, that may be brought in to resolve an issue. 
            <br />
            * the existing 'severity one' or incident plans the company has  
        </h5>
        <div id='sec1Div'>
            <h2>Incident Response Plan</h2>
            <h5>All privacy breaches and incidents must be assessed for risk of harm. Depending on the legislation, breaches will need to be documented, authorities contacted, and users informed. If a third party company is acting as a processor of a user’s data, the controlling company is accountable for ensuring safety of the user’s data. The same process should be followed
            </h5>
            <asp:Label ID="lblQues1" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns1">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns1" ControlToValidate="ddlAns1" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues2" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns2">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns2" ControlToValidate="ddlAns2" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
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

            <asp:Label ID="lblQues15" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns15">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns15" ControlToValidate="ddlAns15" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />
            <asp:Label ID="lblQues16" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns16">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns16" ControlToValidate="ddlAns16" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues17" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns17">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns17" ControlToValidate="ddlAns17" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues18" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns18">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns18" ControlToValidate="ddlAns18" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues19" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns19">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns19" ControlToValidate="ddlAns19" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues20" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns20">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns20" ControlToValidate="ddlAns20" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Button ID="btn_part1" runat="server" Text="Next" ClientIDMode="Static" OnClientClick="return false;" />
        </div>
        <div id='sec2Div'>
            <h2>Notifications
            </h2>
            <h5>Depending on risk of harm, the appropriate data protection authority (or authorities) must be notified
                <br>
                Depending on risk of harm, users must be notified individually or by public statement.
            </h5>
            <asp:Label ID="lblQues21" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns21">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns21" ControlToValidate="ddlAns21" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues22" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns22">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns22" ControlToValidate="ddlAns22" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues23" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns23">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns23" ControlToValidate="ddlAns23" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues24" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns24">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns24" ControlToValidate="ddlAns24" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues25" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns25">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns25" ControlToValidate="ddlAns25" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Button ID="btn_Save5" runat="server" Text="Save" OnClick="btn_Save5_Click" />
        </div>
    </div>
</asp:Content>
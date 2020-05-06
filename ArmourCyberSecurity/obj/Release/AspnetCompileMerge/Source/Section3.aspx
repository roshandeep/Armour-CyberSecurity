﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section3.aspx.cs" Inherits="ArmourCyberSecurity.Section3" %>

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
            ValidatorValidate(v1);
            ValidatorValidate(v2);
            ValidatorValidate(v3);
            ValidatorValidate(v4);
            ValidatorValidate(v5);
            ValidatorValidate(v6);
            ValidatorValidate(v7);
            if (v1.isvalid && v2.isvalid && v3.isvalid && v4.isvalid && v5.isvalid && v6.isvalid && v7.isvalid) {
                $("#sec1Div").slideUp(1000);
                $("#sec2Div").slideDown(1000);
            }
            else {
                alert("Fill in all the questions before moving ahead");
            }
        });


    </script>
    <div>
        <h5>The following questions deal with how you handle the control of data including how an individual's data is accessed, transferred, stored, and deleted from your systems.
        <br />
        </h5>
        <h5>SECTION GOAL:
            <br />
            To build a system for data control that complies with an individual's rights but also ensures privacy and security levels are high. 
        </h5>
        <h5>STAKEHOLDERS REQUIRED:
            <br>
            To fill out this section you will need a knowledge of the following:
            <br>
            the way the data is collected, stored, transefered and processed<br>
            * the way(s) individuals communicate with the company
            <br>
            the method by which individuals are authenticated in the system 
        </h5>
        <div id='sec1Div'>
            <h2>Data Subject Access Requests</h2>
            <h5>Individuals have the right to access their data. Depending on the legislation, they may have the rights to check for accuracy, request correction, or simply review what is held. This includes data you have collected directly from them, data from use, and possibly inferred data.
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
            <asp:Button ID="btn_part1" runat="server" Text="Next" ClientIDMode="Static" OnClientClick="return false;" />
        </div>
        <div id='sec2Div'>
            <h2>Data Retention and Removal
            </h2>
            <h5>Depending on the legislation, users may have the rights to ‘be forgotten’ or be removed from the system on request. As a privacy design principle, data should also be removed when it is no longer required for business purposes. 
            </h5>
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

            <asp:Button ID="btn_Save3" runat="server" Text="Save" OnClick="btn_Save3_Click" />

        </div>

    </div>
</asp:Content>
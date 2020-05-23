﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section3.aspx.cs" Inherits="ArmourCyberSecurity.Section3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #btn_Next,
        #btn_Save3 {
            padding: 1rem 3rem;
            border-radius: 50px !important;
            background: transparent;
            color: white;
            border-color: #149dcc !important;
            font-weight: 700;
            font-size: large;
            align-self: center;
            width: 100%;
            margin-bottom: 2rem;
        }

            #btn_Next:hover,
            #btn_Save3:hover {
                box-shadow: inset -4px -4px 10px rgba(225, 225, 225, 0.5), inset 4px 4px 10px rgba(0, 0, 0, 0.1);
                cursor: pointer;
                background-position: right;
                background: linear-gradient(120deg, #3498db, #3a4953) !important;
                transition: .5s;
            }



        h2 {
            text-align: center;
            background: #3498db !important;
            color: white;
            border-radius: 30px;
            padding: 1rem;
        }
    </style>
    <script>

        function EnableTextArea1() {
            var ddlAns1 = document.getElementById('<%= ddlAns1.ClientID %>');
            var links1 = document.getElementById('<%= txt_Links_1.ClientID %>');

            if (ddlAns1.options[ddlAns1.selectedIndex].innerHTML == 'YES') {
                links1.disabled = false;
            }
            else {
                links1.disabled = true;
            }
        }
    </script>
    <div style="width: 90%; margin: 0 auto; padding-top: 3rem;">
        <br />
        <div style="padding-left: 2rem;">
            <h5 style="background-color: transparent; width: 92%; margin: 0 auto;">The following questions deal with how you handle the control of data including how an individual's data is accessed, transferred, stored, and deleted from your systems.
        <br />
            </h5>
            <br />
            <h5 style="width: 92%; margin: 0 auto; background-color: transparent;"><b>SECTION GOAL:</b>
                <br />
                To build a system for data control that complies with an individual's rights but also ensures privacy and security levels are high. 
            </h5>
            <br />
            <h5 style="width: 92%; margin: 0 auto; background-color: transparent;"><b>STAKEHOLDERS REQUIRED:</b>
                <br />
                To fill out this section you will need a knowledge of the following:
            <br />
                the way the data is collected, stored, transefered and processed<br />
                * the way(s) individuals communicate with the company
            <br />
                the method by which individuals are authenticated in the system 
            <br />
            </h5>
        </div>
        <div id='sec1Div' style="margin: 0 auto;" class="container-fluid">
            <br />
            <h2>Data Subject Access Requests
                <br />
            </h2>
            <br />
            <h5 style="background-color: transparent; width: 90%; margin: 0 auto;">Individuals have the right to access their data. Depending on the legislation, they may have the rights to check for accuracy, request correction, or simply review what is held. This includes data you have collected directly from them, data from use, and possibly inferred data.
            <br />
            </h5>
            <br />
            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues1" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns1" onChange="EnableTextArea1()">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns1" ControlToValidate="ddlAns1" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    <br />
                    <asp:Label ID="lbl_Links_1" runat="server" Text="Free Form Links : " ForeColor="#FFFAF0" Font-Bold="true" />
                    <br />
                    <asp:TextBox ID="txt_Links_1" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                    <br />
                </div>
            </div>
            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues2" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns2">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns2" ControlToValidate="ddlAns2" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues3" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns3">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns3" ControlToValidate="ddlAns3" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues4" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns4">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns4" ControlToValidate="ddlAns4" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues5" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns5">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns5" ControlToValidate="ddlAns5" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues6" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns6">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns6" ControlToValidate="ddlAns6" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues7" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns7" onChange="EnableTextArea15()">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns7" ControlToValidate="ddlAns7" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />
            <asp:Button ID="btn_Save3" runat="server" Text="Save" OnClick="btn_Save3_Click" ClientIDMode="Static" />
            <asp:Button ID="btn_Next" runat="server" Text="Next" OnClick="btn_Next_Click" ClientIDMode="Static" />
            <asp:ConfirmButtonExtender ID="ConfirmButtonExtender2" TargetControlID="btn_Next" ConfirmText="Press OK if you have saved your changes or if you wish to proceed without saving." runat="server" ></asp:ConfirmButtonExtender>
        </div>

    </div>
</asp:Content>

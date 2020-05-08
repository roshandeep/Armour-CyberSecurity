<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section3.aspx.cs" Inherits="ArmourCyberSecurity.Section3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #btn_part1,
        #btn_part2,
        #btn_part3,
        #ContentPlaceHolder1_btn_Save3 {
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

            #btn_part1 :hover,
            #btn_part2 :hover,
            #btn_part3 :hover,
            #ContentPlaceHolder1_btn_Save3 :hover {
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
        function EnableTextArea8() {
            var ddlAns8 = document.getElementById('<%= ddlAns8.ClientID %>');
            var links8 = document.getElementById('<%= txt_Links_8.ClientID %>');

            if (ddlAns8.options[ddlAns8.selectedIndex].innerHTML == 'YES') {
                links8.disabled = false;
            }
            else {
                links8.disabled = true;
            }
        }
        function EnableTextArea15() {
            var ddlAns7 = document.getElementById('<%= ddlAns7.ClientID %>');
            var ddlAns15 = document.getElementById('<%= ddlAns15.ClientID %>');
            var links15 = document.getElementById('<%= txt_Links_15.ClientID %>');

            if (ddlAns7.options[ddlAns7.selectedIndex].innerHTML == 'YES' && ddlAns15.options[ddlAns15.selectedIndex].innerHTML == 'YES') {
                links15.disabled = false;
            }
            else {
                links15.disabled = true;
            }
        }
    </script>
    <div style="width: 90%; margin: 0 auto; padding-top: 8rem;">
        <h5>The following questions deal with how you handle the control of data including how an individual's data is accessed, transferred, stored, and deleted from your systems.
        <br />
        </h5>
        <h5 style="width: 90%; margin: 0 auto;">SECTION GOAL:
            <br />
            To build a system for data control that complies with an individual's rights but also ensures privacy and security levels are high. 
        </h5>
        <h5 style="width: 90%; margin: 0 auto;">STAKEHOLDERS REQUIRED:
            <br>
            To fill out this section you will need a knowledge of the following:
            <br>
            the way the data is collected, stored, transefered and processed<br>
            * the way(s) individuals communicate with the company
            <br>
            the method by which individuals are authenticated in the system 
        </h5>
        <div id='sec1Div' style="width: 90%; margin: 0 auto;" class="container-fluid">
            <h2>Data Subject Access Requests</h2>
            <h5>Individuals have the right to access their data. Depending on the legislation, they may have the rights to check for accuracy, request correction, or simply review what is held. This includes data you have collected directly from them, data from use, and possibly inferred data.
            </h5>
            <div class="row">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues1" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns1" onChange="EnableTextArea1()">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns1" ControlToValidate="ddlAns1" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                    <br />
                    <asp:Label ID="lbl_Links_1" runat="server" Text="Free Form Links : " />
                    <asp:TextBox ID="txt_Links_1" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                    <br />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues2" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns2">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns2" ControlToValidate="ddlAns2" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues3" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns3">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns3" ControlToValidate="ddlAns3" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues4" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns4">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns4" ControlToValidate="ddlAns4" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues5" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns5">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns5" ControlToValidate="ddlAns5" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues6" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns6">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns6" ControlToValidate="ddlAns6" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues7" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns7" onChange="EnableTextArea15()">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns7" ControlToValidate="ddlAns7" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />
            <asp:Button ID="btn_part1" runat="server" Text="Next" ClientIDMode="Static" OnClientClick="return false;" />
        </div>
        <div id='sec2Div' style="width: 90%; margin: 0 auto;" class="container-fluid">
            <h2 style="width: 90%; margin: 0 auto;">Data Retention and Removal
            </h2>
            <h5 style="width: 90%; margin: 0 auto;">Depending on the legislation, users may have the rights to ‘be forgotten’ or be removed from the system on request. As a privacy design principle, data should also be removed when it is no longer required for business purposes. 
            </h5>
            <div class="row">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues8" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns8" onChange="EnableTextArea8()">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns8" ControlToValidate="ddlAns8" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                    <br />
                    <asp:Label ID="lbl_Links_8" runat="server" Text="Free Form Links : " />
                    <asp:TextBox ID="txt_Links_8" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues9" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns9">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns9" ControlToValidate="ddlAns9" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues10" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns10">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns10" ControlToValidate="ddlAns10" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues11" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns11">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns11" ControlToValidate="ddlAns11" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues12" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns12">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns12" ControlToValidate="ddlAns12" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues13" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns13">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns13" ControlToValidate="ddlAns13" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues14" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns14">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns14" ControlToValidate="ddlAns14" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues15" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns15" onChange="EnableTextArea15()">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns15" ControlToValidate="ddlAns15" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                    <br />
                    <asp:Label ID="lbl_Links_15" runat="server" Text="Free Form Links : " />
                    <asp:TextBox ID="txt_Links_15" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                </div>
            </div>
            <br />

            <asp:Button ID="btn_Save3" runat="server" Text="Save" OnClick="btn_Save3_Click" />

        </div>

    </div>
</asp:Content>

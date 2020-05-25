<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section5Part2.aspx.cs" Inherits="ArmourCyberSecurity.Section5Part2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #btn_Previous,
        #btn_Save5 {
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

            #btn_Previous:hover,
            #btn_Save5:hover {
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

        function EnableTextArea21() {
            var ddlAns21 = document.getElementById('<%= ddlAns21.ClientID %>');
            var links21 = document.getElementById('<%= txt_Links_21.ClientID %>');

            if (ddlAns21.options[ddlAns21.selectedIndex].innerHTML == 'YES') {
                links21.disabled = false;
            }
            else {
                links21.disabled = true;
            }
        }

        function EnableTextArea23() {
            var ddlAns23 = document.getElementById('<%= ddlAns23.ClientID %>');
            var links23 = document.getElementById('<%= txt_Links_23.ClientID %>');

            if (ddlAns23.options[ddlAns23.selectedIndex].innerHTML == 'YES') {
                links23.disabled = false;
            }
            else {
                links23.disabled = true;
            }

        }
        function EnableTextArea() {

            var ddlAns21 = document.getElementById('<%= ddlAns21.ClientID %>');
            var links21 = document.getElementById('<%= txt_Links_21.ClientID %>');

            var ddlAns23 = document.getElementById('<%= ddlAns23.ClientID %>');
            var links23 = document.getElementById('<%= txt_Links_23.ClientID %>');


            if (ddlAns21.options[ddlAns21.selectedIndex].innerHTML == 'YES') {
                links21.disabled = false;
            }
            else {
                links21.disabled = true;
            }

            if (ddlAns23.options[ddlAns23.selectedIndex].innerHTML == 'YES') {
                links23.disabled = false;
            }
            else {
                links23.disabled = true;
            }

        }


    </script>
    <div style="width: 90%; margin: 0 auto; padding-top: 3rem;">
        <div style="padding-left: 4rem;">
            <h1 style="width: 90%; margin: 0 auto; color: floralwhite; background-color: transparent; text-align: center; padding-bottom: 1rem;">Incident Management</h1><br />
            <h5 style="background-color: transparent;">The following questions deal with how your company responds to and addresses a privacy incident. 
        <br />
                <br />
            </h5>
            <h5 style="background-color: transparent;"><b>SECTION GOAL:</b>
                <br />
                To ensure that your company has an adequate incident response management plan in place before you experience an incident.
            <br />
                <br />
            </h5>
            <h5 style="background-color: transparent;"><b>STAKEHOLDERS REQUIRED:</b>
                <br />
                To fill out this section you will need a knowledge of the following:
            <br />
                * the stakeholders needed to address an incident
            <br />
                * the names of third parties, including legal and forensics, that may be brought in to resolve an issue. 
            <br />
                * the existing 'severity one' or incident plans the company has  
            <br />
            </h5>
        </div>
        <div id='sec2Div' class="container-fliud">
            <h2>Notifications
                <br />
            </h2>
            <h5 style="background-color: transparent; width: 92%; margin: 0 auto;">Depending on risk of harm, the appropriate data protection authority (or authorities) must be notified
                <br />
                Depending on risk of harm, users must be notified individually or by public statement.
                <br />
            </h5>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues21" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns21" onChange="EnableTextArea21()">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns21" ControlToValidate="ddlAns21" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    <br />
                    <asp:Label ID="lbl_Links_21" runat="server" Text="Free Form Links : " ForeColor="#FFFAF0" Font-Bold="true" /><br />
                    <asp:TextBox ID="txt_Links_21" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                </div>
            </div>

            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues22" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns22">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns22" ControlToValidate="ddlAns22" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues23" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns23" onChange="EnableTextArea23()">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns23" ControlToValidate="ddlAns23" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    <br />
                    <asp:Label ID="lbl_Links_23" runat="server" Text="Free Form Links : " ForeColor="#FFFAF0" Font-Bold="true" /><br />
                    <asp:TextBox ID="txt_Links_23" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues24" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns24">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns24" ControlToValidate="ddlAns24" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues25" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns25">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns25" ControlToValidate="ddlAns25" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-4">
                    <asp:Button ID="btn_Save5" runat="server" Text="Save" OnClick="btn_Save5_Click" ClientIDMode="Static" />
                </div>
                <div class="col-sm-4">
                    <asp:Button ID="btn_Previous" runat="server" Text="Previous" OnClick="btn_Previous_Click" ClientIDMode="Static" />
                    <asp:ConfirmButtonExtender ID="ConfirmButtonExtender2" TargetControlID="btn_Previous" ConfirmText="Press OK if you have saved your changes or if you wish to proceed without saving." runat="server"></asp:ConfirmButtonExtender>
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>
    </div>
</asp:Content>

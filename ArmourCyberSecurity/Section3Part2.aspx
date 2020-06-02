<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section3Part2.aspx.cs" Inherits="ArmourCyberSecurity.Section3Part2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #btn_Previous,
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

            #btn_Previous:hover,
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
            var ddlAns7 = '<%= this.ques7Flag %>';
            var ddlAns15 = document.getElementById('<%= ddlAns15.ClientID %>');
            var links15 = document.getElementById('<%= txt_Links_15.ClientID %>');
            //alert(ddlAns7);
            if (ddlAns15.options[ddlAns15.selectedIndex].innerHTML == 'YES' && ddlAns7 == 'True') {
                alert(ddlAns15.options[ddlAns15.selectedIndex].innerHTML + ' ' + ddlAns7 + 'enable karo');
                links15.disabled = false;
            }
            else {
                alert(ddlAns15.options[ddlAns15.selectedIndex].innerHTML + ' ' + ddlAns7 + 'disable rakho');
                links15.disabled = true;
            }
        }
    </script>
    <section class="tabs2 cid-rYwmhfTTsG" id="tabs2-x" style="width: 100%;">
        <div class="container" style="margin-top: 6rem; padding-top: 2rem; padding-bottom: 2rem;">
            <div class="media-container-row" style="width: max-content; margin: 0 auto;">
                <div class="col-12" style="width: max-content;">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <asp:Button ID="btn_rtn_dashbrd" runat="server" Text="Return To Dashboard" OnClick="btn_rtn_dashbrd_Click" CssClass="nav-link link display-4" Enabled="True" CausesValidation="false" ClientIDMode="Static" />

                            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="btn_rtn_dashbrd" CancelControlID="imgbtnbackground" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>
                        </li>
                        <li class="nav-item" role="tablist">
                            <asp:Button ID="btn_Report" runat="server" Text="Generate Report" OnClick="btn_Report_Click" CssClass="nav-link link display-4" Enabled="True" ClientIDMode="Static" />
                            <asp:Label ID="lbl_warning" runat="server" Text="" ForeColor="Red" />
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">
        <div style="text-align: right;">
            <asp:ImageButton ID="imgbtnbackground" runat="server" ImageUrl="~/images/RedCross.png" Style="display: inline-block; width: 30px; height: 30px;" />
        </div>
        <div style="height: 60px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    Would you like to Save or Discard Your changes?&nbsp;
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnDiscard" runat="server" Text="Discard" OnClick="btnDiscard_Click" />
    </asp:Panel>
    <div style="width: 90%; margin: 0 auto; padding-top: 3rem;">
        <br />
        <div style="padding-left: 2rem;">
            <h1 style="width: 90%; margin: 0 auto; color: floralwhite; background-color: transparent; text-align: center; padding-bottom: 1rem;">Data Control</h1>
            <br />
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
        <div id='sec2Div' style="margin: 0 auto;" class="container-fluid">
            <br />
            <h2 style="margin: 0 auto;">Data Retention and Removal
                <br />
            </h2>
            <br />
            <h5 style="width: 90%; margin: 0 auto; background-color: transparent;">Depending on the legislation, users may have the rights to ‘be forgotten’ or be removed from the system on request. As a privacy design principle, data should also be removed when it is no longer required for business purposes. 
            <br />
            </h5>
            <br />
            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues8" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns8" onChange="EnableTextArea8()">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns8" ControlToValidate="ddlAns8" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    <br />
                    <asp:Label ID="lbl_Links_8" runat="server" Text="Free Form Links : " ForeColor="#FFFAF0" Font-Bold="true" />
                    <br />
                    <asp:TextBox ID="txt_Links_8" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues9" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns9">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns9" ControlToValidate="ddlAns9" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues10" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns10">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns10" ControlToValidate="ddlAns10" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues11" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns11">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns11" ControlToValidate="ddlAns11" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues12" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns12">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns12" ControlToValidate="ddlAns12" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues13" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns13">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns13" ControlToValidate="ddlAns13" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues14" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns14">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns14" ControlToValidate="ddlAns14" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues15" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns15" onChange="EnableTextArea15()">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns15" ControlToValidate="ddlAns15" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    <br />
                    <asp:Label ID="lbl_Links_15" runat="server" Text="Free Form Links : " ForeColor="#FFFAF0" Font-Bold="true" />
                    <br />
                    <asp:TextBox ID="txt_Links_15" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-4">
                    <asp:Button ID="btn_Save3" runat="server" Text="Save" OnClick="btn_Save3_Click" ClientIDMode="Static" />
                </div>
                <div class="col-sm-4">
                    <asp:Button ID="btn_Previous" runat="server" Text="Previous" OnClick="btn_Previous_Click" ClientIDMode="Static" />

                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>

    </div>
</asp:Content>

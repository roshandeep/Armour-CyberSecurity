<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section2Part3.aspx.cs" Inherits="ArmourCyberSecurity.Section2Part3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #btn_Previous,
        #btn_Next,
        #btn_Save2 {
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
            #btn_Next:hover,
            #btn_Save2:hover {
                box-shadow: inset -4px -4px 10px rgba(225, 225, 225, 0.5), inset 4px 4px 10px rgba(0, 0, 0, 0.1);
                cursor: pointer;
                background-position: right;
                background: linear-gradient(120deg, #3498db, #3a4953) !important;
                transition: .5s;
            }


        h5 {
            color: floralwhite;
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

        function EnableTextArea16() {
            var ddlAns16 = document.getElementById('<%= ddlAns16.ClientID %>');
            var links16 = document.getElementById('<%= txt_Links_16.ClientID %>');

            if (ddlAns16.options[ddlAns16.selectedIndex].innerHTML == 'YES') {
                links16.disabled = false;
            }
            else {
                links16.disabled = true;
            }
        }

        function EnableTextArea22() {
            var ddlAns22 = document.getElementById('<%= ddlAns22.ClientID %>');
            var links22 = document.getElementById('<%= txt_Links_22.ClientID %>');

            if (ddlAns22.options[ddlAns1.selectedIndex].innerHTML == 'YES') {
                links22.disabled = false;
            }
            else {
                links22.disabled = true;
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

                            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="btn_rtn_dashbrd" CancelControlID="btnClose" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>
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
        <div style="height: 60px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    Would you like to Save or Discard Your changes?&nbsp;
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnDiscard" runat="server" Text="Discard" OnClick="btnDiscard_Click" />
        <asp:Button ID="btnClose" runat="server" Text="Close" />
    </asp:Panel>
    <div style="padding-top: 3rem; height: auto;">
        <div style="padding-left: 3rem">
            <h1 style="width: 90%; margin: 0 auto; color: floralwhite; background-color: transparent; text-align: center; padding-bottom: 1rem;">Privacy Engineering</h1><br />
            <h5 style="width: 90%; margin: 0 auto; background-color: transparent;">The following questions deal with how your system or service is set up with respect to the collection, transfer, processing and storage of personal data.
            </h5>
            <br />
            <h5 style="width: 90%; margin: 0 auto; background-color: transparent;"><b>SECTION GOAL:</b>
                <br />
                To ensure that privacy is at the foundation of your system and services. To evaluate the basis on which data is collected and the security of its processing, transfer and storage. Through this process you eliminate risk by removing any data that is not necessary to system, and add in the secuirty measures needed to protect the data
            </h5>
            <br />
            <h5 style="width: 90%; margin: 0 auto; background-color: transparent;"><b>STAKEHOLDERS REQUIRED: </b>
                <br />
                To fill out this section you will need a knowledge of the following:
            <br />
                the way the data is collected, stored, transefered and processed<br />
                * the types and cotegories of any perosnal data
            <br />
                the third party software and products your company uses with personal data
            <br />
            </h5>
            <br />
        </div>
        <div id='sec3Div' style="margin: 0 auto; width: 90%;" class="container-fluid">
            <br />
            <h2>Vendor Management</h2>
            <br />
            <h5 style="background-color: transparent; width: 95%; margin: 0 auto;">If you are the controller of data, your company is ultimately responsible for the safety and privacy of the data you handle. As such, vendors and third party partners must be compliant with regulation as well. This applies to internal software and services if your employees fall under a regulation (ex citizen of a country within the EU), and third party software and services, such as cloud storage, for customers and clients. Some regulations require a contract but it is a good idea to have one regardless.
            </h5>
            <br />
            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues16" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns16" onChange="EnableTextArea16()">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns16" ControlToValidate="ddlAns16" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    <br />
                    <asp:Label ID="lbl_Links_16" runat="server" Text="Free Form Links : " ForeColor="#FFFAF0" Font-Bold="true" /><br />
                    <asp:TextBox ID="txt_Links_16" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues17" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns17">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns17" ControlToValidate="ddlAns17" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues18" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns18">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns18" ControlToValidate="ddlAns18" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues19" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns19">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns19" ControlToValidate="ddlAns19" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues20" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns20">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns20" ControlToValidate="ddlAns20" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />

            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">

                    <asp:Label ID="lblQues21" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns21">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns21" ControlToValidate="ddlAns21" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    <br />
                </div>
            </div>
            <div class="row" style="padding-left: 4rem;">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues22" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns22" onChange="EnableTextArea22()">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns22" ControlToValidate="ddlAns22" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    <br />
                    <asp:Label ID="lbl_Links_22" runat="server" Text="Free Form Links : " ForeColor="#FFFAF0" Font-Bold="true" />
                    <br />
                    <asp:TextBox ID="txt_Links_22" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                    <br />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <asp:Button ID="btn_Save2" runat="server" Text="Save" OnClick="btn_Save2_Click" ClientIDMode="Static" />
                </div>
                <div class="col-sm-4">
                    <asp:Button ID="btn_Previous" runat="server" Text="Previous" OnClick="btn_Previous_Click" ClientIDMode="Static" />
                    
                </div>
                <div class="col-sm-4">
                    <asp:Button ID="btn_Next" runat="server" Text="Next" OnClick="btn_Next_Click" ClientIDMode="Static" />
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>

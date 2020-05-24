<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section2Part4.aspx.cs" Inherits="ArmourCyberSecurity.Section2Part4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #btn_Previous,
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

    </script>
    <div style="padding-top: 3rem; height: auto;">
        <div style="padding-left: 3rem">
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
        <div id='sec4Div' style="margin: 0 auto; width: 90%;" class="container-fluid">
            <br />
            <h2>Privacy Impact Assessment</h2>
            <br />
            <h5 style="background-color: transparent; width: 95%; margin: 0 auto;">All legislations require that companies show due diligence in their protection of personal data. This can be done via an evaluation called a Data Protection Impact Assessment (DPIA) or Privacy Impact Assessment (PIA), which lists, reviews, and records all the ways data is handled, used, stored, and protected.<br />
                The DPIA includes a system map, data map, and information from the data use info sheet, which are included in the sections above. The DPIA also covers security and privacy measures taken to protect the data while being accessed, stored, and transferred.
            </h5>
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
                    <br />
                </div>
            </div>
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
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-4">
                    <asp:Button ID="btn_Save2" runat="server" Text="Save" OnClick="btn_Save2_Click" ClientIDMode="Static" />
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

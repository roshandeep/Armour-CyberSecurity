<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section2.aspx.cs" Inherits="ArmourCyberSecurity.Section2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
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
        <div id='sec1Div' style="width: 90%; margin: 0 auto;" class="container-fluid">
            <h2>Privacy by Design</h2>
            <br />
            <h5 style="background-color: transparent; width: 95%; margin: 0 auto;">Privacy by Design is a framework to ensure that privacy is paramount in the operation and maintenance of a system. Applying the seven principles of PbD maximizes the security and safety of your data.
            <br />
                Starting with the foundation of the system or service, you'll need draw or write out the flow of data including collection, transfer and access to the data. [Note: this system and services map is the first step in a Data Privacy Impact Assessment below]
                                Both the adherence to Privacy by Design and the completed Privacy Impact Assessment are requirements for full compliance for many regulations.
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
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns1" ControlToValidate="ddlAns1" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%><br />
                    <asp:Label ID="lbl_Links_1" runat="server" Text="Free Form Links : " ForeColor="#FFFAF0" Font-Bold="true" /><br />
                    <asp:TextBox ID="txt_Links_1" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                </div>
            </div>
            <br />

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
                <div class="col-sm-6" style="padding-left: 1rem;">
                    <asp:DropDownList runat="server" ID="ddlAns7">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns7" ControlToValidate="ddlAns7" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-4">
                    <asp:Button ID="btn_Save2" runat="server" Text="Save" OnClick="btn_Save2_Click" ClientIDMode="Static" />
                </div>
                <div class="col-sm-4">
                    <asp:Button ID="btn_Next" runat="server" Text="Next" OnClick="btn_Next_Click" ClientIDMode="Static" />
                    <asp:ConfirmButtonExtender ID="ConfirmButtonExtender2" TargetControlID="btn_Next" ConfirmText="Press OK if you have saved your changes or if you wish to proceed without saving." runat="server"></asp:ConfirmButtonExtender>
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>
    </div>
</asp:Content>

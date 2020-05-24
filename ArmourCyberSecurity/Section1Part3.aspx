<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section1Part3.aspx.cs" Inherits="ArmourCyberSecurity.Section1Part3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #Global_Regulations {
            /*                    background: linear-gradient(#626d8d, #efefef,#c3c5cb);*/
            background-image: url(./Level1/assets/images/bground.jpg);
            /*                background:linear-gradient(120deg,#3498db,#224ee3,#3498db);*/
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            height: auto;
        }

        #btn_Previous,
        #btn_Save1 {
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
            #btn_Save1:hover {
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
            width: 100%;
        }


        .input-disabled {
            color: rgb(84, 84, 84) !important;
            cursor: default !important;
            background-color: rgb(235, 235, 228) !important;
        }

        #ContentPlaceHolder1_lblQues1,
        #ContentPlaceHolder1_lblQues2,
        #ContentPlaceHolder1_lblQues3,
        #ContentPlaceHolder1_lblQues4,
        #ContentPlaceHolder1_lblQues5,
        #ContentPlaceHolder1_lblQues6,
        #ContentPlaceHolder1_lblQues7,
        #ContentPlaceHolder1_lblQues8,
        #ContentPlaceHolder1_lblQues9,
        #ContentPlaceHolder1_lblQues10,
        #ContentPlaceHolder1_lblQues11,
        #ContentPlaceHolder1_lblQues12,
        #ContentPlaceHolder1_lblQues13,
        #ContentPlaceHolder1_lbl_Name,
        #ContentPlaceHolder1_lbl_Email,
        #ContentPlaceHolder1_lbl_Phone,
        #ContentPlaceHolder1_lbl_Title,
        #ContentPlaceHolder1_lbl_Contact,
        #ContentPlaceHolder1_lblQues14,
        #ContentPlaceHolder1_lbl_dpaLinks {
            color: floralwhite;
            font-size: large;
            font-weight: 400;
        }




        #ContentPlaceHolder1_ddlAns3,
        #ContentPlaceHolder1_ddlAns4,
        #ContentPlaceHolder1_ddlAns5,
        #ContentPlaceHolder1_ddlAns6,
        #ContentPlaceHolder1_ddlAns7,
        #ContentPlaceHolder1_ddlAns8,
        #ContentPlaceHolder1_ddlAns9,
        #ContentPlaceHolder1_ddlAns10,
        #ContentPlaceHolder1_ddlAns11,
        #ContentPlaceHolder1_ddlAns12,
        #ContentPlaceHolder1_ddlAns13, #ContentPlaceHolder1_ddlAns14 {
            display: block;
            width: 50%;
            padding: .375rem .75rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: rgba(255, 255, 255, 1);
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: .25rem;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
        }

        #ContentPlaceHolder1_txt_Name,
        #ContentPlaceHolder1_txt_phone,
        #ContentPlaceHolder1_txt_title,
        #ContentPlaceHolder1_txt_contact,
        #ContentPlaceHolder1_txt_Email {
            display: block;
            width: 100%;
            padding: .375rem .75rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: rgba(255, 255, 255, 1);
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: .25rem;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
            margin-left: 5rem;
        }

        #ContentPlaceHolder1_txt_dpaLinks {
            display: block;
            width: 100%;
            padding: .375rem .75rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: rgba(255, 255, 255, 1);
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: .25rem;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
            margin-left: 21.5rem;
            height: auto;
            margin-bottom: 1rem
        }


        label {
            color: floralwhite;
            font-size: large;
            font-weight: 400;
            padding: 5px;
        }
    </style>
    <script>

        function Enable() {
            var ddlAns13 = document.getElementById('<%= ddlAns13.ClientID %>');

            var Name = document.getElementById('<%= txt_Name.ClientID %>');
            var Email = document.getElementById('<%= txt_Email.ClientID %>');
            var phone = document.getElementById('<%= txt_phone.ClientID %>');
            var title = document.getElementById('<%= txt_title.ClientID %>');
            var contact = document.getElementById('<%= txt_contact.ClientID %>');


            if (ddlAns13.options[ddlAns13.selectedIndex].innerHTML == 'YES') {
                Name.disabled = false;
                Email.disabled = false;
                phone.disabled = false;
                title.disabled = false;
                contact.disabled = false;
            }
            else {
                Name.disabled = true;
                Email.disabled = true;
                phone.disabled = true;
                title.disabled = true;
                contact.disabled = true;
            }
        }

        function EnableTextArea() {
            var ddlAns14 = document.getElementById('<%= ddlAns14.ClientID %>');
            var links = document.getElementById('<%= txt_dpaLinks.ClientID %>');

            if (ddlAns14.options[ddlAns14.selectedIndex].innerHTML == 'YES') {
                links.disabled = false;
            }
            else {
                links.disabled = true;
            }
        }

    </script>

    <div id="Global_Regulations" class="container-fluid">
        <div class="row" style="padding-top: 3rem;">
            <h5 style="width: 90%; margin: 0 auto; color: floralwhite; background-color: transparent;"><strong>The following questions deal with the region in which you do buisness, which includes both where your office resides and where your customers reside.</strong>
                <br />
                For the purpose of this report, we will be focusing on GDPR (Europe), PIPEDA (Canada), CCPA (California), and LGPD (Brazil. This said, between the global reach of many companies and the fact that more countries and regional oversight are coming to law, following the best practice suggestions laid out in this assessment will benefit you regardless of region.
                <br />
                <br />
            </h5>

            <br />
            <h5 style="width: 90%; margin: 0 auto; align-content: center; color: floralwhite; background-color: transparent;">
                <b>SECTION GOAL:</b>
                <br />
            </h5>
            <br />
            <h5 style="width: 90%; margin: 0 auto; color: floralwhite; background-color: transparent;">To establish which legislations are required, determined by both your company location and that of your customers. Qualify your company against those legislations to determine your company’s ‘role’ with respect to the data (GDPR Ex. Processor or Controller).

                            Note: If you deal with medical data, then there are separate regulations that are specific to these kinds of records. They are typical labeled Health Insurance Portability and Accountability Act, or the like.
                <br />
                <br />
            </h5>
            <br />

            <h5 style="width: 90%; margin: 0 auto; color: floralwhite; background-color: transparent;"><b>STAKEHOLDERS REQUIRED:</b>
                <br />
                To fill out this section you will need a knowledge of the locations of the company and the people who use your product/service.
            <br />
            </h5>
        </div>
        <br />

        <div id='sec3Div' class="container-fluid" style="width: 90%;">
            <div class="row" style="width: 90%; margin: 0 auto;">
                <h2>Roles</h2>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues11" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns11">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns11" ControlToValidate="ddlAns11" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    <br />
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues12" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns12">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns12" ControlToValidate="ddlAns12" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    <br />
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues13" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns13" onChange="Enable()">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns13" ControlToValidate="ddlAns13" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    <br />
                </div>
            </div>
            <div class="row" id="DPODetails">
                <div class="col-sm-8">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-8">
                                <asp:Label ID="lbl_Name" runat="server" Text="Name : " />
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txt_Name" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-8">
                                <asp:Label ID="lbl_Email" runat="server" Text="Email : " />
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txt_Email" runat="server"> </asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-8">
                                <asp:Label ID="lbl_Phone" runat="server" Text="Phone No : " />
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txt_phone" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-8">
                                <asp:Label ID="lbl_Title" runat="server" Text="Title : " />
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txt_title" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-8">
                                <asp:Label ID="lbl_Contact" runat="server" Text="Other Contact Info : " />
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txt_contact" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-sm-6">
                    <asp:Label ID="lblQues14" runat="server" Text="" />
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList runat="server" ID="ddlAns14" onChange="EnableTextArea()">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator runat="server" ID="reqAns14" ControlToValidate="ddlAns14" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    <br />
                </div>
            </div>
            <div class="row" id="DPOLinks">

                <div class="col-sm-6">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                                <asp:Label ID="lbl_dpaLinks" runat="server" Text="DPA : " />
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txt_dpaLinks" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
            </div>
            <div class="row text-center">
                <div class="col-sm-2"></div>
                <div class="col-sm-4">
                    <asp:Button ID="btn_Save1" runat="server" Text="Save" OnClick="btn_Save1_Click" ClientIDMode="Static" />
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

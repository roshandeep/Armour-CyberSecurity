<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section1.aspx.cs" Inherits="ArmourCyberSecurity.Section1" %>

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


        #btn_Next,
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

            #btn_Next:hover,
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

        function ValidateDemoList(source, args) {
            var chkListModules = document.getElementById('<%= chkbxAns1.ClientID %>');
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }
            args.IsValid = false;
        }

        function ValidateDemoList2(source, args) {
            var chkListModules = document.getElementById('<%= chkbxAns2.ClientID %>');
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }
            args.IsValid = false;
        }

    </script>

    <div id="Global_Regulations" class="container-fluid">
        <div class="row" style="padding-top: 3rem;">
            <h1 style="width: 90%; margin: 0 auto; color: floralwhite; background-color: transparent; text-align: center; padding-bottom: 1rem;">Global Regulations</h1><br />
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
        <div id='sec1Div' class="container-fluid" style="width: 90%;">
            <div class="row" style="padding-left: 6rem;">
                <h2>Regional specific questions</h2>
            </div>
            <div class="row">
                <asp:Label ID="lblQues1" runat="server" Text="" />
            </div>
            <div class="row">
                <asp:CheckBoxList ID="chkbxAns1" runat="server" ClientIDMode="Static" ClientValidationFunction="ValidateDemoList" RepeatDirection="Vertical">
                </asp:CheckBoxList>
                <asp:CustomValidator runat="server" ID="cvDemoList" ErrorMessage="* Required" ForeColor="Red"></asp:CustomValidator>
                <br />
            </div>
            <div class="row">
                <asp:Label ID="lblQues2" runat="server" Text="" />
            </div>
            <div class="row">
                <asp:CheckBoxList ID="chkbxAns2" runat="server" ClientIDMode="Static" ClientValidationFunction="ValidateDemoList2" RepeatDirection="Vertical">
                </asp:CheckBoxList>
                <asp:CustomValidator runat="server" ID="cvDemoList2" ErrorMessage="* Required" ForeColor="Red"></asp:CustomValidator>
                <br />
            </div>
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-4">
                    <asp:Button ID="btn_Save1" runat="server" Text="Save" OnClick="btn_Save1_Click" ClientIDMode="Static" />
                </div>
                <div class="col-sm-4">
                    <asp:Button ID="btn_Next" runat="server" Text="Next" OnClick="btn_Next_Click" ClientIDMode="Static" />
                    <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="btn_Next" ConfirmText="Press OK if you have saved your changes or if you wish to proceed without saving." runat="server"></asp:ConfirmButtonExtender>
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>

    </div>
</asp:Content>

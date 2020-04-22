<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section1.aspx.cs" Inherits="ArmourCyberSecurity.Section1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        $(document).ready(function () {
            $("#sec2Div").hide();
            $("#sec3Div").hide();

        });

        $(document).on('click', '[id*=btn_part1]', function () {
            $("#sec1Div").slideUp(1000);
            $("#sec2Div").slideDown(1000);
        });

        $(document).on('click', '[id*=btn_part2]', function () {
            $("#sec2Div").slideUp(1000);
            $("#sec3Div").slideDown(1000);
        });

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
    <div id="Global Regulations" class="container-fluid">
        <div class="row">
            <h5>The following questions deal with the region in which you do buisness, which includes both where your office resides and where your customers reside.
            <br>
                For the purpose of this report, we will be focusing on GDPR (Europe), PIPEDA (Canada), CCPA (California), and LGPD (Brazil. This said, between the global reach of many companies and the fact that more countries and regional oversight are coming to law, following the best practice suggestions laid out in this assessment will benefit you regardless of region.

            </h5>

            <h5>SECTION GOAL:
            <br>
                To establish which legislations are required, determined by both your company location and that of your customers. Qualify your company against those legislations to determine your company’s ‘role’ with respect to the data (GDPR Ex. Processor or Controller).

            Note: If you deal with medical data, then there are separate regulations that are specific to these kinds of records. They are typical labeled Health Insurance Portability and Accountability Act, or the like.

            </h5>

            <h5>STAKEHOLDERS REQUIRED:
            <br>
                To fill out this section you will need a knowledge of the locations of the company and the people who use your product/service.
            </h5>
        </div>

        <div id='sec1Div' class="container-fluid">
            <div class="row">
                <h2>Regional specific questions</h2>
            </div>
            <div class="row">
                <asp:Label ID="lblQues1" runat="server" Text="" />
            </div>
            <div class="row">
                <asp:CheckBoxList ID="chkbxAns1" runat="server" ClientIDMode="Static" ClientValidationFunction="ValidateDemoList" AutoPostBack="True" OnSelectedIndexChanged="chkbxAns1_SelectedIndexChanged" RepeatDirection="Horizontal">
                </asp:CheckBoxList>
                <asp:CustomValidator runat="server" ID="cvDemoList" ErrorMessage="* Required" ForeColor="Red"></asp:CustomValidator>
                <br />
            </div>
            <div class="row">
                <asp:Label ID="lblQues2" runat="server" Text="" />
            </div>
            <div class="row">
                <asp:CheckBoxList ID="chkbxAns2" runat="server" ClientIDMode="Static" ClientValidationFunction="ValidateDemoList2" AutoPostBack="True" OnSelectedIndexChanged="chkbxAns2_SelectedIndexChanged" RepeatDirection="Horizontal">
                </asp:CheckBoxList>
                <asp:CustomValidator runat="server" ID="cvDemoList2" ErrorMessage="* Required" ForeColor="Red"></asp:CustomValidator>
                <br />
            </div>
            <div class="row">
                <asp:Button ID="btn_part1" runat="server" Text="Next" ClientIDMode="Static" OnClientClick="return false;" />
            </div>
        </div>

        <div id='sec2Div' class="container-fluid">
            <div class="row">
                <h2>Regional specific questions</h2>
            </div>

            <div id="Ques3Div" runat="server" class="row">
                <div class="col-sm-8">
                    <asp:Label ID="lblQues3" runat="server" Text="" Visible="false" />
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList runat="server" ID="ddlAns3" Visible="false">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns3" ControlToValidate="ddlAns3" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>

            <br />

            <div id="Ques4Div" runat="server" class="row">
                <div class="col-sm-8">
                    <asp:Label ID="lblQues4" runat="server" Text="" Visible="false" />
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList runat="server" ID="ddlAns4" Visible="false">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns4" ControlToValidate="ddlAns4" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div id="Ques5Div" runat="server" class="row">
                <div class="col-sm-8">
                    <asp:Label ID="lblQues5" runat="server" Text="" Visible="false" />
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList runat="server" ID="ddlAns5" Visible="false">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns5" ControlToValidate="ddlAns5" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div id="Ques6Div" runat="server" class="row">
                <div class="col-sm-8">
                    <asp:Label ID="lblQues6" runat="server" Text="" Visible="false" />
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList runat="server" ID="ddlAns6" Visible="false">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns6" ControlToValidate="ddlAns6" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div class="row">
                <h2>Regional Fines</h2>
            </div>

            <div id="Ques7Div" runat="server" class="row">
                <div class="col-sm-8">
                    <asp:Label ID="lblQues7" runat="server" Text="" Visible="false" />
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList runat="server" ID="ddlAns7" Visible="false">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns7" ControlToValidate="ddlAns7" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div id="Ques8Div" runat="server" class="row">
                <div class="col-sm-8">
                    <asp:Label ID="lblQues8" runat="server" Text="" Visible="false" />
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList runat="server" ID="ddlAns8" Visible="false">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns8" ControlToValidate="ddlAns8" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div id="Ques9Div" runat="server" class="row">
                <div class="col-sm-8">
                    <asp:Label ID="lblQues9" runat="server" Text="" Visible="false" />
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList runat="server" ID="ddlAns9" Visible="false">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns9" ControlToValidate="ddlAns9" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />

            <div id="Ques10Div" runat="server" class="row">
                <div class="col-sm-8">
                    <asp:Label ID="lblQues10" runat="server" Text="" Visible="false" />
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList runat="server" ID="ddlAns10" Visible="false">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns10" ControlToValidate="ddlAns10" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                </div>
            </div>
            <br />
            <div class="row">
                <asp:Button ID="btn_part2" runat="server" Text="Next" ClientIDMode="Static" OnClientClick="return false;" />
            </div>
        </div>

        <div id='sec3Div' class="container-fluid">
            <div class="row">
                <h2>Roles</h2>
            </div>
            <div class="row">
                <div class="col-sm-8">
                    <asp:Label ID="lblQues11" runat="server" Text="" />
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList runat="server" ID="ddlAns11">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns11" ControlToValidate="ddlAns11" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                    <br />
                </div>
            </div>

            <div class="row">
                <div class="col-sm-8">
                    <asp:Label ID="lblQues12" runat="server" Text="" />
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList runat="server" ID="ddlAns12">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns12" ControlToValidate="ddlAns12" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                    <br />
                </div>
            </div>

            <div class="row">
                <div class="col-sm-8">
                    <asp:Label ID="lblQues13" runat="server" Text="" />
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList runat="server" ID="ddlAns13">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns13" ControlToValidate="ddlAns13" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                    <br />
                </div>
            </div>

            <div class="row">
                <div class="col-sm-8">
                    <asp:Label ID="lblQues14" runat="server" Text="" />
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList runat="server" ID="ddlAns14">
                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="reqAns14" ControlToValidate="ddlAns14" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                    <br />
                </div>
            </div>

            <div class="row">
                <asp:Button ID="btn_Save1" runat="server" Text="Save" OnClick="btn_Save1_Click" />
            </div>
        </div>
    </div>
</asp:Content>

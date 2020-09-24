<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="SelfEvaluation.aspx.cs" Inherits="ArmourCyberSecurity.Level1.SelfEvaluation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Privacy Compliance Assessment</h1>
    </div>

        <div id="sec1Div">
            <div class="card shadow h-100">

                <div class="card-body">
                    <h5 class="card-header">Privacy Culture</h5>
                    <br />
                    <div class="container">

                        <div class="form-group row">

                            <asp:Label ID="lblQues1" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns1" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns1" ControlToValidate="ddlAns1" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>

                        </div>

                        <div class="form-group row">

                            <asp:Label ID="lblQues2" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns2" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns2" ControlToValidate="ddlAns2" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>

                        </div>

                        <div class="form-group row">

                            <asp:Label ID="lblQues3" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns3" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns3" ControlToValidate="ddlAns3" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>

                        </div>

                        <div class="form-group row">

                            <asp:Label ID="lblQues4" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns4" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns4" ControlToValidate="ddlAns4" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>

                        </div>

                        <div class="form-group row">

                            <asp:Label ID="lblQues5" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns5" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns5" ControlToValidate="ddlAns5" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>

                        </div>

                    </div>
                    <br />

                    <h5 class="card-header">Regional Specific</h5>
                    <br />
                    <div class="container">
                        <asp:Label ID="lblQues6" runat="server" Text="" />
                        <asp:CheckBoxList ID="chkbxAns6" runat="server" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="chkbxAns6_SelectedIndexChanged1" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>
                        <asp:CustomValidator runat="server" ID="cvDemoList" ClientValidationFunction="ValidateDemoList" ErrorMessage="* Required" ForeColor="Red"></asp:CustomValidator>
                        <br />

                        <asp:Label ID="lblQues7" runat="server" Text="" />
                        <asp:CheckBoxList ID="chkbxAns7" runat="server" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="chkbxAns7_SelectedIndexChanged" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>
                        <asp:CustomValidator runat="server" ID="cvDemoList2" ClientValidationFunction="ValidateDemoList2" ErrorMessage="* Required" ForeColor="Red"></asp:CustomValidator>
                    </div>
                </div>
            </div>

            <br />
            <asp:Button ID="btn_section1" runat="server" Text="Next" ClientIDMode="Static" OnClientClick="return false; Validate();" CssClass="btn btn-primary" />
        </div>


        <div id='sec2Div'>

            <div class="card shadow h-100">
                <div class="card-body">
                    <h5 class="card-header">Regional Specific</h5>
                    <br />
                    <div class="container">
                        <div id="Ques8Div" runat="server">
                            <div class="form-group row">
                                <asp:Label ID="lblQues8" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                                <div class="col">
                                    <asp:DropDownList runat="server" ID="ddlAns8" Visible="false" CssClass="form-control">
                                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="reqAns8" ControlToValidate="ddlAns8" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                                </div>
                            </div>
                        </div>

                        <div id="Ques9Div" runat="server">
                            <div class="form-group row">
                                <asp:Label ID="lblQues9" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                                <div class="col">
                                    <asp:DropDownList runat="server" ID="ddlAns9" Visible="false" CssClass="form-control">
                                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="reqAns9" ControlToValidate="ddlAns9" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                                </div>
                            </div>
                        </div>

                        <div id="Ques10Div" runat="server">
                            <div class="form-group row">
                                <asp:Label ID="lblQues10" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                                <div class="col">
                                    <asp:DropDownList runat="server" ID="ddlAns10" Visible="false" CssClass="form-control">
                                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="reqAns10" ControlToValidate="ddlAns10" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                                </div>
                            </div>
                        </div>

                        <div id="Ques11Div" runat="server">
                            <div class="form-group row">
                                <asp:Label ID="lblQues11" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                                <div class="col">
                                    <asp:DropDownList runat="server" ID="ddlAns11" Visible="false" CssClass="form-control">
                                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="reqAns11" ControlToValidate="ddlAns11" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                                </div>
                            </div>
                        </div>

                    </div>

                    <br />

                    <h5 class="card-header">Regional Fines</h5>
                    <br />
                    <div class="container">

                        <div id="Ques12Div" runat="server">
                            <div class="form-group row">
                                <asp:Label ID="lblQues12" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                                <div class="col">
                                    <asp:DropDownList runat="server" ID="ddlAns12" Visible="false" CssClass="form-control">
                                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="reqAns12" ControlToValidate="ddlAns12" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                                </div>
                            </div>
                        </div>

                        <div id="Ques13Div" runat="server">
                            <div class="form-group row">
                                <asp:Label ID="lblQues13" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                                <div class="col">
                                    <asp:DropDownList runat="server" ID="ddlAns13" Visible="false" CssClass="form-control">
                                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="reqAns13" ControlToValidate="ddlAns13" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                                </div>
                            </div>
                        </div>

                        <div id="Ques14Div" runat="server">
                            <div class="form-group row">
                                <asp:Label ID="lblQues14" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                                <div class="col">
                                    <asp:DropDownList runat="server" ID="ddlAns14" Visible="false" CssClass="form-control">
                                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="reqAns14" ControlToValidate="ddlAns14" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                                </div>
                            </div>
                        </div>

                        <div id="Ques15Div" runat="server">
                            <div class="form-group row">
                                <asp:Label ID="lblQues15" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                                <div class="col">
                                    <asp:DropDownList runat="server" ID="ddlAns15" Visible="false" CssClass="form-control">
                                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="reqAns15" ControlToValidate="ddlAns15" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <br />

            <asp:Button ID="btn_section2" runat="server" Text="Next" ClientIDMode="Static" OnClientClick="return false;" CssClass="btn btn-primary" />
        </div>



        <div id='sec3Div'>

            <div class="card shadow h-100">
                <div class="card-body">
                    <h5 class="card-header">Privacy Engineering</h5>
                    <br />
                    <div class="container">

                        <div class="form-group row">
                            <asp:Label ID="lblQues16" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns16" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns16" ControlToValidate="ddlAns16" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <asp:Label ID="lblQues17" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns17" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns17" ControlToValidate="ddlAns17" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <asp:Label ID="lblQues18" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns18" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns18" ControlToValidate="ddlAns18" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <asp:Label ID="lblQues19" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns19" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns19" ControlToValidate="ddlAns19" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <asp:Label ID="lblQues20" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns20" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns20" ControlToValidate="ddlAns20" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <asp:Label ID="lblQues21" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns21" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns21" ControlToValidate="ddlAns21" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>
                        </div>

                    </div>
                    <br />
                    <h5 class="card-header">Data Control</h5>
                    <br />
                    <div class="container">
                        <div class="form-group row">
                            <asp:Label ID="lblQues22" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns22" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns22" ControlToValidate="ddlAns22" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>
                        </div>

                        <div runat="server" id="Ques23Div">
                            <div class="form-group row">
                                <asp:Label ID="lblQues23" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                                <div class="col">
                                    <asp:DropDownList runat="server" ID="ddlAns23" Visible="false" Style="margin-top: -25px;" CssClass="form-control">
                                        <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="reqAns23" ControlToValidate="ddlAns23" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <br />
            <asp:Button ID="btn_section3" runat="server" Text="Next" ClientIDMode="Static" OnClientClick="return false;" CssClass="btn btn-primary" />
        </div>



        <div id='sec4Div'>

            <div class="card shadow h-100">
                <div class="card-body">
                    <h5 class="card-header">Consent</h5>
                    <br />
                    <div class="container">
                        <div class="form-group row">
                            <asp:Label ID="lblQues24" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns24" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns24" ControlToValidate="ddlAns24" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <asp:Label ID="lblQues25" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns25" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns25" ControlToValidate="ddlAns25" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>
                        </div>

                    </div>

                    <h5 class="card-header">Incident Response</h5>
                    <br />
                    <div class="container">
                        <div class="form-group row">
                            <asp:Label ID="lblQues26" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns26" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns26" ControlToValidate="ddlAns26" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <asp:Label ID="lblQues27" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns27" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns27" ControlToValidate="ddlAns27" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <asp:Label ID="lblQues28" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns28" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns28" ControlToValidate="ddlAns28" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <asp:Label ID="lblQues29" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                            <div class="col">
                                <asp:DropDownList runat="server" ID="ddlAns29" CssClass="form-control">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="reqAns29" ControlToValidate="ddlAns29" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <asp:Button ID="btn_Submit" runat="server" Text="Finish" OnClick="btn_Submit_Click" CssClass="btn btn-primary" />
        </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

    <script>
        $(document).ready(function () {
            $("#sec2Div").hide();
            $("#sec3Div").hide();
            $("#sec4Div").hide();

        });

        $(document).on('click', '[id*=btn_section1]', function () {
            var v1 = document.getElementById("<%=reqAns1.ClientID%>");
            var v2 = document.getElementById("<%=reqAns2.ClientID%>");
            var v3 = document.getElementById("<%=reqAns3.ClientID%>");
            var v4 = document.getElementById("<%=reqAns4.ClientID%>");
            var v5 = document.getElementById("<%=reqAns5.ClientID%>");
            var v6 = document.getElementById("<%=cvDemoList.ClientID%>");
            var v7 = document.getElementById("<%=cvDemoList2.ClientID%>");
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

        $(document).on('click', '[id*=btn_section2]', function () {
            $("#sec2Div").slideUp(1000);
            $("#sec3Div").slideDown(1000);
        });

        $(document).on('click', '[id*=btn_section3]', function () {
            var v16 = document.getElementById("<%=reqAns16.ClientID%>");
            var v17 = document.getElementById("<%=reqAns17.ClientID%>");
            var v18 = document.getElementById("<%=reqAns18.ClientID%>");
            var v19 = document.getElementById("<%=reqAns19.ClientID%>");
            var v20 = document.getElementById("<%=reqAns20.ClientID%>");
            var v21 = document.getElementById("<%=reqAns21.ClientID%>");
            var v22 = document.getElementById("<%=reqAns22.ClientID%>");
            ValidatorValidate(v16);
            ValidatorValidate(v17);
            ValidatorValidate(v18);
            ValidatorValidate(v19);
            ValidatorValidate(v20);
            ValidatorValidate(v21);
            ValidatorValidate(v22);
            if (v16.isvalid && v17.isvalid && v18.isvalid && v19.isvalid && v20.isvalid && v21.isvalid && v22.isvalid) {
                $("#sec3Div").slideUp(1000);
                $("#sec4Div").slideDown(1000);
            }
            else {
                alert("Fill in all the questions before moving ahead");
            }
        });


        function ValidateDemoList(source, args) {
            var chkListModules = document.getElementById('<%= chkbxAns6.ClientID %>');
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
            var chkListModules = document.getElementById('<%= chkbxAns7.ClientID %>');
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

</asp:Content>

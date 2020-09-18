<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ArmourCyberSecurity.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="../Content/signup.css" rel="stylesheet" />
    <link rel="stylesheet" href="../Level1/assets/web/assets/mobirise-icons/mobirise-icons.css">
    <link rel="stylesheet" href="../Level1/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../Level1/assets/bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../Level1/assets/bootstrap/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../Level1/assets/socicon/css/styles.css">
    <link rel="stylesheet" href="../Level1/assets/dropdown/css/style.css">
    <link rel="stylesheet" href="../Level1/assets/tether/tether.min.css">
    <link rel="stylesheet" href="../Level1/assets/theme/css/style.css">

    <style>
        .btn-primary, .btn-primary:active {
            background-color: #0a2044 !important;
            border-color: #0a2044 !important;
            color: #ffffff !important;
        }

            .btn-primary, .btn-primary:active, btn-primary:hover {
                background-color: #0a2044 !important;
                border-color: #0a2044 !important;
                color: #ffffff !important;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container-fluid">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6 text-center justify-content-center">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <img src="../Level1/assets/images/Logo.png" style="width: 58px;" />
                                    <br />
                                    <h2>Sign up</h2>
                                    <br />
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col">
                                                <asp:TextBox ID="txt_firstName" runat="server" CssClass="form-control" placeholder="First Name" />
                                                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txt_firstName" runat="server" />
                                            </div>
                                            <div class="col">
                                                <asp:TextBox ID="txt_lastName" runat="server" placeholder="Last Name" CssClass="form-control" />
                                                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txt_lastName" runat="server" />
                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col">
                                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Enter Email ID" />
                                                <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                                                    ControlToValidate="txtEmail" runat="server" />
                                                <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                    ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                                                <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
                                            </div>
                                            <div class="col">
                                                <asp:TextBox ID="txt_phoneNumber" runat="server" placeholder="Phone Number" CssClass="form-control" />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ControlToValidate="txt_phoneNumber" ErrorMessage="Enter 10 digit Phone Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col">
                                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" />
                                                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPassword" runat="server" Display="Dynamic" />
                                            </div>
                                            <div class="col">
                                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm Password" />
                                                <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="txtPassword"
                                                    ControlToValidate="txtConfirmPassword" runat="server" />
                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col">
                                                <asp:TextBox ID="txt_industry" runat="server" CssClass="form-control" placeholder="Industry" />
                                            </div>
                                            <div class="col">
                                                <asp:TextBox ID="txt_country" runat="server" placeholder="Country" CssClass="form-control" />
                                            </div>
                                        </div>

                                    </div>
                                    <br />
                                    <div class="row">
                                        <asp:Button Text="Submit" runat="server" OnClick="RegisterUser" class="btn btn-primary logbtn" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>





                </div>
            </div>
        </div>


    </form>

</body>

<script src="https://code.jquery.com/jquery-3.5.0.js" integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>

<script src="../Level1/assets/web/assets/jquery/jquery.min.js"></script>
<script src="../Level1/assets/popper/popper.min.js"></script>
<script src="../Level1/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="../Level1/assets/tether/tether.min.js"></script>
<script src="../Level1/assets/smoothscroll/smooth-scroll.js"></script>
<script src="../Level1/assets/dropdown/js/nav-dropdown.js"></script>
<script src="../Level1/assets/dropdown/js/navbar-dropdown.js"></script>
<script src="../Level1/assets/touchswipe/jquery.touch-swipe.min.js"></script>
<script src="../Level1/assets/theme/js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js" integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc=" crossorigin="anonymous"></script>
<script>
    $(".txtb input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".txtb input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });
</script>
</html>

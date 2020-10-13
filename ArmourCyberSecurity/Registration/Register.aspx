<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ArmourCyberSecurity.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Favicon icon -->
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Register | Privacy Compliance Solutions</title>
    <!-- Custom fonts for this template-->
    <link href="../../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../../assets/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../../assets/css/style.css" rel="stylesheet">

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
                <div class="col-md-6 text-center justify-content-center pt-3">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <img src="../Level1/assets/images/Logo.png" style="width: 58px;" />
                                    <br />
                                    <h1 style="color: #000;">Sign up</h1>
                                    <br />
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col">
                                                <asp:TextBox ID="txt_firstName" runat="server" CssClass="form-control" placeholder="First Name*" />
                                                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txt_firstName" runat="server" />
                                            </div>
                                            <div class="col">
                                                <asp:TextBox ID="txt_lastName" runat="server" placeholder="Last Name*" CssClass="form-control" />
                                                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txt_lastName" runat="server" />
                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col">
                                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Enter Email ID*" />
                                                <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                                                    ControlToValidate="txtEmail" runat="server" />
                                                <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                    ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                                                <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
                                            </div>
                                            <div class="col">
                                                <asp:TextBox ID="txt_phoneNumber" runat="server" placeholder="Phone Number*" CssClass="form-control" />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ControlToValidate="txt_phoneNumber" ErrorMessage="Enter 10 digit Phone Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col">
                                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password*" />
                                                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPassword" runat="server" Display="Dynamic" />
                                            </div>
                                            <div class="col">
                                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm Password*" />
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
                                        <asp:Button Text="Submit" runat="server" OnClick="RegisterUser" class="btn btn-primary btn-lg btn-block" />
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

<!-- Bootstrap core JavaScript-->
<script src="../../assets/vendor/jquery/jquery.min.js"></script>
<script src="../../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../../assets/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../../assets/js/sb-admin-2.min.js"></script>
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

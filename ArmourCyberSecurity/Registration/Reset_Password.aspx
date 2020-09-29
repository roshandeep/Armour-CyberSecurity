<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reset_Password.aspx.cs" Inherits="ArmourCyberSecurity.Registration.Reset_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Favicon icon -->
    <link rel="icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Forgot Password | Privacy Compliance Solutions</title>
    <!-- Custom fonts for this template-->
    <link href="../../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="../../assets/css/sb-admin-2.css" rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="../../assets/css/style.css" rel="stylesheet" />


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>

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
                <div class="col-md-3 text-center justify-content-center pt-3">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <img src="../Level1/assets/images/Logo.png" style="width: 58px;" />
                                    <br />
                                    <h1 style="color: #000;">Reset Password</h1>
                                    <br />
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col">
                                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" />
                                                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPassword"
                                                    runat="server" />
                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col">
                                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm Password" />
                                                <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="txtPassword"
                                                    ControlToValidate="txtConfirmPassword" runat="server" />
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <asp:Button Text="Reset" runat="server" OnClick="ResetClick" CssClass="btn btn-primary btn-lg btn-block" />
                                    </div>
                                    <br />
                                    <div class="row">
                                        <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
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
</html>

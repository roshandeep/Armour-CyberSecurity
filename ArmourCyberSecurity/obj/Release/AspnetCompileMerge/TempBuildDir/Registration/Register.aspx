<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ArmourCyberSecurity.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/signup.css" rel="stylesheet" />
    <link rel="stylesheet" href="../Level1/assets/web/assets/mobirise-icons/mobirise-icons.css">
    <link rel="stylesheet" href="../Level1/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../Level1/assets/bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../Level1/assets/bootstrap/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../Level1/assets/socicon/css/styles.css">
    <link rel="stylesheet" href="../Level1/assets/dropdown/css/style.css">
    <link rel="stylesheet" href="../Level1/assets/tether/tether.min.css">
    <link rel="stylesheet" href="../Level1/assets/theme/css/style.css">
    <link rel="preload" as="style" href="../Level1/assets/mobirise/css/mbr-additional.css">
    <link rel="stylesheet" href="../Level1/assets/mobirise/css/mbr-additional.css" type="text/css">
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
</head>
<body>
    <form id="form1" runat="server">

        <section class="menu cid-rSx8XQK5A7" once="menu" id="menu1-8">
            <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <div class="hamburger"><span></span><span></span><span></span><span></span></div>
                </button>
                <div class="menu-logo">
                    <div class="navbar-brand">
                        <span class="navbar-logo"><a href="../Level1/LandingPage.aspx">
                            <img src="../Level1/assets/images/Logo.png" alt="Armour Logo" style="height: 3.8rem;">
                        </a>
                        </span>
                        <span class="navbar-caption-wrap">
                            <a class="navbar-caption text-white display-4" href="../Level1/LandingPage.aspx">Privacy Compliance Solutions </a>
                        </span>
                    </div>
                </div>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
                        <li class="nav-item">
                            <a class="nav-link link text-white display-4" href="../Level1/LandingPage#form4-k">Contact Us
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link text-white display-4" href="../Level1/LandingPage#testimonials1-5">About Us
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </section>

        <div class="login-form" style="top: 13%; transform: translate(-50%,0); width: 800px; height: auto; padding: 20px 40px;">
            <img src="../Level1/assets/images/Logo.png" style="width: 58px; margin-left: 20rem;" />
            <h1>Sign up</h1>

            <div class="row">
                <div style="float: left; width: 48%;">
                    <div class="txtb">
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Email ID" />
                        <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                            ControlToValidate="txtEmail" runat="server" />
                        <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                        <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
                    </div>
                </div>
                <div style="float: right; width: 48%;">
                    <div class="txtb">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" />
                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPassword" runat="server" Display="Dynamic" />
                    </div>
                </div>
            </div>

            <div class="row">
                <div style="float: left; width: 48%;">
                    <div class="txtb">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password" />
                        <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="txtPassword"
                            ControlToValidate="txtConfirmPassword" runat="server" />
                    </div>
                </div>
                <div style="float: right; width: 48%;">
                    <div class="txtb">
                        <asp:TextBox ID="txt_firstName" runat="server" placeholder="First Name" />
                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txt_firstName" runat="server" />
                    </div>
                </div>
            </div>

            <div class="row">
                <div style="float: left; width: 48%;">
                    <div class="txtb">
                        <asp:TextBox ID="txt_lastName" runat="server" placeholder="Last Name" />
                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txt_lastName" runat="server" />
                    </div>
                </div>

                <div style="float: right; width: 48%;">
                    <div class="txtb">
                        <asp:TextBox ID="txt_phoneNumber" runat="server" placeholder="Phone Number" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ControlToValidate="txt_phoneNumber" ErrorMessage="Enter 10 digit Phone Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>

            <div class="row">
                <div style="float: left; width: 48%;">

                    <div class="txtb">
                        <asp:TextBox ID="txt_industry" runat="server" placeholder="Industry" />
                    </div>
                </div>
                <div style="float: right; width: 48%;">

                    <div class="txtb">
                        <asp:TextBox ID="txt_country" runat="server" placeholder="Country" />
                    </div>

                </div>
            </div>
            <asp:Button Text="Submit" runat="server" OnClick="RegisterUser" class="logbtn" />
        </div>
    </form>
    <section once="footers" class="cid-rSxbAyIsnT" id="footer7-e" style="position: absolute; top: 115%; width: 100%;">
        <div class="container">
            <div class="media-container-row align-center mbr-white">
                <div class="row row-links">
                </div>
                <div class="row social-row">
                    <div class="social-list align-right pb-2">
                        <div class="soc-item">
                            <a href="#" target="_blank">
                                <span class="socicon-twitter socicon mbr-iconfont mbr-iconfont-social"></span>
                            </a>
                        </div>
                        <div class="soc-item">
                            <a href="#" target="_blank">
                                <span class="socicon-facebook socicon mbr-iconfont mbr-iconfont-social"></span>
                            </a>
                        </div>
                        <div class="soc-item">
                            <a href="#" target="_blank">
                                <span class="socicon-youtube socicon mbr-iconfont mbr-iconfont-social"></span>
                            </a>
                        </div>
                        <div class="soc-item">
                            <a href="#" target="_blank">
                                <span class="socicon-instagram socicon mbr-iconfont mbr-iconfont-social"></span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row row-copirayt">
                    <p class="mbr-text mb-0 mbr-fonts-style mbr-white align-center display-7">
                        © Copyright 2020 Armour Cyber Security
                        <br />
                        All Rights Reserved<br />
                        <a href="PrivacyCompliancePolicy.aspx">Privacy Policy</a>
                    </p>
                </div>
            </div>
        </div>
    </section>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgot_Password.aspx.cs" Inherits="ArmourCyberSecurity.Forgot_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="generator" content="AIHUB/DC" />
    <meta name="creator" author="techie(aj)" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1" />
    <link rel="shortcut icon" href="assets/images/Logo.png" type="image/x-icon" />
    <meta name="description" content="Home page" />

    <title>Privacy Compliance</title>
    <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css" />
    <link rel="stylesheet" href="assets/socicon/css/styles.css" />
    <link rel="stylesheet" href="assets/dropdown/css/style.css" />
    <link rel="stylesheet" href="assets/tether/tether.min.css" />
    <link rel="stylesheet" href="assets/theme/css/style.css" />
    <link rel="preload" as="style" href="assets/mobirise/css/mbr-additional.css" />
    <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css" />

    <style>
        * {
            margin: 0;
            padding: 0;
            text-decoration: none;
            font-family: montserrat;
            box-sizing: border-box
        }

        body {
            min-height: 100vh;
            background-image: linear-gradient(120deg, #3498db, #224ee3);
        }

        #form1 {
            width: 360px;
            background: #f1f1f1;
            height: 400px;
            padding: 80px 40px;
            border-radius: 10px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }

        #txtEmail {
            font-size: 15px;
            color: #333;
            border: none;
            width: 100%;
            outline: none;
            background: white;
            padding: 0 5px;
            height: 40px;
            border-bottom: 2px solid #adadad;
            position: relative;
            margin: 30px 0;
        }


        #btn_sendmail {
            display: block;
            width: 100%;
            height: 50px;
            border: none;
            background: linear-gradient(120deg, #3498db, #224ee3, #3498db);
            background-size: 200%;
            color: #fff;
            outline: none;
            cursor: pointer;
            transition: .5s;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
    <section class="menu cid-rSx8XQK5A7" once="menu" id="menu1-8">
        <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
            <div class="menu-logo">
                <div class="navbar-brand">
                    <span class="navbar-logo">
                        <a href="Level1/LandingPage.aspx">
                            <img src="assets/images/Logo.png" alt="Armour Logo" style="height: 3.8rem;" />
                        </a>
                    </span>
                    <span class="navbar-caption-wrap">
                        <a class="navbar-caption text-white display-4" href="Level1/LandingPage.aspx">Privacy Compliance Solutions
                        </a>
                    </span>
                </div>
            </div>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
                    <li class="nav-item">
                        <a class="nav-link link text-white display-4" href="Level1/LandingPage#form4-k">Contact Us
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link text-white display-4" href="Level1/LandingPage#testimonials1-5">About Us
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </section>
    <form id="form1" runat="server">
        <div>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <img src="../Level1/assets/images/Logo.png" style="width: 58px; margin-left: 7rem;" class="" />
                    <th colspan="3">Forgot Password
            </th>
                </tr>
                <tr>
                    <td>
                        <b>Email Address </b>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" Style="background-color: transparent;" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                            ControlToValidate="txtEmail" runat="server" />
                        <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                    </td>
                </tr>
                <tr>

                    <td colspan="3">
                        <asp:Button Text="Send Email" runat="server" OnClick="Forgot_Password_Click" CssClass="btn btn-primary display-4" ID="btn_sendmail" />
                        <h1>
                            <asp:Literal ID="ltMessage" runat="server" /></h1>
                    </td>

                </tr>
            </table>
        </div>
    </form>
    <section once="footers" class="cid-rSxbAyIsnT" id="footer7-e">
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
                        If you wish to withdraw your consent, please contact us at <a href="https://privacy@armourcyber.ca">privacy@armourcyber.ca</a>

                    </p>
                </div>
            </div>
        </div>
    </section>
    <script src="assets/web/assets/jquery/jquery.min.js"></script>
    <script src="assets/popper/popper.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/tether/tether.min.js"></script>
    <script src="assets/smoothscroll/smooth-scroll.js"></script>
    <script src="assets/dropdown/js/nav-dropdown.js"></script>
    <script src="assets/dropdown/js/navbar-dropdown.js"></script>
    <script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
    <script src="assets/theme/js/script.js"></script>
</body>
</html>

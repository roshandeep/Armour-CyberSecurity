<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomRoadmapDashboard.aspx.cs" Inherits="ArmourCyberSecurity.CustomRoadmapDashboard" %>

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

    <title>Custom Roadmap Dashboard</title>
    <link rel="stylesheet" href="Level1/assets/web/assets/mobirise-icons/mobirise-icons.css" />
    <link rel="stylesheet" href="Level1/assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Level1/assets/bootstrap/css/bootstrap-grid.min.css" />
    <link rel="stylesheet" href="Level1/assets/bootstrap/css/bootstrap-reboot.min.css" />
    <link rel="stylesheet" href="Level1/assets/socicon/css/styles.css" />
    <link rel="stylesheet" href="Level1/assets/dropdown/css/style.css" />
    <link rel="stylesheet" href="Level1/assets/tether/tether.min.css" />
    <link rel="stylesheet" href="Level1/assets/theme/css/style.css" />
    <link rel="preload" as="style" href="Level1/assets/mobirise/css/mbr-additional.css" />
    <link rel="stylesheet" href="Level1/assets/mobirise/css/mbr-additional.css" type="text/css" />

    <style>
        #btn_Sec1, #btn_Sec2, #btn_Sec3, #btn_Sec4, #btn_Sec5, #btn_Sec6 {
            border: none;
            background: none;
            font-weight: 600;
        }

        #btn_Sec1,
        #btn_Sec2,
        #btn_Sec3,
        #btn_Sec4,
        #btn_Sec5,
        #btn_Sec6 {
            background: white;
            color: #149dcc;
            margin-right: .2rem;
            width: 225px;
            height: 75px;
        }

            #btn_Sec1:hover,
            #btn_Sec2:hover,
            #btn_Sec3:hover,
            #btn_Sec4:hover,
            #btn_Sec5:hover,
            #btn_Sec6:hover {
                color: white;
                background: #149dcc;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <section class="menu cid-rSx8XQK5A7" once="menu" id="menu1-8">
            <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
                <div class="menu-logo">
                    <div class="navbar-brand">
                        <span class="navbar-logo">
                            <a href="Level1/LandingPage.aspx">
                                <img src="Level1/assets/images/Logo.png" alt="Armour Logo" style="height: 3.8rem;">
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
                        <li class="nav-item">
                            <asp:Label ID="lbl_userinit" runat="server" Text="" CssClass="nav-link link text-white display-4" ForeColor="#0795d6"/>
                        </li>
                    </ul>
                </div>
            </nav>
        </section>


        <section class="mbr-section info2 cid-rWXtEIH7mI" id="info2-s" style="background: linear-gradient(#149dcc, #587aed);">
            <div class="container" style="margin-top: 4.8rem; height: 80vh">
                <div class="row main justify-content-center">
                    <div class="media-container-column title col-12 col-lg-10 col-md-10">
                        <h2 class="align-center mbr-bold mbr-white pb-3 mbr-fonts-style display-2">Dash Board</h2>
                        <h3 class="mbr-section-subtitle align-center mbr-light mbr-white mbr-fonts-style display-5">ANY TEXT YOU WANT TO ADD.
                        </h3>
                    </div>

                    <div class="media-container-column col-12 col-lg-3 col-md-6">
                        <div class="mbr-section-btn align-left py-4">
                            <asp:Button ID="btn_Sec1" runat="server" Text="Global Regulations" OnClick="btn_Sec1_Click" CausesValidation="false" CssClass="btn btn-white-outline display-4" />
                        </div>
                    </div>
                    <div class="media-container-column col-12 col-lg-3 col-md-6">
                        <div class="mbr-section-btn align-left py-4">
                            <asp:Button ID="btn_Sec2" runat="server" Text="Privacy Engineering" OnClick="btn_Sec2_Click" CausesValidation="false" CssClass="btn btn-white-outline display-4" />
                        </div>
                    </div>
                    <div class="media-container-column col-12 col-lg-3 col-md-6">
                        <div class="mbr-section-btn align-left py-4">
                            <asp:Button ID="btn_Sec3" runat="server" Text="Data Control" OnClick="btn_Sec3_Click" CausesValidation="false" CssClass="btn btn-white-outline display-4" />
                        </div>
                    </div>
                    <div class="media-container-column col-12 col-lg-3 col-md-6">
                        <div class="mbr-section-btn align-left py-4">
                            <asp:Button ID="btn_Sec4" runat="server" Text="Consent" OnClick="btn_Sec4_Click" CausesValidation="false" CssClass="btn btn-white-outline display-4" />
                        </div>
                    </div>
                    <div class="media-container-column col-12 col-lg-3 col-md-6">
                        <div class="mbr-section-btn align-left py-4">
                            <asp:Button ID="btn_Sec5" runat="server" Text="Incident Management" OnClick="btn_Sec5_Click" CausesValidation="false" CssClass="btn btn-white-outline display-4" />
                        </div>
                    </div>
                    <div class="media-container-column col-12 col-lg-3 col-md-6">
                        <div class="mbr-section-btn align-left py-4">
                            <asp:Button ID="btn_Sec6" runat="server" Text="Employee Training" OnClick="btn_Sec6_Click" CausesValidation="false" CssClass="btn btn-white-outline display-4" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
                            <a href="PrivacyCompliancePolicy.aspx">Privacy Policy</a>
                        </p>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>

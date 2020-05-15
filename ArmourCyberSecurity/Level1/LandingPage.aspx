<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="ArmourCyberSecurity.LandingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--  -->
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="generator" content="AIHUB/DC">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1" />
    <link rel="shortcut icon" href="assets/images/Logo.png" type="image/x-icon" />
    <meta name="description" />
    <a href="LandingPage.aspx">LandingPage.aspx</a>

    <title>Cyber Assessment</title>
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
        .change_content:after {
            content: '';
            animation: changetext 24s infinite linear;
        }

        @keyframes changetext {
            0% {
                content: "Protecting Your Data?";
            }

            20% {
                content: "Regulation Ready?";
            }

            40% {
                content: "Ready To Be Safe?";
            }

            60% {
                content: "Ready To Be Secure?";
            }

            75% {
                content: "Sure Your Data Is Safe?";
            }

            100% {
                content: "meeting compliance for your customers?";
            }
        }
        /* Popup box BEGIN */

        .hover_bkgr_fricc {
            background: rgba(0, 0, 0, .4);
            cursor: pointer;
            display: none;
            height: 100%;
            position: fixed;
            text-align: center;
            top: 0;
            width: 100%;
            z-index: 10000;
        }

            .hover_bkgr_fricc .helper {
                display: inline-block;
                height: 100%;
                vertical-align: middle;
            }

            .hover_bkgr_fricc > div {
                background-color: #fff;
                box-shadow: 10px 10px 60px #555;
                display: inline-block;
                height: auto;
                max-width: 551px;
                min-height: 100px;
                vertical-align: middle;
                width: 60%;
                position: relative;
                border-radius: 8px;
                padding: 15px 5%;
            }

        .popupCloseButton {
            background-color: #fff;
            border: 3px solid #999;
            border-radius: 50px;
            cursor: pointer;
            display: inline-block;
            font-family: arial;
            font-weight: bold;
            position: absolute;
            top: -20px;
            right: -20px;
            font-size: 25px;
            line-height: 30px;
            width: 30px;
            height: 30px;
            text-align: center;
        }

            .popupCloseButton:hover {
                background-color: #ccc;
            }

        .trigger_popup_fricc {
            cursor: pointer;
            font-size: 20px;
            margin: 20px;
            display: inline-block;
            font-weight: bold;
        }
        /* Popup box BEGIN */
    </style>
</head>
<body>
    <section class="menu cid-rSx8XQK5A7" once="menu" id="menu1-8">
        <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <div class="hamburger">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </button>
            <div class="menu-logo">
                <div class="navbar-brand">
                    <span class="navbar-logo">
                        <a href="LandingPage.aspx">
                            <img src="assets/images/Logo.png" alt="Armour Logo" style="height: 3.8rem;" />
                        </a>
                    </span>
                    <span class="navbar-caption-wrap">
                        <a class="navbar-caption text-white display-4" href="LandingPage.aspx">Privacy Compliance Solutions
                        </a>
                    </span>
                </div>
            </div>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
                    <li class="nav-item">
                        <a class="nav-link link text-white display-4" href="#features15-9">
                            <!--                        <span class="mbri-home mbr-iconfont mbr-iconfont-btn"></span>-->
                            Regulations
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link text-white display-4" href="#features3-d">
                            <!--                        <span class="mbri-home mbr-iconfont mbr-iconfont-btn"></span>-->
                            Free Assessment
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link text-white display-4" href="#features3-d">
                           
                            Custom Roadmap
                    </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link text-white display-4" href="#form4-k">
                            <!--                        <span class="mbri-home mbr-iconfont mbr-iconfont-btn"></span>-->
                            Contact Us
                    </a>
                    </li>
                </ul>
                <div class="navbar-buttons mbr-section-btn">
                    <a class="btn btn-sm btn-primary display-4" href="/Login.aspx">
                        <span></span>
                        Sign in
                    </a>
                </div>
            </div>

        </nav>
    </section>

    <section class="engine">
        <a href="#">Information Section</a>
    </section>
    <section class="header6 cid-rSx82ns3zm mbr-fullscreen" data-bg-video="https://www.youtube.com/watch?v=36YgDDJ7XSc" id="header6-4">



        <div class="mbr-overlay" style="opacity: 0.5; background-color: rgb(35, 35, 35);">
        </div>

        <div class="container">
            <div class="row justify-content-md-center">
                <div class="mbr-white col-md-12">
                    <h1 class="mbr-section-title align-center mbr-bold pb-12 mbr-fonts-style display-1">Are You  <span class="change_content"></span>
                    </h1>
                    <p class="mbr-text align-center pb-3 mbr-fonts-style display-5">
                        Your clients’ data is your greatest asset. If the data is breached you will lose money, time, and credibility. Breaches can be avoided with good cyber security practices and compliance with regulations.<br />
                        Take our free assessment to get your customized report today.
               
                    </p>
                    <div class="mbr-section-btn align-center">
                        <a class="btn btn-md btn-primary display-4" href="#features3-d">Take Me to the Self Assessment</a>

                    </div>
                </div>
            </div>
        </div>

        <div class="mbr-arrow hidden-sm-down" aria-hidden="true">
            <a href="#next">
                <i class="mbri-down mbr-iconfont"></i>
            </a>
        </div>
    </section>

    <section class="features15 cid-rSx9e7dX8o" id="features15-9">
        <div class="container">
            <h2 class="mbr-section-title pb-3 align-center mbr-fonts-style display-2">Global Privacy Regulations 
            </h2>
            <h3 class="mbr-section-subtitle display-5 align-center mbr-fonts-style"></h3>

            <div class="media-container-row container pt-5 mt-2">

                <div class="col-12 col-md-6 mb-4 col-lg-3">
                    <div class="card flip-card p-5 align-center">
                        <div class="card-front card_cont">
                            <img src="assets/images/CCPA_logo_vertical.png" alt="Ccpa_img" />
                        </div>
                        <div class="card_back card_cont">
                            <h4 class="card-title display-5 py-2 mbr-fonts-style">CCPA
                            </h4>
                            <p class="mbr-text mbr-fonts-style display-7">
                                CCPA (California Consumer Privacy Act) is the data privacy regulation that applies to residents of California.
                       
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6 mb-4 col-lg-3">

                    <div class="card flip-card p-5 align-center">
                        <div class="card-front card_cont">
                            <img src="assets/images/GDPR_logo_vertical.png" alt="GDPR_IMG" />
                        </div>
                        <div class="card_back card_cont">
                            <h4 class="card-title py-2 mbr-fonts-style display-5">GDPR
                            </h4>
                            <p class="mbr-text mbr-fonts-style display-7">
                                The GDPR (General Data Protection Regulation) is the data privacy regulation that applies both businesses and citizens of the European Union.
                       
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6 mb-4 col-lg-3">
                    <div class="card flip-card p-5 align-center">
                        <div class="card-front card_cont">
                            <img src="assets/images/LGPD_Logo.png" alt="LGPD_IMG" />
                        </div>
                        <div class="card_back card_cont">
                            <h4 class="card-title py-2 mbr-fonts-style display-5">LGPD
                            </h4>
                            <p class="mbr-text mbr-fonts-style display-7">
                                The LGPD (Lei Geral de Proteção de Dados) is the data privacy regulation that applies both businesses and citizens of Brazil.
                       
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6 mb-4 col-lg-3">
                    <div class="card flip-card p-5 align-center">
                        <div class="card-front card_cont">
                            <img src="assets/images/Pipeda.png" alt="pipeda_img" />
                        </div>
                        <div class="card_back card_cont">
                            <h4 class="card-title py-2 mbr-fonts-style display-5">PIPEDA 
                            </h4>
                            <p class="mbr-text mbr-fonts-style display-7">
                                PIPEDA (Personal Information Protection and Electronic Documents Act) is the data privacy regulation that applies both businesses and citizens of Canada.




                       
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="features3 cid-rSxbciijxT" id="features3-d" style="padding-top: 65px;">
        <h2 class="mbr-section-title pb-3 align-center mbr-fonts-style display-2">Services
        </h2>

        <div class="container">
            <%--<div class="media-container-row">--%>
            <form id="form1" runat="server" class="form media-container-row">
                <div class="card p-3 col-12 col-md-6 col-lg-4">
                    <div class="card-wrapper">
                        <div class="card-img">
                            <img src="assets/images/background3.jpg" alt="Self_Assesment_img">
                        </div>
                        <div class="card-box">
                            <h4 class="card-title mbr-fonts-style display-7">Free Assessment 
                        </h4>
                            <p class="mbr-text mbr-fonts-style display-7">
                                Fill out this quick questionnaire to get your free compliance preparedness report and score.&nbsp; Find out in which areas you need to focus your resources to get to full privacy regulation compliance.
                                
                            </p>
                            <br/><br />
                            <br/>
                        </div>
                        <div class="mbr-section-btn text-center" style="margin-top: 6.5rem;">
                            <%--<a href="./" class="btn btn-primary display-4">Start Here 
                                </a>--%>
                            <asp:Button ID="level1" runat="server" CssClass="btn btn-primary display-4" Text="Start Here" Style="border-radius: 50px; margin-right: auto; margin-left: auto;" OnClick="level1_Click" />
                        </div>
                    </div>
                </div>

                <div class="card p-3 col-12 col-md-6 col-lg-4">
                    <div class="card-wrapper">
                        <div class="card-img">
                            <img src="assets/images/background1.jpg" alt="Custom_roadmap_img" />
                        </div>
                        <div class="card-box">
                            <h4 class="card-title mbr-fonts-style display-7">Custom Roadmap
                        </h4>
                            <p class="mbr-text mbr-fonts-style display-7">
                                You are legally obligated to become compliant with data privacy regulations. We can get you there. Using our specialized tool, we guide you through an in-depth process examining all the steps required to not only meet compliance, but to do so efficiently and in a way that will save you money in the future. The result is a custom roadmap that will set you on the right path.
                       
                            </p>
                            <br/><br/>
                        </div>
                        <div class="mbr-section-btn text-center">
                            <%--<a href="#" class="btn btn-primary display-4">Buy Now
                                 </a>--%>
                            <asp:Button ID="level2" runat="server" CssClass="btn btn-primary display-4" Style="border-radius: 50px; margin-right: auto; margin-left: auto;" Text="More Info" OnClick="level2_Click" />
                        </div>
                    </div>
                </div>

                <div class="card p-3 col-12 col-md-6 col-lg-4">
                    <div class="card-wrapper">
                        <div class="card-img">
                            <img src="assets/images/background2.jpg" alt="contactus_img" />
                        </div>
                        <div class="card-box">
                            <h4 class="card-title mbr-fonts-style display-7">Privacy Consulting 
                        </h4>
                            <p class="mbr-text mbr-fonts-style display-7">
                                Our global cyber security team has been consulting with companies small and large for many years. We are here to help you with any of your compliance and cyber needs. From guiding you through Data Privacy Impact Assessments or recommending tools that meet your access request needs. Do not hesitate to reach out with any questions or inquiries.
                       
                            </p>
                        </div>
                        <div class="mbr-section-btn text-center" style="margin-top: 2.8rem;">
                            <a href="#" class="btn btn-primary display-4">Contact Us
                        </a>
                        </div>
                    </div>
                </div>
            </form>
            <%--</div>--%>
        </div>
    </section>
    <section class="testimonials1 cid-rSx8bkc1tj" id="testimonials1-5">
        <div class="container">
            <div class="media-container-row">
                <div class="title col-12 align-center">
                    <h2 class="pb-3 mbr-fonts-style display-2">Our Team
                    </h2>

                </div>
            </div>
        </div>

        <div class="container pt-3 mt-2">
            <div class="media-container-row">
                <div class="mbr-testimonial p-3 align-center col-12 col-md-6 col-lg-4">
                    <div class="panel-item p-3">
                        <div class="card-block">
                            <div class="testimonial-photo">
                                <img src="assets/images/Gilad%20-%2002.jpg" />
                            </div>

                            <div class="card-footer">
                                <div class="mbr-author-name mbr-bold mbr-fonts-style display-7">
                                    Gilad Perry
                                </div>
                                <!--
                        <small class="mbr-author-desc mbr-italic mbr-light mbr-fonts-style display-7">
                              Co-Founder Armour Cyber Security
                        </small>
-->
                            </div>

                            <p class="mbr-text mbr-fonts-style display-7">
                                Gilad is a forward-thinking executive with 20 years of experience in enterprise-wide information technology. He brings a background of consulting, delivery, and sales, which he used to build skilled services organizations and deliver complex, multi-million-dollar projects at companies like KPMG and Amdocs—including managing large-scale Canadian cybersecurity initiatives.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="mbr-testimonial p-3 align-center col-12 col-md-6 col-lg-4">
                    <div class="panel-item p-3">
                        <div class="card-block">
                            <div class="testimonial-photo">
                                <img src="assets/images/Cat%20Coode%20-%202.jpg" />
                            </div>

                            <div class="card-footer">
                                <div class="mbr-author-name mbr-bold mbr-fonts-style display-7">
                                    Cat Coode
                                </div>
                                <!--
                        <small class="mbr-author-desc mbr-italic mbr-light mbr-fonts-style display-7">
                               Data Privacy Expert
                        </small>
-->
                            </div>

                            <p class="mbr-text mbr-fonts-style display-7">
                                Cat Coode is the founder of Binary Tattoo. Binary, for the language of all things digital. Tattoo, for the permanence of what goes online. Her mission is to help you safeguard your data and protect your digital identity. Backed by two decades of experience in mobile development and software architecture, as well as a certification in data privacy law, Cat helps corporations and individuals better understand cybersecurity and data privacy.
                            </p>

                        </div>
                    </div>
                </div>

                <div class="mbr-testimonial p-3 align-center col-12 col-md-6 col-lg-4">
                    <div class="panel-item p-3">
                        <div class="card-block">
                            <div class="testimonial-photo">
                                <img src="assets/images/david.jpg" />
                            </div>

                            <div class="card-footer">
                                <div class="mbr-author-name mbr-bold mbr-fonts-style display-7">
                                    David Chernitzky
                                </div>
                                <!--
                        <small class="mbr-author-desc mbr-italic mbr-light mbr-fonts-style display-7">
                               Co-Founder Armour Cyber Security
                        </small>
-->
                            </div>

                            <p class="mbr-text mbr-fonts-style display-7">
                                David brings 20 years of experience and dedication to Armour Cybersecurity. He served as an officer in the elite technology unit of the Israeli Defense Forces intelligence corps for 12 years, with a deep focus on cybersecurity. He has also held subsequent leadership and operational roles in Canada, Europe, and around the globe at companies like Amdocs and NCR.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="mbr-section form4 cid-rVH54LhbOK" id="form4-k" style="background: rgba(52, 152, 219,.3); padding: 2rem 2rem;">
        <div class="container" style="align-content: center;">
            <div class="row">

                <div class="col-md-6">
                <h2 class="pb-3 align-left mbr-fonts-style display-2">
                    LETS TALK ABOUT YOUR PRIVACY NEEDS
                </h2>
                    <div>
                        <div class="icon-block pb-3 align-left">
                            <span class="icon-block__icon">
                                <span class="mbri-letter mbr-iconfont"></span>
                            </span>
<!--
                        <h4 class="icon-block__title align-left mbr-fonts-style display-5">
                            Don't hesitate to contact us
                        </h4>
-->
                        </div>
                        <div class="icon-contacts pb-3">
                        <h5 class="align-left mbr-fonts-style display-7">
                           How best can we help you? 
                        </h5>

                        </div>
                    </div>
                    <div data-form-type="formoid">
                        <!---Formbuilder Form--->
                        <form action="info@privacycompliance.group" method="POST" class="mbr-form form-with-styler" data-form-title="Mobirise Form">
                            <input type="hidden" name="email" data-form-email="true" value="yxxyOpOo6wLgTWBqbLl1zgWO1M2zqSvxtoaFC3nBhmNmPockUbP5tS4iuEK1AzG7ukIBefUUBAF4rVl/zrg1dCQvm3r+V90peQ+y+IplzpBRHkswyz0AMnWJ43g0o5uv" />
                            <div class="row">
                                <div hidden="hidden" data-form-alert="" class="alert alert-success col-12">Thanks for filling out the form!</div>
                                <div hidden="hidden" data-form-alert-danger="" class="alert alert-danger col-12">
                                </div>
                            </div>
                            <div class="dragArea row">
                                <div class="col-md-6  form-group" data-for="name">
                                    <input type="text" name="Firstname" placeholder="First Name" data-form-field="Name" required="required" class="form-control input display-7" id="name-form4-k" />
                                </div>
                                <div class="col-md-6  form-group" data-for="name">
                                    <input type="text" name="Lastname" placeholder="Last Name" data-form-field="name" required="required" class="form-control input display-7" id="phone-form4-k" />
                                </div>
                                <div data-for="email" class="col-md-12  form-group">
                                    <input type="text" name="email" placeholder="Email" data-form-field="Email" class="form-control input display-7" required="required" id="email-form4-k" />
                                </div>
                                <div data-for="message" class="col-md-12  form-group">
                                    <textarea name="message" placeholder="Message" data-form-field="Message" class="form-control input display-7" id="message-form4-k"></textarea>
                                </div>
                                <div class="col-md-12 input-group-btn  mt-2 align-center">
                                    <button type="submit" class="btn btn-primary btn-form display-4">SEND MESSAGE</button>
                                </div>
                            </div>
                        </form>
                        <!---Formbuilder Form--->
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="mbr-section contacts3 cid-rVuUX4SLT3" id="contacts3-i" style="padding-top: 100px; padding-bottom: 90px;">
        <!---->

        <!---->
        <!--Overlay-->

        <!--Container-->
        <div class="container">
            <div class="row">
<!--                If You want to chat directly to a representative-->
           
                <div class="title col-12">
<!--
                    <h2 class="align-left mbr-fonts-style display-1">Our Contacts
                </h2>
-->

                </div>
                <div class="col-12">
                    <div class="row">
                        <div class="col-12 col-md-6">
                            <div class="wrapper">
                                <span class="iconfont-wrapper">
                                    <span class="amp-iconfont icon fa-thumbs-o-up fa"></span>
                                </span>
                                <div class="b-info b-adress">
                                    <h5 class="align-left mbr-fonts-style display-5">Address:
                                </h5>
                                    <p class="mbr-text align-left mbr-fonts-style display-7">
                                        <a href="https://www.google.com/maps/place/77+Bloor+St+W,+Toronto,+ON+M5S+1M2/@43.6692104,-79.391786,17z/data=!3m1!4b1!4m5!3m4!1s0x882b34afda0ae153:0x6590e00287a6daf6!8m2!3d43.6692104!4d-79.3895973">77 Bloor St West, Suite 600,
Toronto, ON M5S 1M2</a>

                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="wrapper">
                                <span class="iconfont-wrapper">
                                    <span class="amp-iconfont icon fa-phone fa"></span>
                                </span>
                                <div class="b-info b-phone">
                                    <h5 class="align-left mbr-fonts-style display-5">Phone:
                                </h5>
                                    <p class="mbr-text align-left mbr-fonts-style display-7">
                                        <a href="tel:+1-647-229-2015">(647)-229-2015</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="wrapper">
                                <span class="iconfont-wrapper">
                                    <span class="amp-iconfont icon fa-comment-o fa"></span>
                                </span>
                                <div class="b-info b-mail">
                                    <h5 class="align-left mbr-fonts-style display-5">E-mail:
                                </h5>
                                    <p class="mbr-text align-left mbr-fonts-style display-7">
                                        <a href="https://privacy@armourcyber.ca">privacy@armourcyber.ca</a>

                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="wrapper">
                                <span class="iconfont-wrapper">
                                    <span class="amp-iconfont icon fa-th-large fa"></span>
                                </span>
                        </div>
                    </div>
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
                        <br /> All Rights Reserved<br />
                        <a href="PrivacyCompliancePolicy.aspx">Privacy Policy</a>
                    </p>
                </div>
            </div>
        </div>
    </section>


    <script src="assets/web/assets/jquery/jquery.min.js"></script>
    <script src="assets/popper/popper.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/smoothscroll/smooth-scroll.js"></script>
    <script src="assets/dropdown/js/nav-dropdown.js"></script>
    <script src="assets/dropdown/js/navbar-dropdown.js"></script>
    <script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
    <script src="assets/tether/tether.min.js"></script>
    <script src="assets/vimeoplayer/jquery.mb.vimeo_player.js"></script>
    <script src="assets/mbr-flip-card/mbr-flip-card.js"></script>
    <script src="assets/viewportchecker/jquery.viewportchecker.js"></script>
    <script src="assets/bootstrapcarouselswipe/bootstrap-carousel-swipe.js"></script>
    <script src="assets/mbr-clients-slider/mbr-clients-slider.js"></script>
    <script src="assets/ytplayer/jquery.mb.ytplayer.min.js"></script>
    <script src="assets/theme/js/script.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>


</body>
</html>

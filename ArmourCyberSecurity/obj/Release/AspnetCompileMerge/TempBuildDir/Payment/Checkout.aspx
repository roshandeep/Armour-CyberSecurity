<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ArmourCyberSecurity.Payment.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link href="../Content/signup.css" rel="stylesheet" />
    <link rel="stylesheet" href="../Level1/assets/web/assets/mobirise-icons/mobirise-icons.css" />
    <link rel="stylesheet" href="../Level1/assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../Level1/assets/bootstrap/css/bootstrap-grid.min.css" />
    <link rel="stylesheet" href="../Level1/assets/bootstrap/css/bootstrap-reboot.min.css" />
    <link rel="stylesheet" href="../Level1/assets/socicon/css/styles.css" />
    <link rel="stylesheet" href="../Level1/assets/dropdown/css/style.css" />
    <link rel="stylesheet" href="../Level1/assets/tether/tether.min.css" />
    <link rel="stylesheet" href="../Level1/assets/theme/css/style.css" />
    <link rel="preload" as="style" href="../Level1/assets/mobirise/css/mbr-additional.css" />
    <link rel="stylesheet" href="../Level1/assets/mobirise/css/mbr-additional.css" type="text/css" />
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
            background-image: linear-gradient(#149dcc, #587aed);
        }



        #backdrop {
            width: 360px;
            background: #f1f1f1;
            height: 300px;
            padding: 80px 40px;
            border-radius: 10px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }




        #checkout-button-sku_H8jWTcMkJ5uh1n {
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

    <!-- Load Stripe.js on your website. -->
    <script src="https://js.stripe.com/v3"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>

    <!-- Create a button that your customers click to complete their purchase. Customize the styling to suit your branding. -->
    <div class="row main justify-content-center" style="margin-top: 5rem;">
        <div class="media-container-column title col-12 col-lg-10 col-md-10">
            <h2 class="align-center mbr-bold mbr-white pb-3 mbr-fonts-style display-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h2>
            <h3 class="mbr-section-subtitle align-center mbr-light mbr-white mbr-fonts-style display-5">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            </h3>
        </div>
    </div>
    <div id="backdrop" style="height: 120px; padding: 40px;">
        <button id="checkout-button-sku_H8jWTcMkJ5uh1n" role="link">
            Checkout
        </button>

    </div>
    <div id="error-message"></div>

    <script>
        (function () {
            var stripe = Stripe('pk_test_dv7XSoJVZgSV4CiDNrYgnOUQ00KCEF6q1W');
    var checkoutButton = document.getElementById('checkout-button-sku_H8jWTcMkJ5uh1n');
    var userID = '<%= UserID %>';
            checkoutButton.addEventListener('click', function () {
                // When the customer clicks on the button, redirect
                // them to Checkout.
                stripe.redirectToCheckout({
        items: [{ sku: 'sku_H8jWTcMkJ5uh1n', quantity: 1 }],
        clientReferenceId: userID,

                    // Do not rely on the redirect to the successUrl for fulfilling
                    // purchases, customers may not always reach the success_url after
                    // a successful payment.
                    // Instead use one of the strategies described in
                    // https://stripe.com/docs/payments/checkout/fulfillment
                    successUrl: window.location.protocol + '//localhost:62800/CustomRoadmapDashboard?paid=True',
                    cancelUrl: window.location.protocol + '//localhost:62800/Level1/CustomRoadmapLandingpage?paid=False',
                })
                    .then(function (result) {
                        if (result.error) {
                            // If `redirectToCheckout` fails due to a browser or network
                            // error, display the localized error message to your customer.
                            var displayError = document.getElementById('error-message');
                            displayError.textContent = result.error.message;
                        }
                    });
            });
        })();
</script>





    <title></title>
</head>
<body>
    <section class="menu cid-rSx8XQK5A7" once="menu" id="menu1-8">
        <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <div class="hamburger"><span></span><span></span><span></span><span></span></div>
            </button>
            <div class="menu-logo">
                <div class="navbar-brand">
                    <span class="navbar-logo">
                        <a href="../Level1/LandingPage.aspx">
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
                    <li class="nav-item">
                        <asp:Label ID="lbl_userinit" runat="server" Text="" CssClass="nav-link link text-white display-4" ForeColor="#0795d6" />
                    </li>
                </ul>
            </div>
        </nav>
    </section>


    <section once="footers" class="cid-rSxbAyIsnT" id="footer7-e" style="position: absolute; top: 75%; width: 100%;">
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

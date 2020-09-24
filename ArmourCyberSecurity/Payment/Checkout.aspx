<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ArmourCyberSecurity.Payment.Checkout" %>

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
    <title>Checkout | Privacy Compliance Solutions</title>
    <!-- Custom fonts for this template-->
    <link href="../../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../../assets/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../../assets/css/style.css" rel="stylesheet">

    <style>
        body {
            background-color: #eff3f9;
        }
    </style>
</head>
<body>

    <div class="container-fluid">
        <div class="row justify-content-center h-100 align-items-center">
            <div class="col-lg-6 z-1 pt-4 mb-lg-0">
                <div class="card text-center border-0">
                    <div class="card-header bg-transparent justify-content-center py-4">
                        <h5 class="mb-0">Privacy Compliance Solutions</h5>
                    </div>
                    <div class="card-body p-5">
                        <img src="../Level1/assets/images/Logo.png" style="width: 58px;" />
                        <br />
                        <br />
                        <p class="lead">Protect your data and privacy.</p>
                        <div class="mb-5">
                            <div class="display-3 text-dark">$1</div>
                        </div>
                    </div>
                    <a id="checkout-button-sku_H8jWTcMkJ5uh1n" class="card-footer d-flex align-items-center justify-content-center" href="#!">Start now
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right ml-2">
                                                <line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
                    </a>
                    <div id="error-message"></div>
                </div>
            </div>
        </div>
    </div>


    <!-- Create a button that your customers click to complete their purchase. Customize the styling to suit your branding. -->




</body>
<!-- Load Stripe.js on your website. -->
<script src="https://js.stripe.com/v3"></script>
<!-- Bootstrap core JavaScript-->
<script src="../../assets/vendor/jquery/jquery.min.js"></script>
<script src="../../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../../assets/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../../assets/js/sb-admin-2.min.js"></script>

<script>
    (function () {
        //TESTING
        var stripe = Stripe('pk_test_dv7XSoJVZgSV4CiDNrYgnOUQ00KCEF6q1W');
        //PRODUCTION
        //var stripe = Stripe('pk_live_8qcKOYqSOl23IBvb5tt1JBVx00G6JuAj3I');
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
</html>

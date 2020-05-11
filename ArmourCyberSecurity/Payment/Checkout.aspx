<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ArmourCyberSecurity.Payment.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">


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
    <div id="backdrop">
                <button id="checkout-button-sku_H8jWTcMkJ5uh1n" role="link">
                Checkout
   
            </button>
        </div>
    <div id="error-message"></div>

    <script>
        (function () {
            var stripe = Stripe('pk_test_dv7XSoJVZgSV4CiDNrYgnOUQ00KCEF6q1W');
            var checkoutButton = document.getElementById('checkout-button-sku_H8jWTcMkJ5uh1n');
            checkoutButton.addEventListener('click', function () {
                // When the customer clicks on the button, redirect
                // them to Checkout.
                stripe.redirectToCheckout({
                    items: [{ sku: 'sku_H8jWTcMkJ5uh1n', quantity: 1 }],

                    // Do not rely on the redirect to the successUrl for fulfilling
                    // purchases, customers may not always reach the success_url after
                    // a successful payment.
                    // Instead use one of the strategies described in
                    // https://stripe.com/docs/payments/checkout/fulfillment
                    successUrl: window.location.protocol + '//localhost:62800/Section1',
                    cancelUrl: window.location.protocol + '//canceled',
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
        

</body>
</html>

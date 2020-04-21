<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ArmourCyberSecurity.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/signup.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
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
        <div class="login-form" style="top: 0%; transform: translate(-50%,0);">
        <img src="../Level1/assets/images/Logo.png" style="width: 58px; margin-left: 8rem;" />
        <h1>Sign up</h1>

        
        <div class="txtb">
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Email ID" />
            <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                ControlToValidate="txtEmail" runat="server" />
            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
            <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
        </div>

        <div class="txtb">
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" />
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPassword" runat="server" />
        </div>

        <div class="txtb">
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password" />
            <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="txtPassword"
                ControlToValidate="txtConfirmPassword" runat="server" />
        </div>
        <div class="txtb">
            <asp:TextBox ID="txt_firstName" runat="server" placeholder="First Name" />
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txt_firstName" runat="server" />
        </div>

        <div class="txtb">
            <asp:TextBox ID="txt_lastName" runat="server" placeholder="Last Name" />
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txt_lastName" runat="server" />
        </div>

        <div class="txtb">
            <asp:TextBox ID="txt_phoneNumber" runat="server" placeholder="(xxx)-xxx-xxxx" />
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txt_phoneNumber" runat="server" />
        </div>

        <div class="txtb">
            <asp:TextBox ID="txt_industry" runat="server" placeholder="Industry" />
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txt_industry" runat="server" />
        </div>

        <div class="txtb">
            <asp:TextBox ID="txt_country" runat="server" placeholder="Country" />
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txt_country" runat="server" />
        </div>


        <asp:Button Text="Submit" runat="server" OnClick="RegisterUser" class="logbtn" />
            </div>
    </form>
</body>
</html>

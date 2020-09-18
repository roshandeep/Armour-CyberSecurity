<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ArmourCyberSecurity.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="Content/login.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
    <title>Login Page</title>
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
    <script runat="server">
        bool IsValidEmail(string strIn)
        {
            // Return true if strIn is in valid email format.
            return Regex.IsMatch(strIn, @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
        }

        void OnLoggingIn(object sender, System.Web.UI.WebControls.LoginCancelEventArgs e)
        {
            if (!IsValidEmail(Login1.UserName))
            {
                Login1.InstructionText = "Enter a valid email address.";
                Login1.InstructionTextStyle.ForeColor = System.Drawing.Color.RosyBrown;
                e.Cancel = true;
            }
            else
            {
                Login1.InstructionText = String.Empty;

            }
        }

        void OnLoginError(object sender, EventArgs e)
        {
            Login1.HelpPageText = "Help with logging in...";
        }
    </script>
    <script>
        $(".txtb input").on("focus", function () {
            $(this).addClass("focus");
        });
        $(".txtb input").on("blur", function () {
            if ($(this).val() == "")
                $(this).removeClass("focus");
        });
    </script>
    <style>
        .logbtn {
            display: block;
            width: 100%;
            height: 50px;
            border: none;
            background: #0a2044;
            background-size: 200%;
            color: #fff;
            outline: none;
            cursor: pointer;
            transition: .5s;
        }

            .logbtn:hover {
                background-position: right;
            }

        .Login1 {
            width: 100%;
        }

        .logbox {
            width: 100%;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server" class="login-form authincation-content" style="height: 560px; padding-top: 20px; padding-bottom: 30px;">
        <img src="images/newLogo.png" style="width: 62px; margin-left: 7rem; border-radius: 20%;" />
        <h1 style="margin-bottom: 0px;">Login</h1>
        <div>

            <asp:Login ID="Login1" runat="server"
                CreateUserText="Create a new user..."
                CreateUserUrl="Registration/Register.aspx"
                HelpPageUrl="help.aspx"
                PasswordRecoveryUrl="Registration/Forgot_Password.aspx"
                UserNameLabelText="Email address:"
                OnLoginError="OnLoginError"
                PasswordRecoveryText="Forgot your password?"
                Width="100%">
                <LayoutTemplate>
                    <table cellspacing="0" cellpadding="1" style="border-collapse: collapse; width: 100%;">
                        <tr>
                            <td class="logbox">
                                <table cellpadding="0" style="width: 100%;">

                                    <tr>
                                        <td class="txtb">
                                            <asp:TextBox runat="server" ID="UserName" CssClass="form-control" placeholder="Username"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="UserName" ErrorMessage="User Name is required." ValidationGroup="Login1" ToolTip="User Name is required." ID="UserNameRequired"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="txtb">
                                            <asp:TextBox runat="server" TextMode="Password" ID="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ValidationGroup="Login1" ToolTip="Password is required." ID="PasswordRequired" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <div class="bottom-text">
                                            <td style="padding-top: 15px;">
                                                <asp:CheckBox runat="server" Text="Remember me next time." ID="RememberMe"></asp:CheckBox>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="color: Red;">
                                            <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    </div>
                                    <tr>

                                        <td align="right" style="padding-top: 15px;">
                                            <asp:Button runat="server" class="logbtn" CommandName="Login" Text="Log In" ValidationGroup="Login1" ID="LoginButton" OnClick="btnLogin_Click"></asp:Button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-top: 15px;">
                                            <asp:HyperLink runat="server" NavigateUrl="Registration/Register" ID="CreateUserLink" Font-Size="Large" Style="padding-top: 15px;">Create a new user...</asp:HyperLink>
                                            <br />
                                            <asp:HyperLink runat="server" NavigateUrl="Registration/Forgot_Password.aspx" ID="PasswordRecoveryLink" Font-Size="Large" Style="padding-top: 15px;">Forgot your password?</asp:HyperLink>
                                            <br />

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>

                <TitleTextStyle Font-Bold="True"
                    ForeColor="#FFFFFF"
                    BackColor="#6B696B"></TitleTextStyle>
            </asp:Login>

            <asp:Label ID="lbl_notification" runat="server" Text="" ForeColor="Red" Font-Bold="true" />

        </div>

    </form>

</body>
</html>

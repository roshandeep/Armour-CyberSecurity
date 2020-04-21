<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ArmourCyberSecurity.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <link href="Content/login.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
    <title>Login Page</title>
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
            background: linear-gradient(120deg,#3498db,#224ee3,#3498db);
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
    <form id="form1" runat="server" class="login-form">
        <img src="images/newLogo.png" style="width: 58px; margin-left: 7rem;" />
        <h1>Login</h1>
        <div>

            <asp:Login ID="Login1" runat="server"
                CreateUserText="Create a new user..."
                CreateUserUrl="newUser.aspx"
                HelpPageUrl="help.aspx"
                PasswordRecoveryUrl="getPass.aspx"
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
                                            <asp:TextBox runat="server" ID="UserName" placeholder="Usename"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ValidationGroup="Login1" ToolTip="User Name is required." ID="UserNameRequired">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="txtb">
                                           
                                            <asp:TextBox runat="server" TextMode="Password" ID="Password" placeholder="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ValidationGroup="Login1" ToolTip="Password is required." ID="PasswordRequired">*</asp:RequiredFieldValidator>
                                        </td>


                                    </tr>
                                    <tr>
                                        <div class="bottom-text">
                                            <td>
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

                                        <td align="right">
                                            <asp:Button runat="server" class="logbtn" CommandName="Login" Text="Log In" ValidationGroup="Login1" ID="LoginButton" OnClick="btnLogin_Click"></asp:Button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:HyperLink runat="server" NavigateUrl="Registration/Register" ID="CreateUserLink" class="bottom-text">Create a new user...</asp:HyperLink>
                                            <br />
                                            <asp:HyperLink runat="server" NavigateUrl="getPass.aspx" ID="PasswordRecoveryLink" class="bottom-text">Forgot your password?</asp:HyperLink>
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

        </div>
    </form>
</body>
</html>

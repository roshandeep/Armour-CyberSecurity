<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgot_Password.aspx.cs" Inherits="ArmourCyberSecurity.Forgot_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

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
        
        #txtEmail{
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
    <form id="form1" runat="server">
        <div>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <img src="../Level1/assets/images/Logo.png" style="width: 58px; margin-left: 7rem;" class="" />
                    <th colspan="3">
                Forgot Password
            </th>
        </tr>
        <tr>
            <td>
               <b> Email Address </b>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" style="background-color: transparent;"/>
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
                <asp:Button Text="Send Email" runat="server" OnClick="Forgot_Password_Click" CssClass="btn btn-primary display-4" ID="btn_sendmail"/>
                <h1><asp:Literal ID="ltMessage" runat="server" /></h1>
            </td>
            
        </tr>
    </table>
        </div>
    </form>
</body>
</html>

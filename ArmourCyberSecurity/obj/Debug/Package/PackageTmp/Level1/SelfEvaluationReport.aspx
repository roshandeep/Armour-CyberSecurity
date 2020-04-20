<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelfEvaluationReport.aspx.cs" Inherits="ArmourCyberSecurity.SelfEvaluationReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
        .modalBackground {
            background-image: linear-gradient(120deg,#3498db,#224ee3,#3498db);
            filter: alpha(opacity=40);
            opacity: 0.95;
        }

        .modalPopup {
            background-color: #FFFFFF;
            width: 400px;
            border: 3px solid #0DA9D0;
            height: auto;
        }

            .modalPopup .header {
                height: 30px;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
            }

            .modalPopup .body {
                min-height: 50px;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
            }

        #backdrop {
            width: initial;
            color: #FFFFFF;
            background-color: #0795d6;
            border-radius: 25px;
            padding: 20px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .Logo {
            border-radius: 25px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        #reportTitle {
            text-align: center;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        #scoreValue {
            margin-left: auto;
            margin-right: auto;
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }

        #scoreTable {
            display: block;
            margin-left: auto;
            margin-right: auto;
            align-content: center;
            table-layout: auto;
            width: 475px;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        #reportdetail {
            display: block;
            margin-left: auto;
            margin-right: auto;
            align-content: center;
            padding-top: 10px;
            padding-bottom: 10px;
            text-align: center;
        }



        .scoreAlignment {
            font-size: 22px;
            text-align: center;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            font-weight: bold;
        }

        .boxshadow {
            display: block;
            margin-left: auto;
            margin-right: auto;
            align-content: center;
            margin-bottom: 20px;
            padding: 20px;
            width: 1100px;
            min-height: 300px;
            overflow-y: hidden;
            box-shadow: 10px 10px 5px rgba(0, 0, 0, 0.50);
            font-size: larger;
        }

        .divBullet {
            width: 5%;
            float: left;
            /*display: block;*/
            display: table-cell;
        }

        .divLabel {
            width: 95%;
            float: right;
            /*display: block;*/
            display: table-cell;
        }

        .statemenRow {
            /*display:flex;*/
            display: table;
        }

        .zoom:hover {
            -webkit-transform: scale(1.1);
            transform: scale(1.1);
            transition: transform .3s;
        }

        .txtbx {
            position: relative;
            margin: 50px 0;
        }


        #txt_EmalId, #txt_Firstname, #txt_Lastname {
            font-size: 15px;
            color: #333;
            border: none;
            width: 80%;
            outline: none;
            background: none;
            height: 40px;
            border-bottom: 2px solid #adadad;
        }

        #txt_industry {
            font-size: 15px;
            color: #333;
            border: none;
            width: 80%;
            outline: none;
            background: none;
            height: 40px;
            border-bottom: 2px solid #adadad;
        }

        #btnHide {
            display: block;
            width: 60%;
            height: 50px;
            border: none;
            background: linear-gradient(120deg,#3498db,#224ee3,#3498db);
            background-size: 200%;
            color: #fff;
            outline: none;
            cursor: pointer;
            transition: .5s;
            margin-left: 4rem;
        }

            #btnHide:hover {
                background-position: right;
            }

        h1 {
            text-align: center;
            margin-bottom: 60px;
            margin-top: 0px;
        }
    </style>
    <script>
        $(function () {
            $('#<%=txt_EmalId.ClientID%>').change(function () {

                var submit = document.getElementById('#<%=btnHide.ClientID%>');
                var btnSubmit = $('#<%=btnHide.ClientID%>');
                btnSubmit.attr("disabled", false);
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div>
            <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="mpe" runat="server"
                PopupControlID="pnlPopup" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground" CancelControlID="lnkDummyCancel">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
                <div class="header">
                    <img src="../images/newLogo.png" style="width: 58px;">
                    <h1>Register</h1>
                </div>
                <br />
                <br />
                <br />
                <div class="body">
                    <div class="txtbx">
                        <asp:TextBox ID="txt_EmalId" runat="server" placeholder="Email Address *(Required)" ClientIDMode="Static"></asp:TextBox><br />
                        <asp:RegularExpressionValidator ID="regEmailId" runat="server" ControlToValidate="txt_EmalId" ErrorMessage="Please enter valid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">  </asp:RegularExpressionValidator>
                        <br />
                    </div>

                    <div class="txtbx">
                        <asp:TextBox ID="txt_Firstname" runat="server" placeholder="First Name (Optional)" ClientIDMode="Static"></asp:TextBox>
                        <br />
                    </div>
                    <div class="txtbx">
                        <asp:TextBox ID="txt_Lastname" runat="server" placeholder="Last Name (Optional)" ClientIDMode="Static"></asp:TextBox>
                        <br />
                    </div>
                    <asp:LinkButton ID="lnkDummyCancel" runat="server"></asp:LinkButton>
                    <asp:Button ID="btnHide" runat="server" Text="Submit" ClientIDMode="Static" Enabled="false" OnClick="btnHide_Click" /><br />
                </div>

            </asp:Panel>


        </div>
        <div>
            <div class="boxshadow" style="background-color: #0795d6;">
                <table style="margin: 0 auto; text-align: center">
                    <tr>
                        <td style="text-align: center;">
                            <asp:Image CssClass="Logo" ID="Logo" runat="server" ImageUrl="~/images/armor-logo.png" Style="width: 100px;" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; color: white;">
                            <h2>Global Data Privacy Regulation Compliance 
                                Self-Assessment - Report
                            </h2>
                        </td>
                    </tr>
                </table>


                <p style="text-align: justify; margin: 2px; color: white;">
                    Companies are legally required to fulfill the privacy regulations determined by the geographical location of both the company and their customers/clients. 
Compliance is a large task, but when done properly the first time, it becomes simple to maintain. Doing due diligence helps mitigate risk to customers, protects a company’s reputation, and drastically reduces fines.

                </p>

            </div>

                <%--OVERALL--%>
            <div class="boxshadow zoom">
                <table>
                    <tr style="background-color: #0795d6;">
                        <th colspan="2" style="text-align: center;">
                            <h3 style="color: white; font-size: xx-large;">OVERALL SCORE – ARE YOU PRIVACY REGULATION COMPLIANT?</h3>
                        </th>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <asp:Label ID="lbl_overall" runat="server" Text="As a company you are entrusted with protecting data for both your customers and your employees. Putting in place a proper privacy program ensures that you mitigate risk to customers, protect your company’s reputation, and drastically reduces fines. " />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>

                                <tr>
                                    <td style="text-align: center;">
                                        <asp:Image ID="img_overall" runat="server" ImageAlign="Middle" Style="width: 200px; border-radius: 50%;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="scoreAlignment" style="text-align: center;">
                                        <asp:Label ID="lbl_score" runat="server" Text="" />
                                    </td>
                                </tr>

                            </table>
                        </td>
                        <td style="width: 100%; text-align: justify;">
                            <div class="statemenRow">
                                <div class="divBullet">
                                    <asp:Label ID="bullet" runat="server" Text="" />
                                </div>
                                <div class="divLabel">
                                    <asp:Label ID="comment" runat="server" Text="" />
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <%--Privacy Culture Questions--%>
            <div class="boxshadow zoom">
                <table>
                    <tr style="background-color: #0795d6;">
                        <th colspan="2" style="text-align: center;">
                            <h3 style="color: white;">Privacy Culture Questions</h3>
                        </th>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <asp:Label ID="lbl_pcq_info" runat="server" Text="As a company you are entrusted with protecting data for both your customers and your employees. Putting in place a proper privacy program ensures that you mitigate risk to customers, protect your company’s reputation, and drastically reduces fines. " />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>

                                <tr>
                                    <td style="text-align: center;">
                                        <asp:Image ID="img_pcq" runat="server" ImageAlign="Middle" Style="width: 200px; border-radius: 50%;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="scoreAlignment" style="text-align: center;">
                                        <asp:Label ID="lbl_pcq_score" runat="server" Text="" />
                                    </td>
                                </tr>

                            </table>
                        </td>
                        <td style="width: 100%; text-align: justify;">
                            <div class="statemenRow">
                                <div class="divBullet">
                                    <asp:Label ID="bullet1" runat="server" Text="" />
                                </div>
                                <div class="divLabel">
                                    <asp:Label ID="comment1" runat="server" Text="" />
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <%--Regional Specific Questions--%>
            <div class="boxshadow zoom">
                <table>
                    <tr style="background-color: #0795d6;">
                        <th colspan="2" style="text-align: center;">
                            <h3 style="color: white;">Regional Specific Questions</h3>
                        </th>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <asp:Label ID="lbl_rsq_info" runat="server" Text="Both your location and that of your customers determine the legally required legislations for your company. " />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>

                                <tr>
                                    <td style="text-align: center;">
                                        <asp:Image ID="img_rsq" runat="server" ImageAlign="Middle" Style="width: 200px; border-radius: 50%;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="scoreAlignment" style="text-align: center;">
                                        <asp:Label ID="lbl_rsq_score" runat="server" Text="" />
                                    </td>
                                </tr>

                            </table>
                        </td>
                        <td style="width: 100%; text-align: justify;">
                            <div class="statemenRow">
                                <div class="divBullet">
                                    <asp:Label ID="bullet2" runat="server" Text="" />
                                </div>
                                <div class="divLabel">
                                    <asp:Label ID="comment2" runat="server" Text="" />
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>


            <%--Privacy Engineering--%>
            <div class="boxshadow zoom">
                <table>
                    <tr style="background-color: #0795d6;">
                        <th colspan="2" style="text-align: center;">
                            <h3 style="color: white;">Privacy Engineering</h3>
                        </th>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <asp:Label ID="lbl_peq_info" runat="server" Text="Putting Privacy at the foundation of all of your services and products is the key to building a strong base that is regulation compliant and protects your customers/clients. A proper privacy engineering implementation includes the use of Privacy by Design principles, running of a DPIA (Data Privacy Impact Assessment), categorization of your PII (Personally identifiable information), and proper vendor management." />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>

                                <tr>
                                    <td style="text-align: center;">
                                        <asp:Image ID="img_peq" runat="server" ImageAlign="Middle" Style="width: 200px; border-radius: 50%;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="scoreAlignment" style="text-align: center;">
                                        <asp:Label ID="lbl_peq_score" runat="server" Text="" />
                                    </td>
                                </tr>

                            </table>
                        </td>
                        <td style="width: 100%; text-align: justify;">
                            <div class="statemenRow">
                                <div class="divBullet">
                                    <asp:Label ID="bullet4" runat="server" Text="" />
                                </div>
                                <div class="divLabel">
                                    <asp:Label ID="comment4" runat="server" Text="" />
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <%--Data Control--%>
            <div class="boxshadow zoom">
                <table>
                    <tr style="background-color: #0795d6;">
                        <th colspan="2" style="text-align: center;">
                            <h3 style="color: white;">Data Control</h3>
                        </th>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <asp:Label ID="lbl_dcq_info" runat="server" Text="Users have the right to access their data. Depending on the legislation, they may have the rights to check for accuracy, request correction, or simply review what is held. " />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>

                                <tr>
                                    <td style="text-align: center;">
                                        <asp:Image ID="img_dcq" runat="server" ImageAlign="Middle" Style="width: 200px; border-radius: 50%;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="scoreAlignment" style="text-align: center;">
                                        <asp:Label ID="lbl_dcq_score" runat="server" Text="" />
                                    </td>
                                </tr>

                            </table>
                        </td>
                        <td style="width: 100%; text-align: justify;">
                            <div class="statemenRow">
                                <div class="divBullet">
                                    <asp:Label ID="bullet5" runat="server" Text="" />
                                </div>
                                <div class="divLabel">
                                    <asp:Label ID="comment5" runat="server" Text="" />
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <%--Consent--%>
            <div class="boxshadow zoom">
                <table>
                    <tr style="background-color: #0795d6;">
                        <th colspan="2" style="text-align: center;">
                            <h3 style="color: white;">Consent</h3>
                        </th>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <asp:Label ID="lbl_cq_info" runat="server" Text="In accordance to the legislations, the privacy policy must explain to users what their rights are and how to execute on those rights. It is also important to establish a legal basis for which data is being collected. Users must have the ability to Opt in and out of having their data collected, stored, and transferred. " />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>

                                <tr>
                                    <td style="text-align: center;">
                                        <asp:Image ID="img_cq" runat="server" ImageAlign="Middle" Style="width: 200px; border-radius: 50%;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="scoreAlignment" style="text-align: center;">
                                        <asp:Label ID="lbl_cq_score" runat="server" Text="" />
                                    </td>
                                </tr>

                            </table>
                        </td>
                        <td style="width: 100%; text-align: justify;">
                            <div class="statemenRow">
                                <div class="divBullet">
                                    <asp:Label ID="bullet6" runat="server" Text="" />
                                </div>
                                <div class="divLabel">
                                    <asp:Label ID="comment6" runat="server" Text="" />
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <%--Incident Response--%>
            <div class="boxshadow zoom">
                <table>
                    <tr style="background-color: #0795d6;">
                        <th colspan="2" style="text-align: center;">
                            <h3 style="color: white;">Incident Response Questions</h3>
                        </th>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <asp:Label ID="lbl_irq_info" runat="server" Text="Lack of an incident response plan can cost a company upwards of $500k USD.  All privacy breaches and incidents must be assessed for risk of harm. Depending on the legislation, breaches will need to be documented, authorities contacted, and users informed. " />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>

                                <tr>
                                    <td style="text-align: center;">
                                        <asp:Image ID="img_irq" runat="server" ImageAlign="Middle" Style="width: 200px; border-radius: 50%;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="scoreAlignment" style="text-align: center;">
                                        <asp:Label ID="lbl_irq_score" runat="server" Text="" />
                                    </td>
                                </tr>

                            </table>
                        </td>
                        <td style="width: 100%; text-align: justify;">
                            <div class="statemenRow">
                                <div class="divBullet">
                                    <asp:Label ID="bullet7" runat="server" Text="" />
                                </div>
                                <div class="divLabel">
                                    <asp:Label ID="comment7" runat="server" Text="" />
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <%--  <asp:Button ID="Button1" runat="server" Text="Go Back" OnClick="Button1_Click" />--%>
    </form>
</body>
</html>

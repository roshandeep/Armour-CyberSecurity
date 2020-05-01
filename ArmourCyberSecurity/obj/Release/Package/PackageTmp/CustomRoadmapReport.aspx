<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomRoadmapReport.aspx.cs" Inherits="ArmourCyberSecurity.CustomRoadmapReport" %>

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
            font-size: 20px;
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
            -webkit-box-shadow: 5px 5px 8px 8px rgba(0, 0, 0, 0.50);
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

        h3, h2 {
            text-align: center;
            margin-bottom: 30px;
            margin-top: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                                Custom Roadmap - Report
                            </h2>
                        </td>
                    </tr>
                </table>


                <p style="text-align: justify; margin: 2px; color: white;">
                    Your clients’ data is your greatest asset. If the data is breached you will lose money, time, and credibility. Breaches can be avoided with good cyber security practices and compliance with regulations. Companies are legally required to fulfill the privacy regulations determined by the geographical location of both the company and their customers/clients. Compliance is a large task, but when done properly the first time, it becomes simple to maintain. Doing due diligence helps mitigate risk to customers, protects a company’s reputation, and drastically reduces fines.
                </p>

            </div>

            <%--Global Regulations--%>
            <div class="boxshadow zoom">
                <table>
                    <tr style="background-color: #0795d6;">
                        <th colspan="2" style="text-align: center;">
                            <h3 style="color: white; font-size: xx-large;">Global Regulations</h3>
                        </th>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <p>
                                The Global Regulations report deals with the region in which you do business; This includes both where your office resides and where your customers reside.
                                <br />
                                For the purpose of this report, we will be focusing on GDPR (Europe), PIPEDA (Canada), CCPA (California), and LGPD (Brazil). This said, between the global reach of many companies and the fact that more countries and regional oversight are coming to law, following the best practice suggestions laid out in all the sections of this report will benefit you regardless of region.

                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>SECTION GOAL: </b></h3>
                            <p>
                                To establish which legislations are required, determined by both your company location and that of your customers.
                                <br />

                                Note: If you deal with medical data, then there are separate regulations that are specific to these kinds of records. They are typical labeled Health Insurance Portability and Accountability Act (HIPPA), or the like.

                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>REGULATIONS </b></h3>
                            <p>
                                Regulations vary by geographical region. Additionally, some apply to the location of the company and others to the location of the individual.
                                <br />
                                For example, GDPR applies:<br />
                                ●	If the company is in the EU<br />
                                ●	If the company does business with some subjects in the EU<br />
                                ●	If the company is in a country that also follows GDPR (ex Brazil)<br />
                                ●	If the data subject is 'in the union'. This is intentionally vague and could cover either residents by address or citizens so long as some action takes place in the EU.<br />
                                <br />
                                According to your input, your company falls under the following legislations:

                            </p>
                            <asp:Label ID="lbl_legislation_list" runat="server" Text="" />
                            <br />
                            <p>
                                Each regulation carries its own standards and penalties.<br />
                                <asp:Label ID="lbl_regulations_score" runat="server" Text="" />
                                Having an understanding of the regulations you fall under protect your data and prevent your company from the high cost of possible fines.
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Data Protection Authorities</b></h3>
                            <p>
                                In the event of a security incident or complaint, it is important to know which Authorities are responsible for your regulations. 
                                <br />
                                <asp:Label ID="lbl_DPA" runat="server" Text="" />

                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>ROLES</b></h3>
                            <p>
                                The naming convention within regulations differs but there are three main entities under each: the employee of a company responsible for privacy, the company, and the user.
                                <br />
                                <br />
                                <b>DPO – Data Protection Officer</b>
                                <br />
                                <br />
                                The most common name for the employee responsible for privacy of data is the Data Privacy Officer. This is the term used in GDPR. Other roles that may include this responsibility are CPO (Chief Privacy Officer) or CISO (Chief Information Security Officer). GDPR covers this role in Article 39, PIPEDA covers it within the principle of Accountability.
                                <br />
                                The responsibilities of the DPO include:<br />
                                •	Monitoring for and ensuring legal regulation compliance<br />
                                •	Overseeing and updating DPIAs (Data Protection Impact Assessments)<br />
                                •	Acting as primary contact for external companies and regulatory bodies
                                <br />
                                •	Ensuring internal policies and processes are in place, and providing training to staff
                                <br />
                                <br />

                                <asp:Label ID="lbl_DPO" runat="server" Text="" />

                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Controllers, Processors, Organizations</b></h3>
                            <p>
                                Determining your company can help in defining which regulation rules you need to observe. The company that controls the data is typically referred to as an organization.
                                <br />
                                <asp:Label ID="lbl_controller" runat="server" Text="" />
                                <br />
                                <asp:Label ID="lbl_processor" runat="server" Text="" />
                                <br />
                                <asp:Label ID="lbl_notsure" runat="server" Text="" />
                                <br />
                                NOTE: A company can be both a Controller and a Processor.
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Documentation and Links</b></h3>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <div style="vertical-align: top;">
                                <h3><b>Your Data Privacy Officer </b></h3>
                            </div>
                            <div>
                                <p>
                                    <asp:Label ID="lbl_Name" runat="server" Text="Name : " /><br />
                                    <asp:Label ID="lbl_Email" runat="server" Text="Email : " /><br />
                                    <asp:Label ID="lbl_Phone" runat="server" Text="Phone No : " /><br />
                                    <asp:Label ID="lbl_Title" runat="server" Text="Title : " /><br />
                                    <asp:Label ID="lbl_Contact" runat="server" Text="Other Contact Info : " /><br />
                                </p>
                            </div>
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <div style="vertical-align: top;">
                                <h3><b>Your Data Authority List</b></h3>
                            </div>
                            <div>
                                <p>
                                    <asp:Label ID="lbl_linklist" runat="server" Text="" />
                                </p>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <%--Privacy Engineering--%>
            <%--<div class="boxshadow zoom">
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
            </div>--%>

            <%--Data Control--%>
            <%--<div class="boxshadow zoom">
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
            </div>--%>


            <%--Consent--%>
            <%--<div class="boxshadow zoom">
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
            </div>--%>

            <%--Incident Management--%>
            <%--<div class="boxshadow zoom">
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
            </div>--%>

            <%--Employee Training--%>
            <%--<div class="boxshadow zoom">
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
            </div>--%>
        </div>
    </form>
</body>
</html>

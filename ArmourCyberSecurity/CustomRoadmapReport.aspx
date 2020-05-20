<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomRoadmapReport.aspx.cs" Inherits="ArmourCyberSecurity.CustomRoadmapReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="AIHUB/DC">
    <meta name="creator" author="techie(aj)">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <link rel="shortcut icon" href="assets/images/Logo.png" type="image/x-icon">
    <meta name="description" content="Home page">

    <title>Custom Road Map Report</title>

    <link rel="stylesheet" href="Level1/assets/web/assets/mobirise-icons/mobirise-icons.css">
    <link rel="stylesheet" href="Level1/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="Level1/assets/bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="Level1/assets/bootstrap/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="Level1/assets/socicon/css/styles.css">
    <link rel="stylesheet" href="Level1/assets/dropdown/css/style.css">
    <link rel="stylesheet" href="Level1/assets/tether/tether.min.css">
    <link rel="stylesheet" href="Level1/assets/theme/css/style.css">
    <link rel="preload" as="style" href="Level1/assets/mobirise/css/mbr-additional.css">
    <link rel="stylesheet" href="Level1/assets/mobirise/css/mbr-additional.css" type="text/css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
        #form1 {
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            height: auto;
        }

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
            -webkit-transform: scale(1.01);
            transform: scale(1.01);
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
            margin-bottom: 15px;
            margin-top: 15px;
        }

        .Check {
            width: 90%;
            margin: 0 auto;
        }

        #btn_dashboard {
            background: white;
            color: #149dcc;
            margin-right: .2rem;
        }


            #btn_dashboard:hover {
                color: white;
                background: #149dcc;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <section class="menu cid-rSx8XQK5A7" once="menu" id="menu1-8" style="margin-bottom: 100px;">
            <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">

                <div class="menu-logo">
                    <div class="navbar-brand">
                        <span class="navbar-logo">
                            <a href="Level1/LandingPage.aspx">
                                <img src="Level1/assets/images/Logo.png" alt="Armour Logo" style="height: 3.8rem;">
                            </a>
                        </span>
                        <span class="navbar-caption-wrap">
                            <a class="navbar-caption text-white display-4" href="Level1/LandingPage.aspx">Privacy Compliance Solutions
                            </a>
                        </span>
                    </div>
                </div>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
                        <li class="nav-item">
                            <a class="nav-link link text-white display-4" href="Level1//LandingPage#form4-k">Contact Us
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link text-white display-4" href="Level1//LandingPage#testimonials1-5">About Us
                            </a>
                        </li>
                        <li class="nav-item">
                            <asp:Label ID="lbl_userinit" runat="server" Text="" CssClass="nav-link link text-white display-4" ForeColor="#0795d6"/>
                        </li>
                    </ul>
                </div>
            </nav>
        </section>
        <div>
            <div class="boxshadow" style="background-color: #0795d6;">
                <table style="margin: 0 auto; text-align: center">
                    <tr>
                        <td style="text-align: center;">
                            <asp:Image CssClass="Logo" ID="Logo" runat="server" ImageUrl="~/images/newLogo.png" Style="width: 100px; height: 120px;" />
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
            <div class="boxshadow zoom" id="divGlobalRegulations" runat="server">
                <table>
                    <tr style="background-color: #0795d6;">
                        <th colspan="2" style="text-align: center;">
                            <h3 style="color: white; font-size: xx-large;">Global Regulations</h3>

                        </th>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <p style="width: 90%; margin: 0 auto;">
                                The Global Regulations report deals with the region in which you do business; This includes both where your office resides and where your customers reside.
                                <br />
                                For the purpose of this report, we will be focusing on <strong>GDPR</strong> (Europe), <strong>PIPEDA</strong> (Canada),<strong> CCPA</strong> (California), and <strong>LGPD</strong> (Brazil). This said, between the global reach of many companies and the fact that more countries and regional oversight are coming to law, following the best practice suggestions laid out in all the sections of this report will benefit you regardless of region.

                            </p>
                        </td>
                    </tr>

                    <tr>

                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>SECTION GOAL: </b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                To establish which legislations are required, determined by both your company location and that of your customers.
                                <br />

                                Note: If you deal with medical data, then there are separate regulations that are specific to these kinds of records. They are typical labeled  <strong>Health Insurance Portability and Accountability Act</strong> (HIPPA), or the like.

                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>REGULATIONS </b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                Regulations vary by geographical region. Additionally, some apply to the location of the company and others to the location of the individual.
                                <br />
                                For example,<strong> GDPR</strong> applies:<br />
                                •	If the company is in the <strong>EU </strong>
                                <br />
                                •	If the company does business with some subjects in the  <strong>EU</strong><br />
                                •	If the company is in a country that also follows<strong> GDPR</strong> (ex Brazil)<br />
                                •	If the data subject is 'in the union'. This is intentionally vague and could cover either <strong>residents</strong> by address or <strong>citizens</strong> so long as some action takes place in the<strong> EU</strong>.<br />
                                <br />
                                <strong>According to your input, your company falls under the following legislations: </strong>
                                <br />

                                <asp:Label class="Check" ID="lbl_legislation_list" runat="server" Text="" />
                            </p>
                            <br />
                            <p style="width: 90%; margin: 0 auto;">
                                Each regulation carries its own standards and penalties.<br />
                                <asp:Label ID="lbl_regulations_score" runat="server" Text="" />
                                Having an understanding of the regulations you fall under protect your data and prevent your company from the high cost of possible fines.
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Data Protection Authorities</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                In the event of a security incident or complaint, it is important to know which Authorities are responsible for your regulations. 
                                <br />
                                <asp:Label ID="lbl_DPA" runat="server" Text="" Font-Bold="true" />

                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>ROLES</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                The naming convention within regulations differs but there are three main entities under each: the employee of a company responsible for privacy, the company, and the user.
                                <br />
                                <br />
                                <b>DPO – Data Protection Officer</b>
                                <br />
                                <br />
                                The most common name for the employee responsible for privacy of data is the Data Privacy Officer. This is the term used in GDPR. Other roles that may include this responsibility are<strong> CPO</strong> (Chief Privacy Officer) or <strong>CISO</strong> (Chief Information Security Officer).<strong> GDPR covers this role in Article 39, PIPEDA covers it within the principle of Accountability.</strong>
                                <br />
                                The responsibilities of the DPO include:<br />
                                •	Monitoring for and ensuring legal regulation compliance<br />
                                •	Overseeing and updating <strong>DPIAs</strong> (Data Protection Impact Assessments)<br />
                                •	Acting as primary contact for external companies and regulatory bodies
                                <br />
                                •	Ensuring internal policies and processes are in place, and providing training to staff
                                <br />
                                <br />

                                <asp:Label ID="lbl_DPO" runat="server" Text="" Font-Bold="true" />

                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Controllers, Processors, Organizations</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                Determining your company can help in defining which regulation rules you need to observe. The company that controls the data is typically referred to as an organization.
                                <br />
                                <asp:Label ID="lbl_controller" runat="server" Text="" />
                                <br />
                                <asp:Label ID="lbl_processor" runat="server" Text="" />
                                <br />
                                <asp:Label ID="lbl_notsure" runat="server" Text="" />
                                <br />
                                <strong>NOTE:</strong> A company can be both a Controller and a Processor.
                            </p>
                        </td>
                    </tr>
                    <tr>

                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <hr size="1" width="90%" align="center" color="#000">
                            <h3><b>Documentation and Links</b></h3>

                        </td>
                    </tr>
                    <tr style="width: 90%; margin: 0 auto;">
                        <td style="text-align: justify; margin-left: 50px; float: left">
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
                        <td style="text-align: justify; margin-right: 50px; float: right">
                            <div style="vertical-align: top;">
                                <h3><b style="margin-right: 7rem;">Your Data Authority List </b></h3>

                            </div>
                            <div>
                                <p style="width: 90%; margin: 0 auto; word-break: break-all;">
                                    <asp:Label ID="lbl_linklist" runat="server" Text="" />
                                </p>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <%--Privacy Engineering--%>
            <div class="boxshadow zoom" id="divPrivacyEngineering" runat="server">
                <table>
                    <tr style="background-color: #0795d6;">
                        <th colspan="2" style="text-align: center;">
                            <h3 style="color: white; font-size: xx-large;">PRIVACY ENGINEERNG & DATA ANALYSIS 
                            </h3>

                        </th>
                    </tr>

                    <tr>

                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>SECTION GOAL: </b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                To ensure that privacy is at the foundation of your system and services.
                                <br />
                                To evaluate the basis on which data is collected.
                                <br />
                                To determine the level of security of its processing, transfer and storage.
                                <br />
                                Through this process you eliminate risk by removing any data that is not necessary to the system, and add in the security measures needed to protect the data that remains.<br />

                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>FOUNDATION - PRIVACY BY DESIGN (PbD)</b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                Privacy by Design is a framework to ensure that privacy is paramount in the operation and maintenance of a system. Applying the seven principles of PbD maximizes the security and safety of your data. 
                                Starting with the foundation of the system or service, you'll need to draw or write out the flow of data including collection, transfer and access to the data. [Note: this system and services map is the first step in a Data Privacy Impact Assessment below]
                                Both the adherence to Privacy by Design and the completed Privacy Impact Assessment are requirements for full compliance for many regulations.
                                 <br />
                                <br />
                            </p>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>Your System and Service Map</b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                Whether you are assessing an existing system or designing a new one, you will need to create a system and/or service map. This can be done with drawings, flow charts or words. The map is an opportunity to evaluate where privacy is being considered and where it may be missed.
                                <br />
                                <br />
                                <asp:Label ID="lbl_pe_1" runat="server" Text="" Font-Bold="true" />
                                <br />
                                <br />
                                The implementation of privacy by design principles will depend specifically on your product and/or service. The following design elements should be considered in order to improve your system.<br />
                            </p>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_2" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_2" runat="server" Text="You have you<b> pseudonymized your data </b>in the design. This means have you stored your data in a way where the personally identifiable information is separated from the non-identifiable information but can still be correlated together. This is valid for some regulations (others require full anonymization). This allows you to process data while keeping individuals protected." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_3" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_3" runat="server" Text="You have you <b>anonymized your data </b>in the design? This means have you stored your data in a way where the personally identifiable information is separated from the non-identifiable information and can no longer be connected back to the personal data. This is valid for all regulations. This allows you to process and retain data while keeping individuals protected." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_4" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_4" runat="server" Text="The <b>storage of your data is protected by encryption</b>. This is not required but does lower the risk of breach significantly. The higher the level of sensitivity of the data, the more stringent the protection." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_5" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_5" runat="server" Text="The <b>access to your data is limited </b>to only those who require it. If all of your data is highly sensitive then access should be strict. If you have multiple data severities then you can separate your highly sensitive data from less sensitive data by access levels. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_6" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_6" runat="server" Text="The <b>transfer of your data is protected by encryption.</b> This is not required but does lower the risk of breach significantly. Data on transfer is particularly susceptible to man-in-the-middle attacks where it can be taken. The higher the level of sensitivity of the data, the more stringent the protection." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_7" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_7" runat="server" Text="You have a <b>system or process to delete data </b>from your system when no longer needed. You need to have a retention time on the data you maintain and that time should be justified with legal basis." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>DATA ASSESSMENT & CATEGORIZATION</b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                Once the system map is complete and different transactions are identified, it is important to list the data involved at those touch points. This data will then be categorized, assessed for necessity, and documented.<br />
                                <br />
                                Your data must be distinguished in terms of Personal Information (PI), Personally Identifiable Information (PII), as well as sensitivity of the data.
                                <br />
                                The data flow can be captured in a data map. The data itself can be captured in a speadsheet or a tool. This is referred to as the Data Use Info Sheet.
[Note: the Data Map and Data Use Info Sheet are part of the Data Privacy Impact Assessment below]. 

                            <br />
                                <br />
                                <asp:Label ID="lbl_pe_9" runat="server" Text="" />
                                <br />
                                It is important that you document all the PI and PII you collect. Having this documentation allows you to evaluate the risk of collecting/processing the data and determine if it is truly required. If you have legal basis to collect the data, ensure you understand the risk.

                                <br />
                                Below are best practices to optimize the safety of the data you are collecting.

                                <br />
                            </p>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_8" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_8" runat="server" Text="You are <b>tracking your all your collected data in a data</b> use info sheet (excel spreadsheet) or a data collection tool. Many regulations will require an audit trail of your data. The Data Use Info sheet or output from your tool should be included in your DPIA. On that sheet you should include the source of the data, the category and potentially the risk of harm." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_10" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_10" runat="server" Text="You have <b>identified all of your collected data.</b> Using your Data Map, you can show all of the data being collected by your company either directly or indirectly from an individual." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_11" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_11" runat="server" Text="You have <b>you categorized all of your personal information, PI </b>(data about an individual). PI may include identifiers that are not unique such as gender, religion, age, or city." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_12" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_12" runat="server" Text="You have <b>you categorized all of your personally identifiable information, PII </b>(data that when taken alone or in combination with other data identifies a specific individual. PII may include areas with unique identifiers such as email addresses, financial data, biometrics." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_13" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_13" runat="server" Text="You have <b>assessed all of your PII for legal basis </b>(business necessity) and removed any data collection that is not needed for your business. Extra data is useful for marketing but it there is not a need then you cannot collect anything beyond what has business purpose. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_14" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_14" runat="server" Text="You have <b>assessed the RROSH (Real Risk of Significant Harm)</b> for the potential breach of each piece of personal data. Certain categories, such as financial or medical data hold a higher risk. That said, you should evaluate your company’s data against the risk of your customers/clients based on their geographical or political region. Example: Religion may be low risk in some countries and high risk in others." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_15" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_15" runat="server" Text="You have you done this <b>assessment for data pertaining to internal employees</b>. The regulations also apply to employees of the company. Your company should have a record of what it is collecting and why." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_16" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_16" runat="server" Text="You have a <b>process for employees to assess and add new PII </b>to your internal systems. Given the risk of adding PII, your company should have a process to evaluate the legal basis for adding new data. The process should also include instructions on how to add new data to the Data Use Info Sheet or tool. You may also need to add in consent collection for this data. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>VENDOR MANAGEMENT</b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                If you are the controller of data, your company is ultimately responsible for the safety and privacy of the data you handle. As such, vendors and third party partners must be compliant with regulation as well. This applies to internal software and services if your employees fall under a regulation (ex citizen of a country within the EU), and third party software and services (such as cloud storage) for customers and clients. Some regulations require a vendor contract but it is a good idea to have one regardless of regulation.
                                <br />
                                <asp:Label ID="lbl_pe_22" runat="server" Text="" Font-Bold="true" />
                                <br />
                                Though pre-written templates are not required for regulation compliance, creating them in advance will save you time and resources as the requests come in. It will also ensure consistent communication from the company to individuals.<br />
                                <br />
                                <b>Review these items to ensure your Vendor Management Process meets the standards.
                                </b>
                                <br />
                            </p>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_17" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_17" runat="server" Text="You have a list of all <b>software products and collection services that you use internally </b>with your employees that collects personal data. Consider software used by your HR and financial departments as well as remote access or device use." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_18" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_18" runat="server" Text="You have <b>reviewed all of these internally used companies</b> to ensure they are compliant with the same regulations you require. Your employees have the same rights as your customers." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_19" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_19" runat="server" Text="You have a list of all <b>software products and collection services that you use externally</b> with your users/customers that touches personal data. Consider software you use to collect, process, transfer, and store data." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_20" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_20" runat="server" Text="You have <b>reviewed all of these externally used companies</b> to ensure they are compliance with the same regulations you require. You will not be considered compliant by many regulations if the companies you use are not compliant." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_pe_21" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_pe_21" runat="server" Text="You have a <b>contract you use with third party companies and services</b> to ensure they are compliant and will notify you of a breach of their systems. This is required for some regulations and not others though it is highly recommended. Without this contract a vendor company has no obligation to alert you to any breaches in their systems or non-compliance they have." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>DATA PRIVACY IMPACT ASSESSMENT</b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                All legislations require that companies show due diligence in their protection of personal data. This can be done via an evaluation called a Data Protection Impact Assessment (DPIA) or Privacy Impact Assessment (PIA), which lists, reviews, and records all the ways data is handled, used, stored, and protected.
                                <br />
                                Though pre-written templates are not required for regulation compliance, creating them in advance will save you time and resources as the requests come in. It will also ensure consistent communication from the company to individuals.
                                <br />
                                <br />
                                The DPIA includes a system map, data map, and information from the data use info sheet, which are included in the sections above. The DPIA also covers security and privacy measures taken to protect the data while being accessed, stored, and transferred.
Of all the elements of compliance,<b> a thorough DPIA will take the most amount of time</b>. Authorities suggest reviewing the DPIA every 6 months. When done properly the first time, the review should have a minimal impact on resources going forward. A new DPIA should be done for every new system or service created if it involves PII.

                                <br />
                                <asp:Label ID="lbl_pe_23" runat="server" Text="" Font-Bold="true" />
                                <br />
                                Review the sections to ensure you have covered all required areas of the DPIA.
                                The body of the assessment is broken in to six parts:<br />

                                1.	System and/or Service Map
                                <br />
                                2.	Data List (including PI and PII)
                                <br />
                                3.	Notice and Consent
                                <br />
                                4.	Security and Data Access
                                <br />
                                5.	Retention and Deletion
                                <br />
                                6.	Further actions and Recommendations
                                <br />

                                It is also recommended you include an executive summary and a sign off page for executive stakeholders.
                                <br />

                                <br />
                                The DPIA should be reviewed and re-signed every year. 
                                <asp:Label ID="lbl_pe_24" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>

                        </td>
                    </tr>
                    <tr>

                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <hr size="1" width="90%" align="center" color="#000">
                            <h3><b>Documentation and Links</b></h3>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Systems Map</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_sm_links" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Data Map</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_dm_links" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Data Privacy Impact Assessment</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_dpia_links" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>PII and Data Assessment process</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_pidap_links" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Data Use Info Sheet for Internal Tools</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_duisit_links" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Data Use Info Sheet for External Tools</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_duisEt_links" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Vendor Management Process</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_vmp_links" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                </table>
            </div>

            <%--Data Control--%>
            <div class="boxshadow zoom" id="divDataControl" runat="server">
                <table>
                    <tr style="background-color: #0795d6;">
                        <th colspan="2" style="text-align: center;">
                            <h3 style="color: white; font-size: xx-large;">DATA CONTROL  </h3>

                        </th>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <p style="width: 90%; margin: 0 auto;">
                                Data control is covered in all of the regulations under Data Subject Rights or guiding principles.
For example, according to GDPR Article 15, a user has the right to access their data. Under Article 16, they have the right to rectify that data, and under Article 17, they have the right to ask to be erased from your system.

                            </p>
                        </td>
                    </tr>
                    <tr>

                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>SECTION GOAL: </b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                To build a system for data control that complies with an individual's rights but also ensures privacy and security levels are high.<br />
                                <br />
                                The steps below will help you through the creation of your own custom Data Request and Retention process for determining how best to access, deliver, and delete a user’s data on request. By proactively creating this process, you ensure that you are properly and securely handling data user rights.<br />
                                <br />
                                Depending on quantity of requests you receive, many of these steps can be automated, from data retrieval to automated customer scripts. Automation also helps you track the requests to completion in the event you are audited. Consider that as you develop the process.<br />
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>Data Subject Access Requests (DSAR)</b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                Individuals have the right to access their data. Depending on the legislation, they may have the rights to check for accuracy, request correction, or simply review what is held. This includes data you have collected directly from them, data from use, and possibly inferred data.
                                <br />
                                <asp:Label ID="lbl_dc_1" runat="server" Text="" Font-Bold="true" />
                                <br />
                                <b>This process should include requests to see, alter, or transfer an individual’s data.
Review the items below to ensure that you have covered all of your bases. 
                                </b>
                            </p>

                        </td>
                    </tr>

                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_2" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_2" runat="server" Text="You are able to <b>properly authenticate</b> an individual's identity to grant the request. This can be done automatically via their own email and password if inside a system with credentials. Otherwise you need to have an established way to verify the requestor’s identity." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_3" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_3" runat="server" Text="You are able to <b>package an individual's data</b> up in a way that is readable by the individual. This means it cannot be in a proprietary format. Suggested method is CSV." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_4" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_4" runat="server" Text="You are able to <b>securely transfer the data</b> to an individual. If data is sensitive, it should be encrypted and/or password protected." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_5" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_5" runat="server" Text="You have <b>optimized any of this process</b> with a tool or internal automation. This is not necessary for compliance but if you are able to automate the process it will help you under load (many requests). Additionally, the use of automation or tools ensures you have a secure and consistent process of finding, gathering, and packaging the data. These tools often include ways to track the requests." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_6" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_6" runat="server" Text="You are you <b>able to access specific data</b> from your systems about an individual for correction. If an individual needs to amend a single piece of data for accuracy (ex an address) then your process or systems allow you to find and amend that data. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>Data Retention and Removal</b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                Depending on the legislation, users may have the rights to ‘be forgotten’ or be removed from the system on request. As a privacy design principle, data should also be removed when it is no longer required for business purposes. 
                                <br />
                                <asp:Label ID="lbl_dc_8" runat="server" Text="" Font-Bold="true" />
                                <br />
                                <asp:Label ID="lbl_dc_10" runat="server" Text="" Font-Bold="true" />
                                <br />
                                Data retention is two-fold; deleting data when it is no longer of use and deleting data when requested by an individual. The initiation of deletion is different but since the act of removal is the same you can choose to use one process for retention and deletion. If it makes more sense for your company, separate the items below in to two separate processes.

                            <br />
                                <br />
                                <b>Review the items below to ensure that you have covered all of your bases. </b>
                            </p>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_9" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_9" runat="server" Text="You have a <b>data retention period </b>for all data. This depends on what kind of data you are storing and the need for future use. If your data ceases to be of value when not in use, then 2 years is the standard retention period. If the data is accounting related, then the term may be 7 years. If the data is personal but has value to a company (example an ex-employee’s contact information) then that data may be kept indefinitely. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_11" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_11" runat="server" Text="You are able to <b>remove the individual from all systems</b> including back-ups. If an individual request to be deleted from the system and there is no legal basis to keep their personal data then it showed be removed from all storage including back-ups and printed versions." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_12" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_12" runat="server" Text="You have a way to <b>anonymize or pseudo anonymize </b>data. By stripping the identifiable data away from non-identifiable data, you may be able to retain pieces of data for analysis and processing. This is only necessary if you want to keep some of the data." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_13" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_13" runat="server" Text="You have a way to<b> date data and remove it </b>if it has not been in use for an extended period of time. If your retention period has a data to it then you should have a way to flag data with a timestamp to ensure its removal after the retention period has expired." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_14" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_14" runat="server" Text="You have <b>optimized any of this process </b>with a tool or internal automation. This is not necessary for compliance but if you are able to automate the process it will help you under load (many requests). Additionally, the use of automation or tools ensures you are properly locating and deleting the data. These tools often include ways to track the requests." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>Communication</b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                How you communicate with an individual is up to your company. The one required piece of information is the acknowledgement of the request that includes a timeline for completion. According to most regulations, these requests must be completed within 30 days. Check appropriate requirements to ensure you have the correct timeline. If the request is denied this should also be communicated to avoid missed expectations.
                                <br />
                                <asp:Label ID="lbl_dc_comm" runat="server" Text="" Font-Bold="true" />
                                <br />
                                Though pre-written templates are not required for regulation compliance, creating them in advance will save you time and resources as the requests come in. It will also ensure consistent communication from the company to individuals.<br />

                                The trail of communication additionally provides a great way to audit what requests were made, when they were handled, and when they were completed.<br />

                                <br />
                                The suggested communication templates are:
                                <br />
                                ●	<b>Acknowledgement:</b> Request received.<br />
                                ●	<b>Request Accepted:</b> Individual authenticated and request will be processed.<br />
                                ●	<b>Request Denied:</b> Request will NOT be processed. There are a number of valid reasons that can be listed.<br />
                                ●	<b>Data Request Delivery:</b> Data sent.<br />
                                ●	<b>Data Deletion Confirmation:</b> Confirmation of system removal.<br />

                                <br />
                            </p>

                        </td>
                    </tr>
                    <tr>

                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <hr size="1" width="90%" align="center" color="#000">
                            <h3><b>Documentation and Links</b></h3>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Data Subject Access Request Process</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_dsarp" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Data Retention and Deletion Process</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_drdp" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Data Request Scripts and Communications</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_drsc" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                </table>
            </div>


            <%--Consent--%>
            <div class="boxshadow zoom" id="divConsent" runat="server">
                <table>
                    <tr style="background-color: #0795d6;">
                        <th colspan="2" style="text-align: center;">
                            <h3 style="color: white; font-size: xx-large;">CONSENT  </h3>

                        </th>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <p style="width: 90%; margin: 0 auto;">
                                Data privacy consent is outlined as the user acceptance of the collection use, processing, transfer, storage, and retention of their data. A clear explanation of each of these elements must be presented to the data subject for them to properly provide their consent. This can be done in person via a printed document or digitally, typically via the Privacy Policy.
                            </p>
                        </td>
                    </tr>
                    <tr>

                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>SECTION GOAL: </b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                To ensure that consent is properly collected from informed individuals that are aware of how their data is collected and used.
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>PRIVACY POLICY</b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                As a company, you have many options to present your users and customers with the required information about their data privacy. The simplest way to do this is through a Privacy Policy in person or on your website. 
                                <br />
                                In accordance to the legislations, the privacy policy must explain to users what their rights are and how to execute on those rights. It is also important to establish a legal basis for which data is being collected. This policy should be clear and easy to find. 
                                <br />
                                Below is a checklist of what should be included in this policy. We have scored this list based on your assessment input. Review each item to ensure you have met the standard.<br />

                            </p>

                        </td>
                    </tr>

                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_1" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_1" runat="server" Text="You have an <b>existing privacy policy</b>. This can be distributed to customers/clients on sign up and/or posted on your website. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_2" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_2" runat="server" Text="Your <b>privacy policy is easy to locate on your website</b>. Having a digital copy online allows you to update it when needed. Conventionally this page is linked in the header of footer of your site." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_3" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_3" runat="server" Text="Your <b>privacy policy is updated annually.</b> Regulations and laws change. You should at least review, if not update, this policy annually and change the version date at the bottom." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_4" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_4" runat="server" Text="You have identified if your <b>company is the controller and/or processor</b> of information. The Controller assumes ultimate accountability for the data is that is being collected and processed. They also select the processors." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_5" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_5" runat="server" Text="You have <b>listed all the personal data that is being collected</b>. This includes data collected directly from the customer/client and the data you collect from tools or services (example location data, usage data)." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_6" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_6" runat="server" Text="You have <b>listed all the methods by which data is collected.</b> This includes direct methods such as input forms and indirect methods such as cookies." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_7" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_7" runat="server" Text="You have <b>listed the legal basis </b>(business reason) why you are collecting that data. Each piece of personal data needs a reason. For example, gender is not needed for a magazine subscription service. It is demographic data but not required data." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_8" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_8" runat="server" Text="You have<b> listed the geographical regions in which the data is being transferred and stored.</b> Some regulations (like GDPR) require that data be processed within the given region. Others (like PIPEDA) allow cross-border transfer so long as it is specified to the user." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_9" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_9" runat="server" Text="You have <b>listed the retention period for your company's data.</b> This will vary by company and by data type. Financial data, for example, requires 7 years storage; other data could be 2 years. If you have legal basis, some data could be stored indefinitely." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_10" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_10" runat="server" Text="You have <b>listed any third party policies </b>where applicable. If you are the Controller, it is important to let users know that your third party partners are also compliant. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_11" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_11" runat="server" Text="You have listed the <b>individual's rights according to your legislations.</b> You can either call out that the individual has rights or list them separately. Doing so here shows that you understand and are able to comply with the rights your customers/clients may have." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_12" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_12" runat="server" Text="You<b> have included the contact information for your privacy officer</b> and/or ways in which individuals can contact the company to execute their rights. This can be via email, postal mail, or online form. As long as the method is clear to the individual. " />
                        </td>
                    </tr>

                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>OPT-INS AND OPT-OUTS</b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                Users must have the ability to Opt In and Opt Out of having their data collected, stored, and transferred. That consent must be stored and updated if data use is changed. You can use a checkbox for this on a digital service but be sure not to have it checked by default.
                                <br />
                                <br />
                                <b>Consent is a key component to privacy regulations. It must be informed (individual knows what they are agreeing to) and given freely. </b>
                                <br />
                                <br />
                                There is direct consent and indirect consent. Direct Consent is provided by the individual with respect to the collection and use of their data. Indirect Consent is provided from a controller to a processor. For example, if you were collecting individual’s names and decided to put them in a newsletter mailer, you are the controller collecting the data and the mailer is the processor. You need the individual’s consent to add their name to the newsletter but the newsletter application does not need direct consent from the user.
                                 <br />
                                <br />
                                <asp:Label ID="lbl_c_13" runat="server" Text="" Font-Bold="true" />
                                <br />
                                <br />
                                <b>Review the items below to ensure that you have covered all of your bases. </b>
                                <br />
                                <br />
                                <b>IF YOU ARE ACTING AS THE CONTROLLER: To be compliant with privacy regulations, all of the items should be marked green, or complete.
                                    <br />
                                    <br />
                                    IF YOU ARE ACTING AS THE PROCESSOR: You can make a judgement on each requirement and if it applies to you or if it is covered by your controller.

                                </b>
                                <br />
                                <br />
                            </p>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_14" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_14" runat="server" Text="You have <b>an explicit box for &quot;Do not sell my personal information&quot;. </b>California residents must be able to opt out of the reselling of their data." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_15" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_15" runat="server" Text="You <b>storing the acknowledgment of consent of each individual</b>. In the event you are audited, you must be able to show that each individual has consented to your services." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_16" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_16" runat="server" Text="You <b>have a method or link for individuals to opt-out </b>of parts of your service. If participation or data is required to fully use your service or product, you can stipulate that opting out will result in partial or no access." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_17" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_17" runat="server" Text="You <b>have a method for individuals to quit</b> your service or product. This must include a way for them to leave entirely and not only deactivate their account with you." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_18" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_18" runat="server" Text="You <b>have a process to notify users if there is a change in the way their data is being processes or sold.</b> If the use of an individual’s data has changed then you require a new consent from them." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_19" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_19" runat="server" Text="You <b>have a way to store updated consent.</b> When data use changes and a new consent request is sent out, you must be able to accept that consent and store it for audit." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>COOKIES</b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                Cookies are a form of personal data collection. When individuals visit your website, they must consent to having cookies track their usage.
                                <br />
                                <br />
                                <asp:Label ID="lbl_c_20" runat="server" Text="" Font-Bold="true" />
                                <br />
                                <br />
                            </p>

                        </td>
                    </tr>
                    <tr>

                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <hr size="1" width="90%" align="center" color="#000">
                            <h3><b>Documentation and Links</b></h3>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Privacy Policy</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_c_pp" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Consent Management Process</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_c_cmp" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                </table>
            </div>

            <%--Incident Management--%>
            <div class="boxshadow zoom" id="divIncidentManagement" runat="server">
                <table>
                    <tr style="background-color: #0795d6;">
                        <th colspan="2" style="text-align: center;">
                            <h3 style="color: white; font-size: xx-large;">PRIVACY BREACH & INCIDENT RESPONSE  
                            </h3>

                        </th>
                    </tr>

                    <tr>

                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>SECTION GOAL: </b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                To ensure that your company has an adequate incident response management plan in place before you experience an incident.
                                <br />
                                With privacy incidents, it is not IF you will be breached but WHEN.

                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>DEFINING A PRIVACY BREACH</b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                A breach of personal data is a finable offence by the respective Data Protection Authorities (DPA).
                                <br />
                                <br />
                                The definition of a breach in all regulations lines up with how It is defined in GDPR as <i>“a breach of security leading to the accidental or unlawful destruction, loss, alteration, unauthorized disclosure of, or access to, personal data transmitted, stored or otherwise processed”.</i>
                                <br />
                                If you use a third company party to process your data, then you are still ultimately responsible for the protection of said data. If the third-party company has been breached, they are obligated to send you a notification. You must now assess the breach as your own and then address accordingly with actions and notifications.
                                <br />
                                <asp:Label ID="lbl_im_6" runat="server" Text="" Font-Bold="true" />
                                <br />
                                <b>You will need to be able to determine if your incident has crossed the threshold of being a breach. An incident may involve only internal discussion, but a breach requires external notification.</b>
                                <br />
                                All breaches are supposed to be logged by your company for audit purposes by the respective DPAs. 
                                <br />
                                <asp:Label ID="lbl_im_3" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>INCIDENT RESPONSE PROCESS</b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                All privacy breaches and incidents must be assessed for risk of harm. Depending on the legislation, breaches will need to be documented, authorities contacted, and individuals informed. 
                                <br />
                                <br />
                                The following is intended to guide you through the creation of your own custom incident response process for Data Privacy Breaches. The key here is not to be caught off guard. The faster you can step in, stop the incident, address it, and take charge, the better.
                                <br />
                                <br />
                                Studies have shown that companies pay an average of $500K US in fees for NOT having a plan in place.
                                <br />
                                <asp:Label ID="lbl_im_1" runat="server" Text="" Font-Bold="true" />
                                <br />
                                <br />
                                It is also imperative that you run your plan through in an activity called a tabletop exercise (like a fire alarm drill). This ensures everyone is prepared and knows what they doing.
                                <br />
                                <br />
                                <asp:Label ID="lbl_im_2" runat="server" Text="" Font-Bold="true" />
                                <br />
                                Testing should be done annually or when major stakeholders change.
                                <br />
                                <br />
                                To optimize your plan, review the list below to ensure that your plan covers all the needed pieces.
                                <br />
                                <br />
                            </p>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_4" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_4" runat="server" Text="You have <b>the contact information for any vendors</b> that process your customers or users data. If a breach has occurred within a system run by your vendors you need to be able to contact the right people to report the breach. This could be reported to you internally or by a customer." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_5" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_5" runat="server" Text="You have a process or <b>method for individuals to report a suspected incident</b>. This should be for external customers or internal employees. If an incident is a breach you want to ensure that information gets to stakeholders as quickly a possible to resolve the issue and to contain the spread of misinformation." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_7" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_7" runat="server" Text="You have <b>identified the individual(s) who will be running the management plan.</b> This is typically the Data Protection Officer but may have a different title. It is key that one person or team is charged with coordinating and executing the plan. They may delegate pieces but ultimately a central individual/team is accountable." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_8" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_8" runat="server" Text="You have <b>back-up managers </b>for the plan. In the event that your plan executer is unavailable, there should be ‘understudies’ that will take on their role." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_9" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_9" runat="server" Text="You have a <b>list of all stakeholders</b> that are required. This list can be quite extensive and could include executives, product developers, communications, IT department, legal etc." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_10" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_10" runat="server" Text="You <b>printed the stakeholder list</b> with contact information in hard copy, off your company systems. Ransomware and other popular cyber incidents lock down company systems. A copy of you plan should be kept off system. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_11" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_11" runat="server" Text="You have a <b>phone bridge or meeting location</b> (other than email) to discuss the incident that is open 24/7. Email can be easily forwarded to the wrong individuals (including externally) and can be used against a company if misunderstood. It is recommended that phone or in-person discussions take place until resolutions are made. A war-room meeting area is suggested." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_12" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_12" runat="server" Text="You have <b>contacted any third-party cyber security company</b> needed to manage insurance, forensics, audits etc. to be on retainer. If you do not have the resources in-house, it is key to have companies on retainer that can resolve issues from breach identification to insurance questions. The retainer must be done ahead of time and their contact information should be included in the plan." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_13" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_13" runat="server" Text="You have <b>contacted any third part legal resources</b> to manage be on retainer. If you do not have the resources in-house, it is key to have legal weigh in on the incident and severity of risk of harm. The retainer must be done ahead of time and their contact information should be included in the plan." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_14" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_14" runat="server" Text="All <b>stakeholders know their roles.</b> Each member of the incident team must know what is expected of them including the work that is expected, the communication they should provide, and other team members they should coordinate with." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_15" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_15" runat="server" Text="You have a <b>communication strategy between stakeholder teams </b>(updates, progress). This is often where plans break down and why they should be tested. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_16" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_16" runat="server" Text="All <b>stakeholders have a way to contact one another outside work</b>. Breaches frequently occur in off-work hours. All stakeholders should have a contact list and method to join conversations from outside the office. This is where phone bridges are handy. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_17" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_17" runat="server" Text="You have <b>evaluated all of your PII to determine the Real Risk of Significant Harm (RROSH).</b> The RROSH is used to determine the risk level of the breach, which dictates notification strategies. Adding the RROSH to your PII tracking (via Data Use Info Sheet or tool) helps generate a risk profile quickly." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_18" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_18" runat="server" Text="You <b>developed a risk profile for your PII</b> and data. Using the RROSH of your personal information, a risk profile of your systems can tell you immediately what risk the breach may pose thus determining your next steps for communication. Risk profiles can be developed for different groups of data such as login credentials vs financial data.  " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_19" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_19" runat="server" Text="You have a <b>notification process and/or communications team </b>lined up. Depending on the size of your customer base and criticality of your data, a process, an individual, or a team should be ready to produce and execute on all communications. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_20" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_20" runat="server" Text="You have a <b>breach template to log </b>the relevant information. Having a template with areas to fill in will allow you to organize your thoughts and ensure you have captured all the needed information from your stakeholders. When structured properly, this template can also be used to easily populate your notification templates. It should include what you know, what you have done, what individuals can do etc." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>SENDING NOTIFICATIONS</b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                A breach notification is a legal announcement of your due diligence. Depending on risk of harm, you may need to notify the appropriate data protection authority (or authorities) and/or affected individuals (personally or by public statement). If you are a vendor, you will also have to notify companies that use your product or service. To avoid fines, there are windows of time in which you need to ensure your notifications are sent.<br />
                                <br />
                                Some information about your breach is mandatory to be shared and other information you may want to keep confidential. Since time is of the essence with privacy incidents, it is extremely helpful to have pre-prepared templates for your notifications. These templates can include all the static information, such as company contact information, plus spaces to fill in information specific to this incident. 
                                <br />
                                If it is not possible or unreasonable to send notifications to all of your users, you have the option to post a public statement. This can appear on your company’s website or as a statement to the press. 
                            <br />
                                Though<b> breach notifications are part of all regulations</b>, these templates are not. This said, it is shown that having these guidelines prepared in advance saves a great deal of time and money.
                                <br />

                            </p>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_21" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_21" runat="server" Text="You have a <b>template for notifications to your relevant data protection authority.</b> The template should include spaces for all of the mandatory information." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_22" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_22" runat="server" Text="You have a<b> template for notifications to any business that uses your product or services.</b> If other companies use your product and/or service, then you are obligated to let them know about your breach so that they can inform customers if necessary." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_23" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_23" runat="server" Text="You have a<b> template for notifications to your users or customers.</b> The template should include spaces for all of the mandatory information." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_24" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_24" runat="server" Text="You have a process or method to <b>automatically contact large numbers of users or customers.</b> There are tools that can do this for you, or you can automate a technical product to do this. Consider that methods such as telephone or postal mail are practical with small numbers only." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_im_25" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_im_25" runat="server" Text="You have a method to <b>post a public statement </b>that would reach all customers. In the event that you cannot individually contact users or customers, you should have a webpage set up or a press contact to be able to publish a public statement." />
                        </td>
                    </tr>

                    <tr>

                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <hr size="1" width="90%" align="center" color="#000">
                            <h3><b>Documents and Links</b></h3>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Privacy Breach Log</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_im_pbl" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Incident Response Plan</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_im_irp" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Data Protection Authority Notification Template </b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_dpant" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Internal Notification Template </b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_im_int" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>External Notification Template </b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_im_ent" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                </table>
            </div>

            <%--Employee Training--%>
            <div class="boxshadow zoom" id="divEmployeeTraining" runat="server">
                <table>
                    <tr style="background-color: #0795d6;">
                        <th colspan="2" style="text-align: center;">
                            <h3 style="color: white; font-size: xx-large;">EMPLOYEE TRAINING </h3>

                        </th>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <p style="width: 90%; margin: 0 auto;">
                                It is key for many regulations that you demonstrate that employees have been informed about the existence of privacy documentation, procedures and mechanisms. Your DPO (Data Protection Officer) is ultimately responsible for all the pieces of compliance, but every employee plays a part. 
                            </p>
                        </td>
                    </tr>
                    <tr>

                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>SECTION GOAL: </b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                To ensure that all employees understand their roles within the company when it comes to privacy and compliance.
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <br />
                            <h3><b>EMPLOYEE EDUCATION PROGRAM  </b></h3>
                            <hr size="1" width="40%" align="center" color="#000" />
                            <p style="width: 90%; margin: 0 auto;">
                                Your employee education program around cyber security and privacy should be delivered at the point when you onboard new employees and then periodically with existing employees.
                                <br />
                                Below is a checklist of what should be included in this program. We have scored this list based on your assessment input. Review each item to ensure you have met the standard.
To meet compliance, you need only to have evidence of a program. To prevent breaches, (accidental) insider threats, and reputation protection, we suggest you have all the pieces below implemented. The small amount of effort upfront will lower your risks and costs significantly.
                            </p>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Privacy Program Items</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_1" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_1" runat="server" Text="You have an existing <b> privacy education program.</b> This program should be delivered annually and include both cyber hygiene practices as well as privacy processes specific to your organization. Your company’s incident response management plan also falls into this program. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_2" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_2" runat="server" Text="Your privacy program <b>includes data privacy regulations and compliance education.</b> Employees should all have a basic understanding of what regulations that apply to them and your customers/clients." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_3" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_3" runat="server" Text="Your <b>onboarding for new employees includes the Privacy Education Program</b>. This should also detail what their particular role includes." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_4" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_4" runat="server" Text="Your employees know where to <b>access Privacy Policies and process documentation</b>. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_5" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_5" runat="server" Text="Your <b>employees are aware of the privacy rights</b> they have with respect to their own personally identifiable data (PII) that is kept by the company. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_6" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_6" runat="server" Text="Your <b>customer-facing employees know how to respond to privacy and regulation related questions</b> from customers, partners or vendors. This includes questions about their rights and how to invoke them." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_7" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_7" runat="server" Text="Your product and service <b>development team understands Privacy by Design.</b> They know what it is and how to ensure it is used for both existing and future development." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_8" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_8" runat="server" Text="Your product and service <b>development team understands the definition of PII.</b> They are made aware of any procedures you have around the addition of and/or processing of PII. This may include a tool or document used to track PII." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_9" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_9" runat="server" Text="Your product and service <b>development team understands data control</b> and how the product/service needs to conform to those controls. This includes the need for authenticating requests, the way data has to be collected/transferred, and optimizing for load." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_10" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_10" runat="server" Text="All <b>executives understand the importance of privacy regulations</b> from the perspective of both legal requirements and protecting your private data." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_11" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_11" runat="server" Text="All <b>employees understand how to identify a privacy incident</b> and/or breach. What constitutes an incident for your company? " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_12" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_12" runat="server" Text="All <b>employees understand how to report a privacy incident</b> and/or breach. Whether it’s a tool, a central email address, or a process, every employee will need to be able to escalate information of a potential incident to the right team immediately." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_13" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_13" runat="server" Text="All <b>employees understand how to communicate externally during a privacy incident</b> and/or breach. This is key to a company’s reputation. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_14" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_14" runat="server" Text="<b>Incident response stakeholders know their roles</b> during and after an incident." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_15" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_15" runat="server" Text="Your company has done a tabletop exercise to<b> test your incident response management plan.</b> Tabletop exercises as part of training helps prevent errors in the time of an actual incident." />
                        </td>
                    </tr>
                    <tr>

                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <hr size="1" width="90%" align="center" color="#000">
                            <h3><b>Documentation and Links</b></h3>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Onboarding and New Employee Training</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_onet" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h3><b>Privacy and Compliance Training</b></h3>
                            <hr size="1" width="40%" align="center" color="#000">
                            <p style="width: 90%; margin: 0 auto;">
                                <asp:Label ID="lbl_pct" runat="server" Text="" Font-Bold="true" />
                                <br />
                            </p>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="text-align: -webkit-center; font-size: larger; padding: 5px;">
            <asp:Button ID="btn_dashboard" runat="server" Text="Return To Dashboard" OnClick="btn_dashboard_Click" CausesValidation="false" CssClass="nav-link mbr-fonts-style show active" Font-Bold="true" />
        </div>
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
                        <br />
                            All Rights Reserved<br />
                            <a href="PrivacyCompliancePolicy.aspx">Privacy Policy</a>
                        </p>
                    </div>
                </div>
            </div>
        </section>
    </form>

</body>
</html>

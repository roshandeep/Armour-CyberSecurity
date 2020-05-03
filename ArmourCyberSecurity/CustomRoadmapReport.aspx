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
                                ●	If the company is in the <strong>EU </strong>
                                <br />
                                ●	If the company does business with some subjects in the  <strong>EU</strong><br />
                                ●	If the company is in a country that also follows<strong> GDPR</strong> (ex Brazil)<br />
                                ●	If the data subject is 'in the union'. This is intentionally vague and could cover either <strong>residents</strong> by address or <strong>citizens</strong> so long as some action takes place in the<strong> EU</strong>.<br />
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
                                <asp:Label ID="lbl_DPA" runat="server" Text="" />

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

                                <asp:Label ID="lbl_DPO" runat="server" Text="" />

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
                        <td style="text-align: justify; margin: 2px; float: left">
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
                        <td style="text-align: justify; float: right">
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
            <%--<div class="boxshadow zoom" id="divPrivacyEngineering" runat="server">
                <table>
                    <tr style="background-color: #0795d6;">
                        <th colspan="2" style="text-align: center;">
                            <h3 style="color: white;">Privacy Culture Questions</h3>
                            <hr size="1" width="50%" align="center" color="#000">
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
                            <asp:Label ID="lbl_dc_2" runat="server" Text="You are able to properly authenticate an individual's identity to grant the request. This can be done automatically via their own email and password if inside a system with credentials. Otherwise you need to have an established way to verify the requestor’s identity." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_3" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_3" runat="server" Text="You are able to package an individual's data up in a way that is readable by the individual. This means it cannot be in a proprietary format. Suggested method is CSV." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_4" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_4" runat="server" Text="You are able to securely transfer the data to an individual. If data is sensitive, it should be encrypted and/or password protected." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_5" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_5" runat="server" Text="You have optimized any of this process with a tool or internal automation. This is not necessary for compliance but if you are able to automate the process it will help you under load (many requests). Additionally, the use of automation or tools ensures you have a secure and consistent process of finding, gathering, and packaging the data. These tools often include ways to track the requests." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_6" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_6" runat="server" Text="You are you able to access specific data from your systems about an individual for correction. If an individual needs to amend a single piece of data for accuracy (ex an address) then your process or systems allow you to find and amend that data. " />
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
                            <asp:Label ID="lbl_dc_9" runat="server" Text="You have a data retention period for all data. This depends on what kind of data you are storing and the need for future use. If your data ceases to be of value when not in use, then 2 years is the standard retention period. If the data is accounting related, then the term may be 7 years. If the data is personal but has value to a company (example an ex-employee’s contact information) then that data may be kept indefinitely. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_11" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_11" runat="server" Text="You are able to remove the individual from all systems including back-ups. If an individual request to be deleted from the system and there is no legal basis to keep their personal data then it showed be removed from all storage including back-ups and printed versions." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_12" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_12" runat="server" Text="You have a way to anonymize or pseudo anonymize data. By stripping the identifiable data away from non-identifiable data, you may be able to retain pieces of data for analysis and processing. This is only necessary if you want to keep some of the data." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_13" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_13" runat="server" Text="You have a way to date data and remove it if it has not been in use for an extended period of time. If your retention period has a data to it then you should have a way to flag data with a timestamp to ensure its removal after the retention period has expired." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_dc_14" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_dc_14" runat="server" Text="You have optimized any of this process with a tool or internal automation. This is not necessary for compliance but if you are able to automate the process it will help you under load (many requests). Additionally, the use of automation or tools ensures you are properly locating and deleting the data. These tools often include ways to track the requests." />
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
                            <asp:Label ID="lbl_c_1" runat="server" Text="You have an existing privacy policy. This can be distributed to customers/clients on sign up and/or posted on your website. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_2" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_2" runat="server" Text="Your privacy policy is easy to locate on your website. Having a digital copy online allows you to update it when needed. Conventionally this page is linked in the header of footer of your site." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_3" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_3" runat="server" Text="Your privacy policy is updated annually. Regulations and laws change. You should at least review, if not update, this policy annually and change the version date at the bottom." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_4" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_4" runat="server" Text="You have identified if your company is the controller and/or processor of information. The Controller assumes ultimate accountability for the data is that is being collected and processed. They also select the processors." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_5" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_5" runat="server" Text="You have listed all the personal data that is being collected. This includes data collected directly from the customer/client and the data you collect from tools or services (example location data, usage data)." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_6" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_6" runat="server" Text="You have listed all the methods by which data is collected. This includes direct methods such as input forms and indirect methods such as cookies." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_7" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_7" runat="server" Text="You have listed the legal basis (business reason) why you are collecting that data. Each piece of personal data needs a reason. For example, gender is not needed for a magazine subscription service. It is demographic data but not required data." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_8" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_8" runat="server" Text="You have listed the geographical regions in which the data is being transferred and stored. Some regulations (like GDPR) require that data be processed within the given region. Others (like PIPEDA) allow cross-border transfer so long as it is specified to the user." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_9" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_9" runat="server" Text="You have listed the retention period for your company's data. This will vary by company and by data type. Financial data, for example, requires 7 years storage; other data could be 2 years. If you have legal basis, some data could be stored indefinitely." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_10" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_10" runat="server" Text="You have listed any third party policies where applicable. If you are the Controller, it is important to let users know that your third party partners are also compliant. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_11" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_11" runat="server" Text="You have listed the individual's rights according to your legislations. You can either call out that the individual has rights or list them separately. Doing so here shows that you understand and are able to comply with the rights your customers/clients may have." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_12" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_12" runat="server" Text="You have included the contact information for your privacy officer and/or ways in which individuals can contact the company to execute their rights. This can be via email, postal mail, or online form. As long as the method is clear to the individual. " />
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
                            <asp:Label ID="lbl_c_14" runat="server" Text="You have an explicit box for &quot;Do not sell my personal information&quot;. California residents must be able to opt out of the reselling of their data." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_15" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_15" runat="server" Text="You storing the acknowledgment of consent of each individual. In the event you are audited, you must be able to show that each individual has consented to your services." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_16" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_16" runat="server" Text="You have a method or link for individuals to opt-out of parts of your service. If participation or data is required to fully use your service or product, you can stipulate that opting out will result in partial or no access." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_17" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_17" runat="server" Text="You have a method for individuals to quit your service or product. This must include a way for them to leave entirely and not only deactivate their account with you." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_18" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_18" runat="server" Text="You have a process to notify users if there is a change in the way their data is being processes or sold. If the use of an individual’s data has changed then you require a new consent from them." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_c_19" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_c_19" runat="server" Text="You have a way to store updated consent. When data use changes and a new consent request is sent out, you must be able to accept that consent and store it for audit." />
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
            <%--<div class="boxshadow zoom" id="divIncidentManagement" runat="server">
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
                            <asp:Label ID="lbl_1" runat="server" Text="You have an existing privacy education program. This program should be delivered annually and include both cyber hygiene practices as well as privacy processes specific to your organization. Your company’s incident response management plan also falls into this program. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_2" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_2" runat="server" Text="Your privacy program includes data privacy regulations and compliance education. Employees should all have a basic understanding of what regulations that apply to them and your customers/clients." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_3" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_3" runat="server" Text="Your onboarding for new employees includes the Privacy Education Program. This should also detail what their particular role includes." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_4" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_4" runat="server" Text="Your employees know where to access Privacy Policies and process documentation. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_5" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_5" runat="server" Text="Your employees are aware of the privacy rights they have with respect to their own personally identifiable data (PII) that is kept by the company. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_6" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_6" runat="server" Text="Your customer-facing employees know how to respond to privacy and regulation related questions from customers, partners or vendors. This includes questions about their rights and how to invoke them." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_7" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_7" runat="server" Text="Your product and service development team understands Privacy by Design. They know what it is and how to ensure it is used for both existing and future development." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_8" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_8" runat="server" Text="Your product and service development team understands the definition of PII. They are made aware of any procedures you have around the addition of and/or processing of PII. This may include a tool or document used to track PII." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_9" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_9" runat="server" Text="Your product and service development team understands data control and how the product/service needs to conform to those controls. This includes the need for authenticating requests, the way data has to be collected/transferred, and optimizing for load." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_10" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_10" runat="server" Text="All executives understand the importance of privacy regulations from the perspective of both legal requirements and protecting your private data." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_11" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_11" runat="server" Text="All employees understand how to identify a privacy incident and/or breach. What constitutes an incident for your company? " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_12" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_12" runat="server" Text="All employees understand how to report a privacy incident and/or breach. Whether it’s a tool, a central email address, or a process, every employee will need to be able to escalate information of a potential incident to the right team immediately." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_13" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_13" runat="server" Text="All employees understand how to communicate externally during a privacy incident and/or breach. This is key to a company’s reputation. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_14" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_14" runat="server" Text="Incident response stakeholders know their roles during and after an incident." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px; width: 10%; text-align: center; vertical-align: middle;">
                            <asp:Image ID="img_15" runat="server" Width="30px" Height="30px" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_15" runat="server" Text="Your company has done a tabletop exercise to test your incident response management plan. Tabletop exercises as part of training helps prevent errors in the time of an actual incident." />
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
    </form>
</body>
</html>

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
            <div class="boxshadow zoom">
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
            <%--<div class="boxshadow zoom">
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
            <div class="boxshadow zoom">
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
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Image ID="img_1" runat="server" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_1" runat="server" Text="You have an existing privacy education program. This program should be delivered annually and include both cyber hygiene practices as well as privacy processes specific to your organization. Your company’s incident response management plan also falls into this program. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Image ID="img_2" runat="server" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_2" runat="server" Text="Your privacy program includes data privacy regulations and compliance education. Employees should all have a basic understanding of what regulations that apply to them and your customers/clients." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Image ID="img_3" runat="server" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_3" runat="server" Text="Your onboarding for new employees includes the Privacy Education Program. This should also detail what their particular role includes." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Image ID="img_4" runat="server" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_4" runat="server" Text="Your employees know where to access Privacy Policies and process documentation. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Image ID="img_5" runat="server" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_5" runat="server" Text="Your employees are aware of the privacy rights they have with respect to their own personally identifiable data (PII) that is kept by the company. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Image ID="img_6" runat="server" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_6" runat="server" Text="Your customer-facing employees know how to respond to privacy and regulation related questions from customers, partners or vendors. This includes questions about their rights and how to invoke them." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Image ID="img_7" runat="server" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_607" runat="server" Text="Your product and service development team understands Privacy by Design. They know what it is and how to ensure it is used for both existing and future development." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Image ID="img_8" runat="server" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_8" runat="server" Text="Your product and service development team understands the definition of PII. They are made aware of any procedures you have around the addition of and/or processing of PII. This may include a tool or document used to track PII." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Image ID="img_9" runat="server" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_9" runat="server" Text="Your product and service development team understands data control and how the product/service needs to conform to those controls. This includes the need for authenticating requests, the way data has to be collected/transferred, and optimizing for load." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Image ID="img_10" runat="server" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_10" runat="server" Text="All executives understand the importance of privacy regulations from the perspective of both legal requirements and protecting your private data." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Image ID="img_11" runat="server" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_11" runat="server" Text="All employees understand how to identify a privacy incident and/or breach. What constitutes an incident for your company? " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Image ID="img_12" runat="server" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_12" runat="server" Text="All employees understand how to report a privacy incident and/or breach. Whether it’s a tool, a central email address, or a process, every employee will need to be able to escalate information of a potential incident to the right team immediately." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Image ID="img_13" runat="server" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_13" runat="server" Text="All employees understand how to communicate externally during a privacy incident and/or breach. This is key to a company’s reputation. " />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Image ID="img_14" runat="server" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_14" runat="server" Text="Incident response stakeholders know their roles during and after an incident." />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Image ID="img_15" runat="server" />
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <asp:Label ID="lbl_15" runat="server" Text="Your company has done a tabletop exercise to test your incident response management plan. Tabletop exercises as part of training helps prevent errors in the time of an actual incident." />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>

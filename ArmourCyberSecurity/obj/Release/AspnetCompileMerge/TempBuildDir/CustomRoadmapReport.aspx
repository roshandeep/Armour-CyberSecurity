<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomRoadmapReport.aspx.cs" Inherits="ArmourCyberSecurity.CustomRoadmapReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                            <h3 style="color: white;">Global Regulations</h3>
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
                            <h5><b>SECTION GOAL: </b></h5>
                            <p>
                                To establish which legislations are required, determined by both your company location and that of your customers.
                                <br />

                                Note: If you deal with medical data, then there are separate regulations that are specific to these kinds of records. They are typical labeled Health Insurance Portability and Accountability Act (HIPPA), or the like.

                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h5><b>REGULATIONS </b></h5>
                            <p>
                                Regulations vary by geographical region. Additionally, some apply to the location of the company and others to the location of the individual.
                                <br />
                                For example, GDPR applies:
                                ●	If the company is in the EU
                                ●	If the company does business with some subjects in the EU
                                ●	If the company is in a country that also follows GDPR (ex Brazil)
                                ●	If the data subject is 'in the union'. This is intentionally vague and could cover either residents by address or citizens so long as some action takes place in the EU.
 
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
                            <h5><b>Data Protection Authorities</b></h5>
                            <p>
                                In the event of a security incident or complaint, it is important to know which Authorities are responsible for your regulations. 
                                <br />
                                <asp:Label ID="lbl_DPA" runat="server" Text="" />

                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h5><b>ROLES</b></h5>
                            <p>
                                The naming convention within regulations differs but there are three main entities under each: the employee of a company responsible for privacy, the company, and the user.
                                <br />
                                <b>DPO – Data Protection Officer</b>
                                <br />
                                The most common name for the employee responsible for privacy of data is the Data Privacy Officer. This is the term used in GDPR. Other roles that may include this responsibility are CPO (Chief Privacy Officer) or CISO (Chief Information Security Officer). GDPR covers this role in Article 39, PIPEDA covers it within the principle of Accountability.

                                The responsibilities of the DPO include:
                                •	Monitoring for and ensuring legal regulation compliance
                                •	Overseeing and updating DPIAs (Data Protection Impact Assessments)
                                •	Acting as primary contact for external companies and regulatory bodies 
                                •	Ensuring internal policies and processes are in place, and providing training to staff 
                                <br />

                                <asp:Label ID="lbl_DPO" runat="server" Text="" />

                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h5><b>Controllers, Processors, Organizations</b></h5>
                            <p>
                                Determining your company can help in defining which regulation rules you need to observe. The company that controls the data is typically referred to as an organization.
                                <br />
                                <asp:Label ID="lbl_controller" runat="server" Text="" />
                                <br />
                                NOTE: A company can be both a Controller and a Processor.
                            </p>
                        </td>
                    </tr>
                     <tr>
                        <td style="text-align: justify; margin: 2px;" colspan="2">
                            <h5><b>Documentation and Links</b></h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify; margin: 2px;">
                            <h5><b>Your Data Privacy Officer </b></h5>
                            <p>
                                <asp:Label ID="lbl_Name" runat="server" Text="Name : " />
                                <asp:Label ID="lbl_Email" runat="server" Text="Email : " />
                                <asp:Label ID="lbl_Phone" runat="server" Text="Phone No : " />
                                <asp:Label ID="lbl_Title" runat="server" Text="Title : " />
                                <asp:Label ID="lbl_Contact" runat="server" Text="Other Contact Info : " />
                            </p>
                        </td>
                        <td style="text-align: justify; margin: 2px;">
                            <h5><b>Your Data Authority List</b></h5>
                            <p>
                                <asp:Label ID="lbl_linklist" runat="server" Text="" />
                            </p>
                        </td>
                    </tr>
                </table>
            </div>

            <%--            <%--Privacy Engineering--%>
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

            <%--Data Control--%>
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


            <%--Consent--%>
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

            <%--Incident Management--%>
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

            <%--Employee Training--%>
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
            --%>

        </div>
    </form>
</body>
</html>

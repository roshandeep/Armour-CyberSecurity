<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/main.Master" CodeBehind="CustomRoadmapLandingpage.aspx.cs" Inherits="ArmourCyberSecurity.CustomRoadmapLandingpage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Privacy Compliance Assessment</h1>
    </div>

    <div class="card shadow h-100">
        <div class="card-body">
            <div class="jumbotron">
            <h2>Welcome&nbsp;</h2>
                <h3>Compliance Roadmap Coming Soon!</h3>
                <p class="lead">
                    We are excited to bring our proprietary Compliance Assessment straight to your desktop.
                    Using our specialized tool, we guide you through an in-depth process examining all the steps required to not only meet compliance, but to do so efficiently and in a way that will save you money in the future. 
                    We look at:<br /><br />
                    <span>&#8226;</span>	Global Regulations that affect you and your customers<br />
                    <span>&#8226;</span>	Privacy Engineering including Privacy by Design, and Vendor Management<br />
                    <span>&#8226;</span>	Data Control including data subject access rights<br />
                    <span>&#8226;</span>	Consent and Policies<br />
                    <span>&#8226;</span>	Incident Response Management<br />
                    <span>&#8226;</span>	Education and Employee Awareness Training<br /><br />
                    You get to run the tool on your time and divided sections allow you to get the right stakeholders for input to each set of questions.
                    The result is a custom roadmap that will set you on the right path to optimized and complete compliance.

                    Sign up today and be a part of our first access VIP group.
                </p>
                <asp:Button ID="btn_questionnaire" runat="server" Text="Take Me To Questionnaire" CssClass="btn btn-primary btn-lg" OnClick="btn_questionnaire_Click" Enabled="false"></asp:Button>
            </div>
            <div class="row py-3">
                <div class="container">
                    <h3>HELP &amp; FAQ</h3>
                    <div class="accordion" id="accordionExample">
                        <div class="card">
                            <div class="card-header bg-dark" id="headingOne">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left text-light" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;How do I get started?
                                    </button>
                                </h2>
                            </div>

                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <div class="card-body">
                                    To begin your in-depth assessment, you will need to register an account.
                                    Tip: Carefully select an email and password that will be used to access your dashboard. Keep in mind that you may want to share the access code with others in your company. This email is also where PDF copies of the reports are sent.
                                    Part of your registration includes payment. This will give you instant and full access to the tool.
                                    You will be brought to the dashboard where you can select a section and begin to fill out the answers. You may do the sections in any order. You may also choose to partially fill out a section. Depending on the size of your company, you may need to bring in other stakeholders to answer the questions. Take your time. There is no limit on how long you take to fill it out.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header bg-dark" id="headingTwo">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left collapsed text-light" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;How do I generate my custom report?
                                    </button>
                                </h2>
                            </div>
                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                <div class="card-body">
                                    Reports are generated per section. You can choose to partially or completely fill out the section before you generate the report. You can also generate the report as many times as you want.
                                    When you are ready, select the 'generate report' button. A copy of the report will appear on your screen. A second PDF copy will be sent to your registration email.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header bg-dark" id="headingThree">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left collapsed text-light" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;Who can access the dashboard?
                                    </button>
                                </h2>
                            </div>
                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                <div class="card-body">
                                    The dashboard is access using the email and password you set in the registration. In some companies, a designated individual collects the report answers and fills out all of the assessment. In others, a single email and password is used by multiple stakeholders to fill out various sections. All changes can be saved and the reports can be run at any time.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header bg-dark" id="headingFour">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left collapsed text-light" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseThree">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;How many times can I access the report?
                                    </button>
                                </h2>
                            </div>
                            <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                                <div class="card-body">
                                    There is no limit on the number of times you can generate the report. You may also generate partially complete sections.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

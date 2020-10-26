<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/main.Master" CodeBehind="CustomRoadmapLandingpage.aspx.cs" Inherits="ArmourCyberSecurity.CustomRoadmapLandingpage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Privacy Compliance Assessment</h1>
    </div>

    <div class="card shadow h-100">
        <div class="card-body">
            <div class="jumbotron">
                <h1 class="display-4">Welcome&nbsp;</h1>
                <h3>Compliance Roadmap Coming Soon!</h3>
                <p class="lead">
                    We are excited to bring our proprietary Compliance Assessment straight to your desktop.
                    Using our specialized tool, we guide you through an in-depth process examining all the steps required to not only meet compliance, but to do so efficiently and in a way that will save you money in the future. 
                    We look at:
                    <span>&#8226;</span>Global Regulations that affect you and your customers
                    <span>&#8226;</span>Privacy Engineering including Privacy by Design, and Vendor Management
                    <span>&#8226;</span>Data Control including data subject access rights
                    <span>&#8226;</span>Consent and Policies
                    <span>&#8226;</span>Incident Response Management
                    <span>&#8226;</span>Education and Employee Awareness Training
                    You get to run the tool on your time and divided sections allow you to get the right stakeholders for input to each set of questions.
                    The result is a custom roadmap that will set you on the right path to optimized and complete compliance.

                    Sign up today and be a part of our first access VIP group.
                </p>
                <asp:Button ID="btn_questionnaire" runat="server" Text="Take Me To Questionnaire" CssClass="btn btn-primary btn-lg" OnClick="btn_questionnaire_Click"></asp:Button>
            </div>
            <div class="row py-3">
                <div class="container">
                    <h3>HELP &amp; FAQ</h3>
                    <div class="accordion" id="accordionExample">
                        <div class="card">
                            <div class="card-header bg-dark" id="headingOne">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left text-light" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;This is a accordion Title 1
                                    </button>
                                </h2>
                            </div>

                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <div class="card-body">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in nulla ut magna vehicula libero luctus in ipsum consequat faucibus. 
                                    Ut porta nulla ac dapibus convallis. Curabitur sit amet massa quam. In ut ex auctor, porta neque quis, 
                                    sagittis purus. Nunc auctor gravida magna, sed efficitur tortor tristique quis.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header bg-dark" id="headingTwo">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left collapsed text-light" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;This is a accordion Title 2
                                    </button>
                                </h2>
                            </div>
                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                <div class="card-body">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in nulla ut magna vehicula libero luctus in ipsum consequat faucibus. 
                                    Ut porta nulla ac dapibus convallis. Curabitur sit amet massa quam. In ut ex auctor, porta neque quis, 
                                    sagittis purus. Nunc auctor gravida magna, sed efficitur tortor tristique quis.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header bg-dark" id="headingThree">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left collapsed text-light" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;This is a accordion Title 3
                                    </button>
                                </h2>
                            </div>
                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                <div class="card-body">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in nulla ut magna vehicula libero luctus in ipsum consequat faucibus. 
                                    Ut porta nulla ac dapibus convallis. Curabitur sit amet massa quam. In ut ex auctor, porta neque quis, 
                                    sagittis purus. Nunc auctor gravida magna, sed efficitur tortor tristique quis.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

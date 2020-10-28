<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/main.Master" CodeBehind="CustomRoadmapLandingpage.aspx.cs" Inherits="ArmourCyberSecurity.CustomRoadmapLandingpage" %>

<asp:content id="Content2" contentplaceholderid="Body" runat="server">

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Privacy Compliance Assessment</h1>
</div>

<div class="card shadow h-100">
    <div class="card-body">
        <div class="jumbotron">
            <h2>Welcome&nbsp;</h2>
            <h3>Heading of the text</h3>
            <p class="lead">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in nulla ut magna vehicula libero luctus in ipsum consequat faucibus. Ut porta nulla ac dapibus convallis. 
                    Curabitur sit amet massa quam. In ut ex auctor, porta neque quis, sagittis purus. Nunc auctor gravida magna, sed efficitur tortor tristique quis.
            </p>
            <asp:button id="btn_questionnaire" runat="server" text="Take Me To Questionnaire" cssclass="btn btn-primary btn-lg" onclick="btn_questionnaire_Click"></asp:button>
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

</asp:content>

<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="CustomRoadmapDashboard.aspx.cs" Inherits="ArmourCyberSecurity.CustomRoadmapDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <asp:Label ID="lbl_userinit" runat="server" Text="" CssClass="nav-link link text-white display-4" ForeColor="#0795d6" />

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    </div>

    <div class="row">


        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-4 col-md-4 mb-4">
            <a href="section1">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-uppercase mb-1">Global Regulations</div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col pt-1">
                                        <div class="progress progress-striped active">
                                            <div id="progress_barSection1" class="progress-bar progress-bar-animated progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" runat="server" style="width: 70%">
                                                <span runat="server" id="sec1_score"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-4 col-md-4 mb-4">
            <a href="section2">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-uppercase mb-1">Privacy Engineering</div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col pt-1">
                                        <div class="progress progress-striped active">
                                            <div id="progress_barSection2" class="progress-bar progress-bar-animated progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" runat="server" style="width: 70%">
                                                <span runat="server" id="sec2_score"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-4 col-md-4 mb-4">
            <a href="section3">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-uppercase mb-1">Data Control</div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col pt-1">
                                        <div class="progress progress-striped active">
                                            <div id="progress_barSection3" class="progress-bar progress-bar-animated progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" runat="server" style="width: 70%">
                                                <span runat="server" id="sec3_score"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>

    </div>

    <div class="row">


        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-4 col-md-4 mb-4">
            <a href="section4">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-uppercase mb-1">Consent</div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col pt-1">
                                        <div class="progress progress-striped active">
                                            <div id="progress_barSection4" class="progress-bar progress-bar-animated progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" runat="server" style="width: 70%">
                                                <span runat="server" id="sec4_score"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-4 col-md-4 mb-4">
            <a href="section5">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-uppercase mb-1">Incident Management</div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col pt-1">
                                        <div class="progress progress-striped active">
                                            <div id="progress_barSection5" class="progress-bar progress-bar-animated progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" runat="server" style="width: 70%">
                                                <span runat="server" id="sec5_score"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-4 col-md-4 mb-4">
            <a href="section6">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-uppercase mb-1">Employee Training</div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col pt-1">
                                        <div class="progress progress-striped active">
                                            <div id="progress_barSection6" class="progress-bar progress-bar-animated progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" runat="server" style="width: 70%">
                                                <span runat="server" id="sec6_score"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>

    </div>

    <section class="jumbotron text-center">
        <div class="container">
            <p class="lead text-muted">No more information to show.</p>
        </div>
    </section>
</asp:Content>


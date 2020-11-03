<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Level1LandingPage.aspx.cs" Inherits="ArmourCyberSecurity.Level1.Level1LandingPage" EnableEventValidation="false" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Privacy Compliance Assessment</h1>
    </div>

    <div class="card shadow h-100">
        <div class="card-body">
            <div class="jumbotron">
                <h2>Welcome to Your Free Privacy Regulation Compliance Assessment.</h2>
                <p class="lead">
                    <%--<strong>Welcome to Your Free Privacy Regulation Compliance Assessment.</strong><br />--%>
                    In only 10 minutes you will have a personalized report on how your company ranks in terms of being compliant with global privacy regulations. Learn where you are prepared, and where you need to focus your resources to get to full compliance." 
                </p>
                <asp:Button ID="selfAssessment" runat="server" Text="Take Me To Questionnaire" CssClass="btn btn-primary btn-lg" OnClick="selfAssessment_Click"></asp:Button>
            </div>
        </div>
    </div>

</asp:Content>


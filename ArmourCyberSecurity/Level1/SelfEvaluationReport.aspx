<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="SelfEvaluationReport.aspx.cs" Inherits="ArmourCyberSecurity.Level1.SelfEvaluationReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .modalBackground {
            background-color: rgba(239, 243, 249, 1);
            filter: alpha(opacity=40);
            opacity: 0.95;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
        <cc1:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="mpe" runat="server"
            PopupControlID="pnlPopup" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground" CancelControlID="lnkDummyCancel">
        </cc1:ModalPopupExtender>

        <div class="container-fluid">
            <div class="col-md-6">
                <asp:Panel ID="pnlPopup" runat="server" CssClass="card" Style="display: none">
                    <h5 class="card-header">Register</h5>
                    <div class="card-body">
                        <div class="text-center">
                            <img src="../images/newLogo.png" style="width: 58px;">
                        </div>
                        <br />
                        <div class="form-group">
                            <asp:TextBox ID="txt_EmalId" runat="server" placeholder="Email Address *(Required)" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="regEmailId" runat="server" ControlToValidate="txt_EmalId" ErrorMessage="Please enter valid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">  </asp:RegularExpressionValidator>
                        </div>

                        <div class="form-group">
                            <asp:TextBox ID="txt_Firstname" runat="server" placeholder="First Name (Optional)" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                            <br />
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txt_Lastname" runat="server" placeholder="Last Name (Optional)" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                            <br />
                        </div>
                        <asp:LinkButton ID="lnkDummyCancel" runat="server"></asp:LinkButton>
                        <asp:Button ID="btnHide" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg btn-block" ClientIDMode="Static" Enabled="false" OnClick="btnHide_Click" /><br />
                    </div>

                </asp:Panel>
            </div>
        </div>



    </div>
    <div>

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Privacy Compliance Report</h1>
        </div>

        <div class="card shadow h-100">
            <div class="card-body">
                <section class="text-center">
                    <div class="container">
                        <h3>Self-Assessment - Report
                        </h3>
                        <p>
                            Your clients’ data is your greatest asset. If the data is breached you will lose money, 
                                time, and credibility. Breaches can be avoided with good cyber security practices 
                                and compliance with regulations. Companies are legally required to fulfill the 
                                privacy regulations determined by the geographical location of both the company and their 
                                customers/clients. Compliance is a large task, but when done properly the first time, it becomes 
                                simple to maintain. Doing due diligence helps mitigate risk to customers, protects a company’s reputation, 
                                and drastically reduces fines.
                        </p>
                    </div>
                </section>
            </div>
        </div>

        <div class="card shadow h-100 mt-2">
            <div class="card-body">
                <h5 class="card-header">Overall Score – Are you privacy regulation compliant?</h5>
                <br />
                <div class="container">
                    <div class="form-group row">
                        <asp:Label ID="lbl_overall" runat="server" Text="" />
                        <div class="col-md-3">
                            <div class="row text-center">
                                <asp:Image ID="img_overall" runat="server" ImageAlign="Middle" Style="width: 200px;" CssClass="mx-auto" />
                            </div>
                            <br />
                            <div class="row text-center">
                                <asp:Label ID="lbl_score" CssClass="lblscore" runat="server" Text="" />
                            </div>

                        </div>

                        <div class="col my-auto">
                            <asp:Label ID="bullet" runat="server" Text="" />
                            <asp:Label ID="comment" runat="server" Text="" />
                        </div>
                    </div>
                </div>
                <br />
                <%--Privacy Culture Questions--%>
                <h5 class="card-header">Privacy Culture Questions</h5>
                <br />
                <div class="container">
                    <div class="row">
                        <asp:Label ID="lbl_pcq_info" runat="server" Text="As a company you are entrusted with protecting data for both your customers and your employees. Putting in place a proper privacy program ensures that you mitigate risk to customers, protect your company’s reputation, and drastically reduces fines. " />
                    </div>

                    <br />
                    <div class="form-group row">
                        <div class="col-md-3">
                            <div class="row text-center">
                                <asp:Image ID="img_pcq" runat="server" ImageAlign="Middle" Style="width: 200px;" CssClass="mx-auto" />
                            </div>
                            <br />
                            <div class="row text-center">
                                <asp:Label ID="lbl_pcq_score" CssClass="lblscore" runat="server" Text="" />
                            </div>

                        </div>

                        <div class="col my-auto">
                            <asp:Label ID="bullet1" runat="server" Text="" />
                            <asp:Label ID="comment1" runat="server" Text="" />
                        </div>
                    </div>
                </div>
                <br />
                <%-- Regional Specific Questions --%>
                <h5 class="card-header">Regional Specific Questions</h5>
                <br />
                <div class="container">
                    <div class="row">
                        <asp:Label ID="lbl_rsq_info" runat="server" Text="Both your location and that of your customers determine the legally required legislations for your company. " />
                    </div>

                    <br />
                    <div class="form-group row">
                        <div class="col-md-3">
                            <div class="row text-center">
                                <asp:Image ID="img_rsq" runat="server" ImageAlign="Middle" Style="width: 200px;" CssClass="mx-auto" />
                            </div>
                            <br />
                            <div class="row text-center">
                                <asp:Label ID="lbl_rsq_score" CssClass="lblscore" runat="server" Text="" />
                            </div>

                        </div>

                        <div class="col my-auto">
                            <asp:Label ID="bullet2" runat="server" Text="" />
                            <asp:Label ID="comment2" runat="server" Text="" />
                        </div>
                    </div>
                </div>

                <br />
                <%--Privacy Engineering--%>
                <h5 class="card-header">Privacy Engineering</h5>
                <br />
                <div class="container">
                    <div class="row">
                        <asp:Label ID="lbl_peq_info" runat="server" Text="Putting Privacy at the foundation of all of your services and products is the key to building a strong base that is regulation compliant and protects your customers/clients. 
                                A proper privacy engineering implementation includes the use of Privacy by Design principles, running of a DPIA (Data Privacy Impact Assessment), 
                                categorization of your PII (Personally identifiable information), and proper vendor management. " />
                    </div>

                    <br />
                    <div class="form-group row">
                        <div class="col-md-3">
                            <div class="row text-center">
                                <asp:Image ID="img_peq" runat="server" ImageAlign="Middle" Style="width: 200px;" CssClass="mx-auto" />
                            </div>
                            <br />
                            <div class="row text-center">
                                <asp:Label ID="lbl_peq_score" CssClass="lblscore" runat="server" Text="" />
                            </div>

                        </div>

                        <div class="col my-auto">
                            <asp:Label ID="bullet4" runat="server" Text="" />
                            <asp:Label ID="comment4" runat="server" Text="" />
                        </div>
                    </div>
                </div>

                <br />
                <%--Data Control--%>
                <h5 class="card-header">Data Control</h5>
                <br />
                <div class="container">
                    <div class="row">
                        <asp:Label ID="lbl_dcq_info" runat="server" Text="Users have the right to access their data. Depending on the legislation, they may have the rights to check for 
                                accuracy, request correction, or simply review what is held. " />
                    </div>

                    <br />
                    <div class="form-group row">
                        <div class="col-md-3">
                            <div class="row text-center">
                                <asp:Image ID="img_dcq" runat="server" ImageAlign="Middle" Style="width: 200px;" CssClass="mx-auto" />
                            </div>
                            <br />
                            <div class="row text-center">
                                <asp:Label ID="lbl_dcq_score" CssClass="lblscore" runat="server" Text="" />
                            </div>

                        </div>

                        <div class="col my-auto">
                            <asp:Label ID="bullet5" runat="server" Text="" />
                            <asp:Label ID="comment5" runat="server" Text="" />
                        </div>
                    </div>
                </div>

                <br />

                <%--Consent--%>
                <h5 class="card-header">Consent</h5>
                <br />
                <div class="container">
                    <div class="row">
                        <asp:Label ID="lbl_cq_info" runat="server" Text="In accordance to the legislations, the privacy policy must explain to users what their 
                                rights are and how to execute on those rights. It is also important to establish a legal basis for which data is being collected. 
                                Users must have the ability to Opt in and out of having their data collected, stored, and transferred. " />
                    </div>

                    <br />
                    <div class="form-group row">
                        <div class="col-md-3">
                            <div class="row text-center">
                                <asp:Image ID="img_cq" runat="server" ImageAlign="Middle" Style="width: 200px;" CssClass="mx-auto" />
                            </div>
                            <br />
                            <div class="row text-center">
                                <asp:Label ID="lbl_cq_score" CssClass="lblscore" runat="server" Text="" />
                            </div>

                        </div>

                        <div class="col my-auto">
                            <asp:Label ID="bullet6" runat="server" Text="" />
                            <asp:Label ID="comment6" runat="server" Text="" />
                        </div>
                    </div>
                </div>

                <br />

                <%-- Incident Response Questions--%>
                <h5 class="card-header">Incident Response Questions</h5>
                <br />
                <div class="container">
                    <div class="row">
                        <asp:Label ID="lbl_irq_info" runat="server" Text="Lack of an incident response plan can cost a company upwards of $500k USD.  
                                All privacy breaches and incidents must be assessed for risk of harm. Depending on the legislation, 
                                breaches will need to be documented, authorities contacted, and users informed. " />
                    </div>

                    <br />
                    <div class="form-group row">
                        <div class="col-md-3">
                            <div class="row text-center">
                                <asp:Image ID="img_irq" runat="server" ImageAlign="Middle" Style="width: 200px;" CssClass="mx-auto" />
                            </div>
                            <br />
                            <div class="row text-center">
                                <asp:Label ID="lbl_irq_score" CssClass="lblscore" runat="server" Text="" />
                            </div>

                        </div>
                        <div class="col my-auto">
                            <asp:Label ID="bullet7" runat="server" Text="" />
                            <asp:Label ID="comment7" runat="server" Text="" />
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <br />
        <div class="row text-center d-flex justify-content-center">
            <asp:Button ID="btn_return" runat="server" Text="TRY the Custom Roadmap !" OnClick="btn_return_Click" CssClass="btn btn-primary" />
        </div>

    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script>
        $(function () {
            $('#<%=txt_EmalId.ClientID%>').change(function () {

                var submit = document.getElementById('#<%=btnHide.ClientID%>');
                var btnSubmit = $('#<%=btnHide.ClientID%>');
                btnSubmit.attr("disabled", false);
            });
        });
    </script>
</asp:Content>

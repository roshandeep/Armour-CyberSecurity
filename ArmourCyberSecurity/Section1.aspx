﻿<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Section1.aspx.cs" Inherits="ArmourCyberSecurity.Section1" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Global Regulations</h1>
        <div class="flex-column">
            <asp:LinkButton ID="btn_rtn_dashbrd" runat="server" CssClass="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" OnClick="btn_rtn_dashbrd_Click" data-toggle="modal" data-target="#modalExit" Enabled="True" ClientIDMode="Static">
<i class="fas fa-fw fa-tachometer-alt text-white-50"></i> Dashboard</asp:LinkButton>
            <asp:Label ID="lbl_warning" runat="server" Text="" ForeColor="Red" />
            <asp:LinkButton ID="btn_Report" runat="server" CssClass="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" OnClick="btn_Report_Click" Enabled="True" ClientIDMode="Static">
<i class="fas fa-download fa-sm text-white-50"></i> Generate Report</asp:LinkButton>
        </div>


    </div>


     <div id="modalExit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            Would you like to Save or Discard Your changes?&nbsp;
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnDiscard" CssClass="btn btn-secondary" runat="server" Text="Discard" OnClick="btnDiscard_Click" />
                    <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="card shadow h-100">

        <div class="card-body">
            <div class="container">
                <p class="text-center">
                    <strong>The following questions deal with the region in which you do buisness,
                    which includes both where your office resides and where your customers reside.</strong>
                </p>
                <p>
                    For the purpose of this report, we will be focusing on GDPR (Europe), PIPEDA (Canada), CCPA (California), and LGPD (Brazil. 
                    This said, between the global reach of many companies and the fact that more countries and regional oversight are coming to law, 
                    following the best practice suggestions laid out in this assessment will benefit you regardless of region.
                </p>

                <h5><strong>Section Goal:</strong></h5>
                <p>
                    To establish which legislations are required, determined by both 
                    your company location and that of your customers. Qualify your company against those legislations to determine your company’s ‘role’ 
                    with respect to the data (GDPR Ex. Processor or Controller).

                            Note: If you deal with medical data, then there are separate regulations that are specific to these kinds of records. 
                    They are typical labeled Health Insurance Portability and Accountability Act, or the like.
                </p>
                <h5><strong>Stakeholders Required:</strong></h5>
                <p>
                    To fill out this section you will need a knowledge of the locations of the company and the people who use your product/service.
                </p>
                <br />
                <div class="row text-center justify-content-center">
                    <h2>Regional specific questions</h2>
                </div>
                <br />
                <div class="row">
                    <asp:Label ID="lblQues1" runat="server" Text="" />
                </div>
                <br />
                <div class="row">
                    <asp:CheckBoxList ID="chkbxAns1" runat="server" ClientIDMode="Static" ClientValidationFunction="ValidateDemoList" RepeatDirection="Horizontal">
                    </asp:CheckBoxList>
                    <asp:CustomValidator runat="server" ID="cvDemoList" ErrorMessage="* Required" ForeColor="Red"></asp:CustomValidator>
                    <br />
                </div>
                <div class="row">
                    <asp:Label ID="lblQues2" runat="server" Text="" />
                </div>
                <br />
                <div class="row">
                    <asp:CheckBoxList ID="chkbxAns2" runat="server" ClientIDMode="Static" ClientValidationFunction="ValidateDemoList2" RepeatDirection="Horizontal">
                    </asp:CheckBoxList>
                    <asp:CustomValidator runat="server" ID="cvDemoList2" ErrorMessage="* Required" ForeColor="Red"></asp:CustomValidator>
                    <br />
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="flex-column">
        <asp:Button ID="btn_Save1" runat="server" Text="Save" OnClick="btn_Save1_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
        <asp:Button ID="btn_Next" runat="server" Text="Next" OnClick="btn_Next_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script>

        $('#chkbxAns1').addClass('table-responsive-sm');
        $('#chkbxAns2').addClass('table-responsive-sm');

        function ValidateDemoList(source, args) {
            var chkListModules = document.getElementById('<%= chkbxAns1.ClientID %>');
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }
            args.IsValid = false;
        }

        function ValidateDemoList2(source, args) {
            var chkListModules = document.getElementById('<%= chkbxAns2.ClientID %>');
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }
            args.IsValid = false;
        }

    </script>
</asp:Content>

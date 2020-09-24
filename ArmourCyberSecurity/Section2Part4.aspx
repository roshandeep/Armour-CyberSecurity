<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Section2Part4.aspx.cs" Inherits="ArmourCyberSecurity.Section2Part4" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Privacy Engineering</h1>
            <div class="flex-column">
                <asp:LinkButton ID="btn_rtn_dashbrd" runat="server" CssClass="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" OnClick="btn_rtn_dashbrd_Click" data-toggle="modal" data-target="#modalExit" Enabled="True" ClientIDMode="Static">
<i class="fas fa-fw fa-tachometer-alt text-white-50"></i> Dashboard</asp:LinkButton>
                <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red" />
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
                <h5 class="card-header">Privacy Impact Assessment</h5>
                <br />
                <div class="container">
                    <p>
                        All legislations require that companies show due diligence in their protection of personal data. 
                    This can be done via an evaluation called a Data Protection Impact Assessment (DPIA) or Privacy Impact Assessment (PIA), which lists, reviews, 
                    and records all the ways data is handled, used, stored, and protected.<br />
                        The DPIA includes a system map, data map, and information from the data use info sheet, which are included in the sections above. The DPIA also 
                    covers security and privacy measures taken to protect the data while being accessed, stored, and transferred.
                    </p>

                    <div class="form-group row">
                        <asp:Label ID="lblQues23" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns23" onChange="EnableTextArea23()" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns23" ControlToValidate="ddlAns23" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                            <br />
                            <asp:Label ID="lbl_Links_23" runat="server" Text="Free Form Links : " Font-Bold="true" /><br />
                            <asp:TextBox ID="txt_Links_23" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control" runat="server" />
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lblQues24" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                        <asp:DropDownList runat="server" ID="ddlAns24" CssClass="form-control">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator runat="server" ID="reqAns24" ControlToValidate="ddlAns24" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br />
        <div class="flex-column">
            <asp:Button ID="btn_Save2" runat="server" Text="Save" OnClick="btn_Save2_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
            <asp:Button ID="btn_Previous" runat="server" Text="Previous" OnClick="btn_Previous_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
        </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">

    <script>

        function EnableTextArea23() {
            var ddlAns23 = document.getElementById('<%= ddlAns23.ClientID %>');
            var links23 = document.getElementById('<%= txt_Links_23.ClientID %>');

            if (ddlAns23.options[ddlAns23.selectedIndex].innerHTML == 'YES') {
                links23.disabled = false;
            }
            else {
                links23.disabled = true;
            }

        }

    </script>
</asp:Content>

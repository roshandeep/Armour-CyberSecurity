<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Section4Part2.aspx.cs" Inherits="ArmourCyberSecurity.Section4Part2" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Consent</h1>
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
                <h5 class="card-header">Opt Ins/Outs</h5>
                <br />
                <div class="container">
                    <p>
                        Users must have the ability to Opt in and out of having their data collected, stored, and transferred.
                    That consent must be stored and updated if data use is changed.
                    </p>

                    <div class="form-group row">
                        <asp:Label ID="lblQues13" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns13" onChange="EnableTextArea13()" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns13" ControlToValidate="ddlAns13" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                            <br />
                            <asp:Label ID="lbl_Links_13" runat="server" Text="Free Form Links : " Font-Bold="true" />
                            <br />
                            <asp:TextBox ID="txt_Links_13" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control" runat="server" />
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lblQues14" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns14" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns14" ControlToValidate="ddlAns14" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lblQues15" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns15" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns15" ControlToValidate="ddlAns15" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lblQues16" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns16" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns16" ControlToValidate="ddlAns16" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lblQues17" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns17" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns17" ControlToValidate="ddlAns17" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lblQues18" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns18" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns18" ControlToValidate="ddlAns18" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lblQues19" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns19" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns19" ControlToValidate="ddlAns19" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lblQues20" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                        <asp:DropDownList runat="server" ID="ddlAns20" CssClass="form-control">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator runat="server" ID="reqAns20" ControlToValidate="ddlAns20" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br />
        <div class="flex-column">
            <asp:Button ID="btn_Save4" runat="server" Text="Save" OnClick="btn_Save4_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
            <asp:Button ID="btn_Previous" runat="server" Text="Previous" OnClick="btn_Previous_Click" CssClass="btn btn-primary" ClientIDMode="Static" />

        </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">
    <script>

        function EnableTextArea13() {
            var ddlAns13 = document.getElementById('<%= ddlAns13.ClientID %>');
            var links13 = document.getElementById('<%= txt_Links_13.ClientID %>');

            if (ddlAns13.options[ddlAns13.selectedIndex].innerHTML == 'YES') {
                links13.disabled = false;
            }
            else {
                links13.disabled = true;
            }

        }
    </script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Section5.aspx.cs" Inherits="ArmourCyberSecurity.Section5" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Incident Management</h1>
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
            <div class="container">
                <p class="text-center">
                    <strong>The following questions deal with how your company responds to and addresses a privacy incident. </strong>
                </p>

                <h5><strong>Section Goal:</strong></h5>
                <p>
                    To ensure that your company has an adequate incident response management plan in place before you experience an incident.

                </p>
                <h5><strong>Stakeholders Required:</strong></h5>
                <p>
                    To fill out this section you will need a knowledge of the following:
                </p>
                <ul>
                    <li>The stakeholders needed to address an incident</li>
                    <li>The names of third parties, including legal and forensics, that may be brought in to resolve an issue.</li>
                    <li>The existing 'severity one' or incident plans the company has.</li>
                </ul>

            </div>

            <h5 class="card-header">Incident Response Plan</h5>
            <br />
            <div class="container">
                <p>
                    All privacy breaches and incidents must be assessed for risk of harm. Depending on the legislation, 
                    breaches will need to be documented, authorities contacted, and users informed. 
                    If a third party company is acting as a processor of a user’s data, the controlling company is accountable for ensuring safety of the user’s data. 
                    The same process should be followed
                </p>


                <div class="form-group row">
                    <asp:Label ID="lblQues1" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlAns1" onChange="EnableTextArea1()" CssClass="form-control">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator runat="server" ID="reqAns1" ControlToValidate="ddlAns1" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                        <br />
                        <asp:Label ID="lbl_Links_1" runat="server" Text="Free Form Links : " Font-Bold="true" /><br />
                        <asp:TextBox ID="txt_Links_1" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblQues2" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlAns2" CssClass="form-control">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator runat="server" ID="reqAns2" ControlToValidate="ddlAns2" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblQues3" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlAns3" onChange="EnableTextArea3()" CssClass="form-control">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator runat="server" ID="reqAns3" ControlToValidate="ddlAns3" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                        <br />
                        <asp:Label ID="lbl_Links_3" runat="server" Text="Free Form Links : " Font-Bold="true" /><br />
                        <asp:TextBox ID="txt_Links_3" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblQues4" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlAns4" CssClass="form-control">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator runat="server" ID="reqAns4" ControlToValidate="ddlAns4" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblQues5" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlAns5" CssClass="form-control">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator runat="server" ID="reqAns5" ControlToValidate="ddlAns5" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblQues6" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlAns6" CssClass="form-control">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator runat="server" ID="reqAns6" ControlToValidate="ddlAns6" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblQues7" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlAns7" CssClass="form-control">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator runat="server" ID="reqAns7" ControlToValidate="ddlAns7" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblQues8" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlAns8" CssClass="form-control">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator runat="server" ID="reqAns8" ControlToValidate="ddlAns8" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblQues9" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlAns9" CssClass="form-control">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator runat="server" ID="reqAns9" ControlToValidate="ddlAns9" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblQues10" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlAns10" CssClass="form-control">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator runat="server" ID="reqAns10" ControlToValidate="ddlAns10" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblQues11" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlAns11" CssClass="form-control">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator runat="server" ID="reqAns11" ControlToValidate="ddlAns11" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblQues12" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlAns12" CssClass="form-control">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator runat="server" ID="reqAns12" ControlToValidate="ddlAns12" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblQues13" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlAns13" CssClass="form-control">
                            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator runat="server" ID="reqAns13" ControlToValidate="ddlAns13" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
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
                        <div class="col-sm-6">
                            <asp:DropDownList runat="server" ID="ddlAns18" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns18" ControlToValidate="ddlAns18" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblQues19" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                    <div class="col">
                        <div class="col-sm-6">
                            <asp:DropDownList runat="server" ID="ddlAns19" onChange="EnableTextArea19()" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns19" ControlToValidate="ddlAns19" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                            <br />
                            <asp:Label ID="lbl_Links_19" runat="server" Text="Free Form Links : " Font-Bold="true" /><br />
                            <asp:TextBox ID="txt_Links_19" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblQues20" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                    <div class="col">
                        <div class="col-sm-6">
                            <asp:DropDownList runat="server" ID="ddlAns20" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns20" ControlToValidate="ddlAns20" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
    <br />

    <div class="flex-column">
        <asp:Button ID="btn_Save5" runat="server" Text="Save" OnClick="btn_Save5_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
        <asp:Button ID="btn_Next" runat="server" Text="Next" OnClick="btn_Next_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">
    <script>

        function EnableTextArea1() {
            var ddlAns1 = document.getElementById('<%= ddlAns1.ClientID %>');
            var links1 = document.getElementById('<%= txt_Links_1.ClientID %>');

            if (ddlAns1.options[ddlAns1.selectedIndex].innerHTML == 'YES') {
                links1.disabled = false;
            }
            else {
                links1.disabled = true;
            }

        }
        function EnableTextArea3() {

            var ddlAns3 = document.getElementById('<%= ddlAns3.ClientID %>');
            var links3 = document.getElementById('<%= txt_Links_3.ClientID %>');

            if (ddlAns3.options[ddlAns3.selectedIndex].innerHTML == 'YES') {
                links3.disabled = false;
            }
            else {
                links3.disabled = true;
            }
        }

        function EnableTextArea19() {
            var ddlAns19 = document.getElementById('<%= ddlAns19.ClientID %>');
            var links19 = document.getElementById('<%= txt_Links_19.ClientID %>');

            if (ddlAns19.options[ddlAns19.selectedIndex].innerHTML == 'YES') {
                links19.disabled = false;
            }
            else {
                links19.disabled = true;
            }

        }

        function EnableTextArea() {
            var ddlAns1 = document.getElementById('<%= ddlAns1.ClientID %>');
            var links1 = document.getElementById('<%= txt_Links_1.ClientID %>');

            var ddlAns3 = document.getElementById('<%= ddlAns3.ClientID %>');
            var links3 = document.getElementById('<%= txt_Links_3.ClientID %>');

            var ddlAns19 = document.getElementById('<%= ddlAns19.ClientID %>');
            var links19 = document.getElementById('<%= txt_Links_19.ClientID %>');


            if (ddlAns1.options[ddlAns1.selectedIndex].innerHTML == 'YES') {
                links1.disabled = false;
            }
            else {
                links1.disabled = true;
            }

            if (ddlAns3.options[ddlAns3.selectedIndex].innerHTML == 'YES') {
                links3.disabled = false;
            }
            else {
                links3.disabled = true;
            }

            if (ddlAns19.options[ddlAns19.selectedIndex].innerHTML == 'YES') {
                links19.disabled = false;
            }
            else {
                links19.disabled = true;
            }

        }


    </script>
</asp:Content>

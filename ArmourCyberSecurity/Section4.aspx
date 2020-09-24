<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Section4.aspx.cs" Inherits="ArmourCyberSecurity.Section4" EnableEventValidation="false" %>

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
                <div class="container">
                    <p class="text-center">
                        <strong>The following questions deal with how privacy information is displayed to your customer or client, as well as how their explicit consent gathered and tracked.</strong>
                    </p>

                    <h5><strong>Section Goal:</strong></h5>
                    <p>
                        To ensure that consent is properly collected from infomred individuals that are aware of how their data is collected and used. 

                    </p>
                    <h5><strong>Stakeholders Required:</strong></h5>
                    <p>
                        To fill out this section you will need a knowledge of the following:
                    </p>
                    <ul>
                        <li>The type of data that is collected.</li>
                        <li>The method(s) by which that data is collected (directly and indirectly).</li>
                        <li>The list of third party or vendor companies that process the data. </li>
                        <li>The locations where the data is stored.</li>
                        <li>The contact information for the company.</li>
                    </ul>

                </div>

                <h5 class="card-header">Privacy Policy</h5>
                <br />
                <div class="container">
                    <p>
                        In accordance to the legislations, 
                    the privacy policy must explain to users what their rights are and how to execute on those rights. 
                    It is also important to establish a legal basis for which data is being collected. This policy should be clear and easy to find.
                    </p>

                    <div class="form-group row">
                        <asp:Label ID="lblQues1" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns1" onChange="EnableTextArea1()" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns1" ControlToValidate="ddlAns1" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                            <br />
                            <asp:Label ID="lbl_Links_1" runat="server" Text="Free Form Links : " Font-Bold="true" />
                            <br />
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
                            <asp:DropDownList runat="server" ID="ddlAns3" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns3" ControlToValidate="ddlAns3" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
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

                </div>


            </div>
        </div>
        <br />
        <div class="flex-column">
            <asp:Button ID="btn_Save4" runat="server" Text="Save" OnClick="btn_Save4_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
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
    </script>
</asp:Content>

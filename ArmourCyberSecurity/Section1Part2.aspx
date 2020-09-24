<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Section1Part2.aspx.cs" Inherits="ArmourCyberSecurity.Section1Part2" EnableEventValidation="false" %>

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
                <h5 class="card-header">Regional specific questions</h5>
                <br />
                <div class="container">
                    <div id="Ques3Div" runat="server" class="form-group row">
                        <asp:Label ID="lblQues3" runat="server" Text="" CssClass="col-md-7 col-form-label" Visible="false" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns3" Visible="false" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns3" ControlToValidate="ddlAns3" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Enabled="false" />--%>
                        </div>
                    </div>

                    <div id="Ques4Div" runat="server" class="form-group row">
                        <asp:Label ID="lblQues4" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns4" Visible="false" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns4" ControlToValidate="ddlAns4" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Enabled="false" />--%>
                        </div>
                    </div>

                    <div id="Ques5Div" runat="server" class="form-group row">
                        <asp:Label ID="lblQues5" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns5" Visible="false" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns5" ControlToValidate="ddlAns5" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Enabled="false" />--%>
                        </div>
                    </div>

                    <div id="Ques6Div" runat="server" class="form-group row">
                        <asp:Label ID="lblQues6" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns6" Visible="false" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns6" ControlToValidate="ddlAns6" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Enabled="false" />--%>
                        </div>
                    </div>

                </div>
                <br />
                <h5 class="card-header">Regional Fines</h5>
                <br />
                <div class="container">
                    <div id="Ques7Div" runat="server" class="form-group row">
                        <asp:Label ID="lblQues7" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns7" Visible="false" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns7" ControlToValidate="ddlAns7" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Enabled="false" />--%>
                        </div>
                    </div>

                    <div id="Ques8Div" runat="server" class="form-group row">
                        <asp:Label ID="lblQues8" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns8" Visible="false" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns8" ControlToValidate="ddlAns8" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Enabled="false" />--%>
                        </div>
                    </div>

                    <div id="Ques9Div" runat="server" class="form-group row">
                        <asp:Label ID="lblQues9" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns9" Visible="false" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns9" ControlToValidate="ddlAns9" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Enabled="false" />--%>
                        </div>
                    </div>

                    <div id="Ques10Div" runat="server" class="form-group row">
                        <asp:Label ID="lblQues10" runat="server" Text="" Visible="false" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns10" Visible="false" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns10" ControlToValidate="ddlAns10" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Enabled="false" />--%>
                        </div>
                    </div>



                </div>
            </div>
        </div>
        <br />
        <div class="flex-column">
            <asp:Button ID="btn_Save1" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btn_Save1_Click" ClientIDMode="Static" />
            <asp:Button ID="btn_Previous" runat="server" Text="Previous" CssClass="btn btn-primary" OnClick="btn_Previous_Click" ClientIDMode="Static" />
            <asp:Button ID="btn_Next" runat="server" Text="Next" CssClass="btn btn-primary" OnClick="btn_Next_Click" ClientIDMode="Static" />
        </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Section2Part2.aspx.cs" Inherits="ArmourCyberSecurity.Section2Part2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">

    <form runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Privacy Engineering</h1>
            <div class="flex-column">
                <asp:LinkButton ID="btn_rtn_dashbrd" runat="server" CssClass="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" OnClick="btn_rtn_dashbrd_Click" Enabled="True" ClientIDMode="Static">
<i class="fas fa-fw fa-tachometer-alt text-white-50"></i> Dashboard</asp:LinkButton>
                <asp:Label ID="lbl_warning" runat="server" Text="" ForeColor="Red" />
                <asp:LinkButton ID="btn_Report" runat="server" CssClass="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" OnClick="btn_Report_Click" Enabled="True" ClientIDMode="Static">
<i class="fas fa-download fa-sm text-white-50"></i> Generate Report</asp:LinkButton>
            </div>

            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="btn_rtn_dashbrd" CancelControlID="imgbtnbackground" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>
        </div>

        <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">
            <div style="text-align: right;">
                <asp:ImageButton ID="imgbtnbackground" runat="server" ImageUrl="~/images/RedCross.png" Style="display: inline-block; width: 30px; height: 30px;" />
            </div>
            <div style="height: 60px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        Would you like to Save or Discard Your changes?&nbsp;
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            <asp:Button ID="btnDiscard" runat="server" Text="Discard" OnClick="btnDiscard_Click" />
        </asp:Panel>

        <div class="card shadow h-100">

            <div class="card-body">
                <h5 class="card-header">Data Categorization</h5>
                <br />
                <div class="container">
                    <p>
                        To assess your data, you will need to create a data map by listing your current data and reviewing it against 
                    necessity for your products/services. [Note: the Data Use Info Sheet is part of the Privacy Impact Assessment below]. 
                    Your data must be distinguished in terms of Personal Information (PI), Personally Identifiable Information (PII), as well as sensitivity of the data.
                    </p>
                    <br />
                    <div class="form-group row">
                        <asp:Label ID="lblQues8" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns8" onChange="EnableTextArea8()" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns8" ControlToValidate="ddlAns8" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                            <br />
                            <asp:Label ID="lbl_Links_8" runat="server" Text="Free Form Links : " Font-Bold="true" /><br />
                            <asp:TextBox ID="txt_Links_8" TextMode="multiline" Columns="50" CssClass="form-control" Rows="5" runat="server" />
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lblQues9" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns9" onChange="EnableTextArea9()" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns9" ControlToValidate="ddlAns9" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                            <br />
                            <asp:Label ID="lbl_Links_9" runat="server" Text="Free Form Links : " Font-Bold="true" /><br />
                            <asp:TextBox ID="txt_Links_9" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control" runat="server" />
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
                            <asp:DropDownList runat="server" ID="ddlAns14">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns14" ControlToValidate="ddlAns14" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lblQues15" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns15" onChange="EnableTextArea15()" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns15" ControlToValidate="ddlAns15" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                            <br />
                            <asp:Label ID="lbl_Links_15" runat="server" Text="Free Form Links : " Font-Bold="true" /><br />
                            <asp:TextBox ID="txt_Links_15" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control" runat="server" />
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lblQues16" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns16" onChange="EnableTextArea16()" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns16" ControlToValidate="ddlAns16" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                            <br />
                            <asp:Label ID="lbl_Links_16" runat="server" Text="Free Form Links : " Font-Bold="true" /><br />
                            <asp:TextBox ID="txt_Links_16" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control" runat="server" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br />
        <div class="flex-column">
            <asp:Button ID="btn_Save2" runat="server" Text="Save" OnClick="btn_Save2_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
            <asp:Button ID="btn_Previous" runat="server" Text="Previous" OnClick="btn_Previous_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
            <asp:Button ID="btn_Next" runat="server" Text="Next" OnClick="btn_Next_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
        </div>

    </form>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">
    <script>
        function EnableTextArea9() {
            var ddlAns9 = document.getElementById('<%= ddlAns9.ClientID %>');
            var links9 = document.getElementById('<%= txt_Links_9.ClientID %>');

            if (ddlAns9.options[ddlAns9.selectedIndex].innerHTML == 'YES') {
                links9.disabled = false;
            }
            else {
                links9.disabled = true;
            }

        }
        function EnableTextArea15() {
            var ddlAns15 = document.getElementById('<%= ddlAns15.ClientID %>');
            var links15 = document.getElementById('<%= txt_Links_15.ClientID %>');

            if (ddlAns15.options[ddlAns15.selectedIndex].innerHTML == 'YES') {
                links15.disabled = false;
            }
            else {
                links15.disabled = true;
            }
        }
        function EnableTextArea8() {
            var ddlAns8 = document.getElementById('<%= ddlAns8.ClientID %>');
            var links8 = document.getElementById('<%= txt_Links_8.ClientID %>');

            if (ddlAns8.options[ddlAns8.selectedIndex].innerHTML == 'YES') {
                links8.disabled = false;
            }
            else {
                links8.disabled = true;
            }
        }

        function EnableTextArea16() {
            var ddlAns16 = document.getElementById('<%= ddlAns16.ClientID %>');
            var links16 = document.getElementById('<%= txt_Links_16.ClientID %>');

            if (ddlAns16.options[ddlAns16.selectedIndex].innerHTML == 'YES') {
                links16.disabled = false;
            }
            else {
                links16.disabled = true;
            }
        }

    </script>
</asp:Content>

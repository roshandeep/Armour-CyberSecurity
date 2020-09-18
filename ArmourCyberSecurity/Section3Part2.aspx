<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Section3Part2.aspx.cs" Inherits="ArmourCyberSecurity.Section3Part2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">


    <form runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Data Control</h1>
            <div class="flex-column">
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" OnClick="btn_rtn_dashbrd_Click" Enabled="True" ClientIDMode="Static">
<i class="fas fa-fw fa-tachometer-alt text-white-50"></i> Dashboard</asp:LinkButton>
                <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red" />
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" OnClick="btn_Report_Click" Enabled="True" ClientIDMode="Static">
<i class="fas fa-download fa-sm text-white-50"></i> Generate Report</asp:LinkButton>
            </div>
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
                <h5 class="card-header">Data Retention and Removal</h5>
                <br />
                <div class="container">
                    <p>
                        Depending on the legislation, users may have the rights to ‘be forgotten’ or be 
                        removed from the system on request. As a privacy design principle, data should also be removed when it is no longer required for business purposes.
                    </p>

                    <div class="form-group row">
                        <asp:Label ID="lblQues8" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns8" onChange="EnableTextArea8()" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns8" ControlToValidate="ddlAns8" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                            <br />
                            <asp:Label ID="lbl_Links_8" runat="server" Text="Free Form Links : " Font-Bold="true" />
                            <br />
                            <asp:TextBox ID="txt_Links_8" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control" runat="server" />
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
                            <asp:DropDownList runat="server" ID="ddlAns15" onChange="EnableTextArea15()" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns15" ControlToValidate="ddlAns15" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                            <br />
                            <asp:Label ID="lbl_Links_15" runat="server" Text="Free Form Links : " Font-Bold="true" />
                            <br />
                            <asp:TextBox ID="txt_Links_15" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control" runat="server" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br />
        <div class="flex-column">
            <asp:Button ID="btn_Save3" runat="server" Text="Save" OnClick="btn_Save3_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
            <asp:Button ID="btn_Previous" runat="server" Text="Previous" OnClick="btn_Previous_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
        </div>
    </form>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">
    <script>

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

        function EnableTextArea15() {
            var ddlAns7 = '<%= this.ques7Flag %>';
            var ddlAns15 = document.getElementById('<%= ddlAns15.ClientID %>');
            var links15 = document.getElementById('<%= txt_Links_15.ClientID %>');
            //alert(ddlAns7);
            if (ddlAns15.options[ddlAns15.selectedIndex].innerHTML == 'YES' && ddlAns7 == 'True') {
                links15.disabled = false;
            }
            else {

                links15.disabled = true;
            }
        }
    </script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Section1Part3.aspx.cs" Inherits="ArmourCyberSecurity.Section1Part3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">

    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Global Regulations</h1>
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
                <h5 class="card-header">Roles</h5>
                <br />
                <div class="container">
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
                            <asp:DropDownList runat="server" ID="ddlAns13" onChange="Enable()" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns13" ControlToValidate="ddlAns13" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lbl_Name" runat="server" Text="Name : " CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:TextBox ID="txt_Name" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lbl_Email" runat="server" Text="Email : " CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:TextBox ID="txt_Email" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lbl_Phone" runat="server" Text="Phone No : " CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:TextBox ID="txt_phone" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lbl_Title" runat="server" Text="Title : " CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:TextBox ID="txt_title" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lbl_Contact" runat="server" Text="Other Contact Info : " CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:TextBox ID="txt_contact" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lblQues14" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns14" onChange="EnableTextArea()" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns14" ControlToValidate="ddlAns14" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="lbl_dpaLinks" runat="server" Text="DPA : " CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:TextBox ID="txt_dpaLinks" TextMode="multiline" Columns="50" Rows="5" runat="server" CssClass="form-control" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br />
        <div class="flex-column">
            <asp:Button ID="btn_Save1" runat="server" Text="Save" OnClick="btn_Save1_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
            <asp:Button ID="btn_Previous" runat="server" Text="Previous" CssClass="btn btn-primary" OnClick="btn_Previous_Click" ClientIDMode="Static" />
        </div>

    </form>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

    <script>

        function Enable() {
            var ddlAns13 = document.getElementById('<%= ddlAns13.ClientID %>');

            var Name = document.getElementById('<%= txt_Name.ClientID %>');
            var Email = document.getElementById('<%= txt_Email.ClientID %>');
            var phone = document.getElementById('<%= txt_phone.ClientID %>');
            var title = document.getElementById('<%= txt_title.ClientID %>');
            var contact = document.getElementById('<%= txt_contact.ClientID %>');


            if (ddlAns13.options[ddlAns13.selectedIndex].innerHTML == 'YES') {
                Name.disabled = false;
                Email.disabled = false;
                phone.disabled = false;
                title.disabled = false;
                contact.disabled = false;
            }
            else {
                Name.disabled = true;
                Email.disabled = true;
                phone.disabled = true;
                title.disabled = true;
                contact.disabled = true;
            }
        }

        function EnableTextArea() {
            var ddlAns14 = document.getElementById('<%= ddlAns14.ClientID %>');
            var links = document.getElementById('<%= txt_dpaLinks.ClientID %>');

            if (ddlAns14.options[ddlAns14.selectedIndex].innerHTML == 'YES') {
                links.disabled = false;
            }
            else {
                links.disabled = true;
            }
        }

    </script>

</asp:Content>

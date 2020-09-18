<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Section2.aspx.cs" Inherits="ArmourCyberSecurity.Section2" %>

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
                <div class="container">
                    <p class="text-center">
                        <strong>The following questions deal with how your system or service is set up with respect to the collection, transfer, processing and storage of personal data.</strong>
                    </p>

                    <h5><strong>Section Goal:</strong></h5>
                    <p>
                        To ensure that privacy is at the foundation of your system and services. 
                        To evaluate the basis on which data is collected and the security of its processing, transfer and storage. 
                        Through this process you eliminate risk by removing any data that is not necessary to system, and add in the secuirty measures needed to protect the data.

                    </p>
                    <h5><strong>Stakeholders Required:</strong></h5>
                    <p>
                        To fill out this section you will need a knowledge of the following:
                    </p>
                    <ul>
                        <li>The way the data is collected, stored, transefered and processed.</li>
                        <li>The types and cotegories of any perosnal data.</li>
                        <li>The third party software and products your company uses with personal data.</li>
                    </ul>

                </div>

                <h5 class="card-header">Privacy by Design</h5>
                <br />
                <div class="container">
                    <p>
                        Privacy by Design is a framework to ensure that privacy is paramount in the operation and maintenance of a system. 
                    Applying the seven principles of PbD maximizes the security and safety of your data.
                    </p>
                    <p>
                        Starting with the foundation of the system or service, you'll need draw or write out the flow of data including collection, transfer and access to the data. 
                    [Note: this system and services map is the first step in a Data Privacy Impact Assessment below]
                                Both the adherence to Privacy by Design and the completed Privacy Impact Assessment are requirements for full compliance for many regulations.
                    </p>

                    <br />

                    <div class="form-group row">
                        <asp:Label ID="lblQues1" runat="server" Text="" CssClass="col-md-7 col-form-label" />
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlAns1" onChange="EnableTextArea1()" CssClass="form-control">
                                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ID="reqAns1" ControlToValidate="ddlAns1" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />--%><br />
                            <asp:Label ID="lbl_Links_1" runat="server" Text="Free Form Links : " Font-Bold="true" /><br />
                            <asp:TextBox ID="txt_Links_1" TextMode="multiline" Columns="50" Rows="5" runat="server" CssClass="form-control" />
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

                </div>

            </div>
        </div>
        <br />
        <div class="flex-column">
            <asp:Button ID="btn_Save2" runat="server" Text="Save" OnClick="btn_Save2_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
            <asp:Button ID="btn_Next" runat="server" Text="Next" OnClick="btn_Next_Click" CssClass="btn btn-primary" ClientIDMode="Static" />
        </div>

    </form>
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
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

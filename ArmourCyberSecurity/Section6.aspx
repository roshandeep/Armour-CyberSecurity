<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section6.aspx.cs" Inherits="ArmourCyberSecurity.Section6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function EnableTextArea() {
            var ddlAns1 = document.getElementById('<%= ddlAns1.ClientID %>');
            var links1 = document.getElementById('<%= txt_Links_1.ClientID %>');

            var ddlAns3 = document.getElementById('<%= ddlAns3.ClientID %>');
            var links3 = document.getElementById('<%= txt_Links_3.ClientID %>');


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

        }
    </script>
    <div>
        <h5>The following questions deal with how you have designed you remployee training program. 
        </h5>
        <h5>SECTION GOAL:
            <br>
            To ensure that all employees understand their roles within the company for privacy and compliance.
        </h5>
        <h5>STAKEHOLDERS REQUIRED:
            <br>
            To fill out this section you will need a knowledge of the following:
            <br>
            * the onborading program used at the company
            <br>
            * the employee training program around privacy
            <br>
        </h5>
        <div>
            <h2>Privacy Policy
            </h2>
            <h5>In terms of data privacy compliance, employees must be aware of all internal processes and protocols, or at least know where to find the answers.
            </h5>
            <asp:Label ID="lblQues1" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns1" onChange="EnableTextArea()">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns1" ControlToValidate="ddlAns1" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />
            <asp:Label ID="lbl_Links_1" runat="server" Text="Free Form Links : " />
            <asp:TextBox ID="txt_Links_1" TextMode="multiline" Columns="50" Rows="5" runat="server" />
            <br />

            <asp:Label ID="lblQues2" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns2">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns2" ControlToValidate="ddlAns2" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues3" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns3" onChange="EnableTextArea()">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns3" ControlToValidate="ddlAns3" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />
            <asp:Label ID="lbl_Links_3" runat="server" Text="Free Form Links : " />
            <asp:TextBox ID="txt_Links_3" TextMode="multiline" Columns="50" Rows="5" runat="server" />
            <br />

            <asp:Label ID="lblQues4" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns4">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns4" ControlToValidate="ddlAns4" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues5" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns5">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns5" ControlToValidate="ddlAns5" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues6" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns6">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns6" ControlToValidate="ddlAns6" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues7" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns7">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns7" ControlToValidate="ddlAns7" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues8" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns8">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns8" ControlToValidate="ddlAns8" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues9" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns9">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns9" ControlToValidate="ddlAns9" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues10" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns10">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns10" ControlToValidate="ddlAns10" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues11" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns11">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns11" ControlToValidate="ddlAns11" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues12" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns12">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns12" ControlToValidate="ddlAns12" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues13" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns13">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns13" ControlToValidate="ddlAns13" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues14" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns14">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns14" ControlToValidate="ddlAns14" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues15" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns15">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns15" ControlToValidate="ddlAns15" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Button ID="btn_Save6" runat="server" Text="Save" OnClick="btn_Save6_Click" />
        </div>
    </div>
</asp:Content>

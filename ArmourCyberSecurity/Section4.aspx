<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section4.aspx.cs" Inherits="ArmourCyberSecurity.Section4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        $(document).ready(function () {
            $("#sec2Div").hide();
        });

        $(document).on('click', '[id*=btn_part1]', function () {
            var v1 = document.getElementById("<%=reqAns1.ClientID%>");
            var v2 = document.getElementById("<%=reqAns2.ClientID%>");
            var v3 = document.getElementById("<%=reqAns3.ClientID%>");
            var v4 = document.getElementById("<%=reqAns4.ClientID%>");
            var v5 = document.getElementById("<%=reqAns5.ClientID%>");
            var v6 = document.getElementById("<%=reqAns6.ClientID%>");
            var v7 = document.getElementById("<%=reqAns7.ClientID%>");
            var v8 = document.getElementById("<%=reqAns8.ClientID%>");
            var v9 = document.getElementById("<%=reqAns9.ClientID%>");
            var v10 = document.getElementById("<%=reqAns10.ClientID%>");
            var v11 = document.getElementById("<%=reqAns11.ClientID%>");
            var v12 = document.getElementById("<%=reqAns12.ClientID%>");
            ValidatorValidate(v1);
            ValidatorValidate(v2);
            ValidatorValidate(v3);
            ValidatorValidate(v4);
            ValidatorValidate(v5);
            ValidatorValidate(v6);
            ValidatorValidate(v7);
            ValidatorValidate(v8);
            ValidatorValidate(v9);
            ValidatorValidate(v10);
            ValidatorValidate(v11);
            ValidatorValidate(v12);
            if (v1.isvalid && v2.isvalid && v3.isvalid && v4.isvalid && v5.isvalid && v6.isvalid && v7.isvalid && v8.isvalid && v9.isvalid && v10.isvalid && v11.isvalid && v12.isvalid) {
                $("#sec1Div").slideUp(1000);
                $("#sec2Div").slideDown(1000);
            }
            else {
                alert("Fill in all the questions before moving ahead");
            }
        });

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
    <div>
        <h5>The following questions deal with how privacy information is displayed to your customer or client, as well as how their explicit consent gathered and tracked.
            <br />
        </h5>
        <h5>SECTION GOAL:
            <br>
            To ensure that consent is properly collected from infomred individuals that are aware of how their data is collected and used.
        </h5>
        <h5>STAKEHOLDERS REQUIRED:
            <br>
            To fill out this section you will need a knowledge of the following:
            <br>
            * the type of data that is collected
            <br>
            * the method(s) by which that data is collected (directly and indirectly)
            <br>
            * the list of third party or vendor companies that process the data 
            <br>
            * the locations where the data is stored 
            <br>
            * the contact information for the company
        </h5>
        <div id='sec1Div'>
            <h2>Privacy Policy
            </h2>
            <h5>In accordance to the legislations, the privacy policy must explain to users what their rights are and how to execute on those rights. It is also important to establish a legal basis for which data is being collected. This policy should be clear and easy to find.
            </h5>
            <asp:Label ID="lblQues1" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns1" onChange="EnableTextArea1()">
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
            <asp:DropDownList runat="server" ID="ddlAns3">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns3" ControlToValidate="ddlAns3" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
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
            <asp:Button ID="btn_part1" runat="server" Text="Next" ClientIDMode="Static" OnClientClick="return false;" />
        </div>
        <div id='sec2Div'>
            <h2>Opt Ins/Outs</h2>
            <h5>Users must have the ability to Opt in and out of having their data collected, stored, and transferred. That consent must be stored and updated if data use is changed.
            </h5>
            <asp:Label ID="lblQues13" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns13" onChange="EnableTextArea13()">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns13" ControlToValidate="ddlAns13" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />
            <asp:Label ID="lbl_Links_13" runat="server" Text="Free Form Links : " />
            <asp:TextBox ID="txt_Links_13" TextMode="multiline" Columns="50" Rows="5" runat="server" />
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

            <asp:Label ID="lblQues16" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns16">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns16" ControlToValidate="ddlAns16" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues17" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns17">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns17" ControlToValidate="ddlAns17" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues18" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns18">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns18" ControlToValidate="ddlAns18" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues19" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns19">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns19" ControlToValidate="ddlAns19" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Label ID="lblQues20" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns20">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns20" ControlToValidate="ddlAns20" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />
            <asp:Button ID="btn_Save4" runat="server" Text="Save" OnClick="btn_Save4_Click" />
        </div>
    </div>

</asp:Content>

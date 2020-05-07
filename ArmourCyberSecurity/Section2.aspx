<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section2.aspx.cs" Inherits="ArmourCyberSecurity.Section2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        $(document).ready(function () {
            $("#sec2Div").hide();
            $("#sec3Div").hide();
            $("#sec4Div").hide();
        });

        $(document).on('click', '[id*=btn_part1]', function () {
            var v1 = document.getElementById("<%=reqAns1.ClientID%>");
            var v2 = document.getElementById("<%=reqAns2.ClientID%>");
            var v3 = document.getElementById("<%=reqAns3.ClientID%>");
            var v4 = document.getElementById("<%=reqAns4.ClientID%>");
            var v5 = document.getElementById("<%=reqAns5.ClientID%>");
            var v6 = document.getElementById("<%=reqAns6.ClientID%>");
            var v7 = document.getElementById("<%=reqAns7.ClientID%>");
            ValidatorValidate(v1);
            ValidatorValidate(v2);
            ValidatorValidate(v3);
            ValidatorValidate(v4);
            ValidatorValidate(v5);
            ValidatorValidate(v6);
            ValidatorValidate(v7);
            if (v1.isvalid && v2.isvalid && v3.isvalid && v4.isvalid && v5.isvalid && v6.isvalid && v7.isvalid) {
                $("#sec1Div").slideUp(1000);
                $("#sec2Div").slideDown(1000);
            }
            else {
                alert("Fill in all the questions before moving ahead");
            }
        });

        $(document).on('click', '[id*=btn_part2]', function () {
            var v8 = document.getElementById("<%=reqAns8.ClientID%>");
            var v9 = document.getElementById("<%=reqAns9.ClientID%>");
            var v10 = document.getElementById("<%=reqAns10.ClientID%>");
            var v11 = document.getElementById("<%=reqAns11.ClientID%>");
            var v12 = document.getElementById("<%=reqAns12.ClientID%>");
            var v13 = document.getElementById("<%=reqAns13.ClientID%>");
            var v14 = document.getElementById("<%=reqAns14.ClientID%>");
            var v15 = document.getElementById("<%=reqAns15.ClientID%>");
            ValidatorValidate(v8);
            ValidatorValidate(v9);
            ValidatorValidate(v10);
            ValidatorValidate(v11);
            ValidatorValidate(v12);
            ValidatorValidate(v13);
            ValidatorValidate(v14);
            ValidatorValidate(v15);
            if (v8.isvalid && v9.isvalid && v10.isvalid && v11.isvalid && v12.isvalid && v13.isvalid && v14.isvalid && v15.isvalid) {
                $("#sec2Div").slideUp(1000);
                $("#sec3Div").slideDown(1000);
            }
            else {
                alert("Fill in all the questions before moving ahead");
            }
        });

        $(document).on('click', '[id*=btn_part3]', function () {
            var v16 = document.getElementById("<%=reqAns16.ClientID%>");
            var v17 = document.getElementById("<%=reqAns17.ClientID%>");
            var v18 = document.getElementById("<%=reqAns18.ClientID%>");
            var v19 = document.getElementById("<%=reqAns19.ClientID%>");
            var v20 = document.getElementById("<%=reqAns20.ClientID%>");
            var v21 = document.getElementById("<%=reqAns21.ClientID%>");
            ValidatorValidate(v16);
            ValidatorValidate(v17);
            ValidatorValidate(v18);
            ValidatorValidate(v19);
            ValidatorValidate(v20);
            ValidatorValidate(v21);
            if (v16.isvalid && v17.isvalid && v18.isvalid && v19.isvalid && v20.isvalid && v21.isvalid) {
                $("#sec3Div").slideUp(1000);
                $("#sec4Div").slideDown(1000);
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
        function EnableTextArea23() {
            var ddlAns23 = document.getElementById('<%= ddlAns23.ClientID %>');
            var links23 = document.getElementById('<%= txt_Links_23.ClientID %>');

            if (ddlAns23.options[ddlAns23.selectedIndex].innerHTML == 'YES') {
                links23.disabled = false;
            }
            else {
                links23.disabled = true;
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
        function EnableTextArea22() {
            var ddlAns22 = document.getElementById('<%= ddlAns22.ClientID %>');
            var links22 = document.getElementById('<%= txt_Links_22.ClientID %>');

            if (ddlAns22.options[ddlAns1.selectedIndex].innerHTML == 'YES') {
                links22.disabled = false;
            }
            else {
                links22.disabled = true;
            }
        }

    </script>
    <div>
        <h5>The following questions deal with how your system or service is set up with resspect to the collection, transfer, processing and storage of personal data. 
        </h5>
        <h5>SECTION GOAL:
            <br>
            To ensure that privacy is at the foundation of your system and services. To evaluate the basis on which data is collected and the security of its processing, transfer and storage. Through this process you eliminate risk by removing any data that is not necessary to system, and add in the secuirty measures needed to protect the data
        </h5>
        <h5>STAKEHOLDERS REQUIRED:
            <br>
            To fill out this section you will need a knowledge of the following:
            <br>
            the way the data is collected, stored, transefered and processed<br>
            * the types and cotegories of any perosnal data
            <br>
            the third party software and products your company uses with personal data
        </h5>

        <div id='sec1Div'>
            <h2>Privacy by Design</h2>
            <h5>Privacy by Design is a framework to ensure that privacy is paramount in the operation and maintenance of a system. Applying the seven principles of PbD maximizes the security and safety of your data.
            <br>
                Starting with the foundation of the system or service, you'll need draw or write out the flow of data including collection, transfer and access to the data. [Note: this system and services map is the first step in a Data Privacy Impact Assessment below]
Both the adherence to Privacy by Design and the completed Privacy Impact Assessment are requirements for full compliance for many regulations.

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

            <asp:Button ID="btn_part1" runat="server" Text="Next" ClientIDMode="Static" OnClientClick="return false;" />
        </div>
        <div id='sec2Div'>
            <h2>Data Categorization</h2>

            <h3>To assess your data, you will need to create a data map by listing your current data and reviewing it against necessity for your products/services. [Note: the Data Use Info Sheet is part of the Privacy Impact Assessment below]. Your data must be distinguished in terms of Personal Information (PI), Personally Identifiable Information (PII), as well as sensitivity of the data.
            </h3>

            <asp:Label ID="lblQues8" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns8" onChange="EnableTextArea8()">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns8" ControlToValidate="ddlAns8" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />
            <asp:Label ID="lbl_Links_8" runat="server" Text="Free Form Links : " />
            <asp:TextBox ID="txt_Links_8" TextMode="multiline" Columns="50" Rows="5" runat="server" />
            <br />

            <asp:Label ID="lblQues9" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns9" onChange="EnableTextArea9()">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns9" ControlToValidate="ddlAns9" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />
            <asp:Label ID="lbl_Links_9" runat="server" Text="Free Form Links : " />
            <asp:TextBox ID="txt_Links_9" TextMode="multiline" Columns="50" Rows="5" runat="server" />
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
            <asp:DropDownList runat="server" ID="ddlAns15" onChange="EnableTextArea15()">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns15" ControlToValidate="ddlAns15" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />
            <asp:Label ID="lbl_Links_15" runat="server" Text="Free Form Links : " />
            <asp:TextBox ID="txt_Links_15" TextMode="multiline" Columns="50" Rows="5" runat="server" />

            <br />

            <asp:Button ID="btn_part2" runat="server" Text="Next" ClientIDMode="Static" OnClientClick="return false;" />
        </div>
        <div id='sec3Div'>
            <h2>Vendor Management</h2>
            <h4>If you are the controller of data, your company is ultimately responsible for the safety and privacy of the data you handle. As such, vendors and third party partners must be compliant with regulation as well. This applies to internal software and services if your employees fall under a regulation (ex citizen of a country within the EU), and third party software and services, such as cloud storage, for customers and clients. Some regulations require a contract but it is a good idea to have one regardless. 
            </h4>
            <asp:Label ID="lblQues16" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns16" onChange="EnableTextArea16()">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns16" ControlToValidate="ddlAns16" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />
            <asp:Label ID="lbl_Links_16" runat="server" Text="Free Form Links : " />
            <asp:TextBox ID="txt_Links_16" TextMode="multiline" Columns="50" Rows="5" runat="server" />

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

            <asp:Label ID="lblQues21" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns21">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns21" ControlToValidate="ddlAns21" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />


            <asp:Label ID="lblQues22" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns22" onChange="EnableTextArea22()">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns22" ControlToValidate="ddlAns22" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />
            <asp:Label ID="lbl_Links_22" runat="server" Text="Free Form Links : " />
            <asp:TextBox ID="txt_Links_22" TextMode="multiline" Columns="50" Rows="5" runat="server" />

            <br />

            <asp:Button ID="btn_part3" runat="server" Text="Next" ClientIDMode="Static" OnClientClick="return false;" />
        </div>
        <div id='sec4Div'>
            <h2>Privacy Impact Assessment</h2>
            <h4>All legislations require that companies show due diligence in their protection of personal data. This can be done via an evaluation called a Data Protection Impact Assessment (DPIA) or Privacy Impact Assessment (PIA), which lists, reviews, and records all the ways data is handled, used, stored, and protected.<br>
                The DPIA includes a system map, data map, and information from the data use info sheet, which are included in the sections above. The DPIA also covers security and privacy measures taken to protect the data while being accessed, stored, and transferred.
            </h4>


            <asp:Label ID="lblQues23" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns23" onChange="EnableTextArea23()">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns23" ControlToValidate="ddlAns23" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />
            <asp:Label ID="lbl_Links_23" runat="server" Text="Free Form Links : " />
            <asp:TextBox ID="txt_Links_23" TextMode="multiline" Columns="50" Rows="5" runat="server" />
            <br />
            <asp:Label ID="lblQues24" runat="server" Text="" />
            <asp:DropDownList runat="server" ID="ddlAns24">
                <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqAns24" ControlToValidate="ddlAns24" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            <br />

            <asp:Button ID="btn_Save2" runat="server" Text="Save" OnClick="btn_Save2_Click" />
        </div>
    </div>
</asp:Content>

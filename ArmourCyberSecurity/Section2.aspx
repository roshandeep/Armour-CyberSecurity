<%@ Page Title="" Language="C#" MasterPageFile="~/CustomRoadmapMenu.Master" AutoEventWireup="true" CodeBehind="Section2.aspx.cs" Inherits="ArmourCyberSecurity.Section2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

        <h2>Privacy by Design</h2>
        <h5>Privacy by Design is a framework to ensure that privacy is paramount in the operation and maintenance of a system. Applying the seven principles of PbD maximizes the security and safety of your data.
            <br>
            Starting with the foundation of the system or service, you'll need draw or write out the flow of data including collection, transfer and access to the data. [Note: this system and services map is the first step in a Data Privacy Impact Assessment below]
Both the adherence to Privacy by Design and the completed Privacy Impact Assessment are requirements for full compliance for many regulations.

        </h5>
        <asp:Label ID="lblQues1" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns1">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns1" ControlToValidate="ddlAns1" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
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

        <h2>Data Categorization</h2>

        <h3>To assess your data, you will need to create a data map by listing your current data and reviewing it against necessity for your products/services. [Note: the Data Use Info Sheet is part of the Privacy Impact Assessment below]. Your data must be distinguished in terms of Personal Information (PI), Personally Identifiable Information (PII), as well as sensitivity of the data.
        </h3>

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

        <h2>Vendor Management</h2>
        <h4>If you are the controller of data, your company is ultimately responsible for the safety and privacy of the data you handle. As such, vendors and third party partners must be compliant with regulation as well. This applies to internal software and services if your employees fall under a regulation (ex citizen of a country within the EU), and third party software and services, such as cloud storage, for customers and clients. Some regulations require a contract but it is a good idea to have one regardless. 
        </h4>
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

        <asp:Label ID="lblQues21" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns21">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns21" ControlToValidate="ddlAns21" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />

        <h2>Privacy Impact Assessment</h2>
        <h4>All legislations require that companies show due diligence in their protection of personal data. This can be done via an evaluation called a Data Protection Impact Assessment (DPIA) or Privacy Impact Assessment (PIA), which lists, reviews, and records all the ways data is handled, used, stored, and protected.<br>
            The DPIA includes a system map, data map, and information from the data use info sheet, which are included in the sections above. The DPIA also covers security and privacy measures taken to protect the data while being accessed, stored, and transferred.
        </h4>

        <asp:Label ID="lblQues22" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns22">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns22" ControlToValidate="ddlAns22" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />

        <asp:Label ID="lblQues23" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns23">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns23" ControlToValidate="ddlAns23" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />
        <asp:Label ID="lblQues24" runat="server" Text="" />
        <asp:DropDownList runat="server" ID="ddlAns24">
            <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="reqAns24" ControlToValidate="ddlAns24" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
        <br />

        <asp:Label ID="lbl_warning" runat="server" Text="" ForeColor="Red" />

        <asp:Button ID="btn_Save2" runat="server" Text="Save" OnClick="btn_Save2_Click" />
        <%-- <asp:Button ID="btn_Submit" runat="server" Text="Finish" OnClick="btn_Submit_Click"/>--%>
    </div>
</asp:Content>

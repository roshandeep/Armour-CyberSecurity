<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="KYC.aspx.cs" Inherits="Acreage.KYC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/jquery-3.3.1.intellisense.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <link href="Scripts/jquery-ui.theme.css" rel="stylesheet" />
    <link href="Scripts/jquery-ui.structure.css" rel="stylesheet" />
    <link href="Scripts/jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=ddl_country.ClientID%>').on('change', function () {
                var ddlvalue = $(this).val();
                if (ddlvalue != 'Canada') {
                    alert('Currently the services are available only for Canada investors');
                }
            });
        });

        $(function () {
            $("#<%= txt_dob.ClientID %>").datepicker({
                changeMonth: true,
                changeYear: true,
                minDate: new Date(1900, 1, 1),
                maxDate: new Date(),
                yearRange: "c-50:c+0"
            });
        });

        $(function () {
            $("#<%= txt_dob.ClientID %>").change(function () {
                var age = CalculateAge();
                if (age < 18) {
                    alert("Age must be Greater than equal to 18");
                }
            });
        });

        function CalculateAge() {
            var dob = $("#<%= txt_dob.ClientID %>").val();
            dob = new Date(dob);
            var today = new Date();
            var age = Math.floor((today - dob) / (365.25 * 24 * 60 * 60 * 1000));
            return age;
        }

        function AgeValidation(sender, args) {
            var age = CalculateAge();
            if (age >= 18) {
                args.IsValid = true;
            } else {
                args.IsValid = false;
            }
        }
        $(function () {
            $("[id*=chkbx_address]").click(function () {
                if ($(this).is(":checked")) {
                    $("#residential_address1").hide();
                    $("#residential_address2").hide();
                    ValidatorEnable(document.getElementById('<%= req_resAddress.ClientID %>'), false);
                    ValidatorEnable(document.getElementById('<%= req_resProvince.ClientID %>'), false);
                    ValidatorEnable(document.getElementById('<%= req_resCity.ClientID %>'), false);
                    ValidatorEnable(document.getElementById('<%= reg_resCity.ClientID %>'), false);
                    ValidatorEnable(document.getElementById('<%= req_resPostalCode.ClientID %>'), false);
                    ValidatorEnable(document.getElementById('<%= reg_resPostalCode.ClientID %>'), false);
                } else {
                    $("#residential_address1").show();
                    $("#residential_address2").show();
                    ValidatorEnable(document.getElementById('<%= req_resAddress.ClientID %>'), true);
                    ValidatorEnable(document.getElementById('<%= req_resProvince.ClientID %>'), true);
                    ValidatorEnable(document.getElementById('<%= req_resCity.ClientID %>'), true);
                    ValidatorEnable(document.getElementById('<%= reg_resCity.ClientID %>'), true);
                    ValidatorEnable(document.getElementById('<%= req_resPostalCode.ClientID %>'), true);
                    ValidatorEnable(document.getElementById('<%= reg_resPostalCode.ClientID %>'), true);
                }
            });
        });
    </script>
    <style>
    </style>
    <table>
        <tr>
            <td>Marital Status
            </td>
            <td>
                <asp:DropDownList ID="ddl_maritalStatus" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Single" Value="Single"></asp:ListItem>
                    <asp:ListItem Text="Married" Value="Married"></asp:ListItem>
                    <asp:ListItem Text="Common-Law Partner" Value="Common-Law Partner"></asp:ListItem>
                    <asp:ListItem Text="Separated" Value="Separated"></asp:ListItem>
                    <asp:ListItem Text="Divorced" Value="Divorced"></asp:ListItem>
                    <asp:ListItem Text="Widowed" Value="Widowed"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_maritalStatus" ControlToValidate="ddl_maritalStatus" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
            <td>Name
            </td>
            <td>
                 <asp:DropDownList ID="ddl_salutation" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Mr." Value="Mr."></asp:ListItem>
                    <asp:ListItem Text="Mrs." Value="Mrs."></asp:ListItem>
                    <asp:ListItem Text="Ms." Value="Ms."></asp:ListItem>
                    <asp:ListItem Text="Dr." Value="Dr."></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_salutation" ControlToValidate="ddl_salutation" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            
                <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_name" ControlToValidate="txt_name" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr>
            <td>Email
            </td>
            <td>
                <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_email" ControlToValidate="txt_email" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                <asp:RegularExpressionValidator ID="reg_email" runat="server" ErrorMessage="* Invalid Email Address" ControlToValidate="txt_email" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
            </td>
            <td>Date Of Birth
            </td>
            <td>
                <asp:TextBox ID="txt_dob" runat="server"></asp:TextBox>
                <asp:CustomValidator ID="CvAgeValidation" ErrorMessage="Age must be Greater than equal to 18" ForeColor="Red" ClientValidationFunction="AgeValidation" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Phone Number
            </td>
            <td>
                <asp:TextBox ID="txt_phoneNo" runat="server" placeholder="(xxx) (xxx) (xxxx)"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_phoneNo" ControlToValidate="txt_phoneNo" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                <asp:RegularExpressionValidator ID="reg_phoneNo" runat="server" ForeColor="Red" ControlToValidate="txt_phoneNo" ErrorMessage="Enter 10 digit Phone Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            </td>
            <td>Address
                <asp:CheckBox ID="chkbx_address" runat="server" Text="Mailing Address same as Residential Address" Checked="true"/>
            </td>
            <td>
                <asp:TextBox ID="txt_address" runat="server" placeholder="House No. / Street Name"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_address" ControlToValidate="txt_address" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr>
            <td>Country
            </td>
            <td>
                <asp:DropDownList ID="ddl_country" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_country" ControlToValidate="ddl_country" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
            <td>Province
            </td>
            <td>
                <asp:DropDownList ID="ddl_province" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Alberta" Value="Alberta"></asp:ListItem>
                    <asp:ListItem Text="British Columbia" Value="British Columbia"></asp:ListItem>
                    <asp:ListItem Text="Manitoba" Value="Manitoba"></asp:ListItem>
                    <asp:ListItem Text="New Brunswick" Value="New Brunswick"></asp:ListItem>
                    <asp:ListItem Text="Newfoundland and Labrador" Value="Newfoundland and Labrador"></asp:ListItem>
                    <asp:ListItem Text="Northwest Territories" Value="Northwest Territories"></asp:ListItem>
                    <asp:ListItem Text="Nova Scotia" Value="Nova Scotia"></asp:ListItem>
                    <asp:ListItem Text="Nunavut" Value="Nunavut"></asp:ListItem>
                    <asp:ListItem Text="Ontario" Value="Ontario"></asp:ListItem>
                    <asp:ListItem Text="Prince Edward Island" Value="Prince Edward Island"></asp:ListItem>
                    <asp:ListItem Text="Quebec" Value="Quebec"></asp:ListItem>
                    <asp:ListItem Text="Saskatchewan" Value="Saskatchewan"></asp:ListItem>
                    <asp:ListItem Text="Yukon" Value="Yukon"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_province" ControlToValidate="ddl_province" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr>
            <td>City
            </td>
            <td>
                <asp:TextBox ID="txt_city" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_city" ControlToValidate="txt_city" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                <asp:RegularExpressionValidator ID="reg_city" runat="server" ForeColor="Red" ControlToValidate="txt_city" ErrorMessage="Enter a Valid City name" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
            </td>
            <td>Postal Code
            </td>
            <td>
                <asp:TextBox ID="txt_postalCode" runat="server" placeholder="(xxx)(xxx)"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_postCode" ControlToValidate="txt_postalCode" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                <asp:RegularExpressionValidator ID="req_postalCode" runat="server" ForeColor="Red" ControlToValidate="txt_postalCode" ErrorMessage="Enter a Valid Postal Code" ValidationExpression="[a-zA-Z0-9 ]{6}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr id="residential_address1" style="display: none">
            <td>Address
            </td>
            <td>
                <asp:TextBox ID="txt_residentialaddress" runat="server" placeholder="House No. / Street Name"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_resAddress" ControlToValidate="txt_residentialaddress" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
            <td>Province
            </td>
            <td>
                <asp:DropDownList ID="ddl_resProvince" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Alberta" Value="Alberta"></asp:ListItem>
                    <asp:ListItem Text="British Columbia" Value="British Columbia"></asp:ListItem>
                    <asp:ListItem Text="Manitoba" Value="Manitoba"></asp:ListItem>
                    <asp:ListItem Text="New Brunswick" Value="New Brunswick"></asp:ListItem>
                    <asp:ListItem Text="Newfoundland and Labrador" Value="Newfoundland and Labrador"></asp:ListItem>
                    <asp:ListItem Text="Northwest Territories" Value="Northwest Territories"></asp:ListItem>
                    <asp:ListItem Text="Nova Scotia" Value="Nova Scotia"></asp:ListItem>
                    <asp:ListItem Text="Nunavut" Value="Nunavut"></asp:ListItem>
                    <asp:ListItem Text="Ontario" Value="Ontario"></asp:ListItem>
                    <asp:ListItem Text="Prince Edward Island" Value="Prince Edward Island"></asp:ListItem>
                    <asp:ListItem Text="Quebec" Value="Quebec"></asp:ListItem>
                    <asp:ListItem Text="Saskatchewan" Value="Saskatchewan"></asp:ListItem>
                    <asp:ListItem Text="Yukon" Value="Yukon"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_resProvince" ControlToValidate="ddl_resProvince" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr id="residential_address2" style="display: none">
            <td>City
            </td>
            <td>
                <asp:TextBox ID="txt_resCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_resCity" ControlToValidate="txt_resCity" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                <asp:RegularExpressionValidator ID="reg_resCity" runat="server" ForeColor="Red" ControlToValidate="txt_resCity" ErrorMessage="Enter a Valid City name" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
            </td>
            <td>Postal Code
            </td>
            <td>
                <asp:TextBox ID="txt_resPostalCode" runat="server" placeholder="(xxx)(xxx)"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_resPostalCode" ControlToValidate="txt_resPostalCode" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
                <asp:RegularExpressionValidator ID="reg_resPostalCode" runat="server" ForeColor="Red" ControlToValidate="txt_resPostalCode" ErrorMessage="Enter a Valid Postal Code" ValidationExpression="[a-zA-Z0-9 ]{6}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click"/>
            </td>
        </tr>
    </table>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="SuitabilityTest1.aspx.cs" Inherits="Acreage.SuitabilityTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4>Suitablity Profile</h4>
    <table>
        <tr>
            <td>I
                <asp:Label ID="lbl_investmentKnow" runat="server" Text="Investment Knowledge "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_investmentKnow" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Sophisticated" Value="Sophisticated"></asp:ListItem>
                    <asp:ListItem Text="Good" Value="Good"></asp:ListItem>
                    <asp:ListItem Text="Limited/Poor" Value="Limited/Poor"></asp:ListItem>
                    <asp:ListItem Text="None" Value="None"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_investmentKnow" ControlToValidate="ddl_investmentKnow" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_RiskTolerance" runat="server" Text="Risk Tolerance "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_riskTolerance" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="High" Value="High"></asp:ListItem>
                    <asp:ListItem Text="Medium" Value="Medium"></asp:ListItem>
                    <asp:ListItem Text="Low To Medium" Value="Low To Medium"></asp:ListItem>
                    <asp:ListItem Text="Low" Value="Low"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_riskTolerance" ControlToValidate="ddl_riskTolerance" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_Income" runat="server" Text="Income "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_income" runat="server" OnSelectedIndexChanged="ddl_income_SelectedIndexChanged">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="First" Value="First"></asp:ListItem>
                    <asp:ListItem Text="Second" Value="Second"></asp:ListItem>
                    <asp:ListItem Text="Third" Value="Third"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_income" ControlToValidate="ddl_income" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_Balance" runat="server" Text="Balance "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_Balance" runat="server" Enabled="false" OnSelectedIndexChanged="ddl_Balance_SelectedIndexChanged">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_Balance" ControlToValidate="ddl_Balance" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_Growth" runat="server" Text="Growth "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_Growth" runat="server" Enabled="false">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_Growth" ControlToValidate="ddl_Growth" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />

            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btn_Save" runat="server" Text="Save" OnClick="btn_Save_Click"/>
            </td>
            <td>
                <asp:Button ID="btn_Next" runat="server" Text="Next" OnClick="btn_Next_Click" Enabled="false"/>
            </td>
        </tr>
    </table>
</asp:Content>

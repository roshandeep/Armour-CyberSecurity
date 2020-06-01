<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="SuitabilityTest2.aspx.cs" Inherits="Acreage.SuitabilityTest2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4>Financial Information</h4>
    <table>
        <tr>
            <td>
                <asp:Label ID="lbl_annualincome" runat="server" Text="Individual Annual Income (in CAD)"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_annualincome" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Under $75,000" Value="Under $75,000"></asp:ListItem>
                    <asp:ListItem Text="$75,000- $200,000" Value="$75,000- $200,000"></asp:ListItem>
                    <asp:ListItem Text="$200,000- $500,000" Value="$200,000- $500,000"></asp:ListItem>
                    <asp:ListItem Text="Over $500,000" Value="Over $500,000"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_annualincome" ControlToValidate="ddl_annualincome" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_household" runat="server" Text="Annual income household"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_household" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Under $125,000" Value="Under $125,000"></asp:ListItem>
                    <asp:ListItem Text="$125,000-$300,000" Value="$125,000-$300,000"></asp:ListItem>
                    <asp:ListItem Text="$300,000-$1,000,000" Value="$300,000-$1,000,000"></asp:ListItem>
                    <asp:ListItem Text="Over $1,000,000 " Value="Over $1,000,000 "></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_household" ControlToValidate="ddl_household" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_finAssets" runat="server" Text="Financial Assets "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_finAssets" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Under $100,000" Value="Under $100,000"></asp:ListItem>
                    <asp:ListItem Text="$100,000 - $ 500,000" Value="$100,000 - $ 500,000"></asp:ListItem>
                    <asp:ListItem Text="$500,000 - $ 1,000,000" Value="$500,000 - $ 1,000,000"></asp:ListItem>
                    <asp:ListItem Text="Over $1,000,000" Value="Over $1,000,000"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_finAssets" ControlToValidate="ddl_finAssets" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_netAssets" runat="server" Text="Net Assets "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_netAssets" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Under $500,000" Value="Under $500,000"></asp:ListItem>
                    <asp:ListItem Text="$500,000 - $1,000,000" Value="$500,000 - $1,000,000"></asp:ListItem>
                    <asp:ListItem Text="$1,000,000 - $5,000,000" Value="$1,000,000 - $5,000,000"></asp:ListItem>
                    <asp:ListItem Text="Over $5,000,000" Value="Over $5,000,000"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_netAssets" ControlToValidate="ddl_netAssets" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />

            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btn_Save" runat="server" Text="Save" OnClick="btn_Save_Click" />
            </td>
            <td>
                <asp:Button ID="btn_Next" runat="server" Text="Next" OnClick="btn_Next_Click" Enabled="false" />
            </td>
        </tr>
    </table>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="SuitabilityTest3.aspx.cs" Inherits="Acreage.SuitabilityTest3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4>Text Missing</h4>
    <table>
        <tr>
            <td>
                <asp:Label ID="lbl_timehorizon" runat="server" Text="Time Horizon for whole portfolio"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rdb_timehorizon" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>1-3 years</asp:ListItem>
                    <asp:ListItem>3-5 years</asp:ListItem>
                    <asp:ListItem>More than 5 years</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="req_timehorizon" ControlToValidate="rdb_timehorizon" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_risktolerance" runat="server" Text="Risk Tolerance for Proposed Investment "></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rdb_risktolerance" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>High</asp:ListItem>
                    <asp:ListItem>Medium</asp:ListItem>
                    <asp:ListItem>Low to Medium</asp:ListItem>
                    <asp:ListItem>Low</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="req_risktolerance" ControlToValidate="rdb_risktolerance" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_timehorizon2" runat="server" Text="Time Horizon for Proposed Investment "></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rdb_timehorizon2" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>1-3 years</asp:ListItem>
                    <asp:ListItem>3-5 years</asp:ListItem>
                    <asp:ListItem>More than 5 years</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="req_timehorizon2" ControlToValidate="rdb_timehorizon2" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />

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

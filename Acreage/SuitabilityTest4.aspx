<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="SuitabilityTest4.aspx.cs" Inherits="Acreage.SuitabilityTest4" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h4>Text missing</h4>
    <table>
        <tr>
            <td>
                <asp:Label ID="lbl_finIns" runat="server" Text="Financial Institutions"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_finIns" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Banks" Value="Banks"></asp:ListItem>
                    <asp:ListItem Text="Prime Brokers" Value="Prime Brokers"></asp:ListItem>
                    <asp:ListItem Text="Insurance company" Value="Insurance company"></asp:ListItem>
                    <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_finIns" ControlToValidate="ddl_finIns" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_assetType" runat="server" Text="Asset Type"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_assetType" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Equity" Value="Equity"></asp:ListItem>
                    <asp:ListItem Text="Fixed Income" Value="Fixed Income"></asp:ListItem>
                    <asp:ListItem Text="Cash" Value="Cash"></asp:ListItem>
                    <asp:ListItem Text="None of the above" Value="None of the above"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_assetType" ControlToValidate="ddl_assetType" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_Amount" runat="server" Text="Amount"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_Amount" runat="server" style="height:30px;width:100px;"></asp:TextBox>
                <ajaxToolkit:NumericUpDownExtender ID="NumericUpDownExtender1" runat="server" TargetControlID="txt_Amount" Step="1" Minimum="1" Maximum ="50" Width="120"/>
                <asp:RequiredFieldValidator runat="server" ID="req_Amount" ControlToValidate="txt_Amount" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_officer" runat="server" Text="Are you an officar or director of a company whose shares are traded on an Exchange or in the OTC Market?"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rdb_officer" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="req_officer" ControlToValidate="rdb_officer" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic"/>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_controlpos" runat="server" Text="Are you in a control position or a part of a group in a control position of any such company?"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rdb_controlpos" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="req_controlpos" ControlToValidate="rdb_controlpos" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />

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

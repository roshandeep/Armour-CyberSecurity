<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="OpportunityDetails.aspx.cs" Inherits="Acreage.OpportunityDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <table>
        <tr>
            <td>Name : </td>
            <td>
                <asp:Label ID="lbl_name" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Details : </td>
            <td>
                <asp:Label ID="lbl_details" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Image ID="img_Logo" runat="server" style="width:50px; height:50px;"/></td>
        </tr>
        <tr>
            <td>Created By : </td>
            <td>
                <asp:Label ID="lbl_created_by" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Created TimeStamp : </td>
            <td>
                <asp:Label ID="lbl_created_timestamp" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Valid Upto : </td>
            <td>
                <asp:Label ID="lbl_expiry_timestamp" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Total Amount : </td>
            <td>
                <asp:Label ID="lbl_total_amt" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Amount Raised : </td>
            <td>
                <asp:Label ID="lbl_amt_left" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>
                <div class="progress">
                    <div id="progress_bar" class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%" runat="server">
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                 <asp:Button ID="btn_Back" runat="server" Text="Back" OnClick="btn_Back_Click"/>
            </td>
        </tr>
    </table>
</asp:Content>

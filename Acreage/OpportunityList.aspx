<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="OpportunityList.aspx.cs" Inherits="Acreage.OpportunityList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Repeater ID="rpt_Opportunity" runat="server">
            <HeaderTemplate>
                <table cellspacing="2" rules="all" border="1">
                    <tr>
                        <th>Name</th>
                        <th>Details</th>
                        <th>Created By</th>
                        <th>Total Capital</th>
                        <th>Amount Raised</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# string.Format("~/OpportunityDetails.aspx?Id={0}&Name={1}",HttpUtility.UrlEncode(Eval("opportunity_id").ToString()), HttpUtility.UrlEncode(Eval("oppotunity_name").ToString())) %>' Text='<%# Eval("oppotunity_name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lbl_Details" runat="server" Text='<%# Eval("opportunty_details") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lbl_createdBy" runat="server" Text='<%# Eval("created_by") %>' />
                    </td>
                    <td>
                        $<asp:Label ID="lbl_totalCapital" runat="server" Text='<%# Eval("total_amt") %>' />
                    </td>
                    <td>
                        $<asp:Label ID="lbl_amountRaised" runat="server" Text='<%# Eval("amt_left") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

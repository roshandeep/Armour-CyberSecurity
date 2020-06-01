<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="SuitabilityTest5.aspx.cs" Inherits="Acreage.SuitabilityTest5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4>Upload documents (Proof of Financial assets and Income)</h4>
    <table>
        <tr>
            <td>Broker statement
            </td>
            <td>
                <asp:FileUpload ID="fu_brokerstmt" runat="server" ToolTip="Select Only PDF File" />
            </td>
            <td>
                <asp:Button ID="btn_brkerstmt" runat="server" Text="Upload" OnClick="btn_brkerstmt_Click" />
            </td>
        </tr>
        <tr>
            <td>Proof of financial assets
            </td>
            <td>
                <asp:FileUpload ID="fu_finassets" runat="server" ToolTip="Select Only PDF File" />
            </td>
            <td>
                <asp:Button ID="btn_finassets" runat="server" Text="Upload" OnClick="btn_finassets_Click" />
            </td>
        </tr>
        <tr>
            <td>T4s
            </td>
            <td>
                <asp:FileUpload ID="fu_t4" runat="server" ToolTip="Select Only PDF File" />
            </td>
            <td>
                <asp:Button ID="btn_t4" runat="server" Text="Upload" OnClick="btn_t4_Click" />
            </td>
        </tr>
        <tr>
            <td>NOAs
            </td>
            <td>
                <asp:FileUpload ID="fu_noa" runat="server" ToolTip="Select Only PDF File" />
            </td>
            <td>
                <asp:Button ID="btn_noa" runat="server" Text="Upload" OnClick="btn_noa_Click" />
            </td>
        </tr>
        <tr>
            <td>Bank savings
            </td>
            <td>
                <asp:FileUpload ID="fu_bankSaving" runat="server" ToolTip="Select Only PDF File" />
            </td>
            <td>
                <asp:Button ID="btn_bankSaving" runat="server" Text="Upload" OnClick="btn_bankSaving_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="gv_uploadedDocs" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="uploaded_fileName" HeaderText="File Name" />
                        <asp:BoundField DataField="filecategory" HeaderText="File Category" />
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"
                                    CommandArgument='<%# Eval("uploaded_fileName") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_warning" runat="server"></asp:Label>
            </td>
            <td colspan="2">
                <asp:Button ID="btn_Next" runat="server" Text="Next" OnClick="btn_Next_Click"/>
            </td>
        </tr>
    </table>
</asp:Content>

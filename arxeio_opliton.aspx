<%@ Page Title="Αρχείο" Language="C#" MasterPageFile="~/Misthodosia.Master" AutoEventWireup="true" CodeBehind="arxeio_opliton.aspx.cs" Inherits="Web_Misthodosia_Opliton.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <h2>Αρχείο Οπλίτη</h2>
        <form id="form1" runat="server" class="form-inline form-group-sm">
            <h3 style="text-align: center">Πίνακας Διαγραμμένων Οπλιτών</h3>
            <h4>
                <asp:Label ID="error" runat="server" CssClass="alert-danger" Visible="false"></asp:Label></h4>
            <div class="container">
                <asp:GridView ID="deletedOplitis" CssClass="table table-hover" runat="server" AutoGenerateColumns="false" OnRowDataBound="deletedOplitis_RowDataBound" OnRowCommand="deletedOplitis_RowCommand" DataKeyNames="do_id" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                    <Columns>
                        <asp:ButtonField CommandName="Select" Text="Επιλογή" ButtonType="Button" ControlStyle-CssClass="btn btn-info btn-sm"></asp:ButtonField>
                        <asp:BoundField DataField="r_perigrafi" HeaderText="ΒΑΘΜΟΣ"></asp:BoundField>
                        <asp:BoundField DataField="do_eponymo" HeaderText="ΕΠΩΝΥΜΟ" SortExpression="do_eponymo"></asp:BoundField>
                        <asp:BoundField DataField="do_onoma" HeaderText="ONOMA" SortExpression="do_onoma"></asp:BoundField>
                        <asp:BoundField DataField="do_asm" HeaderText="ΑΣΜ" SortExpression="do_asm"></asp:BoundField>
                        <asp:BoundField HeaderText="ΛΟΧΟΣ" DataField="do_loxos" SortExpression="do_loxos"></asp:BoundField>
                        <asp:BoundField HeaderText="ΚΑΤΗΓΟΡΙΑ" DataField="kat_name"></asp:BoundField>
                        <asp:BoundField HeaderText="ΗΜ/ΝΙΑ ΕΓΓΡΑΦΗΣ" DataField="do_eggrafi"></asp:BoundField>
                        <asp:BoundField HeaderText="ΗΜ/ΝΙΑ ΔΙΑΓΡΑΦΗΣ" DataField="do_diagrafi"></asp:BoundField>
                        <asp:BoundField DataField="do_id" Visible="false"></asp:BoundField>
                    </Columns>

                    <EditRowStyle BackColor="#999999"></EditRowStyle>

                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </div>
            <div>
                <h3>Αναζήτηση Οπλίτη</h3>
                <div>
                    ΑΣΜ:&nbsp;<asp:TextBox ID="asma" runat="server" Width="110px" Height="30px" CssClass="form-control input-sm" TextMode="Search"></asp:TextBox>&nbsp;
                    Επώνυμο:&nbsp;<asp:TextBox runat="server" ID="lnameSearch" Width="150px" Height="30px" CssClass="form-control input-sm" TextMode="Search"></asp:TextBox>&nbsp;
                    <asp:Button ID="search" runat="server" Text="Αναζήτηση" OnClick="search_Click" CssClass="btn btn-primary btn-md" /><asp:Label ID="aa" runat="server" Visible="false"></asp:Label>
                </div>
            </div>
            <div class="container">
                <asp:Panel ID="lastDeletedPaymentsPanel" runat="server" Visible="false">
                    <h3 style="text-align: center">Προηγούμενες Πληρωμές Διαγραμμένου Οπλίτη</h3>
                    <asp:GridView ID="LastPayments" CssClass="table table-hover" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                        <Columns>
                            <asp:BoundField DataField="r_perigrafi" HeaderText="ΒΑΘΜΟΣ" SortExpression="r_perigrafi"></asp:BoundField>
                            <asp:BoundField DataField="do_eponymo" HeaderText="ΕΠΩΝΥΜΟ" SortExpression="do_eponymo"></asp:BoundField>
                            <asp:BoundField DataField="m_perigrafi" HeaderText="ΟΝΟΜΑ" SortExpression="m_perigrafi"></asp:BoundField>
                            <asp:BoundField DataField="pdo_payDay" HeaderText="ΗΜ/ΝΙΑ ΠΛΗΡΩΜΗΣ" SortExpression="pdo_payDay"></asp:BoundField>
                            <asp:BoundField DataField="pdo_posoPliromis" HeaderText="ΠΟΣΟ ΣΕ ΕΥΡΩ" SortExpression="pdo_posoPliromis">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                            </asp:BoundField>
                        </Columns>

                        <EditRowStyle BackColor="#999999"></EditRowStyle>

                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                    <%--<asp:Button ID="anaforaPliromis" runat="server" Text="Αναλυτικά Στοιχεία Πληρωμής" CssClass="btn btn-primary btn-md" />--%>
                </asp:Panel>
                <br />
                <br />
            </div>
            <asp:Button ID="cancelBtn" runat="server" Text="Πίσω" CssClass="btn btn-primary btn-md" OnClick="cancelBtn_Click" style="float:right" />
            <br />
            <br />
            </form>
        </div>
</asp:Content>

<%@ Page Title="Συνολικός Πίνακας Πληρωμών" Language="C#" MasterPageFile="~/Misthodosia.Master" AutoEventWireup="true" CodeBehind="sunolikos_pinakas_pliromon.aspx.cs" Inherits="Web_Misthodosia_Opliton.WebForm13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container-fluid">
        <h2 style="text-align:left">Οικονομικό Έτος: 2015</h2>
        <h3 style="text-align:center">Μισθολόγιο Οπλιτών</h3>
        <form id="form1" runat="server" class="form-inline form-group-sm">
            <asp:GridView ID="TotalPliromes" runat="server" CssClass="table table-hover" DataKeyNames="op_eponymo,op_asm" OnRowDataBound="TotalPliromes_RowDataBound" AutoGenerateColumns="false" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <Columns>
                    <asp:BoundField DataField="r_perigrafi" HeaderText="ΒΑΘΜΟΣ" SortExpression="r_perigrafi">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="op_eponymo" HeaderText="ΕΠΩΝΥΜΟ" SortExpression="op_eponymo">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="op_onoma" HeaderText="ΟΝΟΜΑ" SortExpression="op_onoma">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="op_asm" HeaderText="ΑΣΜ" SortExpression="op_asm">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="kat_name" HeaderText="ΚΑΤΗΓΟΡΙΑ" SortExpression="kat_name">
                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle"></FooterStyle>

                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="kat_katalogisteo" HeaderText="ΚΑΤ." SortExpression="kat_katalogisteo">
                    </asp:BoundField>
                    <asp:BoundField DataField="kat_kratiseis" HeaderText="ΚΡΑΤ." SortExpression="kat_kratiseis"></asp:BoundField>
                    <asp:BoundField DataField="kat_pliroteo" HeaderText="ΠΛΗΡ." SortExpression="kat_pliroteo"></asp:BoundField>
                    <%--<asp:BoundField DataField="kat_dx" HeaderText="Δ.Χ" SortExpression="kat_dx"></asp:BoundField>--%>
                    <%--<asp:BoundField DataField="kat_dp" HeaderText="Δ.Π" SortExpression="kat_dp"></asp:BoundField>--%>
                    <asp:BoundField DataField="Year" HeaderText="ΕΤΟΣ" SortExpression="Year"></asp:BoundField>
                    <asp:BoundField DataField="Jan" HeaderText="ΙΑΝ" SortExpression="Jan"></asp:BoundField>
                    <asp:BoundField DataField="Feb" HeaderText="Φεβ" SortExpression="Feb"></asp:BoundField>
                    <asp:BoundField DataField="Mar" HeaderText="Μαρ" SortExpression="Mar"></asp:BoundField>
                    <asp:BoundField DataField="Apr" HeaderText="Απρ" SortExpression="Apr"></asp:BoundField>
                    <asp:BoundField DataField="May" HeaderText="Μαι" SortExpression="May"></asp:BoundField>
                    <asp:BoundField DataField="Jun" HeaderText="Ιουν" SortExpression="Jun"></asp:BoundField>
                    <asp:BoundField DataField="Jul" HeaderText="Ιουλ" SortExpression="Jul"></asp:BoundField>
                    <asp:BoundField DataField="Aug" HeaderText="Αυγ" SortExpression="Aug"></asp:BoundField>
                    <asp:BoundField DataField="Sep" HeaderText="Σεπ" SortExpression="Sep"></asp:BoundField>
                    <asp:BoundField DataField="Oct" HeaderText="Οκτ" SortExpression="Oct"></asp:BoundField>
                    <asp:BoundField DataField="Nov" HeaderText="Νοε" SortExpression="Nov"></asp:BoundField>
                    <asp:BoundField DataField="Dec" HeaderText="Δεκ" SortExpression="Dec"></asp:BoundField>
                </Columns>

                <FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>

                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>

                <RowStyle ForeColor="#000066"></RowStyle>

                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
            </asp:GridView>
            <div>
                <h3>Αναζήτηση Οπλίτη</h3>
                <div>
                    ΑΣΜ:&nbsp;<asp:TextBox ID="asma" runat="server" Width="110px" Height="30px" CssClass="form-control input-sm" TextMode="Search"></asp:TextBox>&nbsp;
                    Επώνυμο:&nbsp;<asp:TextBox runat="server" ID="lname" Width="150px" Height="30px" CssClass="form-control input-sm" TextMode="Search"></asp:TextBox>&nbsp;
                    <asp:Button ID="search" runat="server" Text="Αναζήτηση" CssClass="btn btn-primary btn-md" OnClick="search_Click" />
                </div>
            </div>
            <br />
            <h3 style="text-align:center">Χρηματικός Λογισμός και Ανακεφαλαίωση</h3>
            <div class="container-fluid">
                <asp:GridView ID="xrimatikos_logismos" runat="server" CellPadding="4" CssClass="table table-hover" GridLines="None" ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                    <EditRowStyle BackColor="#999999"></EditRowStyle>

                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True"></FooterStyle>

                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
            </asp:GridView>
                
                <asp:Button ID="backBtn" runat="server" Text="Πίσω"  CssClass="btn btn-primary btn-md" style="float:right" OnClick="backBtn_Click" />
                <br />
                <br/>
</div>
        </form>
    </div>
</asp:Content>

<%@ Page Title="Διαγραφή Οπλίτη" Language="C#" MasterPageFile="~/Misthodosia.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="diagrafi_opliti.aspx.cs" Inherits="Web_Misthodosia_Opliton.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <h2>Διαγραφή Οπλίτη</h2>
        <asp:Label ID="error" runat="server" CssClass="alert-danger"></asp:Label>
        <form id="form3" runat="server" class="form-inline form-group-sm">
            <h3 style="text-align:center">Συνολικός Πίνακας Οπλιτών</h3>
            <div class="container">
                <asp:GridView ID="TotalOplitis" runat="server" CssClass="table table-hover" AutoGenerateColumns="false" OnRowCommand="TotalOplitis_RowCommand" OnRowDataBound="TotalOplitis_RowDataBound" DataKeyNames="op_id,op_asm,op_eponymo" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-info btn-sm"></asp:CommandField>
                        <asp:BoundField DataField="r_perigrafi" HeaderText="ΒΑΘΜΟΣ" SortExpression="r_perigrafi">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="op_eponymo" HeaderText="ΕΠΩΝΥΜΟ" SortExpression="op_eponymo">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="op_onoma" HeaderText="ΟΝΟΜΑ" SortExpression="op_onoma">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="op_asm" HeaderText="ΑΣΜ" SortExpression="op_asm">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="op_loxos" HeaderText="ΛΟΧΟΣ" SortExpression="op_loxos">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="kat_name" HeaderText="ΚΑΤΗΓΟΡΙΑ" SortExpression="kat_name">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="op_eggrafi" HeaderText="ΗΜ/ΝΙΑ ΕΓΓΡΑΦΗΣ" SortExpression="op_eggrafi">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="op_paratiriseis" HeaderText="ΠΑΡΑΤΗΡΗΣΕΙΣ" SortExpression="op_paratiriseis">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="op_id" HeaderText="A/A" SortExpression="op_id" Visible="false"></asp:BoundField>
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
            <h3>Αναζήτηση Οπλίτη</h3>
            <p>
                ΑΣΜ:&nbsp;<asp:TextBox ID="asmSearch" runat="server" Width="110px" Height="30px" CssClass="form-control input-sm" TextMode="Search">
                </asp:TextBox>&nbsp;&nbsp;
                Επώνυμο:&nbsp;<asp:TextBox runat="server" ID="eponymoSearch" Width="150px" Height="30px" CssClass="form-control input-sm" TextMode="Search"></asp:TextBox>&nbsp;<asp:Button ID="search" runat="server" Text="Αναζήτηση" CssClass="btn btn-primary btn-md" OnClick="search_Click"/>
            </p>
            <h3>Στοιχεία Επιλεγμένου Οπλίτη</h3>
            <asp:Panel ID="deletionPanel" runat="server" Visible="false">
                <p>
                    <strong>ΑΣΜ:</strong>&nbsp;<asp:Label ID="asm" runat="server"></asp:Label>&nbsp;
                    <strong>Βαθμός:</strong>&nbsp;<asp:Label ID="rank" runat="server" ></asp:Label>&nbsp;
                    <strong>Όνομα:</strong>&nbsp;<asp:Label ID="fname" runat="server"></asp:Label>&nbsp;
                    <strong>Επωνυμο:</strong>&nbsp;<asp:Label ID="lname" runat="server"></asp:Label>&nbsp;
                    <strong>Λόχος:</strong>&nbsp;<asp:Label ID="loxos" runat="server"></asp:Label>&nbsp;
                    <strong>Κατηγορία:</strong>&nbsp;<asp:Label ID="category" runat="server"></asp:Label>&nbsp;
                    <asp:Label ID="id" runat="server" Visible="false"></asp:Label>
                </p>
                <p><strong>Ημερομηνία Διαγραφής:</strong>&nbsp;<asp:Label ID="deleteDate" runat="server"></asp:Label>&nbsp;</p>
                <p><strong>Επιβεβαίωση Διαγραφής;</strong>&nbsp; <asp:CheckBox ID="ConfirmCheckBox" runat="server" AutoPostBack="true" OnCheckedChanged="ConfirmCheckBox_CheckedChanged"/>&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Button ID="Submit" runat="server" Text="Διαγραφή Οπλίτη" Visible="false" CssClass="btn btn-primary btn-md" OnClick="Submit_Click"/>
                </p>
                </asp:Panel>

           <p><asp:Button ID="cancel" runat="server" Text="Άκυρο" CssClass="btn btn-primary btn-md" OnClick="cancel_Click"/></p>
        </form>
    </div>
</asp:Content>

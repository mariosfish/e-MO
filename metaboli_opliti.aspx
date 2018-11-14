<%@ Page Title="Μεταβολή Οπλίτη" Language="C#" MasterPageFile="~/Misthodosia.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="metaboli_opliti.aspx.cs" Inherits="Web_Misthodosia_Opliton.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <h2>Μεταβολή Οπλίτη</h2>
        <p>
            <asp:Label ID="Label1" runat="server" CssClass="alert-danger" Visible="false"></asp:Label>
        </p>
        <form id="form" runat="server" class="form-inline form-group-sm">
            <p>
                <asp:Label ID="errorMessage" runat="server" CssClass="alert-danger" Visible="false"></asp:Label>
            </p>
            <h3 style="text-align:center">Συνολικός Πίνακας Οπλιτών</h3>
            <div class="container">
                <asp:GridView ID="GridViewOplitis" CssClass="table  filterable" runat="server" AutoGenerateColumns="false" DataKeyNames="op_id,op_eponymo,op_asm" OnRowCommand="GridViewOplitis_RowCommand" OnRowDataBound="GridViewOplitis_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
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
            <div>
                <h3>Αναζήτηση Οπλίτη</h3>
                <p>
                    ΑΣΜ:&nbsp;<asp:TextBox ID="asma" runat="server" Width="110px" Height="30px" CssClass="form-control input-sm" TextMode="Search"></asp:TextBox>&nbsp;Επώνυμο:&nbsp;<asp:TextBox runat="server" ID="lnameSearch" Width="120px" CssClass="form-control input-sm" TextMode="Search"></asp:TextBox>&nbsp;
                    <asp:Button ID="search" runat="server" Text="Αναζήτηση" class="btn btn-primary btn-sm" OnClick="search_Click" />
                </p>
            </div>
            <h3>Στοιχεία Επιλεγμένου Οπλίτη</h3>
            <p>
                Ημερομηνία Μεταβολής:&nbsp;<asp:TextBox ID="metaboliDate" runat="server" Width="80px" Height="30px" CssClass="form-control input-sm" ReadOnly="true" TextMode="Date"></asp:TextBox>&nbsp;&nbsp;ΑΣΜ:&nbsp;<asp:TextBox ID="asm" runat="server" Width="190px" Height="30px" CssClass="form-control input-sm"></asp:TextBox>&nbsp;
                    Λόχος:&nbsp;<asp:TextBox runat="server" ID="loxos" Width="50px" Height="30px" CssClass="form-control input-sm"></asp:TextBox>
            </p>
            <p>
                Βαθμός:&nbsp;<asp:DropDownList ID="DropDownListRank" runat="server" Width="100px" CssClass="form-control input-sm" DataTextField="r_perigrafi" DataValueField="r_id" Height="30px">
                </asp:DropDownList>&nbsp;&nbsp;
                Όνομα:&nbsp;<asp:TextBox runat="server" Height="30px" ID="fname" Width="120px" CssClass="form-control input-sm"></asp:TextBox>&nbsp;
                Επώνυμο:&nbsp;<asp:TextBox runat="server" ID="lname" Width="150px" Height="30px" CssClass="form-control input-sm"></asp:TextBox><br />
                <br />
                Τρέχουσα Κατηγορία:&nbsp;<asp:TextBox runat="server" ID="currentKatigoria" Width="450px" Height="30px" ReadOnly="true" CssClass="form-control input-sm"></asp:TextBox>&nbsp;<asp:Label runat="server" ID="oplitisid" Visible="false"></asp:Label>
            </p>
            <p><strong>Επιλογή Δικαιολογητικών</strong></p>
            <div class="dropdown">
                <asp:DropDownList ID="Dik_Dropdownlist" runat="server" AutoPostBack="false" CssClass="dropdown" DataTextField="d_perigrafi" DataValueField="d_id"></asp:DropDownList>
                <br />
                <br />
                <asp:Button runat="server" ID="addDik" Text="Προσθήκη" CssClass="btn btn-primary btn-md" OnClick="addDik_Click" />&nbsp;&nbsp;
                    <asp:Button runat="server" ID="removeDik" Text="Διαγραφή" CssClass="btn btn-primary btn-md" OnClick="removeDik_Click" /><br />
                <br />
                <p><strong>Επιλεγμένα Δικαιολογητικά</strong></p>
                <asp:ListBox ID="DikaiologitikaListBox" runat="server" Rows="6" SelectionMode="Multiple"></asp:ListBox>
            </div>
            <br />
            <asp:Button runat="server" ID="CalculateKatigoria" Text="Υπολογισμός Νέας Κατηγορίας" CommandName="save" CssClass="btn btn-primary btn-md" OnClick="CalculateKatigoria_Click" />
            <br />
            <br />
            <p>
                Νέα Κατηγορία:&nbsp;
            <asp:TextBox ID="newKatigoria" runat="server" Width="450px" Height="30px" ReadOnly="true" CssClass="form-control input-sm"></asp:TextBox>
            </p>
            <p>
                Καταλογιστέο:
                    <asp:TextBox runat="server" ID="katalogisteo" Width="60px" CssClass="form-control input-sm" ReadOnly="true" Height="30px"></asp:TextBox>
                &nbsp;€&nbsp; Κρατήσεις:&nbsp;<asp:TextBox runat="server" ID="kratiseis" Width="60px" Height="30px" ReadOnly="true" CssClass="form-control input-sm"></asp:TextBox>&nbsp;€&nbsp; 
                Πληρωτέο:&nbsp;<asp:TextBox runat="server" ID="pliroteo" Width="60px" Height="30px" ReadOnly="true" CssClass="form-control input-sm"></asp:TextBox>&nbsp;€&nbsp;
                Δώρο Χριστουγέννων:&nbsp;<asp:TextBox runat="server" ID="dx" Width="60px" Height="30px" ReadOnly="true" CssClass="form-control input-sm"></asp:TextBox>&nbsp;€&nbsp;
                Δώρο Πάσχα:&nbsp;<asp:TextBox runat="server" ID="dp" Width="60px" Height="30px" ReadOnly="true" CssClass="form-control input-sm"></asp:TextBox>&nbsp;€&nbsp;
            </p>
            <p>Ισχύς Μεταβολής από:&nbsp;<asp:TextBox ID="isxysKatigorias" runat="server" CssClass="form-control input-sm" Width="80px" Height="30px" TextMode="Date"></asp:TextBox></p>
            <br />
            <p><strong>Παρατηρήσεις</strong></p>
            <p>
                <asp:TextBox ID="paratiriseis" runat="server" CssClass="form-control" Rows="3" TextMode="MultiLine"></asp:TextBox></p>
            <br />
            <div>
                <asp:Button ID="cancel" runat="server" Text="Άκυρο" CssClass="btn btn-primary btn-md" OnClick="cancel_Click" />
                &nbsp;
                <asp:Button ID="Submit" runat="server" Text="Μεταβολή Οπλίτη" CssClass="btn btn-primary btn-md" OnClick="Submit_Click" />
            </div>
        </form>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/datepicker.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var dp = $('#<%=isxysKatigorias.ClientID%>');
                dp.datepicker({
                    changeMonth: true,
                    changeYear: true,
                    format: "dd/mm/yyyy",
                    language: "gr"
                }).on('changeDate', function (ev) {
                    $(this).blur();
                    $(this).datepicker('hide');
                });
            });
        </script>
    </div>
    <br />
    <br />
</asp:Content>

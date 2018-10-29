<%@ Page Title="Προσθήκη Οπλίτη" Language="C#" MasterPageFile="~/Misthodosia.Master" UnobtrusiveValidationMode="None" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="prosthiki_opliti.aspx.cs" Inherits="Web_Misthodosia_Opliton.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <h2>Προσθήκη Οπλίτη</h2>
        <form id="form1" runat="server" class="form-inline form-group-sm">
            <asp:Panel runat="server" ID="main">
                <p>
                    <asp:Label ID="errorMessage" runat="server" ForeColor="#cc0000" Visible="false"></asp:Label><asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="#CC0000" HeaderText="Σφάλματα Επικύρωσης" />
                </p>
                <p>
                    Ημερομηνία - Ώρα Εγγραφής:&nbsp;<asp:TextBox ID="insertDate" runat="server" Width="90px" Height="30px" CssClass="form-control input-sm" TextMode="Date" ReadOnly="True"></asp:TextBox>&nbsp;
        ΑΣΜ:&nbsp;<asp:TextBox ID="asm" runat="server" Width="190px" Height="30px" CssClass="form-control input-sm" TextMode="SingleLine"></asp:TextBox>&nbsp;
                    <asp:TextBox ID="aa" runat="server" Visible="false"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Το πεδίο ΑΣΜ είναι υποχρεωτικό." ForeColor="#CC0000" Display="Dynamic" ControlToValidate="asm">*</asp:RequiredFieldValidator>
                </p>
                <p>
                    Βαθμός:&nbsp;<asp:DropDownList ID="DropDownListRank" runat="server" Width="100px" CssClass="form-control input-sm" DataTextField="r_perigrafi" DataValueField="r_id">
                    </asp:DropDownList>
                    &nbsp;&nbsp; Όνομα:&nbsp;<asp:TextBox runat="server" ID="fname" Width="120px" CssClass="form-control input-sm"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Το πεδίο Όνομα είναι υποχρεωτικό." ForeColor="#CC0000" Display="Dynamic" ControlToValidate="fname">*</asp:RequiredFieldValidator>&nbsp;
                    Επώνυμο:&nbsp;<asp:TextBox runat="server" ID="lname" Width="150px" Height="30px" CssClass="form-control input-sm"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Το πεδίο Επώνυμο είναι υποχρεωτικό." ForeColor="#CC0000" Display="Dynamic" ControlToValidate="lname">*</asp:RequiredFieldValidator>&nbsp;
                    Λόχος:&nbsp;<asp:TextBox runat="server" ID="loxos" Width="50px" CssClass="form-control input-sm"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Το πεδίο Λόχος είναι υποχρεωτικό." ForeColor="#CC0000" Display="Dynamic" ControlToValidate="loxos">*</asp:RequiredFieldValidator>
                </p>
                <p><strong>Επιλογή Δικαιολογητικών</strong></p>
                <div class="dropdown">
                    <asp:DropDownList ID="DikaiologitikaDropdownlist" runat="server" CssClass="dropdown" DataTextField="d_perigrafi" DataValueField="d_id">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Button runat="server" ID="addDik" Text="Προσθήκη" CommandName="save" CssClass="btn btn-primary btn-md" OnClick="addDik_Click" />&nbsp;&nbsp;
                    <asp:Button runat="server" ID="removeDik" Text="Διαγραφή" CommandName="save" CssClass="btn btn-primary btn-md" OnClick="removeDik_Click" /><br />
                    <br />
                    <p><strong>Επιλεγμένα Δικαιολογητικά</strong></p>
                    <asp:ListBox ID="DikaiologitikaListBox" runat="server" Rows="6" SelectionMode="Multiple"></asp:ListBox>
                </div>
                <br />
                <asp:Button runat="server" ID="CalculateKatigoria" Text="Υπολογισμός Κατηγορίας" CommandName="save" CssClass="btn btn-primary btn-md" OnClick="CalculateKatigoria_Click" />
                <br />
                <br />
                <p>
                    Κατηγορία:&nbsp;<asp:TextBox ID="TextboxKatigoria" runat="server" Width="450px" Height="30px" CssClass="form-control input-sm" ReadOnly="true"></asp:TextBox>
                </p>
                <p>
                    Καταλογιστέο:&nbsp;
                    <asp:TextBox runat="server" ID="katalogisteo" Width="60px" CssClass="form-control input-sm" ReadOnly="True" OnDataBinding="Page_Load" TextMode="SingleLine"></asp:TextBox>
                    &nbsp;€&nbsp; 
                    Κρατήσεις:&nbsp;<asp:TextBox runat="server" ID="kratiseis" Width="60px" CssClass="form-control input-sm" ReadOnly="True" TextMode="SingleLine"></asp:TextBox>&nbsp;€&nbsp;
                    Πληρωτέο:&nbsp;<asp:TextBox runat="server" ID="pliroteo" Width="60px" CssClass="form-control input-sm" ReadOnly="True" TextMode="SingleLine"></asp:TextBox>&nbsp;€&nbsp;
                    Δώρο Χριστουγέννων:&nbsp;<asp:TextBox runat="server" ID="dx" Width="60px" CssClass="form-control input-sm" ReadOnly="True" TextMode="SingleLine"></asp:TextBox>&nbsp;€&nbsp;
                    Δώρο Πάσχα:&nbsp;<asp:TextBox runat="server" ID="dp" Width="60px" CssClass="form-control input-sm" ReadOnly="True" TextMode="SingleLine"></asp:TextBox>&nbsp;€&nbsp;
                </p>
                <br />
                <p>
                    Ημερομηνία Τελ. Πληρωμής (ΦΔΜ):&nbsp;<asp:TextBox ID="lastPayDate" runat="server" Width="90px" CssClass="form-control input-sm" TextMode="DateTime"></asp:TextBox>&nbsp;
                  Κατηγορία Οπλίτη στο ΦΔΜ:&nbsp;<asp:DropDownList ID="katigoriaFDM" runat="server" Width="450px" CssClass="dropdown" DataTextField="kat_name" DataValueField="kat_id">
                    </asp:DropDownList>
                </p>
                <p>Παρατηρήσεις:</p>
                <p>
                    <asp:TextBox ID="paratiriseis" runat="server" CssClass="form-control" Rows="3" TextMode="MultiLine"></asp:TextBox>
                </p>
                <br />
                <div>
                    <asp:Button runat="server" ID="cancelBtn" Text="Άκυρο" CssClass="btn btn-primary btn-md" OnClick="cancelBtn_Click" />
                    <asp:Button runat="server" ID="reset" Text="Καθαρισμός Φόρμας" CssClass="btn btn-primary btn-md" CausesValidation="False" OnClick="reset_Click" />
                    &nbsp;&nbsp;
                    <asp:Button runat="server" ID="saveButton" Text="Προσθήκη Οπλίτη" CommandName="save" CssClass="btn btn-primary btn-md" OnClick="saveButton_Click" />
                    <br />
                    <br />
                </div>
            </asp:Panel>
        </form>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/datepicker.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var dp = $('#<%=lastPayDate.ClientID%>');
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
</asp:Content>

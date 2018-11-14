<%@ Page Title="Αναφορά Προσθήκης" Language="C#" MasterPageFile="~/Misthodosia.Master" AutoEventWireup="true" CodeBehind="anafora_prosthikis.aspx.cs" Inherits="Web_Misthodosia_Opliton.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <form id="formAnaforaProsth" runat="server" class="form-inline form-group-sm">

            <asp:Panel runat="server" ID="main">
                <h3>
                    <asp:Label ID="success" runat="server" Text="Ο οπλίτης με τα κάτωθι στοιχεία εγγράφηκε με επιτυχία στο σύστημα!" CssClass=" alert alert-success"></asp:Label>
                </h3>
                <br />
                <p>
                    <strong>Ημερομηνία Εγγραφής:</strong>&nbsp;<asp:Label ID="insertDate" runat="server"></asp:Label>&nbsp;
                    <strong>ΑΣΜ:</strong>&nbsp;<asp:Label ID="asm" runat="server"></asp:Label>
                </p>
                <p>
                    <strong>Βαθμός:</strong>&nbsp;<asp:Label ID="rank" runat="server"></asp:Label>&nbsp;&nbsp;
                   <strong>Όνομα:</strong>&nbsp;<asp:Label runat="server" ID="fname"></asp:Label>&nbsp;&nbsp;
                    <strong>Επώνυμο:</strong>&nbsp;<asp:Label runat="server" ID="lname"></asp:Label>&nbsp; &nbsp;
                    <strong>Λόχος:</strong>&nbsp;<asp:Label runat="server" ID="loxos"></asp:Label>
                </p>
                <p><strong>Δικαιολογητικά που έχει προσκομίσει</strong></p>
                <div class="list-group-item">
                    <asp:BulletedList ID="BulletedList1" runat="server" DataTextField="d_perigrafi" DataValueField="d_perigrafi"></asp:BulletedList>
                </div>
                <br />
                <p><strong>Κατηγορία στην οποία εντάσσεται</strong></p>
                <p>
                    <asp:Label ID="LabelKatigoria" runat="server"></asp:Label></p>
                <p>
                    <strong>Καταλογιστέο:</strong>&nbsp;<asp:Label runat="server" ID="katalogisteo"></asp:Label>&nbsp;€&nbsp;
                   <strong>Κρατήσεις:</strong>&nbsp;<asp:Label runat="server" ID="kratiseis"></asp:Label>&nbsp;€&nbsp;
                   <strong>Πληρωτέο:</strong>&nbsp;<asp:Label runat="server" ID="pliroteo"></asp:Label>&nbsp;€&nbsp;
                    <strong>Δώρο Χριστουγέννων:</strong>&nbsp;<asp:Label runat="server" ID="dx"></asp:Label>&nbsp;€&nbsp;
                    <strong>Δώρο Πάσχα:</strong>&nbsp;<asp:Label runat="server" ID="dp"></asp:Label>&nbsp;€&nbsp;
                </p>
                <p><strong>Ημερομηνία Τελ. Πληρωμής (ΦΔΜ):</strong>&nbsp;<asp:Label ID="fdm" runat="server"></asp:Label></p>
                <p><strong>Παρατηρήσεις</strong></p>
                <p>
                    <asp:Label ID="paratiriseis" runat="server"></asp:Label>
                </p>
                <br />
                <br />
                <asp:Button ID="ButtonBack" runat="server" Text="Πίσω" CssClass="btn btn-primary" OnClick="ButtonBack_Click" />
                <br />
                <br />
            </asp:Panel>
        </form>
    </div>
</asp:Content>

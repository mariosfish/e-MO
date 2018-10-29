<%@ Page Title="Αναφορά Μεταβολής" Language="C#" MasterPageFile="~/Misthodosia.Master" AutoEventWireup="true" CodeBehind="anafora_metabolis.aspx.cs" Inherits="Web_Misthodosia_Opliton.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <form id="formAnaforaMetaboli" runat="server" class="form-inline form-group-sm">
            <%--<div class="jumbotron">--%>
            <asp:Panel runat="server" ID="main">
                <h3 class="alert alert-success">Τα στοιχεία του κάτωθι οπλίτη ενημερώθηκαν με επιτυχία στο σύστημα!</h3>
                <br />
                <p>
                    <strong>Ημερομηνία Ενημέρωσης:</strong>&nbsp;<asp:Label ID="metaboliDate" runat="server"></asp:Label>&nbsp;
                    <strong>ΑΣΜ:</strong>&nbsp;<asp:Label ID="asm" runat="server"></asp:Label>
                    <asp:Label ID="aa" runat="server"></asp:Label>
                </p>
                <p>
                    <strong>Βαθμός:</strong>&nbsp;<asp:Label ID="rank" runat="server"></asp:Label>&nbsp;
                    <strong>Όνομα:</strong>&nbsp;<asp:Label runat="server" ID="fname"></asp:Label>&nbsp;
                    <strong>Επώνυμο:</strong>&nbsp;<asp:Label runat="server" ID="lname"></asp:Label>&nbsp; 
                    <strong>Λόχος:</strong>&nbsp;<asp:Label runat="server" ID="loxos"></asp:Label>
                </p>
                <br />
                <p><strong>Δικαιολογητικά που έχει προσκομίσει</strong></p>
                <div class="list-group-item">
                    <asp:BulletedList ID="BulletedListDikaiologitika" runat="server" CssClass="checkbox"  DataTextField="d_perigrafi" DataValueField="d_perigrafi">
                    </asp:BulletedList>
                </div>
                <br />
                <p><strong>Κατηγορία στην οποία έχει ενταχθεί</strong></p>
                <p>
                    <asp:Label ID="LabelKatigoria" runat="server" CssClass="list-group-item"></asp:Label>
                </p>
                <p>
                    <strong>Καταλογιστέο:</strong>&nbsp;<asp:Label runat="server" ID="katalogisteo"></asp:Label>&nbsp;€&nbsp; 
                    <strong>Κρατήσεις:</strong>&nbsp;<asp:Label runat="server" ID="kratiseis"></asp:Label>&nbsp;€&nbsp;
                    <strong>Πληρωτέο:</strong>&nbsp;<asp:Label runat="server" ID="pliroteo"></asp:Label>&nbsp;€&nbsp;
                    <strong>Δώρο Χριστουγέννων:</strong>&nbsp;<asp:Label runat="server" ID="dx"></asp:Label>&nbsp;€&nbsp;
                    <strong>Δώρο Πάσχα:</strong>&nbsp;<asp:Label runat="server" ID="dp"></asp:Label>&nbsp;€&nbsp;
                </p>
                <p><strong>Ισχύς Μεταβολής από:</strong>&nbsp;<asp:Label runat="server" ID="isxysMetabolis"></asp:Label></p>
                <br />
                <p><strong>Παρατηρήσεις</strong></p>
                <br />
                <br />
                <p>
                    <asp:Label ID="paratiriseis" runat="server"></asp:Label>
                </p>
                <asp:Button ID="ButtonBack" runat="server" Text="Πίσω" CssClass="btn btn-primary" OnClick="ButtonBack_Click" />
                <br />
                <br />
            </asp:Panel>
        </form>
    </div>
</asp:Content>

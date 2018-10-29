<%@ Page Title="" Language="C#" MasterPageFile="~/Misthodosia.Master" AutoEventWireup="true" CodeBehind="anafora_pliromis.aspx.cs" Inherits="Web_Misthodosia_Opliton.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <form id="formAnaforaPliromis" runat="server" class="form-inline form-group-sm">
            <asp:Panel runat="server" ID="main">
                <h3 class="alert alert-success">Η πληρωμή για τον κάτωθι οπλίτη πραγματοποιήθηκε με επιτυχία!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   Α/Α Πληρωμής:&nbsp;<asp:Label ID="aaPliromis" runat="server"></asp:Label>
                </h3>
                <p>
                    <strong>Ημερομηνία Πληρωμής:</strong>&nbsp;<asp:Label ID="payDate" runat="server"></asp:Label>&nbsp;
        <strong>ΑΣΜ:</strong>&nbsp;<asp:Label ID="asm" runat="server"></asp:Label>
                </p>
                <p>
                    <strong>Βαθμός:</strong>&nbsp;<asp:Label ID="rank" runat="server"></asp:Label>&nbsp;&nbsp;
                    <strong>Όνομα:</strong>&nbsp;<asp:Label runat="server" ID="fname"></asp:Label>&nbsp;
                    <strong>Επώνυμο:</strong>&nbsp;<asp:Label runat="server" ID="lname"></asp:Label>&nbsp; 
                    <strong>Λόχος:</strong>&nbsp;<asp:Label runat="server" ID="loxos"></asp:Label>
                </p>
                <br />
                <p><strong>Δικαιολογητικά που έχει προσκομίσει</strong></p>
                <div class="list-group-item">
                    <asp:BulletedList ID="dikaiologitika" runat="server" DataTextField="d_perigrafi"></asp:BulletedList>
                </div>
                <asp:Label ID="opid" runat="server" Visible="false"></asp:Label>
                <br />
                <br />
                <p><strong>Κατηγορία στην οποία έχει ενταχθεί</strong></p>
                <p>
                    <asp:Label ID="katigoria" runat="server"></asp:Label>
                </p>
                <p>
                    <strong>Καταλογιστέο:</strong>&nbsp;
                    <asp:Label runat="server" ID="katalogisteo"></asp:Label>&nbsp;€&nbsp; 
                    <strong>Κρατήσεις:</strong>&nbsp;<asp:Label runat="server" ID="kratiseis"></asp:Label>&nbsp;€&nbsp;
                    <strong>Πληρωτέο:</strong><asp:Label runat="server" ID="pliroteo"></asp:Label>&nbsp;€
                </p>
                <p>
                    <strong>Τύπος Πληρωμής:</strong>&nbsp;<asp:Label runat="server" ID="payType"></asp:Label>
                </p>
                <p>
                    <strong>Ποσό Πληρωμής:</strong>&nbsp<asp:Label runat="server" ID="posoPliromis"></asp:Label>&nbsp;€
                </p>
                <p>
                    <strong>Ημερομηνία Πληρωμής:</strong>&nbsp;<asp:Label ID="priromiDate" runat="server"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="paratiriseis" runat="server"></asp:Label>
                </p>
                <br />
                <br />
                <asp:Button ID="ButtonBack" runat="server" Text="Πίσω" CssClass="btn btn-primary" OnClick="ButtonBack_Click" />&nbsp;&nbsp;
                <asp:Button ID="ButtonApodeixi" runat="server" Text="Απόδειξη Πληρωμής" CssClass="btn btn-primary" OnClick="ButtonApodeixi_Click" />
                <br />
                <br />
            </asp:Panel>
        </form>
    </div>
</asp:Content>
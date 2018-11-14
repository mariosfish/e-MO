<%@ Page Title="Αναφορά Διαγραφής" Language="C#" MasterPageFile="~/Misthodosia.Master" AutoEventWireup="true" CodeBehind="anafora_diagrafis.aspx.cs" Inherits="Web_Misthodosia_Opliton.WebForm12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <form id="form3" runat="server" class="form-inline form-group-sm">
            <h3 class="alert alert-success">Ο οπλίτης διαγράφηκε με επιτυχία και καταχωρήθηκε στο αρχείο!</h3>
            <asp:Button ID="ButtonBack" runat="server" Text="Πίσω" CssClass="btn btn-primary" OnClick="ButtonBack_Click" />
        </form>
    </div>
    <br />
    <br />
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Misthodosia.Master" AutoEventWireup="true" CodeBehind="apodeixi_pliromis.aspx.cs" Inherits="Web_Misthodosia_Opliton.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div class="container">
        <h2 class="text-justify">Απόδειξη Πληρωμής Οπλίτη</h2>
        
        <h3><strong>A/A Πληρωμής:&nbsp;[aa]</strong></h3>
        <br />
        <p class="text-left">
            Ο κάτωθι υπογεγραμμένος οπλίτης [rank] [lname] [fname]<br />
            με ΑΣΜ:&nbsp;[asm] μισθοδοτήθηκε τον μήνα&nbsp;[month]&nbsp;[year] <br />
            με [tuposPliromis] με την [date].
        </p>
        <br />
        <br />

        <asp:Table runat="server" ID="table" CssClass="text-center">
            <asp:TableRow>
                <asp:TableCell>-O-</asp:TableCell>
                <asp:TableCell>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:TableCell>
                <asp:TableCell>-O-</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Δχστης Χρηματικού</asp:TableCell>
                <asp:TableCell>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:TableCell>
                <asp:TableCell>Μισθοδοτούμενος</asp:TableCell>
            </asp:TableRow>

        </asp:Table>
    </div>

</asp:Content>

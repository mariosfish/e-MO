<%@ Page Title="" Language="C#" MasterPageFile="~/Misthodosia.Master" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="login.aspx.cs" Inherits="Web_Misthodosia_Opliton.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <%--login forma--%>
        <form class="form-signin" id="form1" name="loginForm" runat="server">
            <asp:Label ID="error" runat="server" ForeColor="#CC0000"></asp:Label>
            <h3 class="form-signin-heading">Σύνδεση Χρήστη</h3>
            <p class="form-signin-heading">
                <asp:TextBox ID="inputUsername" runat="server" CssClass="form-control" placeholder="Όνομα χρήστη"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorUN" runat="server" ErrorMessage="Απαιτείται όνομα χρήστη." ControlToValidate="inputUsername" ForeColor="#CC0000" Display="None"></asp:RequiredFieldValidator>
                <asp:TextBox ID="inputPassword" runat="server" CssClass="form-control" placeholder="Κωδικός" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorPW" runat="server" ErrorMessage="Απαιτείται κωδικός." ControlToValidate="inputPassword" ForeColor="#CC0000" Display="none"></asp:RequiredFieldValidator>
            </p>
            <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="#CC0000" DisplayMode="BulletList" HeaderText="Σφάλματα Επικύρωσης" />
            <br />
            <asp:Button runat="server" class="btn btn-md btn-primary btn-group" Width="64%" ID="login" Text="Σύνδεση" OnClick="login_Click"></asp:Button>
            <div>&nbsp;</div>
            <asp:Button runat="server" class="btn btn-md btn-primary btn-group" Width="64%" ID="Button1" Text="Νέος Χρήστης" CausesValidation="False" OnClick="Button1_Click"></asp:Button>
        </form>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <link rel="stylesheet" type="text/css" href="css/signin.css" />
</asp:Content>

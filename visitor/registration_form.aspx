<%@ Page Title="" Language="C#" MasterPageFile="~/Misthodosia.Master" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="registration_form.aspx.cs" Inherits="Web_Misthodosia_Opliton.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <form id="registForm" runat="server" name="registration form">
        <div class="container">
            <section class="container">
                <div class="container-page">
                    <div class="col-md-8">
                        <h3 class="dark-grey">Εγγραφή</h3>
                        <asp:Label ID="error" runat="server" ForeColor="#CC0000"></asp:Label>
                        <div class="form-group col-md-8">
                            <label>Όνομα Χρήστη&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorUN" runat="server" ErrorMessage="Απαιτείται όνομα χρήστη." ControlToValidate="username" ForeColor="#CC0000" Display="Dynamic">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidatorUN" runat="server" ErrorMessage="Το όνομα χρήστη θα πρέπει να περιέχει μόνο αλφαριθμητικούς  χαρακτήρες." ForeColor="#CC0000" ValidationExpression="^[a-z0-9_-]{3,15}$" ControlToValidate="username" Display="Dynamic">*</asp:RegularExpressionValidator></label>
                            <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Κωδικός&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorPW" runat="server" ErrorMessage="Απαιτείται κωδικός." ForeColor="#CC0000" ControlToValidate="password" Display="Dynamic" ViewStateMode="Disabled">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidatorPW" runat="server" ErrorMessage="Ο κωδικός θα πρέπει να έχει 6-10 χαρακτήρες και να περιέχεται τουλάχιστον  ένας ειδικός χαρακτήρας, ένας αριθμός και ένα κεφαλαίο γράμμα." ControlToValidate="password" Display="Dynamic" ForeColor="#CC0000" ValidationExpression="^.*(?=.{6,10})(?=.*[\d])(?=.*[\W]).*$">*</asp:RegularExpressionValidator></label>
                            <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Επανάληψη κωδικού&nbsp;&nbsp;<asp:CompareValidator ID="CompareValidator" runat="server" ErrorMessage="Οι κωδικοί δεν ταιριάζουν." ControlToCompare="password" ControlToValidate="repass" ForeColor="#CC0000" Display="Dynamic">*</asp:CompareValidator></label>
                            <asp:TextBox ID="repass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Βαθμός&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorR" runat="server" ErrorMessage="Απαιτείται εισαγωγή βαθμού." ForeColor="#CC0000" ControlToValidate="rank" Display="Dynamic">*</asp:RequiredFieldValidator></label>
                            <asp:TextBox ID="rank" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Όνομα&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorFname" runat="server" ErrorMessage="Απαιτείται εισαγωγή όνοματος." ControlToValidate="fname" ForeColor="#CC0000" Display="Dynamic">*</asp:RequiredFieldValidator></label>
                            <asp:TextBox ID="fname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Επώνυμο&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorLname" runat="server" ErrorMessage="Απαιτείται εισαγωγή επωνύμου." ControlToValidate="lname" ForeColor="#CC0000" Display="Dynamic">*</asp:RequiredFieldValidator></label>
                            <asp:TextBox ID="lname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group col-md-6">
                            <label>Μονάδα&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorMonada" runat="server" ErrorMessage="Απαιτείται εισαγωγή Μονάδας." ControlToValidate="monada" ForeColor="#CC0000" Display="Dynamic">*</asp:RequiredFieldValidator></label>
                            <asp:TextBox ID="monada" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group col-md-6">
                            <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="#CC0000" HeaderText="Σφάλματα Επικύρωσης" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h3 class="dark-grey">Terms and Conditions</h3>
                        <p>
                            By clicking on "Register" you agree to The Company's' Terms and Conditions
                        </p>
                        <p>
                            While rare, prices are subject to change based on exchange rate fluctuations - 
					should such a fluctuation happen, we may request an additional payment. You have the option to request a full refund or to pay the new price. (Paragraph 13.5.8)
                        </p>
                        <p>
                            Should there be an error in the description or pricing of a product, we will provide you with a full refund (Paragraph 13.5.6)
                        </p>
                        <p>
                            Acceptance of an order by us is dependent on our suppliers ability to provide the product. (Paragraph 13.5.6)
                        </p>

                        <asp:Button runat="server" ID="register" Text="Εγγραφή" CssClass="btn btn-primary" CausesValidation="true" OnClick="register_Click" />
                        <asp:Button runat="server" ID="backButton" Text="Πίσω" CssClass="btn btn-primary" CausesValidation="false" OnClick="backButton_Click" />
                    </div>
                </div>
            </section>
        </div>
    </form>
    <br />
    <br />
    <link rel="stylesheet" href="css/signin.css" type="text/css" />
</asp:Content>

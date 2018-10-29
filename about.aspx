<%@ Page Title="Περί e-MO" Language="C#" MasterPageFile="~/Misthodosia.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="about.aspx.cs" Inherits="Web_Misthodosia_Opliton.WebForm14" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <link href="css/blog.css" type="text/css" rel="stylesheet" />
    <%--<div class="blog-masthead">
        <div class="container">
            <a class="blog-nav-item1 active" href="#mid">Αποστολή</a>
            <a class="blog-nav-item1" href="#mid2">Λειτουργία</a>
            <a class="blog-nav-item1" href="#end">Στόχοι</a>
            <a class="blog-nav-item1" href="#end2">Μελλοντικοί Στόχοι</a>
            <a class="blog-nav-item1" href="#mail">Υποβολή Προτάσεων - Ιδεών - Προβλημάτων</a>
        </div>
    </div>--%>
    <div class="container">
        <div class="blog-header">
            <h1 class="blog-title" id="top">Περί e-MO</h1>
            <h3>Ηλεκτρονική εφαρμογή διαχείρισης μισθοδοσίας οπλιτών.</h3>
        </div>
        <div class="col-sm-8 blog-main">
            <div class="blog-post">
                <h2 class="blog-post-title">Αποστολή</h2>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;Αποστολή μας είναι η επίτευξη της εύρυθμης και ορθολογικής λειτουργίας των διαχειρίσεων Μ.Ο. πανελλαδικώς, ο εκσυγχρονισμός των τηρούμενων διαδικασιών και η παροχή υπηρεσιών μέσω ποιοτικών και ελεγχόμενων διαδικασιών.</p>
                <hr />
            </div>
            <div class="blog-post">
                <h2 class="blog-post-title" id="mid2">Λειτουργία</h2>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;Τήρηση ηλεκτρονικά όλων των προβλεπόμενων – τηρούμενων βιβλίων νέου τύπου του διαχειριστή του Μ.Ο., αποθήκευση σε ηλεκτρονική βάση των δεδομένων των οπλιτών (δικαιολογητικά, κατηγορίες, ιστορικό πληρωμών, ημερομηνίες έναρξης και λήξης πληρωμών κ.τ.λ.), καθώς και εκτέλεση αυτόματα της μισθοδοσίας των οφειλούμενων ποσών που δικαιούται ο κάθε οπλίτης ανά μήνα.</p>
                <hr />
            </div>
            <div class="blog-post">
                <h2 class="blog-post-title" id="end">Τι επιτυγχάνεται;</h2>
                <ul>
                    <li>Τυποποίηση διαδικασίας – αυτοματοποίηση.</li>
                    <li>Ομοιομορφία τήρησης Μ.Ο. πανελλαδικώς.</li>
                    <li>Περιορισμός χρόνου καταχώρησης.</li>
                    <li>Περιορισμός λαθών κι εύκολος εντοπισμός.</li>
                    <li>Ασφάλεια (προσωπικοί κωδικοί χρηστών – ηλεκτρονικό ίχνος).</li>
                    <li>Διευκόλυνση ελέγχου του Διαχειριστή από τα αρμόδια όργανα (Διοικητής και Ε.Ο.Υ.)</li>
                </ul>
                <hr />
            </div>
            <div class="blog-post">
                <h2 class="blog-post-title" id="end2">Μελλοντικοί Στόχοι</h2>
                <ul>
                    <li>Τήρηση ενιαίας Βάσης Δεδομένων των στρατευσίμων οπλιτών πανελλαδικώς</li>
                    <li>Διασύνδεση της Βάσης Δεδομένων με την αντίστοιχη της Στρατολογίας.</li>
                    <li>Διευκόλυνση  Δ.Ε.Ο./Τ.Ε.Ο. (εξ αποστάσεως έλεγχος με προσωπικούς κωδικούς).</li>
                    <li>Μεταφορά όλων των χειρόγραφα τηρούμενων βιβλίων των διαχειρίσεων του Στρατού Ξηράς και διασύνδεσή τους σε ένα ενιαίο σύστημα.</li>
                </ul>
                <hr />
            </div>
            <div class="blog-post">
                <h4 class="blog-post-title" id="mail">Υποβολή Προτάσεων - Ιδεών - Προβλημάτων</h4>
                <br />
                <form id="email" runat="server" class="form-inline form-group-sm">
                    <p>Βαθμός:&nbsp;<asp:TextBox ID="TextBox1" runat="server" Width="100px" CssClass="form-control input-sm"></asp:TextBox>&nbsp;&nbsp;Ονοματεπώνυμο:&nbsp;<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control input-sm" Width="249px"></asp:TextBox></p>
                    <p>Μονάδα:&nbsp;<asp:TextBox ID="TextBox6" runat="server" CssClass="form-control input-sm" Width="150px"></asp:TextBox>&nbsp;E-mail:&nbsp;<asp:TextBox ID="TextBox5" runat="server" CssClass="form-control input-sm" Width="284px"></asp:TextBox></p>
                    <p>Θέμα:&nbsp;<asp:TextBox ID="TextBox3" runat="server" CssClass="form-control input-sm" Width="523px"></asp:TextBox></p>
                    <p>Μήνυμα:</p>
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Width="574px" Rows="6"></asp:TextBox><br />
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Υποβολή" CssClass="btn btn-primary btn-md" />
                    <br />
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="Πίσω" style="float:right" CssClass="btn btn-primary btn-md" OnClick="Button2_Click" />

                </form>
            </div>
        </div>
        <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
            <div class="sidebar-module sidebar-module-inset">
                <h4>Βιβλιοθήκη</h4>
                <ul>
                    <li><a href="#">Εγχειρίδιο Χρήσης</a></li>
                    <li><a href="#">ΠαΔ 8-22/1999 «Περί Λειτουργίας Υπηρεσίας Χρηματικού Υπομονάδος»</a></li>
                    <li><a href="#">Καρτέλα Μισθολόγιο Οπλιτών</a></li>
                    <li><a href="#">Υπόδειγμα Βιβλίο Μισθολόγιο Οπλιτών</a></li>
                </ul>
                <h4>Σχετικές Διαταγές</h4>
                <ul>
                    <li><a href="#">Φ.841/49/812269/Σ.2611/08 Μαϊ 15/ΓΕΣ/ΔΟΙ/4α</a></li>
                    <li><a href="#">Φ.841/1/85879/Σ.275/08 Μαϊ 13/ΔΥΒ/ΔΟΙ</a></li>
                    <li><a href="#">Φ.820/76/87433/Σ.650/17 Αυγ 12/ΔΥΒ/ΔΟΙ</a></li>
                    <li><a href="#">Φ.820/210/821873/Σ.6271/23 Ιουλ 08/ΓΕΣ/ΔΟΙ/3α</a></li>
                </ul>
            </div>
            <br />
            <div class="sidebar-module">
                <h4>Χρήσιμοι Σύνδεσμοι</h4>
                <ol class="list-unstyled">
                    <li>
                        <img src="img/YPETHA_logo.png" width="60px" />&nbsp;<a href="http://www.mod.mil.gr/mod/el/">Υπουργείο Εθνικής Άμυνας</a></li>
                    <li>
                        <img src="img/geetha.png" />&nbsp;<a href="http://www.geetha.mil.gr/el/">Γενικό Επιτελείο Εθνικής Αμύνης</a></li>
                    <li>
                        <img src="img/ges.png" width="60px" />&nbsp;<a href="http://www.army.gr/">Γενικό Επιτελείο Στρατού</a></li>
                    <li>
                        <img src="img/geetha.png" />&nbsp;<a href="https://www.stratologia.gr/">Στρατολογία</a></li>
                </ol>
            </div>
            <div class="sidebar-module sidebar-module-inset">
                <h4>Επικοινωνία</h4>
                <ul>
                    <li>Υπλγός(ΠΖ) Ζαφειράκης Απόστολος Κιν.: 6936161301</li>
                    <li>Υπλγός(Ο) Μπορονίλο Όλγα <br /> Κιν.: 6955354195</li>
                    <li>Υπλγός(ΠΒ) Μιχαλόπουλος Μάριος Κιν.: 6938484262</li>
                </ul>
            </div>
        </div>
    </div>


</asp:Content>

<%@ Page Title="Πληρωμή Οπλίτη" Language="C#" MasterPageFile="~/Misthodosia.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="pliromi_opliti.aspx.cs" Inherits="Web_Misthodosia_Opliton.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <h2>Πληρωμή Οπλίτη</h2>
        <form id="form1" runat="server" class="form-inline form-group-sm">
            <h3 style="text-align: center">Συνολικός Πίνακας Οπλιτών</h3>
            <h4>
                <asp:Label ID="error" runat="server" CssClass="alert-danger" Visible="false"></asp:Label></h4>
            <div class="container">
                <asp:GridView ID="TotalOplitis" CssClass="table table-hover" AutoGenerateColumns="false" DataKeyNames="op_id" runat="server" OnRowDataBound="TotalOplitis_RowDataBound" OnRowCommand="TotalOplitis_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                        <asp:BoundField DataField="op_id" SortExpression="op_id" Visible="false">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        </asp:BoundField>
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
                <div>
                    ΑΣΜ:&nbsp;<asp:TextBox ID="asma" runat="server" Width="110px" Height="30px" CssClass="form-control input-sm" TextMode="Search"></asp:TextBox>&nbsp;
                    Επώνυμο:&nbsp;<asp:TextBox runat="server" ID="lname" Width="150px" Height="30px" CssClass="form-control input-sm" TextMode="Search"></asp:TextBox>&nbsp;
                    <asp:Button ID="search" runat="server" Text="Αναζήτηση" CssClass="btn btn-primary btn-md" OnClick="search_Click" /><asp:Label ID="aa" runat="server" Visible="false"></asp:Label>
                </div>
            </div>
            <div class="container">
                <asp:Panel ID="lastPaymentsPanel" runat="server" Visible="false">
                    <h3 style="text-align: center">Προηγούμενες Πληρωμές Οπλίτη</h3>
                    <asp:GridView ID="LastPayments" CssClass="table table-hover" runat="server" AutoGenerateColumns="false" DataKeyNames="p_id" CellPadding="4" OnRowCommand="LastPayments_RowCommand" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                        <Columns>
                            <asp:ButtonField CommandName="Select" Text="Επιλογή" ButtonType="Button" ControlStyle-CssClass="btn btn-info btn-sm"></asp:ButtonField>
                            <asp:BoundField DataField="r_perigrafi" SortExpression="r_perigrafi" HeaderText="ΒΑΘΜΟΣ"></asp:BoundField>
                            <asp:BoundField DataField="op_eponymo" HeaderText="ΕΠΩΝΥΜΟ" SortExpression="op_eponymo"></asp:BoundField>
                            <asp:BoundField DataField="op_onoma" HeaderText="ΟΝΟΜΑ" SortExpression="op_onoma"></asp:BoundField>
                            <asp:BoundField DataField="p_id" HeaderText="Α/Α ΠΛΗΡΩΜΗΣ" SortExpression="p_id"></asp:BoundField>
                            <asp:BoundField DataField="p_date" HeaderText="ΗΜ/ΝΙΑ ΠΛΗΡΩΜΗΣ" SortExpression="p_date"></asp:BoundField>
                            <asp:BoundField DataField="m_perigrafi" HeaderText="ΤΥΠΟΣ ΠΛΗΡΩΜΗΣ" SortExpression="m_perigrafi"></asp:BoundField>
                            <asp:BoundField DataField="p_posoPliromis" HeaderText="ΠΟΣΟ ΣΕ ΕΥΡΩ" SortExpression="p_posoPliromis"></asp:BoundField>
                            <asp:BoundField DataField="p_id" SortExpression="p_id" Visible="False"></asp:BoundField>
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
                    <asp:Button ID="anaforaPliromis" runat="server" Text="Αναλυτικά Στοιχεία Πληρωμής" CssClass="btn btn-primary btn-md" OnClick="anaforaPliromis_Click" OnClientClick="form1.target =('_blank';)" /><asp:Label ID="aaPliromis" runat="server" Visible="false"></asp:Label>
                </asp:Panel>
            </div>
            <br />
            <p>
                <strong>Κατηγορία:</strong> &nbsp;<asp:TextBox runat="server" ID="katigoria" Width="450px" CssClass="form-control input-sm" ReadOnly="True"></asp:TextBox>
            </p>
            <p>
                <strong>Καταλογιστέο:</strong>&nbsp;<asp:TextBox runat="server" ID="katalogisteo" Width="60px" CssClass="form-control input-sm" ReadOnly="True"></asp:TextBox>&nbsp;€&nbsp;
                <strong>Κρατήσεις:</strong>&nbsp;<asp:TextBox runat="server" ID="kratiseis" Width="60px" CssClass="form-control input-sm" ReadOnly="True"></asp:TextBox>&nbsp;€&nbsp;
                <strong>Πληρωτέο:</strong>&nbsp;<asp:TextBox runat="server" ID="pliroteo" Width="60px" CssClass="form-control input-sm" ReadOnly="True"></asp:TextBox>&nbsp;€&nbsp;
                <strong>Δώρο Χριστουγέννων:</strong>&nbsp;<asp:TextBox runat="server" ID="dx" Width="60px" CssClass="form-control input-sm" ReadOnly="True"></asp:TextBox>&nbsp;€&nbsp;
                <strong>Δώρο Πάσχα:</strong>&nbsp;<asp:TextBox runat="server" ID="dp" Width="60px" CssClass="form-control input-sm" ReadOnly="True"></asp:TextBox>&nbsp;€&nbsp;
            </p>
            <p>
                <strong>Δικαιολογητικά:</strong>&nbsp;&nbsp;<asp:BulletedList ID="BulletedListDik" runat="server" DataTextField="d_perigrafi"></asp:BulletedList>
            </p>
            <p>
                <strong>Τύπος Πληρωμής:</strong>&nbsp;
                <asp:RadioButtonList ID="RadioButtonListMisthodType" CssClass="radio-inline" runat="server" DataTextField="m_perigrafi" DataValueField="m_id" OnSelectedIndexChanged="RadioButtonListMisthodType_SelectedIndexChanged" AutoPostBack="True" Enabled="false"></asp:RadioButtonList>
            </p>
            <div class="container">
                <asp:Panel ID="PanelAnadromika" runat="server" Visible="false">
                    <h3>Υπολογισμός Αναδρομικών</h3>
                    <p>
                        <asp:RadioButtonList ID="logosAnadromikon" runat="server" AutoPostBack="true" OnSelectedIndexChanged="logosAnadromikon_SelectedIndexChanged" RepeatDirection="Horizontal">
                            <asp:ListItem>Λόγω αλλαγής κατηγορίας&nbsp;&nbsp;</asp:ListItem>
                            <asp:ListItem>Λόγω απουσίας</asp:ListItem>
                        </asp:RadioButtonList>
                    </p>
                    <asp:Panel ID="panelAllagiKatigorias" runat="server" Visible="false">
                        <asp:Label ID="error2" runat="server" ForeColor="#cc0000" Visible="false"></asp:Label>
                        <p>Προηγούμενη Κατηγορία:&nbsp;<asp:TextBox ID="oldKatigoria" runat="server" Width="450px" CssClass="form-control input-sm" ReadOnly="True"></asp:TextBox>&nbsp;&nbsp;</p>
                        <p>Τρέχουσα Κατηγορία:&nbsp;<asp:TextBox ID="currentKatigoria" runat="server" Width="450px" CssClass="form-control input-sm" ReadOnly="True"></asp:TextBox></p>
                        <p>Ισχύς Μεταβολής από:&nbsp;<asp:TextBox ID="isxysKatigorias" runat="server" CssClass="form-control input-sm" TextMode="Date" ReadOnly="true"></asp:TextBox>&nbsp;&nbsp;Ημερομηνία Μεταβολής:&nbsp;<asp:TextBox ID="metaboliDate" runat="server" CssClass="form-control input-sm" TextMode="Date" ReadOnly="true"></asp:TextBox></p>
                    </asp:Panel>
                    <asp:Panel ID="panelApousias" runat="server" Visible="false">
                        <asp:Label ID="error3" runat="server" Visible="false" ForeColor="#cc0000"></asp:Label>
                        <p>Ημ/νία Τελ. Πληρωμής:&nbsp;<asp:TextBox ID="lastPliromiDate" runat="server" CssClass="form-control input-sm" TextMode="Date" ReadOnly="true"></asp:TextBox>&nbsp;&nbsp;Τρέχουσα Ημ/νία Πληρωμής:&nbsp;<asp:TextBox ID="currentDate" runat="server" CssClass="form-control input-sm" TextMode="Date" ReadOnly="true"></asp:TextBox>&nbsp;&nbsp;</p>
                    </asp:Panel>
                    <p>
                        <asp:Button ID="anadromikaCalculate" runat="server" Text="Υπολογισμός Αναδρομικών" CssClass="btn btn-primary btn-md" OnClick="anadromikaCalculate_Click" />&nbsp;&nbsp;Ωφειλούμενα Αναδρομικά:&nbsp;<asp:TextBox ID="anadromika" runat="server" CssClass="form-control input-sm" TextMode="Date" ReadOnly="true"></asp:TextBox>
                        &nbsp;€
                    </p>
                </asp:Panel>
            </div>

            <br />
            <p><strong>Ποσό προς πληρωμή:</strong>&nbsp<asp:TextBox runat="server" ID="posoPliromis" Width="60px" CssClass="form-control input-sm" ReadOnly="True" Enabled="false"></asp:TextBox>&nbsp;€</p>
            <p><strong>Ημερομηνία Πληρωμής:</strong>&nbsp;<asp:TextBox ID="priromiDate" runat="server" CssClass="form-control input-sm" TextMode="Date"></asp:TextBox></p>
            <div>
                <asp:Button ID="cancelButton" runat="server" Text="Άκυρο" CssClass="btn btn-primary btn-md" OnClick="cancelButton_Click" />
                &nbsp;                   
                <asp:Button ID="pliromiButton" runat="server" Text="Πληρωμή" CssClass="btn btn-primary btn-md" OnClick="saveButton_Click" />
            </div>
        </form>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/datepicker.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var dp = $('#<%=priromiDate.ClientID%>');
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
    <strong></strong>
</asp:Content>

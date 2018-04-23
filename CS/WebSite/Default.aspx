<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Grid_Editing_EditFormWithSeveralPages_EditFormWithSeveralPages" %>

<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI.HtmlControls" TagPrefix="cc1" %>
<%-- BeginRegion Page setup --%>
<%@ Register Assembly="DevExpress.Web.v15.1" Namespace="DevExpress.Web" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v15.1" Namespace="DevExpress.Web" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v15.1" Namespace="DevExpress.Web" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v15.1" Namespace="DevExpress.Web" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Arrange EditForm editors on several ASPxPageControl pages.</title>
    <style type="text/css">
         td.caption {
            text-align: center;
            background-color: #eee;
            border: 1px dashed #ccc;
         }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsSampleDataSource" KeyFieldName="EmployeeID" Width="600px" 
            OnRowUpdating="OnRowUpdating" OnRowInserting="OnRowInserting">
            <SettingsDetail ShowDetailRow="True" />
            <Templates>
                <EditForm>
                    <%-- BeginRegion EmployeeID --%>
                    <asp:Panel ID="pnlEmployeeIDContainer" runat="server" Visible='<%# !Container.Grid.IsNewRowEditing %>'>
                        EmployeeID: <dxe:ASPxLabel ID="lblEmployeeID" runat="server" Value='<%# Eval("EmployeeID") %>' /><br /><br />
                    </asp:Panel>
                    <%-- EndRegion --%>
                    <%-- BeginRegion PageControl --%>
                    <dxtc:ASPxPageControl ID="pgcEditForm" runat="server" Width="100%">
                        <TabPages>
                            <dxtc:TabPage Name="First page" Text="First page">
                                <ContentCollection><dxw:ContentControl runat="server">
                                    <table style="width: 100%;" runat="server">
                                        <tr runat="server">
                                            <td class="caption">First Name</td>
                                            <td class="caption">Last Name</td>
                                            <td class="caption">Birth Date</td>
                                        </tr>
                                        <tr runat="server">
                                            <td style="width: 34%;">
                                                <dxe:ASPxTextbox ID="tbFirstName" runat="server" Text='<%# Eval("FirstName") %>' Width="100%" />
                                            </td>
                                            <td style="width: 33%;">
                                                <dxe:ASPxTextbox ID="tbLastName" runat="server" Text='<%# Eval("LastName") %>' Width="100%" />
                                            </td>
                                            <td style="width: 33%;">
                                                <dxe:ASPxDateEdit ID="deBirthDate" runat="server" Value='<%# Eval("BirthDate") %>' EditFormatString="MM/dd/yyyy" Width="100%" EditFormat="Custom" />
                                            </td>
                                        </tr>
                                    </table>    
                                </dxw:ContentControl></ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Second page" Text="Second page">
                                <ContentCollection><dxw:ContentControl runat="server">
                                    <table style="width: 100%;" runat="server">
                                        <tr runat="server">
                                            <td class="caption">City</td>
                                            <td class="caption">Country</td>
                                        </tr>
                                        <tr runat="server">
                                            <td style="width: 50%;">
                                                <dxe:ASPxTextbox ID="tbCity" runat="server" Text='<%# Eval("City") %>' Width="100%" />
                                            </td>
                                            <td style="width: 50%;">
                                                <dxe:ASPxTextbox ID="tbCountry" runat="server" Text='<%# Eval("Country") %>' Width="100%" />
                                            </td>
                                        </tr>
                                    </table>
                                </dxw:ContentControl></ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Third page" Text="Third page">
                                <ContentCollection><dxw:ContentControl runat="server">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td class="caption">
                                                <dxe:ASPxLabel ID="lblNotes" runat="server" Text="Notes" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%;">
                                                <dxe:ASPxMemo ID="txtNotes" runat="server" Text='<%# Eval("Notes") %>' Width="100%" Rows="5" />
                                            </td>
                                        </tr>
                                    </table>
                                </dxw:ContentControl></ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Fourth page" Text="Fourth page">
                                <ContentCollection><dxw:ContentControl runat="server">
                                    <table runat="server" style="width: 100%;">
                                        <tr runat="server">
                                            <td class="caption">
                                                <dxe:ASPxLabel ID="lblOccupation" runat="server" Text="Occupation" />
                                            </td>
                                            <td class="caption">
                                                <dxe:ASPxLabel ID="lblSubscriber" runat="server" Text="Subscriber" />
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td style="width: 50%;">
                                                <dxe:ASPxComboBox ID="cbOccupation" runat="server" Width="100%" DataSourceID="dsOccupations"
                                                    ValueField="OccupationID" TextField="Occupation" ValueType="System.Int32" Value='<%# Eval("OccupationID") %>' />
                                            </td>
                                            <td style="width: 50%;" align="center">
                                                <dxe:ASPxCheckBox ID="chbSubscriber" runat="server" Value='<%# Eval("Subscriber") %>' />
                                            </td>
                                        </tr>
                                    </table>
                                </dxw:ContentControl></ContentCollection>
                            </dxtc:TabPage>
                        </TabPages>
                    </dxtc:ASPxPageControl>
                    <%-- EndRegion --%>
                    <%-- BeginRegion Command buttons --%>
                    <table style="width: 100%;">
                        <tr>
                            <td align="right">
                                <table>
                                    <tr>
                                        <td>
                                            <dxe:ASPxButton ID="btnUpdate" runat="server" AutoPostBack="false" Text="Update" Width="60px" ClientSideEvents-Click='<%# "function(s, e) { " + Container.UpdateAction + " }" %>' />
                                        </td>
                                        <td>
                                            <dxe:ASPxButton ID="btnCancel" runat="server" AutoPostBack="false" Text="Cancel" Width="60px" ClientSideEvents-Click='<%# "function(s, e) { " + Container.CancelAction + " }" %>' />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <%-- EndRegion --%>
                </EditForm>
                <DetailRow>
                    <dxe:ASPxLabel ID="lblNotes" runat="server" Text='<%# Eval("Notes") %>' Width="100%" />
                </DetailRow>
            </Templates>
            <Columns>
                <dxwgv:GridViewCommandColumn VisibleIndex="0" ShowNewButton="True" ShowEditButton="True" ShowDeleteButton="True"/>
                <dxwgv:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="LastName" VisibleIndex="3">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataDateColumn FieldName="BirthDate" VisibleIndex="4">
                </dxwgv:GridViewDataDateColumn>
                <dxwgv:GridViewDataTextColumn FieldName="City" VisibleIndex="5">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="Country" VisibleIndex="6">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="Notes" VisibleIndex="7" Visible="False">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="Occupation" VisibleIndex="7">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataCheckColumn FieldName="Subscriber" VisibleIndex="9">
                </dxwgv:GridViewDataCheckColumn>
            </Columns>
        </dxwgv:ASPxGridView>
        <%-- BeginRegion DataSource --%>
        <asp:AccessDataSource ID="dsSampleDataSource" runat="server" DataFile="~/App_Data/Employee.mdb"
            SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [BirthDate], [City], [Country], [Notes], [Occupation], [Employees].[OccupationID], [Subscriber] FROM [Employees], [Occupation] WHERE [Occupation].[OccupationID] = [Employees].[OccupationID]"
            DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = ?" 
            InsertCommand="INSERT INTO [Employees] ([FirstName], [LastName], [BirthDate], [City], [Country], [Notes], [OccupationID], [Subscriber]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" 
            UpdateCommand="UPDATE [Employees] SET [FirstName] = ?, [LastName] = ?, [BirthDate] = ?, [City] = ?, [Country] = ?, [Notes] = ?, [OccupationID] = ?, [Subscriber] = ? WHERE [EmployeeID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="OccupationID" Type="Int32" />
                <asp:Parameter Name="Subscriber" Type="Boolean" />
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="OccupationID" Type="Int32" />
                <asp:Parameter Name="Subscriber" Type="Boolean" />
            </InsertParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="dsOccupations" runat="server" DataFile="~/App_Data/Employee.mdb"
            SelectCommand="SELECT * FROM [Occupation]"></asp:AccessDataSource>
        <%-- EndRegion --%>
    </form>
</body>
</html>

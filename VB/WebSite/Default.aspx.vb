Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web
Imports System.Collections.Generic

Partial Public Class Grid_Editing_EditFormWithSeveralPages_EditFormWithSeveralPages
	Inherits System.Web.UI.Page
	Private Shared ReadOnly KeyFieldName As String = "EmployeeID"
	Private Shared ReadOnly CommonFieldNames As String() = New String() { "FirstName", "LastName", "BirthDate", "City", "Country", "Notes", "OccupationID", "Subscriber" }

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub

	Protected Sub OnRowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
		Dim newValues As Dictionary(Of String, Object) = ExtractValuesFromEditForm(CType(sender, ASPxGridView))
		e.NewValues(KeyFieldName) = newValues(KeyFieldName)
		For Each fieldName As String In CommonFieldNames
			e.NewValues(fieldName) = newValues(fieldName)
		Next fieldName
	End Sub
	Protected Sub OnRowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
		Dim newValues As Dictionary(Of String, Object) = ExtractValuesFromEditForm(CType(sender, ASPxGridView))
		For Each fieldName As String In CommonFieldNames
			e.NewValues(fieldName) = newValues(fieldName)
		Next fieldName
	End Sub

	Private Function ExtractValuesFromEditForm(ByVal grid As ASPxGridView) As Dictionary(Of String, Object)
		Dim pairs As Dictionary(Of String, Object) = New Dictionary(Of String, Object)()

		' EmployeeID
		pairs.Add("EmployeeID", Nothing)
		Dim employeeIDStr As String = (CType(grid.FindEditFormTemplateControl("lblEmployeeID"), ASPxLabel)).Text
		If (Not String.IsNullOrEmpty(employeeIDStr)) Then
			pairs("EmployeeID") = Int32.Parse(employeeIDStr)
		End If
		' PageControl
		Dim pageControl As ASPxPageControl = CType(grid.FindEditFormTemplateControl("pgcEditForm"), ASPxPageControl)
		''' First page
		Dim firstPage As TabPage = pageControl.TabPages(0)
		pairs.Add("FirstName", (CType(firstPage.FindControl("tbFirstName"), ASPxTextBox)).Text)
		pairs.Add("LastName", (CType(firstPage.FindControl("tbLastName"), ASPxTextBox)).Text)
		pairs.Add("BirthDate", (CType(firstPage.FindControl("deBirthDate"), ASPxDateEdit)).Date)
		''' Second page
		Dim secondPage As TabPage = pageControl.TabPages(1)
		pairs.Add("City", (CType(secondPage.FindControl("tbCity"), ASPxTextBox)).Text)
		pairs.Add("Country", (CType(secondPage.FindControl("tbCountry"), ASPxTextBox)).Text)
		''' Third page
		pairs.Add("Notes", (CType(pageControl.TabPages(2).FindControl("txtNotes"), ASPxMemo)).Text)
		''' Fourth page
		Dim fourthPage As TabPage = pageControl.TabPages(3)
		pairs.Add("OccupationID", (CType(fourthPage.FindControl("cbOccupation"), ASPxComboBox)).Value)
		pairs.Add("Subscriber", (CType(fourthPage.FindControl("chbSubscriber"), ASPxCheckBox)).Checked)

		Return pairs
	End Function
End Class
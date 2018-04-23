using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web;
using System.Collections.Generic;

public partial class Grid_Editing_EditFormWithSeveralPages_EditFormWithSeveralPages : System.Web.UI.Page {
    private static readonly string KeyFieldName = "EmployeeID";
    private static readonly string[] CommonFieldNames = new string[] {
        "FirstName", "LastName", "BirthDate", "City", "Country", "Notes", "OccupationID", "Subscriber"
    };
    
    protected void Page_Load(object sender, EventArgs e) {

    }

    protected void OnRowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
        Dictionary<string, object> newValues = ExtractValuesFromEditForm((ASPxGridView)sender);
        e.NewValues[KeyFieldName] = newValues[KeyFieldName];
        foreach(string fieldName in CommonFieldNames)
            e.NewValues[fieldName] = newValues[fieldName];
    }
    protected void OnRowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e) {
        Dictionary<string, object> newValues = ExtractValuesFromEditForm((ASPxGridView)sender);
        foreach(string fieldName in CommonFieldNames)
            e.NewValues[fieldName] = newValues[fieldName];
    }

    private Dictionary<string, object> ExtractValuesFromEditForm(ASPxGridView grid) {
        Dictionary<string, object> pairs = new Dictionary<string, object>();

        // EmployeeID
        pairs.Add("EmployeeID", null);
        string employeeIDStr = ((ASPxLabel)grid.FindEditFormTemplateControl("lblEmployeeID")).Text;
        if(!string.IsNullOrEmpty(employeeIDStr))
            pairs["EmployeeID"] = Int32.Parse(employeeIDStr);
        // PageControl
        ASPxPageControl pageControl = (ASPxPageControl)grid.FindEditFormTemplateControl("pgcEditForm");
        /// First page
        TabPage firstPage = pageControl.TabPages[0];
        pairs.Add("FirstName", ((ASPxTextBox)firstPage.FindControl("tbFirstName")).Text);
        pairs.Add("LastName", ((ASPxTextBox)firstPage.FindControl("tbLastName")).Text);
        pairs.Add("BirthDate", ((ASPxDateEdit)firstPage.FindControl("deBirthDate")).Date);
        /// Second page
        TabPage secondPage = pageControl.TabPages[1];
        pairs.Add("City", ((ASPxTextBox)secondPage.FindControl("tbCity")).Text);
        pairs.Add("Country", ((ASPxTextBox)secondPage.FindControl("tbCountry")).Text);
        /// Third page
        pairs.Add("Notes", ((ASPxMemo)pageControl.TabPages[2].FindControl("txtNotes")).Text);
        /// Fourth page
        TabPage fourthPage = pageControl.TabPages[3];
        pairs.Add("OccupationID", ((ASPxComboBox)fourthPage.FindControl("cbOccupation")).Value);
        pairs.Add("Subscriber", ((ASPxCheckBox)fourthPage.FindControl("chbSubscriber")).Checked);

        return pairs;
    }
}
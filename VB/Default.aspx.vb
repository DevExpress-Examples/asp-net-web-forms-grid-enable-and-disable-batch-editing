Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        ASPxGridView1.DataSource = Enumerable.Range(0, 10).Select(Function(i) New With {Key .ID = i, Key .Text = "Text " & i, Key .Checked = i Mod 2 = 0})
        ASPxGridView1.DataBind()
    End Sub
    Protected Sub ASPxGridView1_CellEditorInitialize(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewEditorEventArgs)
        e.Editor.ReadOnly = False
    End Sub
End Class
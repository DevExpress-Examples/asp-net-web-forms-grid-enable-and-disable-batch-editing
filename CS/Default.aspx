<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        var allowEdit = false;
        function OnEditing(s, e) {
            e.cancel = !allowEdit;
        }
        
        function OnAllowEditChanged(s, e) {
            allowEdit = s.GetValue();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" Text="Allow edit">
                <ClientSideEvents CheckedChanged="OnAllowEditChanged" />
            </dx:ASPxCheckBox>
            <dx:ASPxGridView ID="ASPxGridView1" ClientInstanceName="grid" runat="server" KeyFieldName="ID" OnCellEditorInitialize="ASPxGridView1_CellEditorInitialize">
                <SettingsEditing Mode="Batch"></SettingsEditing>
                <Columns>
                    <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowDeleteButton="true">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="ID"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Text"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="Checked"></dx:GridViewDataCheckColumn>
                </Columns>
                <ClientSideEvents BatchEditStartEditing="OnEditing" BatchEditRowDeleting="OnEditing" BatchEditRowInserting="OnEditing" />
            </dx:ASPxGridView>
        </div>
    </form>
</body>
</html>

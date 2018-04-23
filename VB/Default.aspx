<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <script type="text/javascript">
            var allowEdit = false;
            function OnStartEditing(s, e) {
                e.cancel = !allowEdit;
            }
            function OnHeaderNewClick(s, e) {
                if (allowEdit)
                    grid.AddNewRow();
            }
            function OnCustomButtonClick(s, e) {
                if (e.buttonID == "btnDelete" && allowEdit)
                    grid.DeleteRow(e.visibleIndex);
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
            <dx:ASPxGridView ID="ASPxGridView1" ClientInstanceName="grid" runat="server" KeyFieldName="ID" OnCellEditorInitialize="ASPxGridView1_CellEditorInitialize" >
                <SettingsEditing Mode="Batch"></SettingsEditing>
                <Columns>
                    <dx:GridViewCommandColumn>
                        <HeaderTemplate>
                            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="New" AutoPostBack="false" RenderMode="Link">
                                <ClientSideEvents Click="OnHeaderNewClick" />
                            </dx:ASPxButton>
                        </HeaderTemplate>
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton ID="btnDelete" Text="Delete"></dx:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="ID"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Text"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="Checked"></dx:GridViewDataCheckColumn>
                </Columns>
                <ClientSideEvents BatchEditStartEditing="OnStartEditing" CustomButtonClick="OnCustomButtonClick" />
            </dx:ASPxGridView>
        </div>
    </form>
</body>
</html>
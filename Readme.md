<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128533541/16.1.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T150957)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
[![](https://img.shields.io/badge/💬_Leave_Feedback-feecdd?style=flat-square)](#does-this-example-address-your-development-requirementsobjectives)
<!-- default badges end -->
# Grid View for ASP.NET Web Forms - How to enable or disable the cell edit functionality in batch mode based on a condition

This example demonstrates how to use the check box state to enable or disable the grid's cell edit functionality in batch edit mode.

![Allow Edit Checkbox](controlEditing.gif)

## Overview

Follow the steps below:

1. Create the [Grid View](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridView) control and populate it with columns. Set the grid's [SettingsEditing.Mode](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridViewEditingSettings.Mode) property to `Batch` to enable the batch edit mode. Add a [GridViewCommandColumn](https://docs.devexpress.com/AspNet/DevExpress.Web.GridViewCommandColumn) and set its [ShowNewButtonInHeader](https://docs.devexpress.com/AspNet/DevExpress.Web.GridViewCommandColumn.ShowNewButtonInHeader) and [ShowDeleteButton](https://docs.devexpress.com/AspNet/DevExpress.Web.GridViewCommandColumn.ShowDeleteButton) properties to `true`.

    ```aspx
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" KeyFieldName="ID" ...>
        <SettingsEditing Mode="Batch" />
        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowDeleteButton="true" />
            <!-- ... -->
        </Columns>
    </dx:ASPxGridView>
    ```

2. Add a check box and handle its client-side [CheckedChanged](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxCheckBox.CheckedChanged) event. In the handler, create a flag variable, get the current state of the check box, and assign the state to the flag variable.

    ```aspx
    <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" Text="Allow edit">
        <ClientSideEvents CheckedChanged="OnAllowEditChanged" />
    </dx:ASPxCheckBox>
    ```

    ```js
    var allowEdit = false;
    function OnAllowEditChanged(s, e) {
        allowEdit = s.GetValue();
    }
    ```

3. Handle the grid's client-side [BatchEditStartEditing](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.BatchEditStartEditing), [BatchEditRowInserting](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.BatchEditRowInserting), and [BatchEditRowDeleting](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.BatchEditRowDeleting) events. In the handler, cancel the current edit operation based on the flag variable value.

    ```aspx
    <dx:ASPxGridView ID="ASPxGridView1" runat="server"  ...>
        <!-- ... -->
        <ClientSideEvents BatchEditStartEditing="OnEditing" BatchEditRowDeleting="OnEditing" BatchEditRowInserting="OnEditing" />
    </dx:ASPxGridView>
    ```

    ```js
    function OnEditing(s, e) {
        e.cancel = !allowEdit;
    }
    ```

## Files to Review

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))

## Documentation

* [Grid in Batch Edit Mode](https://docs.devexpress.com/AspNet/16443/components/grid-view/concepts/edit-data/batch-edit-mode)

## More Examples

* [Grid View for ASP.NET MVC - How to enable or disable the cell edit functionality in batch mode based on a condition](https://github.com/DevExpress-Examples/gridview-how-to-conditionally-enable-and-disable-the-batch-editing-on-the-client-side-t150965)
<!-- feedback -->
## Does this example address your development requirements/objectives?

[<img src="https://www.devexpress.com/support/examples/i/yes-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-grid-enable-and-disable-batch-editing&~~~was_helpful=yes) [<img src="https://www.devexpress.com/support/examples/i/no-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-grid-enable-and-disable-batch-editing&~~~was_helpful=no)

(you will be redirected to DevExpress.com to submit your response)
<!-- feedback end -->

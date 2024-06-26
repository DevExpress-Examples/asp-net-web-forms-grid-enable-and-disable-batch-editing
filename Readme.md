<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128533541/14.1.6%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T150957)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
[![](https://img.shields.io/badge/💬_Leave_Feedback-feecdd?style=flat-square)](#does-this-example-address-your-development-requirementsobjectives)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
<!-- default file list end -->
# ASPxGridView- How to conditionally enable and disable the batch editing on the client side


<p>This example demonstrates how to conditionally enable or disable the editing on the client side. You can find detailed steps by clicking below the "Show Implementation Details" link .</p>
<p><strong>See also:</strong><br><a href="https://www.devexpress.com/Support/Center/p/T150965">GridView - Batch Editing - How to conditionally enable and disable the editing on the client side</a></p>


<h3>Description</h3>

<p>1) Define a JavaScript variable that will control the edit state of the grid. This variable can be changed by your code or by other means. In this example, it is controlled by a check box:</p>
<code lang="aspx">&lt;dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" Text="Allow edit"&gt;
    &lt;ClientSideEvents CheckedChanged="OnAllowEditChanged" /&gt;
&lt;/dx:ASPxCheckBox&gt;</code>
<code lang="js">function OnAllowEditChanged(s, e) {
    allowEdit = s.GetValue();
}</code>
<p><br>2) Handle the grid's client-side <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_BatchEditStartEditingtopic">BatchEditStartEditing</a> event to cancel the edit operation based on the value of the mentioned variable:</p>
<code lang="js">function OnStartEditing(s, e) {
    e.cancel = !allowEdit;
}</code>
<br>3) Add custom buttons to the command column to call the grid's client-side <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_AddNewRowtopic">AddNewRow</a> and <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_DeleteRowtopic">DeleteRow</a> methods based on the very same value:<br>
<code lang="aspx">&lt;dx:GridViewCommandColumn&gt;
    &lt;HeaderTemplate&gt;
        &lt;dx:ASPxButton ID="ASPxButton1" runat="server" Text="New" AutoPostBack="false" RenderMode="Link"&gt;
            &lt;ClientSideEvents Click="OnHeaderNewClick" /&gt;
        &lt;/dx:ASPxButton&gt;
    &lt;/HeaderTemplate&gt;
    &lt;CustomButtons&gt;
        &lt;dx:GridViewCommandColumnCustomButton ID="btnDelete" Text="Delete"&gt;&lt;/dx:GridViewCommandColumnCustomButton&gt;
    &lt;/CustomButtons&gt;
&lt;/dx:GridViewCommandColumn&gt;</code>
<code lang="js">function OnHeaderNewClick(s, e) {
    if (allowEdit)
        grid.AddNewRow();
}
function OnCustomButtonClick(s, e) {
    if (e.buttonID == "btnDelete" &amp;&amp; allowEdit)
        grid.DeleteRow(e.visibleIndex);
}</code>
<p>&nbsp;</p>

<br/>


<!-- feedback -->
## Does this example address your development requirements/objectives?

[<img src="https://www.devexpress.com/support/examples/i/yes-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-grid-enable-and-disable-batch-editing&~~~was_helpful=yes) [<img src="https://www.devexpress.com/support/examples/i/no-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-grid-enable-and-disable-batch-editing&~~~was_helpful=no)

(you will be redirected to DevExpress.com to submit your response)
<!-- feedback end -->

<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx](./VB/Default.aspx))
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



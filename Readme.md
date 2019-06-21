<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
<!-- default file list end -->
# ASPxGridView- How to conditionally enable and disable the batch editing on the client side
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t150957/)**
<!-- run online end -->


<p>This example demonstrates how to conditionally enable or disable the editing on the client side.</p>
<p><strong>See also:</strong><br><a href="https://www.devexpress.com/Support/Center/p/T150965">GridView - Batch Editing - How to conditionally enable and disable the editing on the client side</a></p>


<h3>Description</h3>

<p>1) Define a JavaScript variable that will control the edit state of the grid. This variable can be changed by your code or by other means. In this example, it is controlled by a check box:</p>
<code lang="aspx">&lt;dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" Text="Allow edit"&gt;
    &lt;ClientSideEvents CheckedChanged="OnAllowEditChanged" /&gt;
&lt;/dx:ASPxCheckBox&gt;</code>
<code lang="js">function OnAllowEditChanged(s, e) {
    allowEdit = s.GetValue();
}</code>
<p>2) &nbsp;Handle the grid's client-side <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_BatchEditStartEditingtopic">BatchEditStartEditing</a>,&nbsp;&nbsp;<a href="https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientGridView_BatchEditRowDeletingtopic">BatchEditRowDeleting</a>,&nbsp;<a href="https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientGridView_BatchEditRowDeletingtopic">BatchEditRowDeleting</a> events to cancel the operation based on the value of the mentioned variable:</p>
<code lang="aspx"> &lt;ClientSideEvents BatchEditStartEditing="OnEditing" BatchEditRowDeleting="OnEditing" BatchEditRowInserting="OnEditing" /&gt;</code>
<code lang="js">function OnEditing(s, e) {
    e.cancel = !allowEdit;
}</code>

<br/>



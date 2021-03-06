<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PrayerRequestDetail.ascx.cs" Inherits="RockWeb.Blocks.Prayer.PrayerRequestDetail" %>

<asp:UpdatePanel ID="upPrayerRequests" runat="server">
    <ContentTemplate>
        <asp:Panel ID="pnlDetails" runat="server">

            <div class="panel panel-block">
                <div class="panel-heading">
                    <h1 class="panel-title"><i class="fa fa-cloud-upload"></i> <asp:Literal ID="lActionTitle" runat="server" /></h1>
                </div>
                <div class="panel-body">
                    <asp:HiddenField ID="hfPrayerRequestId" runat="server" />
            
                    <asp:ValidationSummary ID="valValidation" runat="server" HeaderText="Please Correct the Following" CssClass="alert alert-danger" />

                    <!-- Edit -->
                    <div id="pnlEditDetails" runat="server">

                        <fieldset>
                
                            <div class="row">
                                <div class="col-md-6">
                                    <Rock:PersonPicker ID="ppRequestor" runat="server" Label="Requested By" />
                                    <Rock:DataTextBox ID="dtbFirstName" runat="server" SourceTypeName="Rock.Model.PrayerRequest, Rock" PropertyName="FirstName" />
                                    <Rock:DataTextBox ID="dtbLastName" runat="server" SourceTypeName="Rock.Model.PrayerRequest, Rock" PropertyName="LastName" />
                                    <Rock:DatePicker ID="dpExpirationDate" Text="Expires On" runat="server" SourceTypeName="Rock.Model.PrayerRequest, Rock" PropertyName="ExpirationDate" />
                                </div>

                                <div class="col-md-6">
                                    <Rock:RockCheckBox ID="cbIsActive" Text="Active " CssClass="checkbox inline" runat="server" />
                                    <Rock:RockCheckBox ID="cbApproved" Text="Approved " CssClass="checkbox inline" runat="server" />
                                    <Rock:HighlightLabel ID="hlblFlaggedMessage" IconCssClass="fa fa-flag" LabelType="warning" runat="server" Visible="false" ToolTip="re-approve the request to clear the flags" />
                                    <Rock:RockCheckBox ID="cbIsPublic" Text="Public " CssClass="checkbox inline" runat="server" />
                                    <Rock:RockCheckBox ID="cbIsUrgent" Text="Urgent " CssClass="checkbox inline" runat="server" />
                                    <Rock:RockCheckBox ID="cbAllowComments" Text="Allow Comments " CssClass="checkbox inline" runat="server" />
                                    <asp:Label ID="lblApprovedByPerson" runat="server" CssClass="muted text-muted" Visible="false" />
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <Rock:CategoryPicker ID="catpCategory" runat="server" Label="Category" Required="true" EntityTypeName="Rock.Model.PrayerRequest"/>
                                    <Rock:DataTextBox ID="dtbText" runat="server" ValidateRequestMode="Disabled" SourceTypeName="Rock.Model.PrayerRequest, Rock" PropertyName="Text" Label="Request" CssClass="field span12" TextMode="MultiLine" Rows="4"/>
                                    <Rock:DataTextBox ID="dtbAnswer" runat="server" ValidateRequestMode="Disabled" SourceTypeName="Rock.Model.PrayerRequest, Rock" PropertyName="Answer" Label="Answer" CssClass="field span12" TextMode="MultiLine" Rows="4"/>
                                </div>
                            </div>

                        </fieldset>

                        <div class="actions">
                            <asp:LinkButton ID="lbSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="lbSave_Click" />
                            <asp:LinkButton ID="lbCancel" runat="server" Text="Cancel" CssClass="btn btn-link" CausesValidation="false" OnClick="lbCancel_Click" />
                        </div>

                    </div>

                    <!-- Read only -->
                    <fieldset id="fieldsetViewDetails" runat="server">

                        <Rock:NotificationBox ID="nbEditModeMessage" runat="server" NotificationBoxType="Info" />

                        <div class="pull-right">
                            <Rock:HighlightLabel ID="hlblFlaggedMessageRO" LabelType="warning" runat="server" Visible="false" IconCssClass="fa fa-flag" ToolTip="To clear the flags you'll have to re-approve this request." />
                            <Rock:HighlightLabel ID="hlblStatus" runat="server" LabelType="Warning" Text="Unapproved"  Visible="false" />
                            <Rock:HighlightLabel ID="hlblUrgent" LabelType="Danger" runat="server" Visible="false" IconCssClass="fa fa-exclamation-circle" Text="Urgent" />
                            <Rock:Badge ID="badgePrayerCount" runat="server"></Rock:Badge>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <asp:Literal ID="lMainDetails" runat="server" />
                            </div>
                        </div>

                        <div class="actions">
                            <asp:LinkButton ID="lbEdit" runat="server" Text="Edit" CssClass="btn btn-primary" OnClick="lbEdit_Click" />
                            <asp:LinkButton ID="lbCancelView" runat="server" Text="Back" CssClass="btn btn-link" CausesValidation="false" OnClick="lbCancel_Click" />
                        </div>

                    </fieldset>
                </div>
            </div>
        </asp:Panel>
        <hr />
    </ContentTemplate>
</asp:UpdatePanel>

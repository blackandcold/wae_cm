<%init>
	my @results = $site->{'db'}->get_entry_by_id($site->{'id'});
	my @categories = $site->{'db'}->get_categories;
	my $result_count = @results;
	my $category_count = @categories;
</%init>
<%args>
	$site => undef;
	$save => "not set";
</%args>

% if($save eq 'Save changes') {
	<% $site->{'entry'}->update() %>
	<% $m->redirect("?action=show_entry&id=" . $site->{'entry'}->{'id'}) %>
%} else {

% 	if($result_count == 0) {
	Entry not found!
% 	}	elsif($result_count > 1) {
	Error - Multiple entries found.
% 	} else {
% 		foreach my $result (@results) {
	<script src="./javascript/editor.js"></script>
	<form class="yui-skin-sam" name="editform" method="post" enctype="application/x-www-form-urlencoded">
	
	<div class="single_entry">
		<div class="entry_header">
			<input type="text" name="titel" value="<% $result->{'titel'} %>" />
			<br />
			by <% $result->{'username'} %> in
			<input type="hidden" name="user_id" value="<% $result->{'user_id'} %>" />
			
<!-- Drop down list with categories -->
			<select name="category_id">
%				if($category_count > 0) {
%					foreach my $category (@categories) {
%						if($category->{'guid'} eq $result->{'category_id'}) {
							<option value="<% $category->{'guid'} %>" selected="selected"><% $category->{'name'} %></option>
%						} else {
							<option value="<% $category->{'guid'} %>"><% $category->{'name'} %></option>
% 						}
%					}
%				}
			</select>
			
			on <% $result->{'published'} %>
		</div>
		<textarea name="content" id="content" cols="50" rows="10">
		    <% $result->{'content'} %>
		</textarea>
		<!--<div class="entry_footer">
			<a href="?action=edit_entry&id=<% $result->{'guid'} %>">Edit</a> |
			<a href="?action=delete_entry&id=<% $result->{'guid'} %>">Delete</a>
		</div>-->
	</div>
	
	<input type="submit" name="save" value="Save changes" />
	</form>
			
%		}
% 	}
% }
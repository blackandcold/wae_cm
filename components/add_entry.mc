<%init>
	my @categories = $site->{'db'}->get_categories;
	my $category_count = @categories;
</%init>
<%args>
	$site => undef;
	$save => undef;
</%args>

% if($save eq 'Save changes') {
	test <% $site->{'entry'}->{'titel'} %> post
	<% my $new_id = $site->{'entry'}->create() %>
	<% $m->redirect("?action=show_entry&id=" . $new_id) %>
%} else {

	<script src="./javascript/editor.js"></script>
	<form class="yui-skin-sam" name="editform" method="post" enctype="application/x-www-form-urlencoded">
	
	<div class="single_entry">
		<div class="entry_header">
			<input type="text" name="titel" value="Title of post" /
			<br />
			<input type="hidden" name="user_id" value="<% $site->user_id() %>" />
			
<!-- Drop down list with categories -->
			<select name="category_id">
%				if($category_count > 0) {
%					foreach my $category (@categories) {
						<option value="<% $category->{'guid'} %>" selected="selected"><% $category->{'name'} %></option>
%					}
%				}
			</select>
		</div>
		<textarea name="content" id="content" cols="50" rows="10">
			Content of post
		</textarea>
	</div>
	
	<input type="submit" name="save" value="Save changes" />
	</form>
			
% }
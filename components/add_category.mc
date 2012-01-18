<%args>
	$site => undef;
	$save => undef;
</%args>

% if($save eq 'Save changes') {
	test <% $site->{'category'}->{'name'} %> post
	<% my $new_id = $site->{'category'}->create() %>
	<% $m->redirect("?action=show_entries_by_category&id=" . $new_id) %>
%} else {

	<form name="editform" method="post" enctype="application/x-www-form-urlencoded">
	
	<input type="text" name="category_name" value="Name of category" />
	
	<input type="submit" name="save" value="Save changes" />
	</form>
			
% }
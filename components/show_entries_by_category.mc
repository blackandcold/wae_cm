<%init>
	my @results = $site->{'db'}->get_entries_per_category($site->{'id'});
	my $result_count = @results;
	my $category_name = $site->{'db'}->get_category_name($site->{'id'});
</%init>

<%args>
	$site => undef;
</%args>

<h2>All posts in category &quot;<% $category_name %>&quot;</h2>

% if($result_count == 0) {
	No entries in this category.
% }	 else {
% 	foreach my $result (@results) {
			<div class="single_entry">
				<div class="entry_header">
					<b> <% $result->{'titel'} %></b> 
					<br />
					by <% $result->{'username'} %> in <% $result->{'categoryname'} %> on <% $result->{'published'} %>
				</div>
				<% $result->{'content'} %>
% if($site->is_loggedin() == 1 and ($site->is_admin() == 1 or ($site->username() eq $result->{'username'}))) {
				<div class="entry_footer">
					<a href="?action=edit_entry&id=<% $result->{'guid'} %>" title="Edit post"><img src="./images/edit_icon.png" style="border:0;" /></a>
					<a href="?action=delete_entry&id=<% $result->{'guid'} %>" title="Delete post"><img src="./images/delete_icon.png" style="border:0;" /></a>
				</div>
% }
			</div>
%		}
% }

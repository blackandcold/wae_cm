<%init>
	my @results = $site->{'db'}->get_users();
	my $result_count = @results;
</%init>

<%args>
	$site => undef;
</%args>

% if($result_count > 0) {
% 	foreach my $result (@results) {
		<li>
			<a href="./?action=show_entries_by_user&id=<% $result->{'guid'} %>"><% $result->{'name'} %></a>
		</li>
%		}
% }

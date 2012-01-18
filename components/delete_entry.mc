<%args>
	$site => undef;
	$save => "not set";
</%args>

% if($save eq 'Delete entry') {
%	$site->{'entry'}->delete();
	<% $m->redirect(".") %>
% } else {	
	<form name="editform" method="post" enctype="application/x-www-form-urlencoded">
		Are you sure?<br />
		<input type="submit" name="save" value="Delete entry" />
	</form>

% }
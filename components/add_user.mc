<%args>
	$site => undef;
	$save => undef;
</%args>

% if($save eq 'Create user') {
	<% my $new_id = $site->{'user'}->create() %>
	<% $m->redirect("?action=show_entries_by_user&id=" . $new_id) %>
%} else {

	<form name="editform" method="post" enctype="application/x-www-form-urlencoded">
	
	<table class="logintable">
    	<tr>
			<td class="left_td" style="">Username:</td>
			<td class="right_td"><input type="text" name="username"></td>
		</tr>
    	<tr>
			<td class="left_td">Password:</td>
			<td class="right_td"><input type="password" name="password"></td>
		</tr>
		<tr>
			<td class="left_td">Is Admin:</td>
			<td class="right_td"><input type="checkbox" name="user_is_admin" /></td>
		</tr>
    	<tr>
			<td class="button_td" colspan="2"><input type="submit" value="Create user" name="save"></td>
		</tr>
	</table>
	
	</form>
			
% }
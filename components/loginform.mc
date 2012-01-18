<%args>
    $site => undef;
	$username => undef; 
	$password => undef;
	$action => undef;
</%args>

<%init>
	#print "USERNAME: ".$username." Password: ".$password;
	if (!defined $username or !defined $password) 
	{

	}
	else
	{
		if ($site->login($username, $password))
		{
			#print "vorm redirect";
        	$m->redirect("?");
	    } 
		else 
		{
			print "<div class=\"error\">Wrong credentials</div>";
	    }
	}
</%init>

<div class="loginform">	
	<h2>Login</h2>

	<form method="post" action="?action=login">
    	<table class="logintable">
        	<tr>
				<td class="left_td" style="">Username:</td>
				<td class="right_td"><input type="text" name="username"></td>
			</tr>
        	<tr>
				<td class="left_td">Passwort:</td>
				<td class="right_td"><input type="password" name="password"></td>
			</tr>
        	<tr>
				<td class="button_td" colspan="2"><input type="submit" value="Login" name="submit"></td>
			</tr>
    	</table>
	</form>
</div>


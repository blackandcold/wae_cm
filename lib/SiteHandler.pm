package SiteHandler;

use warnings;

sub new {
    my ($class, $db, $id, $action, $session, $entry, $category, $user) = @_;
    my $self = { db => $db, id => $id, action => $action, session => $session, entry => $entry, category => $category, user => $user };
    bless $self, $class;
}

sub id {
    my ($self) = @_;
    return $self->{'id'};
}

sub action {
    my ($self) = @_;
    return $self->{'action'};
}

sub entry {
    my ($self) = @_;
    return $self->{'entry'};
}

sub category {
    my ($self) = @_;
    return $self->{'category'};
}

sub user {
    my ($self) = @_;
    return $self->{'user'};
}

sub login {
	#print "login!!!";
    my ($self, $username, $password) = @_;
	#print "Loginfunktion: ".$username." ".$password;
	my $user_id = $self->{db}->has_user($username, $password);
	my $is_admin = $self->{db}->is_admin($username);
    if ($user_id > 0) 
	{
        $self->{session}->{is_admin} = $is_admin;
        $self->{session}->{username} = $username;
		$self->{session}->{user_id} = $user_id;
		#print "SiteHandler Session: ".$self->{session}->{username};
    } 
	else 
	{
        $self->logout();
    }

    return $self->is_admin;
}

sub is_loggedin{
	my ($self) = @_;
	
	#print "checking loggedin " . $self->{session}->{username};
	if(defined $self->{session}->{username})
	{
		#print "returning 1";
		return 1;
	}
	else
	{
		#print "returnin 0";
		return 0;
	}
}

sub logout {
    my ($self) = @_;
    $self->{session}->{is_admin} = 0;
    $self->{session}->{username} = undef;
	$self->{session}->{user_id} = undef;
}

sub is_admin {
    my ($self) = @_;
    return $self->{session}->{is_admin};
}

sub username {
    my ($self) = @_;
    return $self->{session}->{username} or '';
}

sub user_id {
    my ($self) = @_;
    return $self->{session}->{user_id} or '';
}

#sub uri {
#    my ($self) = @_;
#    return '?action='.$self->{action};
#}
#
#sub entry_uri {
#	my ($self) = @_;
#	return '?id='.$self->{id};
#}

1;
package User;

use warnings;
use POSIX qw/strftime/;

sub new {
    my ($class, $dbx, $id, $name, $password, $is_admin) = @_;
    my $self = { dbx => $dbx, id => $id, name => $name, password => $password, is_admin => $is_admin };
    bless $self, $class;
}

sub id {
    my ($self) = @_;
    return $self->{'id'};
}

sub name {
    my ($self) = @_;
    return $self->{'name'};
}

sub password {
    my ($self) = @_;
    return $self->{'password'};
}

sub is_admin {
    my ($self) = @_;
    return $self->{'is_admin'};
}

# gets the highest id in the entry-table = id of last autoincrement
sub last_id {
    my ($self) = @_;

    $self->{'dbx'}->{'test'}->select({
        fields => "max(guid) as guid",
        tables => "wae06_user",
    })->fetchrow_hashref()->{'guid'};
}

#sub update {
#	my ($self) = @_;
#	my $time = strftime( "%Y-%m-%d %H:%M:%S", localtime(time()) );
#	$self->{'dbx'}->{'test'}->update('wae06_entry', {
#										'titel' => $self->{'titel'},
#        								'content' => $self->{'content'},
#										'user_guid' => $self->{'user_id'},
#										'published' => $time,
#										'category_guid' => $self->{'category_id'}
#    								}, { 'guid' => $self->{'id'}});
#}

sub foo {
	my ($self) = @_;
	print "foo";
}

sub create {
	my ($self) = @_;
	if($self->{'is_admin'} eq 'on') {
		$self->{'is_admin'} = 1;
	}
	else {
		$self->{'is_admin'} = 0;
	}
	$self->{'dbx'}->{'test'}->insert('wae06_user', {
										'name' => $self->{'name'},
										'password' => $self->{'password'},
										'admin' => $self->{'is_admin'}
   								});
	return $self->last_id();
}

#sub delete {
#	my ($self) = @_;
#	$self->{'dbx'}->{'test'}->delete('wae06_entry', { 'guid' => $self->{'id'}});
#}

1;
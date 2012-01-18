package Category;

use warnings;
use POSIX qw/strftime/;

sub new {
    my ($class, $dbx, $id, $name) = @_;
    my $self = { dbx => $dbx, id => $id, name => $name };
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

# gets the highest id in the entry-table = id of last autoincrement
sub last_id {
    my ($self) = @_;

    $self->{'dbx'}->{'test'}->select({
        fields => "max(guid) as guid",
        tables => "wae06_category",
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

sub create {
	my ($self) = @_;
	$self->{'dbx'}->{'test'}->insert('wae06_category', {
										'name' => $self->{'name'}
   								});
	return $self->last_id();
}

#sub delete {
#	my ($self) = @_;
#	$self->{'dbx'}->{'test'}->delete('wae06_entry', { 'guid' => $self->{'id'}});
#}

1;
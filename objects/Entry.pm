package Entry;

use warnings;
use POSIX qw/strftime/;

sub new {
    my ($class, $dbx, $id, $titel, $content, $published, $category_id, $user_id) = @_;
    my $self = { dbx => $dbx, id => $id, titel => $titel, content => $content, published => $published, category_id => $category_id, user_id => $user_id };
    bless $self, $class;
}

sub id {
    my ($self) = @_;
    return $self->{'id'};
}

sub titel {
    my ($self) = @_;
    return $self->{'titel'};
}

sub content {
    my ($self) = @_;
    return $self->{'content'};
}

sub published {
    my ($self) = @_;
    return $self->{'published'};
}

sub category_id {
    my ($self) = @_;
    return $self->{'category_id'};
}

sub user_id {
    my ($self) = @_;
    return $self->{'user_id'};
}

# gets the highest id in the entry-table = id of last autoincrement
sub last_id {
    my ($self) = @_;

    $self->{'dbx'}->{'test'}->select({
        fields => "max(guid) as guid",
        tables => "wae06_entry",
    })->fetchrow_hashref()->{'guid'};
}

sub update {
	my ($self) = @_;
	my $time = strftime( "%Y-%m-%d %H:%M:%S", localtime(time()) );
	$self->{'dbx'}->{'test'}->update('wae06_entry', {
										'titel' => $self->{'titel'},
        								'content' => $self->{'content'},
										'user_guid' => $self->{'user_id'},
										'published' => $time,
										'category_guid' => $self->{'category_id'}
    								}, { 'guid' => $self->{'id'}});
}

sub foo {
	my ($self) = @_;
	print "foo called";
}

sub create {
	my ($self) = @_;
	my $time = strftime( "%Y-%m-%d %H:%M:%S", localtime(time()) );
	$self->{'dbx'}->{'test'}->insert('wae06_entry', {
										'titel' => $self->{'titel'},
       									'content' => $self->{'content'},
										'user_guid' => $self->{'user_id'},
										'published' => $time,
										'category_guid' => $self->{'category_id'}
   								});
	return $self->last_id();
}

sub delete {
	my ($self) = @_;
	my %data = ( guid => $self->{'id'});
	$self->{'dbx'}->{'test'}->delete('wae06_entry', \%data);
}

1;
package DBConnection;

use warnings;


# --------------------------------------------
#   Constructor
# --------------------------------------------
sub new {
    my ($class, $dbx) = @_;
    my $self = { dbx => $dbx };
    bless $self, $class;
}

# --------------------------------------------
#   Getters for retrieving data from mySql
# --------------------------------------------
sub get_entry_by_id {
	my ($self, $entry_id) = @_;
	my @results;
	
	$self->{'dbx'}->{'test'}->select({ 	'fields' => 'wae06_entry.guid as guid, published, content, titel, wae06_user.name as username, wae06_category.name as categoryname, wae06_category.guid as category_id, wae06_user.guid as user_id ',
                       		'table' => 'wae06_entry, wae06_user, wae06_category',
							'join' => 'wae06_entry.user_guid = wae06_user.guid and 
									 wae06_entry.category_guid = wae06_category.guid',
							'where' => {'wae06_entry.guid', $entry_id}
                     		});
	while (my $hr = $self->{'dbx'}->{'test'}->fetchrow_hashref()) 
	{
		push(@results, $hr);
	}
	
	return @results;
}

sub get_entries_per_category {
    my ($self, $category_id) = @_;
	my @results;

    $self->{'dbx'}->{'test'}->select({ 	'fields' => 'wae06_entry.guid as guid, published, content, titel, wae06_user.name as username, wae06_category.name as categoryname, wae06_category.guid as category_id, wae06_user.guid as user_id ',
                       		'table' => 'wae06_entry, wae06_user, wae06_category',
							'join' => 'wae06_entry.user_guid = wae06_user.guid and 
									 wae06_entry.category_guid = wae06_category.guid',
							'where' => {'wae06_category.guid', $category_id}
                     		});

	while (my $hr = $self->{'dbx'}->{'test'}->fetchrow_hashref()) 
	{
		push(@results, $hr);
	}
	
	return @results;
}

sub get_entries_per_user {
    my ($self, $user_id) = @_;
	my @results;

    $self->{'dbx'}->{'test'}->select({ 	'fields' => 'wae06_entry.guid as guid, published, content, titel, wae06_user.name as username, wae06_category.name as categoryname, wae06_category.guid as category_id, wae06_user.guid as user_id ',
                       		'table' => 'wae06_entry, wae06_user, wae06_category',
							'join' => 'wae06_entry.user_guid = wae06_user.guid and 
									 wae06_entry.category_guid = wae06_category.guid',
							'where' => {'wae06_user.guid', $user_id}
                     		});

	while (my $hr = $self->{'dbx'}->{'test'}->fetchrow_hashref()) 
	{
		push(@results, $hr);
	}
	
	return @results;
}

sub get_users {
    my ($self) = @_;
	my @results;

    $self->{'dbx'}->{'test'}->select({ 	'fields' => 'guid, name ',
                       					'table' => 'wae06_user'
                     		});

	while (my $hr = $self->{'dbx'}->{'test'}->fetchrow_hashref()) 
	{
		push(@results, $hr);
	}
	
	return @results;
}

sub get_categories {
    my ($self) = @_;
	my @results;

    $self->{'dbx'}->{'test'}->select({ 	'fields' => 'guid, name ',
                       					'table' => 'wae06_category'
                     		});

	while (my $hr = $self->{'dbx'}->{'test'}->fetchrow_hashref()) 
	{
		push(@results, $hr);
	}
	
	return @results;
}

sub get_category_name {
    my ($self, $category_id) = @_;
	my @results;

    $row = $self->{'dbx'}->{'test'}->select({ 	'fields' => 'name ',
                       					'table' => 'wae06_category',
										'where' => {'guid', $category_id}
                     		})->fetchrow_hashref();

	return $row->{'name'};
}

sub get_user_name {
    my ($self, $user_id) = @_;
	my @results;

    $row = $self->{'dbx'}->{'test'}->select({ 	'fields' => 'name ',
                       					'table' => 'wae06_user',
										'where' => {'guid', $user_id}
                     		})->fetchrow_hashref();

	return $row->{'name'};
}

sub has_user {
	my ($self, $username, $password) = @_;

	$row = $self->{'dbx'}->{'test'}->select({ 	fields => 'guid, password',
										tables => 'wae06_user',
										where => {name => $username}
										})->fetchrow_hashref();


	if($row->{'password'} eq $password)
	{
		#print "has_user true";
		return $row->{'guid'};
	}

	return 0;	
}

sub is_admin {
	my ($self, $username) = @_;

	$row = $self->{'dbx'}->{'test'}->select({ 	fields => 'admin',
										tables => 'wae06_user',
										where => {name => $username}
										})->fetchrow_hashref();

	#print "has_user true";
	return $row->{'admin'};	
}

sub latest_entries {
	my ($self) = @_;
	my @results;
	
	my $query = 'SELECT wae06_entry.guid as guid, published, content, titel, wae06_user.name as username, wae06_category.name as categoryname, wae06_category.guid as category_id, wae06_user.guid as user_id  
				 FROM wae06_entry,wae06_user, wae06_category 
				 WHERE wae06_entry.user_guid = wae06_user.guid and wae06_entry.category_guid = wae06_category.guid 
				 ORDER BY wae06_entry.published desc LIMIT 3;';
    $self->{'dbx'}->{'test'}->query($query);

	while (my $hr = $self->{'dbx'}->{'test'}->fetchrow_hashref()) 
	{
		push(@results, $hr);
	}
	
	return @results;
}

1;


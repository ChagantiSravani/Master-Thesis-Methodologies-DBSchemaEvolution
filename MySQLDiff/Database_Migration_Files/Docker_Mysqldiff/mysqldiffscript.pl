use strict;
use warnings;
use MySQL::Diff;

my @files = @ARGV;

if (@files < 2) {
    print "Wrong entry. Please enter two or more database files to be compared.\n";
    exit;
}

my %options = (
    host       => 'localhost',
    port       => 3306,
    user       => 'root',
    password   => '',
    ignore_tables => qr/^schema_migrations$/,
);

my $md = MySQL::Diff->new(%options);

for (my $i = 0; $i < @files - 1; $i++) {
    my $file1 = $files[$i];
    my $file2 = $files[$i+1];
    my $db1 = $md->register_db($file1, 1);
    my $db2 = $md->register_db($file2, 2);
    my $result = $md->diff();
    print "Diff between $file1 and $file2:\n$result\n";
}

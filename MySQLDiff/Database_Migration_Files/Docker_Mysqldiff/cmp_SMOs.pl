use strict;
use warnings;
use Text::CSV;
use File::Basename;
use MySQL::Diff;
use Getopt::Long;

my $csv_filename;

GetOptions("csv=s" => \$csv_filename);

my @files = @ARGV;

if (@files < 2) {
    print "Wrong entry. Please enter two or more database files to be compared.\n";
    exit;
}

my %options = (
    host          => 'localhost',
    port          => 3306,
    user          => 'root',
    password      => '',
    ignore_tables => qr/^schema_migrations$/,
);

my $md = MySQL::Diff->new(%options);

my $ct_num = 0;     # count of created tables
my $dt_num = 0;     # count of dropped tables
my $rt_num = 0;     # count of renamed tables
my $ac_num = 0;     # count of added columns
my $dc_num = 0;     # count of dropped columns
my $cc_num = 0;     # count of changed columns
my $rc_num = 0;     # count of rename columns
my $total = 0;      # total changes

$csv_filename = $csv_filename // 'output.csv';  # use the provided command-line argument as the CSV file name, or set a default name

# open log file for writing warnings
open my $log_fh, '>>', 'warnings.log' or die "Failed to open log file: $!";

# open CSV file for writing
open my $csv_fh, '>', $csv_filename or die "Failed to open CSV file: $!";
my $csv = Text::CSV->new({ eol => "\n" });


$csv->print($csv_fh, ["File names", "CT num", "DT num", "RT num", "AC num", "DC num", "CC num", "RC num", "SMO's_Total"]);

for (my $i = 0; $i < @files - 1; $i++) {
    my $file1 = $files[$i];
    my $file2 = $files[$i+1];
    my $db1 = $md->register_db($file1, 1);
    my $db2 = $md->register_db($file2, 2);
    my $result = $md->diff();
	
	# redirect warnings to log file
    {
        local *STDERR = $log_fh;
        print STDERR $_ for grep /Use of uninitialized value/, split /\n/, $result;
    }

    my $ct_num_local = () = $result =~ /CREATE TABLE/g;
    my $dt_num_local = () = $result =~ /DROP TABLE/g;
    my $rt_num_local = () = $result =~ /RENAME/g;
    my $ac_num_local = () = $result =~ /ADD COLUMN /gm;
    my $dc_num_local = () = $result =~ /DROP COLUMN/gm;
    my $cc_num_local = () = $result =~ /CHANGE COLUMN/gm;
    my $rc_num_local = () = $result =~ /MODIFY COLUMN/gm;

    $ct_num += $ct_num_local;
    $dt_num += $dt_num_local;
    $rt_num += $rt_num_local;
    $ac_num += $ac_num_local;
    $dc_num += $dc_num_local;
    $cc_num += $cc_num_local;
    $rc_num += $rc_num_local;

    my $filename = basename($file1) . " to " . basename($file2);
    $csv->print($csv_fh, [$filename, $ct_num_local, $dt_num_local, $rt_num_local, $ac_num_local, $dc_num_local, $cc_num_local, $rc_num_local, $ct_num_local + $dt_num_local + $rt_num_local + $ac_num_local + $dc_num_local + $cc_num_local + $rc_num_local]);
}
close $log_fh;
close $csv_fh;
print "Output written to csv file\n";

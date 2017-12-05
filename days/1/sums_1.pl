use warnings;
use strict;
use Data::Dumper;

my $in = $ARGV[0];
#print "$in\n";
my @letters = split(//, $in);

my $sum = 0;
my $last = $letters[-1];
foreach my $letter (@letters){
        if($last eq $letter){
                $sum += $letter;
        }
        $last = $letter;
}
print "$sum\n";

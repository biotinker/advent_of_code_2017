use warnings;
use strict;
use Data::Dumper;

my $in = $ARGV[0];
#print "$in\n";
my @letters = split(//, $in);

my $sum = 0;
my $len = scalar @letters;
my $fwd = $len/2;
foreach my $i (0..$len-1){
	my $j = $fwd + $i;
	my $e1 = $letters[$i];
	if($fwd + $i >= $len){
		$j = $fwd + $i - $len;
	}
	my $e2 = $letters[$j];
	if($e1 == $e2){
		$sum += $e1;
	}
}

print "$sum\n";
#print Dumper @letters;

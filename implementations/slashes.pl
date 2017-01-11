#!/usr/bin/perl -w

# This progrom was coppied from esolangs.org, licensed under CC0.

my $debug = ($#ARGV >= 0 and $ARGV[0] =~ m/^-d([1-2]?)$/ and shift and ($1 || 1));
$| = 1;

$_ = join '', <>;
while (1) {
	print "\n[", $_, "]" if $debug == 1;
	if (s!^([^/\\]+)!! or s!^\\(.)!!s) {
		print($1);
		print "\n[", $_, "]" if $debug == 2;
	}
	elsif (s!^/((?:[^/\\]|\\.)*)/((?:[^/\\]|\\.)*)/!!s) {
		my ($s,$d) = ($1,$2);
		$s =~ s/\\(.)/$1/gs;
		$d =~ s/\\(.)/$1/gs;
		while (s/(?:\Q$s\E)/$d/) { }
	}
	else { last; }
}

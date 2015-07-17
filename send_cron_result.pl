#!/usr/bin/perl

my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;
$year += 1900;
$mon++;
my $date="$year/$mon/$mday";

open (FP,"log.txt");
while( $line = <FP>){
  if($line =~ /^$date/){
    print "$line";
  }
}
close (FP);


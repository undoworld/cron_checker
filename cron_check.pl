#!/usr/bin/perl
# --name=DailyCount --value=9 --validate=\>9
# --name=DailyCount --value=ando --validate='eq "ando"'

use Getopt::Long;

my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;
$year += 1900;
$mon++;

my $name="undo";
my $value=0;
my $validate=0;
my $date="$year/$mon/$mday $hour:$min";

GetOptions('name=s' => \$name, 'value=s' => \$value, 'validate=s' => \$validate);

if(eval("$value ".$validate)){
  print "OK";
}else{
  print "NG";
}

open (FP,">>log.txt");
print FP "$date";
print FP " $name ";
print FP "$value ";
print FP "$validate ";


if ($value >0){
 print FP "OK\n";
}


close (FP);


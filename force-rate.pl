#!/bin/perl
use strict;
use warnings;

for (my $i = 0; $i < 5; $i++) {
  if (`xrandr` =~ /144.00\*/) {
    print "rate is set\n";
    last;
  }
  print "rate not set properly trying again\n";
  `xrandr --output DP-0 --mode 1920x1080 --rate 144.00`;
  sleep(2);
}

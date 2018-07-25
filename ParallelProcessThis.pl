#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;
use File::Basename;

#my $PDFfile = "Molecular-Biology-of-the-Cell.pdf";
my $PDFfile = "How_the_immune_system_works.pdf";

my $nProc = 4;
my $pagesPerChunk = "7";


#get page numbers
my $numPages = `pdftk $PDFfile dump_data | grep NumberOfPages | cut -d " " -f 2`;
chomp($numPages);
my $numChunks = int(($numPages/($pagesPerChunk+1))+1);

my $currentMinimum = 1;
for (my $chunk=0 ; $chunk < $numChunks ; $chunk ++) {
    
    my $currentMaximum = $currentMinimum+$pagesPerChunk;
    $currentMaximum = $numPages if($currentMaximum > $numPages);
    
    my $pageRange = "$currentMinimum"."-".$currentMaximum;

    #WORKING: my $commandLine = "k2pdfopt -p $pageRange -mode fw -m 0,0.93,0,0 -x -ui- -ds 1.3 -col 1 -dev kp2 -o ${PDFfile}-PART".sprintf("%03d",$chunk)."-fitWidth-kp2-native.pdf ${PDFfile}";
    #BETA: my $commandLine = "k2pdfopt -p $pageRange -mode fw -m 0,0.94,0,0 -x -ui- -ds 1.3 -col 2 -dev kp2 -o ${PDFfile}-PART".sprintf("%03d",$chunk)."-fitWidth-kp2-native.pdf ${PDFfile}";

    #my $commandLine = "k2pdfopt -p $pageRange -mode tm -m 0,0.92,0,0 -x -ui- -ds 1.3 -o ${PDFfile}-PART".sprintf("%03d",$chunk)."-OASIS2-native_trim.pdf -dev kv -w 1200 -h 1582 ${PDFfile}";

    
    my $commandLine = "k2pdfopt -p $pageRange -mode 2col -m 0.3,0.8,0.7,0.8 -x -ui- -ds 1.3 -cg 0.1 -cgmax 1 -ch 1 -cgr 0.33 -crgh 0.014 -comax 0.3 -col 2 -o How_the_immune_system_works-PART".sprintf("%03d",$chunk)."-OASIS2-native_2col.pdf -dev kv -w 1200 -h 1583 How_the_immune_system_works.pdf";
    
    
    print "$commandLine\n";
    
    $currentMinimum = $currentMaximum+1;
}

die ;






#open(IN, "$filename") or die "Could not open input file: $!\n";
#
#while (my $line = <IN>) {
#    chomp($line);
#    next if($line eq "");
#    my @data = split("\t", $line);
#
#    die Dumper(\@data)."\n";
#
#}
#
#close IN;


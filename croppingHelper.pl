#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;
use File::Basename;

 use Getopt::Long;
  my $data   = "NA";
  my $lineSize = 15;
  my $top = 0;
  my $bottom = 0;
  my $left = 0;
  my $right = 0;

  my $verbose;
  GetOptions ("length=i" => \$lineSize,    # numeric
              "file=s"   => \$data,      # string
              "topLines=i"   => \$top,      # string
              "bottomLine=i"   => \$bottom,      # string
              "leftLines=i"   => \$left,      # string
              "rightLines=i"   => \$right,      # string
              "verbose"  => \$verbose)   # flag
  or die("Error in command line arguments\n");


#Check for file existence
if($data eq "NA") {
	die "ERROR: PDF file not specified, please use the --file option to point at the PDF file that needs processing\n\n";
}

if (!-e $data) {
	die "ERROR: Hey, the PDF file you specified [$data] doesn't exist. Please choose a good one or use quotes if the filename has spaces\n\n";
}

#Check for PDFcrop
my $checkPDFcrop = `which pdfcrop`;
chomp($checkPDFcrop);

die "ERROR: The program pdfcrop was not found, please install it before running this script\n\n" if($checkPDFcrop eq "");

#Apply changes
my $outfile = $data;
$outfile =~ s/\.pdf/-crop.pdf/ig;

my $leftLines = -1*$left*$lineSize;
my $topLines = -1*$top*$lineSize;
my $rightLines = -1*$right*$lineSize;
my $bottomLines = -1*$bottom*$lineSize;

#do the actual cropping

#--margins "<left> <top> <right> <bottom>" 
#pdfcrop --verbose --margins "0 -30 0 -15" journal.pone.0162571.PDF ; open journal.pone.0162571-crop.pdf

system("pdfcrop --margins \"$leftLines $topLines $rightLines $bottomLines\" \"$data\"");

#open cropped PDF
system("open $outfile")
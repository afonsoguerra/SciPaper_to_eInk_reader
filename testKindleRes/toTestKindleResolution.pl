#!/usr/bin/env perl
use strict;
use warnings;

use GD;

#Disclaimer: This is a modified version of https://gist.github.com/stanaka/3892964

my $globCounter = 1;

sub draw_page {
    my ($width, $height) = @_;
    return unless $width && $height;

    if(!-e "output-$globCounter-$width-$height.pdf"){
        my $im = new GD::Image($width, $height);
        my $white = $im->colorAllocate(255,255,255);
        my $black = $im->colorAllocate(0,0,0);
        my $red = $im->colorAllocate(255,0,0);
        my $blue = $im->colorAllocate(0,0,255);

        $im->filledRectangle(0, 0, $width-1, $height-1, $white);

        for(my $y = 0; $y < $height; $y += 2){
            $im->line(0,$y,$width-1,$y,$black);
        }

        for(my $x = 0; $x < $width; $x += 2){
            $im->line($x, 0, $x, $height-1, $black);
        }

        my $font_file = "/Library/Fonts/Georgia.ttf";
        my ($pos_x, $pos_y) = (100, 100);
        my $size = 50;
        $im->filledRectangle($pos_x, $pos_y - $size * 1.1, $pos_x + $size * 7, $pos_y + $size * 0.1, $white);
        $im->stringFT($black,
                      $font_file, $size,
                      0,
                      $pos_x, $pos_y,
                      "$width x $height");

        open my $out, ">", "output-$globCounter-$width-$height.png";
        binmode $out;
        print $out $im->png;
        close $out;

        system("sam2p", "-j:quiet", "output-$globCounter-$width-$height.png", "output-$globCounter-$width-$height.pdf");
    }
    my $aaa = "output-$globCounter-$width-$height.pdf";
    $globCounter++;
    return $aaa;
}

my @pdfs;
#for(my $y = 890; $y < 920; $y++){
#    push @pdfs, draw_page(560, $y);
#};
#for(my $x = 645; $x < 675; $x++){
#    push @pdfs, draw_page($x, 880);
#};
#push @pdfs, draw_page(659, 905);
#push @pdfs, draw_page(658, 906);


#for(my $y = 905; $y < 1020; $y+=1){
#    for(my $x = 658; $x < 765; $x+=1){
#        push @pdfs, draw_page($x, $y);
#        push @pdfs, draw_page($x, $y);
#    };
#};
#
#
#push @pdfs, draw_page(658, 905);
#push @pdfs, draw_page(718, 965);
#push @pdfs, draw_page(658, 940);


#1150x776 - online
push @pdfs, draw_page(1150, 776);
push @pdfs, draw_page(1150, 776);

#1180x800 - k2pdfopt
push @pdfs, draw_page(1180, 800);
push @pdfs, draw_page(1180, 800);

#1136x786 - other online
push @pdfs, draw_page(1136, 786);
push @pdfs, draw_page(1136, 786);

for(my $y = 1147; $y < 1153; $y+=1){
    for(my $x = 773; $x < 779; $x+=1){
        push @pdfs, draw_page($x, $y);
        push @pdfs, draw_page($x, $y);
    };
};

for(my $y = 1177; $y < 1183; $y+=1){
    for(my $x = 797; $x < 803; $x+=1){
        push @pdfs, draw_page($x, $y);
        push @pdfs, draw_page($x, $y);
    };
};

for(my $y = 1133; $y < 1139; $y+=1){
    for(my $x = 783; $x < 789; $x+=1){
        push @pdfs, draw_page($x, $y);
        push @pdfs, draw_page($x, $y);
    };
};

system("pdftk", @pdfs, "cat", "output", "output2.pdf");


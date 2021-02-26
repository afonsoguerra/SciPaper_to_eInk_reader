#!/usr/bin/env bash

#EXTRA='-p 4-34 -n -ds 1.3' #selecing page numbers
#EXTRA='-p 302-312 -n' #selecing page numbers
#EXTRA='-n -ds 1.3' #native pdf from djvu with scaling
#EXTRA='-n' #Native pdf
#EXTRA='-ds 1.3' #Document scaling
#EXTRA='-neg' #Negative output
#EXTRA='' #blank options

#DEBUG=" -sm "

#PAGESELECT="-p 1-26"
#PAGESELECT="-p 302-312"
#PAGESELECT="-p 4,5,8-10,12,20,24,33,37,38,467,888,1234"
#PAGESELECT="-p 4,334-473,848-923,1211-1233" #MBoC pages to read

ZOOMLEVEL="-ds 1.3"
#ZOOMLEVEL="-ds 1.2"
#ZOOMLEVEL="-ds 0.9"
#ZOOMLEVEL="-ds 0.7"

###Hey, please not that the margins change with the ds option above, so if a scaling factor is used, a scaled margin needs to be used too... (or so it seems)
###Margins in inches
#large bottom margin
#MARGINS='0,0,0,2'
#Trim all around (default)
#MARGINS='0.3,0.7,0.7,0.4'
#MARGINS='0.3,0.8,0.7,0.8' #For immune system book on -ds 1.3

#Pre-trimmed margins
MARGINS='0,0,0,0'
#MARGINS='0,0.5,0,0'
#MARGINS='0,0.7,0,0'
#MARGINS='0,0.8,0,0'
#MARGINS='0,1.3,0,0'
#MARGINS='0,2,0,0'


#Cell paper at -ds 1.3
#MARGINS='0.3,1.12,0.7,0.62'

#Science mode
#MARGINS='0.5,0.7,0.5,0.5'
#Top only
#MARGINS='0,0.7,0,0'
#MARGINS='0,0.92,0,0' #ds 1.3 ~ 0.7 otherwise
#MARGINS='0,0.93,0,0' #ds 1.3 ~ 0.7 otherwise
#SciRep - TopBottom
#MARGINS='0,0.65,0,0.5'
#Nature - TopBottom+ds1.3
#MARGINS='0,0.65,0,0.51'
#MARGINS='0,0.65,0,0.55'
#Scanned book
#MARGINS='0,0.40,0,0.15' #with ds1.3
#MARGINS='0,0.49,0,0.15'  #with ds1.3

#Bioinformatics - TopBottom+ds1.3
#MARGINS='0,0.9,0,0.95'


#MAXCOL=4 #Maximum number of columns to be detected
#MAXCOL=2 #Maximum number of columns to be detected
MAXCOL=1 #Maximum number of columns to be detected

#OCR options
OCRSTRING='' #default (faster)
#OCRSTRING='-ocr t -ocrhmax 1 -ocrvis s -nt 2' #tesseract (needs separate installation, much slower, but more accurate)

#Filesize reduction
BWBIT=1 #BW
#BWBIT=2 #4 Greys
#BWBIT=4 #default (16 Greys)


###DEV="kpw" #Should be the right one but resolution not good enough, big margins
#DEV="kp2" #Seems to be perfect resolution for small margin mode in Kindle Paperwhite
#DEV2=${DEV}


#Confirmed no distortion on DXG, need to assess clipping
#-w 788 -h 1133
#-w 784 -h 1134
#-w 783 -h 1135
#-w 784 -h 1135
#-w 786 -h 1136

###Modes for Kindle DX Graphite
###DEV="dx -w 786 -h 1136 "
#DEV="dx -w 788 -h 1133 "
#DEV2="dxg"


###Temporary modes for Kindle Oasis 2
#mytest: 1198x1582
# 1680x1264
#DEV="kv -w 1264 -h 1680"
#-w 1200 -h 1584 -dpi 300

###Good stuff below for oasis
DEV="kv -w 1200 -h 1583"
DEV2=OASIS2

#DEV="ko2" #new, built in kindle oasis2 mode
#DEV2=${DEV}

###Ipad mode test
#DEV="kbh2o -w 1536 -h 2048"
#DEV2=iPad


#DITHERSTRING=''
DITHERSTRING='-d-' #No dithering

#HYPHENS="-hy" #default
#HYPHENS="-hy-" #keep hyphens

######################## Finished setup, actually running stuff

###Mix of all the options above to make it as generic as possible and controlled by variables
#k2pdfopt ${PAGESELECT} ${ZOOMLEVEL} ${EXTRA} ${OCRSTRING} -m ${MARGINS} -bpc ${BWBIT} ${DITHERSTRING} -ehl 0 -evl 1 -ui- -dev ${DEV} -col ${MAXCOL} -cg 0.1 -cgmax 1 -ch 1 -cgr 0.33 -crgh 0.014 -comax 0.3 -o $1-${DEV2}-BW.pdf -ow 20 -x -wrap ${HYPHENS} -ws -0.2 -j -1 -jf -1 0.75 ${DEBUG} -cmax 1 -s- -g 0.5 -wt -1 $1

###Native mode - book landscape
k2pdfopt ${PAGESELECT} ${DEBUG} ${ZOOMLEVEL} -m ${MARGINS} -bpc ${BWBIT} -mode fw -ui- -x -col ${MAXCOL} -o $1-${DEV2}-native_fw_bookLandscape.pdf -dev ${DEV} $1

### Is this fit width?
#echo "k2pdfopt ${PAGESELECT} -sm -mode fw -m ${MARGINS} -x -ui- ${ZOOMLEVEL} -col ${MAXCOL} -dev ${DEV} -o $1-fitWidth-${DEV2}-native.pdf $1"
#k2pdfopt ${PAGESELECT} ${DEBUG} -mode fw -m ${MARGINS} -x -ui- ${ZOOMLEVEL} -col ${MAXCOL} -dev ${DEV} -o $1-fitWidth-${DEV2}-native.pdf $1

#Also try mode tm (trim margins) and mode concat (no rescaling, just chopping it into kindle pages)
###k2pdfopt ${PAGESELECT} ${DEBUG} -mode tm -m ${MARGINS} -x -ui- ${ZOOMLEVEL} -col ${MAXCOL} -dev ${DEV} -o $1-trimMargins-${DEV2}-native.pdf $1
#k2pdfopt ${PAGESELECT} ${DEBUG} -mode concat -m ${MARGINS} -x -ui- ${ZOOMLEVEL} -col ${MAXCOL} -dev ${DEV} -o $1-conCat-${DEV2}-native.pdf $1



###Native mode - book portrait fit page
#k2pdfopt ${PAGESELECT} ${DEBUG}  -mode fp -m ${MARGINS} -x -ui- ${ZOOMLEVEL} -col ${MAXCOL} -dev ${DEV} -o $1-fitPage-${DEV2}-native.pdf $1

###Native mode - paper
#k2pdfopt -mode 2col -sm -m ${MARGINS} -x -ui- ${ZOOMLEVEL} -col ${MAXCOL} -o $1-${DEV2}-native_2col.pdf -dev ${DEV} $1
#echo k2pdfopt -mode 2col -m ${MARGINS} -x -ui- ${ZOOMLEVEL} -cg 0.1 -cgmax 1 -ch 1 -cgr 0.33 -crgh 0.014 -comax 0.3 -col ${MAXCOL} -o $1-${DEV2}-native_2col.pdf -sm -dev ${DEV} $1

###Native mode - trim margins only to then use OASIS landscape mode
#k2pdfopt ${PAGESELECT} -mode tm -m ${MARGINS} -x -ui- ${ZOOMLEVEL} -o $1-${DEV2}-native_trim.pdf -sm -dev ${DEV} $1 #Marked
#k2pdfopt ${PAGESELECT} -mode tm -m ${MARGINS} -x -ui- ${ZOOMLEVEL} -o $1-${DEV2}-native_trim_select.pdf -dev ${DEV} $1
#echo k2pdfopt ${PAGESELECT} -mode tm -m ${MARGINS} -x -ui- ${ZOOMLEVEL} -o $1-${DEV2}-native_trim.pdf -dev ${DEV} $1



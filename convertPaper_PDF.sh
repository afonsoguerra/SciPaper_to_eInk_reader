#!/usr/bin/env bash

#EXTRA='-p 4- -n -ds 1.3' #selecing page numbers
#EXTRA='-n -ds 1.3' #native pdf from djvu with scaling
#EXTRA='-n' #Native pdf
#EXTRA='-ds 1.3' #Document scaling
#EXTRA='-neg' #Negative output
EXTRA='' #blank options

###Hey, please not that the margins change with the ds option above, so if a scaling factor is used, a scaled margin needs to be used too... (or so it seems)
###Margins in inches
#large bottom margin
#MARGINS='0,0,0,2'
#Trim all around (default)
MARGINS='0.3,0.7,0.7,0.4'
#Science mode
#MARGINS='0.5,0.7,0.5,0.5'
#Top only
#MARGINS='0,0.7,0,0'
#MARGINS='0,0.92,0,0' #ds 1.3 ~ 0.7 otherwise
#SciRep - TopBottom
#MARGINS='0,0.65,0,0.5'
#Scanned book
#MARGINS='0,0.40,0,0.15' #with ds1.3
#MARGINS='0,0.49,0,0.15'  #with ds1.3

MAXCOL=4 #Maximum number of columns to be detected
#MAXCOL=2 #Maximum number of columns to be detected
#MAXCOL=1 #Maximum number of columns to be detected

#OCR options
#OCRSTRING='' #default (faster)
#OCRSTRING='-ocr t -ocrhmax 1 -ocrvis s -nt 2' #tesseract (needs separate installation, much slower, but more accurate)

#Filesize reduction
#BWBIT=1 #BW
#BWBIT=2 #4 Greys
#BWBIT=4 #default (16 Greys)


#DEV="kpw" #Should be the right one but resolution not good enough, big margins
DEV="kp2" #Seems to be perfect resolution for small margin mode

#DITHERSTRING=''
#DITHERSTRING='-d-' #No dithering

#HYPHENS="-hy" #default
#HYPHENS="-hy-" #keep hyphens

######################## Finished setup, actually running stuff

###Mix of all the options above to make it as generic as possible and controlled by variables
#k2pdfopt ${EXTRA} ${OCRSTRING} -m ${MARGINS} -bpc ${BWBIT} ${DITHERSTRING} -ehl 0 -evl 1 -ui- -dev ${DEV} -col ${MAXCOL} -cg 0.1 -cgmax 1 -ch 1 -cgr 0.33 -crgh 0.014 -comax 0.3 -o $1-${DEV}-BW.pdf -ow 20 -x -wrap ${HYPHENS} -ws -0.2 -j -1 -jf -1 0.75 -sm -cmax 1.5 -s- -g 0.5 -wt -1 $1

###Native mode - book
#k2pdfopt -mode fw -ui- -col ${MAXCOL} -dev ${DEV} $1
#k2pdfopt -mode fw -m 0,0.85,0,0 -x -ui- -ds 1.2 -col 1 -dev kp2 E.H.Gombrich-A_Little_History_of_the_World.pdf

###Native mode - paper
#k2pdfopt -mode 2col -m ${MARGINS} -x -ui- -ds 1.1 -col ${MAXCOL} -dev ${DEV} $1



EXTRA='-p 1-19 -n -ds 1.3' #selecing page numbers
#EXTRA='-n' #Native pdf
#EXTRA='-ds 1.2' #Document scaling
#EXTRA='' #blank options

#large bottom margin
#MARGINS='0,0,0,2'
#Trim all around
#MARGINS='0.3,0.7,0.7,0.4'
#Science mode
#MARGINS='0.5,0.7,0.5,0.5'
#Top only
#MARGINS='0,0.7,0,0'
#SciRep - TopBottom
#MARGINS='0,0.65,0,0.5'
#Scanned book
MARGINS='0,0.4,0,0.15'


#Filesize reduction
#BWBIT=1 #BW
BWBIT=2 #4 Greys
#BWBIT=4 #default (16 Greys)

#DITHERSTRING=''
DITHERSTRING='-d-'

#OCR options
OCRSTRING='' #default
#OCRSTRING='-ocr t -ocrhmax 1 -ocrvis s -nt 4' #tesseract

#DEV="kpw" #Should be the right one but resolution not good enough, big margins
DEV="kp2" #Seems to be perfect resolution for small margin mode

#MAXCOL=4 #Maximum number of columns to be detected
#MAXCOL=2 #Maximum number of columns to be detected
MAXCOL=1 #Maximum number of columns to be detected


#k2pdfopt -dev ${DEV} -col 2 -cg 0.1 -cgmax 1 -ch 1 -cgr 0.33 -crgh 0.014 -comax 0.3 -o -ow 20 -x -m 0,1,0,0.5 -wrap -hy- -ws -0.2 -j -1 -jf -1 0.75 Buenrostro-haematopoiesis_atacSeq-cell2018.pdf 
#k2pdfopt -dev ${DEV} -col 2 -cg 0.1 -cgmax 1 -ch 1 -cgr 0.33 -crgh 0.014 -comax 0.3 -o -ow 20 -x -m 0,1,0,0.5 -wrap -hy- -ws -0.2 -j -1 -jf -1 0.75 -sm -cmax 1.5 -s- -g 0.5 -wt -1 -ocr m -ocrhmax 1.5 -ocrvis s $1

#k2pdfopt -dev ${DEV} -col 2 -cg 0.1 -cgmax 1 -ch 1 -cgr 0.33 -crgh 0.014 -comax 0.3 -o $1-${DEV}-BW.pdf -ow 20 -x -m 0,0.7,0,0.4 -wrap -hy- -ws -0.2 -j -1 -jf -1 0.75 -sm -cmax 1.5 -s- -g 0.5 -wt -1 -ocr m -ocrhmax 1.5 -ocrvis s $1
#k2pdfopt -dev ${DEV} -col 2 -cg 0.1 -cgmax 1 -ch 1 -cgr 0.33 -crgh 0.014 -comax 0.3 -o $1-${DEV}-BW.pdf -ow 20 -x -m 0,1,0,0.5 -wrap -hy- -ws -0.2 -j -1 -jf -1 0.75 -sm -cmax 1.5 -s- -g 0.5 -wt -1 -ocr m -ocrhmax 1.5 -ocrvis s $1

###Single column, large bottom margin
#k2pdfopt -m 0,0,0,2 -dev ${DEV} -col 2 -cg 0.1 -cgmax 1 -ch 1 -cgr 0.33 -crgh 0.014 -comax 0.3 -o $1-${DEV}-BW.pdf -ow 20 -x -wrap -hy- -ws -0.2 -j -1 -jf -1 0.75 -sm -cmax 1.5 -s- -g 0.5 -wt -1 -ocr m -ocrhmax 1.5 -ocrvis s $1

###Two column, side margin as well as top and bottom trim
#k2pdfopt -m 0.3,0.7,0.3,0.4 -ui- -dev ${DEV} -col 2 -cg 0.1 -cgmax 1 -ch 1 -cgr 0.33 -crgh 0.014 -comax 0.3 -o $1-${DEV}-BW.pdf -ow 20 -x -wrap -hy- -ws -0.2 -j -1 -jf -1 0.75 -sm -cmax 1.5 -s- -g 0.5 -wt -1 -ocr m -ocrhmax 1.5 -ocrvis s $1
###Two column, side margin as well as top and bottom trim same as above but no OCR
#k2pdfopt -m 0.3,0.7,0.3,0.4 -ui- -dev ${DEV} -col 2 -cg 0.1 -cgmax 1 -ch 1 -cgr 0.33 -crgh 0.014 -comax 0.3 -o $1-${DEV}-BW.pdf -ow 20 -x -wrap -hy- -ws -0.2 -j -1 -jf -1 0.75 -sm -cmax 1.5 -s- -g 0.5 -wt -1 -ocr- $1

###Attempt at science mode (4 column, get rid of vertical lines, crop sides)
#k2pdfopt -m 0.5,0.7,0.5,0.5 -evl 1 -ui- -dev ${DEV} -col 4 -cg 0.1 -cgmax 1 -ch 1 -cgr 0.33 -crgh 0.014 -comax 0.3 -o $1-${DEV}-BW.pdf -ow 20 -x -wrap -hy- -ws -0.2 -j -1 -jf -1 0.75 -sm -cmax 1.5 -s- -g 0.5 -wt -1 -ocr m -ocrhmax 1.5 -ocrvis s $1

###Mix of all the options above to make it as generic as possible and controlled by variables
k2pdfopt ${EXTRA} ${OCRSTRING} -m ${MARGINS} -bpc ${BWBIT} ${DITHERSTRING} -evl 1 -ui- -dev ${DEV} -col ${MAXCOL} -cg 0.1 -cgmax 1 -ch 1 -cgr 0.33 -crgh 0.014 -comax 0.3 -o $1-${DEV}-BW.pdf -ow 20 -x -wrap -hy- -ws -0.2 -j -1 -jf -1 0.75 -sm -cmax 1.5 -s- -g 0.5 -wt -1 $1



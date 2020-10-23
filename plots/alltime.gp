#!/usr/local/bin/gnuplot

set output "alltime/".ARG1.".png"
set title ARG2

set terminal png size 2000,400

set key off
set grid

set ylabel "NUMBER OF DUPLICATIONS"

set xdata time
set xrange [ * : * ]
set yrange [ * : * ]
set format x "%B %Y"
set timefmt "%Y-%m-%d"

set autoscale xfix

plot "data/".ARG1.".txt" using 1:2 with linespoints ls 1 pointtype 7

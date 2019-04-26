unset grid
set terminal pdf
set output 'wykres[8].pdf'
set key box top left
set multi
set key opaque
set key box
set key width 1 height 0.5 font "Arial, 14”
set style data lines
set termopt enhanced
set xlabel "N" font "Arial, 14”
set ylabel "Multiplication time" font "Arial, 14”
set xtics font "Arial, 14”
set ytics font "Arial, 14”
set termoption dashed

plot "naiv_8.txt"
replot "bett_8.txt"
replot "dot_8.txt"
replot "matmul_8.txt"
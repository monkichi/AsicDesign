vcs -full64 -sverilog -debug updownCounter.sv updownCounter_tb.sv
today=`date '+%Y_%m_%d__%H_%M_%S'`;
simv | tee lab1_$today.log


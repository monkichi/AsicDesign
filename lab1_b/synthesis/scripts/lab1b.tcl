analyze -f sverilog /home/users8/cz584688/ece527/AsicDesign/lab1_b/sourcecode/UpdownCounter.sv
analyze -f sverilog /home/users8/cz584688/ece527/AsicDesign/lab1_b/sourcecode/lab1b.sv
analyze -f sverilog /home/users8/cz584688/ece527/AsicDesign/lab1_b/sourcecode/lab1b_100counters.sv 
elaborate lab1b_100counters
check_design 
create_clock CLK -period 5
compile
report_timing 
report_area
write

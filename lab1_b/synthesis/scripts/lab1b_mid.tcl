nalyze -f sverilog /home/users8/cz584688/ece527/AsicDesign/lab1_b/sourcecode/UpdownCounter.sv
analyze -f sverilog /home/users8/cz584688/ece527/AsicDesign/lab1_b/sourcecode/lab1b.sv
elaborate lab1b
check_design
create_clock CLK -period 5
compile > /home/users8/cz584688/ece527/AsicDesign/lab1_b/synthesis/reports/mid_compile.rt
report_timing > /home/users8/cz584688/ece527/AsicDesign/lab1_b/synthesis/reports/mid_timing.rt
report_area > /home/users8/cz584688/ece527/AsicDesign/lab1_b/synthesis/reports/mid_area.rt
report_cell > /home/users8/cz584688/ece527/AsicDesign/lab1_b/synthesis/reports/cMid_ells.rt
report_power > /home/users8/cz584688/ece527/AsicDesign/lab1_b/synthesis/reports/mid_power.rt
report_reference > /home/users8/cz584688/ece527/AsicDesign/lab1_b/synthesis/reports/mid_reference.rt
report_resources > /home/users8/cz584688/ece527/AsicDesign/lab1_b/synthesis/reports/mid_resources.rt
report_design > /home/users8/cz584688/ece527/AsicDesign/lab1_b/synthesis/reports/mid_redesign.rt
write_file -f verilog -o /home/users8/cz584688/ece527/AsicDesign/lab1_b/synthesis/netlists/mid_counters.v

analyze -f sverilog /home/users8/cz584688/ece527/AsicDesign/lab1_b/sourcecode/UpdownCounter.sv
elaborate UpdownCounter
check_design
report_resources > /home/users8/cz584688/ece527/AsicDesign/lab1_b/synthesis/reports/resources_updown_counter.rt
report_cells > /home/users8/cz584688/ece527/AsicDesign/lab1_b/synthesis/reports
/cells_updown_counter.rt
report_hierarchy > /home/users8/cz584688/ece527/AsicDesign/lab1_b/synthesis/reports
/hierarchy_updown_counter.rt
write_file -f verilog -o /home/users8/cz584688/ece527/AsicDesign/lab1_b/synthesis/netlists/updowncounter.v

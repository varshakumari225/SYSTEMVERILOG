#vlog -sv +cover=sbceft mem_lib.svh
vlog -sv -mfcu +cover=sbceft +incdir+./Projects/DV_Training_2025/gokanavk/SYSTEM_VERILOG/ass10/Q1 mem_lib.svh
vsim -coverage work.top
run -all
coverage save my_coverage.ucdb
coverage report -file coverage_summary.txt -detail -codeALL 
vcover report -html -htmldir cov_html_report -details my_coverage.ucdb
exit

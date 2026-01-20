vlib work 
vmap work work
vlog -sv -mfcu +cover=sbceft +incdir+. mem_lib.svh
vsim -coverage work.top
run -all
coverage save my_coverage.ucdb
coverage report -file coverage_summary.txt -detail -codeALL 
vcover report -html -htmldir cov_html_report -details my_coverage.ucdb

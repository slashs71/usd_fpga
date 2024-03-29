onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /nco_tb/clk
add wave -noupdate -format Logic /nco_tb/reset_n
add wave -noupdate -format Logic /nco_tb/clken
add wave -noupdate -format Literal -radix unsigned /nco_tb/phi
add wave -noupdate -divider -height 50 {New Divider}
add wave -noupdate -format Logic /nco_tb/out_valid
add wave -noupdate -color Yellow -format Literal -radix decimal  /nco_tb/sin_val
add wave -noupdate -divider -height 80 {New Divider}
add wave -noupdate -color Yellow -format Analog-Step -radix decimal -scale 0.016 /nco_tb/sin_val
add wave -noupdate -divider -height 80 {New Divider}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {356 ns}
WaveRestoreZoom {0 ns} {2132 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2

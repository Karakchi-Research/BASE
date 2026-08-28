onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib bse_opt

do {wave.do}

view wave
view structure
view signals

do {bse.udo}

run -all

quit -force

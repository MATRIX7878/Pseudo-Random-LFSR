if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -work work [pwd]/*.vhd

vsim toplevel

add wave *

force clk 0, 1 13.5 -r 27

view structure
view signals

run 500 ns

view -undock wave
wave zoomfull
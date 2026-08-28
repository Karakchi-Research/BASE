vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_4
vlib questa_lib/msim/zynq_ultra_ps_e_vip_v1_0_4
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/fifo_generator_v13_2_3
vlib questa_lib/msim/lib_fifo_v1_0_12
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/axi_datamover_v5_1_20
vlib questa_lib/msim/axi_sg_v4_1_11
vlib questa_lib/msim/axi_dma_v7_1_19
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_18
vlib questa_lib/msim/axi_data_fifo_v2_1_17
vlib questa_lib/msim/axi_crossbar_v2_1_19
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/xlconstant_v1_1_5
vlib questa_lib/msim/smartconnect_v1_0
vlib questa_lib/msim/xbip_utils_v3_0_9
vlib questa_lib/msim/axi_utils_v2_0_5
vlib questa_lib/msim/xbip_pipe_v3_0_5
vlib questa_lib/msim/xbip_dsp48_wrapper_v3_0_4
vlib questa_lib/msim/xbip_dsp48_addsub_v3_0_5
vlib questa_lib/msim/xbip_dsp48_multadd_v3_0_5
vlib questa_lib/msim/xbip_bram18k_v3_0_5
vlib questa_lib/msim/mult_gen_v12_0_14
vlib questa_lib/msim/floating_point_v7_1_7
vlib questa_lib/msim/axi_protocol_converter_v2_1_18
vlib questa_lib/msim/axi_clock_converter_v2_1_17
vlib questa_lib/msim/blk_mem_gen_v8_4_2
vlib questa_lib/msim/axi_dwidth_converter_v2_1_18

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_4 questa_lib/msim/axi_vip_v1_1_4
vmap zynq_ultra_ps_e_vip_v1_0_4 questa_lib/msim/zynq_ultra_ps_e_vip_v1_0_4
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_3 questa_lib/msim/fifo_generator_v13_2_3
vmap lib_fifo_v1_0_12 questa_lib/msim/lib_fifo_v1_0_12
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap axi_datamover_v5_1_20 questa_lib/msim/axi_datamover_v5_1_20
vmap axi_sg_v4_1_11 questa_lib/msim/axi_sg_v4_1_11
vmap axi_dma_v7_1_19 questa_lib/msim/axi_dma_v7_1_19
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_18 questa_lib/msim/axi_register_slice_v2_1_18
vmap axi_data_fifo_v2_1_17 questa_lib/msim/axi_data_fifo_v2_1_17
vmap axi_crossbar_v2_1_19 questa_lib/msim/axi_crossbar_v2_1_19
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap xlconstant_v1_1_5 questa_lib/msim/xlconstant_v1_1_5
vmap smartconnect_v1_0 questa_lib/msim/smartconnect_v1_0
vmap xbip_utils_v3_0_9 questa_lib/msim/xbip_utils_v3_0_9
vmap axi_utils_v2_0_5 questa_lib/msim/axi_utils_v2_0_5
vmap xbip_pipe_v3_0_5 questa_lib/msim/xbip_pipe_v3_0_5
vmap xbip_dsp48_wrapper_v3_0_4 questa_lib/msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_5 questa_lib/msim/xbip_dsp48_addsub_v3_0_5
vmap xbip_dsp48_multadd_v3_0_5 questa_lib/msim/xbip_dsp48_multadd_v3_0_5
vmap xbip_bram18k_v3_0_5 questa_lib/msim/xbip_bram18k_v3_0_5
vmap mult_gen_v12_0_14 questa_lib/msim/mult_gen_v12_0_14
vmap floating_point_v7_1_7 questa_lib/msim/floating_point_v7_1_7
vmap axi_protocol_converter_v2_1_18 questa_lib/msim/axi_protocol_converter_v2_1_18
vmap axi_clock_converter_v2_1_17 questa_lib/msim/axi_clock_converter_v2_1_17
vmap blk_mem_gen_v8_4_2 questa_lib/msim/blk_mem_gen_v8_4_2
vmap axi_dwidth_converter_v2_1_18 questa_lib/msim/axi_dwidth_converter_v2_1_18

vlog -work xilinx_vip -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_4 -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_4 -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim/bse_zynq_ultra_ps_e_0_0_vip_wrapper.v" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_3 -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_3 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_3 -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_12 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/544a/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_20 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/dfb3/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_11 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/efa7/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_19 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/09b0/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/bse/ip/bse_axi_dma_0_0/sim/bse_axi_dma_0_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_18 -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_17 -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_19 -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/6c9d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/bse/ip/bse_xbar_0/sim/bse_xbar_0.v" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/bse/ip/bse_rst_ps8_0_100M_0/sim/bse_rst_ps8_0_100M_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/sim/bd_c34f.v" \

vlog -work xlconstant_v1_1_5 -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/4649/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_c34f_one_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_c34f_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_c34f_arsw_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_c34f_rsw_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_c34f_awsw_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_c34f_wsw_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_c34f_bsw_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/f85e/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_c34f_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_c34f_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/9ade/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_c34f_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_c34f_s00a2s_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_c34f_sarn_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_c34f_srn_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_c34f_s01mmu_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_c34f_s01tr_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_15/sim/bd_c34f_s01sic_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_16/sim/bd_c34f_s01a2s_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_17/sim/bd_c34f_sawn_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_18/sim/bd_c34f_swn_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_19/sim/bd_c34f_sbn_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_20/sim/bd_c34f_m00s2a_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_21/sim/bd_c34f_m00arn_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_c34f_m00rn_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_c34f_m00awn_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_c34f_m00wn_0.sv" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_c34f_m00bn_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b387/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_c34f_m00e_0.sv" \

vlog -work xil_defaultlib -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/bse/ip/bse_smartconnect_0_0/sim/bse_smartconnect_0_0.v" \

vcom -work xbip_utils_v3_0_9 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/0da8/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_5 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec8e/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_5 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/442e/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_5 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/a04b/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_5 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b226/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_5 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/c08f/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_14 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/6bb5/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_7 -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/c63e/hdl/floating_point_v7_1_vh_rfs.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_ebkb.v" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_ejbC.v" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_ekbM.v" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_elbW.v" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_emb6.v" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_encg.v" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_engine_CTRL_s_axi.v" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_eocq.v" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_epcA.v" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_eqcK.v" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_ercU.v" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_esc4.v" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_etde.v" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_eudo.v" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_evdy.v" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/verilog/byte_statistics_engine.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/ip/byte_statistics_engine_ap_faddfsub_2_full_dsp_32.vhd" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/ip/byte_statistics_engine_ap_fcmp_0_no_dsp_32.vhd" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/ip/byte_statistics_engine_ap_fdiv_6_no_dsp_32.vhd" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/ip/byte_statistics_engine_ap_flog_4_full_dsp_32.vhd" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/ip/byte_statistics_engine_ap_fmul_0_max_dsp_32.vhd" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/ip/byte_statistics_engine_ap_fsqrt_5_no_dsp_32.vhd" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/ip/byte_statistics_engine_ap_fsub_2_no_dsp_32.vhd" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/de07/hdl/ip/byte_statistics_engine_ap_uitofp_1_no_dsp_32.vhd" \
"../../../bd/bse/ip/bse_byte_statistics_engi_0_0/sim/bse_byte_statistics_engi_0_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/bse/sim/bse.v" \

vlog -work axi_protocol_converter_v2_1_18 -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/7a04/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work axi_clock_converter_v2_1_17 -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/693a/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_2 -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_18 -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/0815/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/ec67/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/00a3/hdl" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/979d/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/verilog" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../bladei_bse_zcu104.srcs/sources_1/bd/bse/ip/bse_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/bse/ip/bse_auto_ds_0/sim/bse_auto_ds_0.v" \
"../../../bd/bse/ip/bse_auto_pc_0/sim/bse_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"


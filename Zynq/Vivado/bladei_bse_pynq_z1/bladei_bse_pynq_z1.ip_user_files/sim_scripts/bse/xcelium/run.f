-makelib xcelium_lib/xilinx_vip -sv \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "C:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xbip_utils_v3_0_9 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/0da8/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_utils_v2_0_5 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/ec8e/hdl/axi_utils_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_pipe_v3_0_5 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/442e/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_wrapper_v3_0_4 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_addsub_v3_0_5 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/a04b/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_multadd_v3_0_5 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/b226/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_bram18k_v3_0_5 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/c08f/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/mult_gen_v12_0_14 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/6bb5/hdl/mult_gen_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/floating_point_v7_1_7 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/c63e/hdl/floating_point_v7_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/verilog/byte_statistics_ebkb.v" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/verilog/byte_statistics_ejbC.v" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/verilog/byte_statistics_ekbM.v" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/verilog/byte_statistics_elbW.v" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/verilog/byte_statistics_emb6.v" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/verilog/byte_statistics_encg.v" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/verilog/byte_statistics_engine_CTRL_s_axi.v" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/verilog/byte_statistics_eocq.v" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/verilog/byte_statistics_epcA.v" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/verilog/byte_statistics_eqcK.v" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/verilog/byte_statistics_ercU.v" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/verilog/byte_statistics_esc4.v" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/verilog/byte_statistics_etde.v" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/verilog/byte_statistics_eudo.v" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/verilog/byte_statistics_engine.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/ip/byte_statistics_engine_ap_faddfsub_3_full_dsp_32.vhd" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/ip/byte_statistics_engine_ap_fcmp_0_no_dsp_32.vhd" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/ip/byte_statistics_engine_ap_fdiv_14_no_dsp_32.vhd" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/ip/byte_statistics_engine_ap_flog_11_full_dsp_32.vhd" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/ip/byte_statistics_engine_ap_fmul_2_max_dsp_32.vhd" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/ip/byte_statistics_engine_ap_fsqrt_10_no_dsp_32.vhd" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/2963/hdl/ip/byte_statistics_engine_ap_uitofp_4_no_dsp_32.vhd" \
  "../../../bd/bse/ip/bse_byte_statistics_engi_0_0/sim/bse_byte_statistics_engi_0_0.vhd" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_18 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_3 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_3 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_3 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_17 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_19 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/6c9d/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/bse/ip/bse_xbar_0/sim/bse_xbar_0.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/bse/ip/bse_proc_sys_reset_0_0/sim/bse_proc_sys_reset_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/sim/bd_c34f.v" \
-endlib
-makelib xcelium_lib/xlconstant_v1_1_5 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/4649/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_c34f_one_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_c34f_psr_aclk_0.vhd" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/979d/hdl/sc_util_v1_0_vl_rfs.sv" \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_c34f_arsw_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_c34f_rsw_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_c34f_awsw_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_c34f_wsw_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_c34f_bsw_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/f85e/hdl/sc_mmu_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_c34f_s00mmu_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_c34f_s00tr_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/9ade/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_c34f_s00sic_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_c34f_s00a2s_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_c34f_sarn_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_c34f_srn_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_c34f_s01mmu_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_c34f_s01tr_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_15/sim/bd_c34f_s01sic_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_16/sim/bd_c34f_s01a2s_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_17/sim/bd_c34f_sawn_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_18/sim/bd_c34f_swn_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_19/sim/bd_c34f_sbn_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_20/sim/bd_c34f_m00s2a_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_21/sim/bd_c34f_m00arn_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_c34f_m00rn_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_c34f_m00awn_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_c34f_m00wn_0.sv" \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_c34f_m00bn_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/b387/hdl/sc_exit_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/bse/ip/bse_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_c34f_m00e_0.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/bse/ip/bse_smartconnect_0_0/sim/bse_smartconnect_0_0.v" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_fifo_v1_0_12 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/544a/hdl/lib_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_datamover_v5_1_20 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/dfb3/hdl/axi_datamover_v5_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_sg_v4_1_11 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/efa7/hdl/axi_sg_v4_1_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_dma_v7_1_19 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/09b0/hdl/axi_dma_v7_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/bse/ip/bse_axi_dma_0_0/sim/bse_axi_dma_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/bse/sim/bse.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_4 -sv \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_6 -sv \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/70cf/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/bse/ip/bse_processing_system7_0_0/sim/bse_processing_system7_0_0.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_18 \
  "../../../../bladei_bse_pynq_z1.srcs/sources_1/bd/bse/ipshared/7a04/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/bse/ip/bse_auto_pc_0/sim/bse_auto_pc_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib


-- (c) Copyright 1995-2026 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:byte_statistics_engine:1.0
-- IP Revision: 2114671544

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY bse_byte_statistics_engi_0_0 IS
  PORT (
    s_axi_CTRL_AWADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_CTRL_AWVALID : IN STD_LOGIC;
    s_axi_CTRL_AWREADY : OUT STD_LOGIC;
    s_axi_CTRL_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_CTRL_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_CTRL_WVALID : IN STD_LOGIC;
    s_axi_CTRL_WREADY : OUT STD_LOGIC;
    s_axi_CTRL_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_CTRL_BVALID : OUT STD_LOGIC;
    s_axi_CTRL_BREADY : IN STD_LOGIC;
    s_axi_CTRL_ARADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_CTRL_ARVALID : IN STD_LOGIC;
    s_axi_CTRL_ARREADY : OUT STD_LOGIC;
    s_axi_CTRL_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_CTRL_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_CTRL_RVALID : OUT STD_LOGIC;
    s_axi_CTRL_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    in_stream_TVALID : IN STD_LOGIC;
    in_stream_TREADY : OUT STD_LOGIC;
    in_stream_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    in_stream_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    in_stream_TKEEP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    in_stream_TSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    out_stream_TVALID : OUT STD_LOGIC;
    out_stream_TREADY : IN STD_LOGIC;
    out_stream_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    out_stream_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    out_stream_TKEEP : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    out_stream_TSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END bse_byte_statistics_engi_0_0;

ARCHITECTURE bse_byte_statistics_engi_0_0_arch OF bse_byte_statistics_engi_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF bse_byte_statistics_engi_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT byte_statistics_engine IS
    GENERIC (
      C_S_AXI_CTRL_ADDR_WIDTH : INTEGER;
      C_S_AXI_CTRL_DATA_WIDTH : INTEGER
    );
    PORT (
      s_axi_CTRL_AWADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s_axi_CTRL_AWVALID : IN STD_LOGIC;
      s_axi_CTRL_AWREADY : OUT STD_LOGIC;
      s_axi_CTRL_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_CTRL_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_CTRL_WVALID : IN STD_LOGIC;
      s_axi_CTRL_WREADY : OUT STD_LOGIC;
      s_axi_CTRL_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_CTRL_BVALID : OUT STD_LOGIC;
      s_axi_CTRL_BREADY : IN STD_LOGIC;
      s_axi_CTRL_ARADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s_axi_CTRL_ARVALID : IN STD_LOGIC;
      s_axi_CTRL_ARREADY : OUT STD_LOGIC;
      s_axi_CTRL_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_CTRL_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_CTRL_RVALID : OUT STD_LOGIC;
      s_axi_CTRL_RREADY : IN STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      interrupt : OUT STD_LOGIC;
      in_stream_TVALID : IN STD_LOGIC;
      in_stream_TREADY : OUT STD_LOGIC;
      in_stream_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      in_stream_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      in_stream_TKEEP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      in_stream_TSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      out_stream_TVALID : OUT STD_LOGIC;
      out_stream_TREADY : IN STD_LOGIC;
      out_stream_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      out_stream_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      out_stream_TKEEP : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      out_stream_TSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT byte_statistics_engine;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF bse_byte_statistics_engi_0_0_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TSTRB: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TKEEP: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TKEEP";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TLAST: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF out_stream_TVALID: SIGNAL IS "XIL_INTERFACENAME out_stream, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency " & 
"{} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 32}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_" & 
"DOMAIN bse_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF in_stream_TSTRB: SIGNAL IS "xilinx.com:interface:axis:1.0 in_stream TSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF in_stream_TKEEP: SIGNAL IS "xilinx.com:interface:axis:1.0 in_stream TKEEP";
  ATTRIBUTE X_INTERFACE_INFO OF in_stream_TLAST: SIGNAL IS "xilinx.com:interface:axis:1.0 in_stream TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF in_stream_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 in_stream TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF in_stream_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 in_stream TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF in_stream_TVALID: SIGNAL IS "XIL_INTERFACENAME in_stream, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, LAYERED_METADATA undef, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN bse_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF in_stream_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 in_stream TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF interrupt: SIGNAL IS "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {INTERRUPT {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, PortWidth 1";
  ATTRIBUTE X_INTERFACE_INFO OF interrupt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n: SIGNAL IS "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_CTRL:in_stream:out_stream, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, PHASE " & 
"0.000, CLK_DOMAIN bse_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL AWVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_CTRL_AWADDR: SIGNAL IS "XIL_INTERFACENAME s_axi_CTRL, ADDR_WIDTH 5, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, ID_" & 
"WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN bse_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_CTRL_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_CTRL AWADDR";
BEGIN
  U0 : byte_statistics_engine
    GENERIC MAP (
      C_S_AXI_CTRL_ADDR_WIDTH => 5,
      C_S_AXI_CTRL_DATA_WIDTH => 32
    )
    PORT MAP (
      s_axi_CTRL_AWADDR => s_axi_CTRL_AWADDR,
      s_axi_CTRL_AWVALID => s_axi_CTRL_AWVALID,
      s_axi_CTRL_AWREADY => s_axi_CTRL_AWREADY,
      s_axi_CTRL_WDATA => s_axi_CTRL_WDATA,
      s_axi_CTRL_WSTRB => s_axi_CTRL_WSTRB,
      s_axi_CTRL_WVALID => s_axi_CTRL_WVALID,
      s_axi_CTRL_WREADY => s_axi_CTRL_WREADY,
      s_axi_CTRL_BRESP => s_axi_CTRL_BRESP,
      s_axi_CTRL_BVALID => s_axi_CTRL_BVALID,
      s_axi_CTRL_BREADY => s_axi_CTRL_BREADY,
      s_axi_CTRL_ARADDR => s_axi_CTRL_ARADDR,
      s_axi_CTRL_ARVALID => s_axi_CTRL_ARVALID,
      s_axi_CTRL_ARREADY => s_axi_CTRL_ARREADY,
      s_axi_CTRL_RDATA => s_axi_CTRL_RDATA,
      s_axi_CTRL_RRESP => s_axi_CTRL_RRESP,
      s_axi_CTRL_RVALID => s_axi_CTRL_RVALID,
      s_axi_CTRL_RREADY => s_axi_CTRL_RREADY,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      interrupt => interrupt,
      in_stream_TVALID => in_stream_TVALID,
      in_stream_TREADY => in_stream_TREADY,
      in_stream_TDATA => in_stream_TDATA,
      in_stream_TLAST => in_stream_TLAST,
      in_stream_TKEEP => in_stream_TKEEP,
      in_stream_TSTRB => in_stream_TSTRB,
      out_stream_TVALID => out_stream_TVALID,
      out_stream_TREADY => out_stream_TREADY,
      out_stream_TDATA => out_stream_TDATA,
      out_stream_TLAST => out_stream_TLAST,
      out_stream_TKEEP => out_stream_TKEEP,
      out_stream_TSTRB => out_stream_TSTRB
    );
END bse_byte_statistics_engi_0_0_arch;

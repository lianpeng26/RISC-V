create_ip -vendor xilinx.com -library ip -name clk_wiz -module_name mmcm -dir $ipdir -force
set_property -dict [list \
  CONFIG.PRIMITIVE {MMCM} \
  CONFIG.PRIM_IN_FREQ {125.000}\
  CONFIG.MMCM_CLKIN1_PERIOD {8.000}\
  CONFIG.RESET_TYPE {ACTIVE_LOW} \
  CONFIG.CLKOUT1_USED {true} \
  CONFIG.CLKOUT2_USED {true} \
  CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {8.388} \
  CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {16.000} \
  ] [get_ips mmcm]

create_ip -vendor xilinx.com -library ip -name proc_sys_reset -module_name reset_sys -dir $ipdir -force
set_property -dict [list \
  CONFIG.C_EXT_RESET_HIGH {false} \
  CONFIG.C_AUX_RESET_HIGH {false} \
  CONFIG.C_NUM_BUS_RST {1} \
  CONFIG.C_NUM_PERP_RST {1} \
  CONFIG.C_NUM_INTERCONNECT_ARESETN {1} \
  CONFIG.C_NUM_PERP_ARESETN {1} \
  ] [get_ips reset_sys]

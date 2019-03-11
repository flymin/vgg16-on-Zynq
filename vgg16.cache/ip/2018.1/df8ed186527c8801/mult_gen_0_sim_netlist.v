// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Mon Jan 14 09:20:24 2019
// Host        : eda-srv running 64-bit Red Hat Enterprise Linux Server release 6.6 (Santiago)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [7:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [7:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [15:0]P;

  wire [7:0]A;
  wire [7:0]B;
  wire CLK;
  wire [15:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "8" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "0" *) 
  (* C_OUT_HIGH = "15" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "8" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "8" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "0" *) (* C_OUT_HIGH = "15" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [7:0]A;
  input [7:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [15:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [7:0]A;
  wire [7:0]B;
  wire CLK;
  wire [15:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "8" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "0" *) 
  (* C_OUT_HIGH = "15" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
TvNAk+dzefmJC5/xfGEoXo1v1zzw15yvf2w3I+7pl9weHnOYLTwk2CtA6qQwUdiv+KPlR09XyHxt
UocEiAlS9g==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
ccd1Kr3IgmbU3Zd5R5UGhugxe9OUvTTk5M/+YDzRXyTvXIMaUxHB5fv7SuuebIYqGrGlL5seA2Sg
zO1i2uQFXVFn4M1DHS2E7BwirWBP5gmU/RaWKyEfTu3E5ZGbc1lvK67CCG8szRwdrvmY+Z8CpiC4
+fKoXg6GREReZgylTmE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D4OySXRBGdK3bWTwoBJnna9JJTCfjtow8OCB97TMc0CHJtgWscKG0sA6JP+WmQu+g/St8V3dnWCm
Z/oL2u8esW79WhsyQGAkuc2zUGutMTiH5JtlsxfFXreCjsbpfiQ4cOTSVV8RKFLaZCW+eXj7qQwk
WUd+Rk2Kp6kViZmb9GfGDSBc1qKbMuYuGLGiO+UVYNdt7dkYg9aAhJYx3c/Tx4m6BAZTpzEs9xzl
Mg0Plk7PRG/v5PXojT+9MvJ80iSqd3ejpG6kEE1mYBAhD1zmHQfbte6ipINFibjTuluuS5i0pIbf
HaA/nmULSj1xFBTfeEdDhm4CrFUWEdYvrJoOhg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YmbWYAZhC3ayB3FdtHMbSkvV5OWWIi6gmohNfeiL3hZEqSlPd2B43zehv3FM2BA2v3N0HlGO0TL6
neUbRccVG37R0aVoXEjetzHP+ZMpVpr2wNRYoVv9EAzvD7YjPAyiMQMLJO1wmw/LJVkGpP4UCg4g
tgMS7M+LmVgeot1Fmcwa4mDyquYpShDC0ZhYtWL3VmO204ubc1HcI1fEQiMp+tBP7rYU0jIyGMtz
dXGUYS7PdIYkz5ApCjSfCCueqmWeZf9/KXMkoo9udSh2ZyT9uNr+GM8fH8rcz5nZjN4ShPghIUSN
XIZbR6KJ/+WqugC6B6ULpEZUxft3AS1vxij4dA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
pRgO0aX5waanQk0eZ4W7Q+LVxiXC+tf9hFRN9nsdM6xbA9apyUI0wd0pRjkzt/X5yvazLViQDSfS
Bm9cP+mYh23I891gOC2bMeto93RQUYlDhWmKA2HAuokJj6wKo/vk9LA0e/rAjHMWD7cTXHkdXPdz
d92x8sSRX6Z5gz0YOJ8hU+X3aLkMrr/d+Rs3UcELF+MTGSf53SzTuIbnaw08EsHUObyFusQxXlt6
ZuByaRiPP1ofEvMk+UCLRZThOA7sR6SIfjXOTF55TQgss4/Mf30sm+t84LW+xNBWIqVfiQ671PZF
CQ8K4qBj3nTT9D0FTUvfHdTmLtywWgV65+5W3A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
d38DScsESf/yIfST5KEEwSUvjI+Km/dbua2xenGdzq3rgc/diAWKNIN11lcJIPDVBe6fB9J2TqbT
eXC+WnYP2YB9QXYlwKxLW7HOYcLC6Ivx9uoTg503B1azg5yB52W8iAwxelCieuRZ3qo4CxwOJ4w3
kwV+F675PsE0hWvEwTA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Bf4H+OH1vHHXYQ0B+xvr52Pkbk3t9R17gzpbDdSPXjerF+p1mOwTJrxL3jQRkm9rUtVIgJGiq2/s
crniU3gwf/UiAzOrNxcIp9eKlLwDNsxSMYn+mkUQWlDdifqNNVK+YFJD0ZFE6pzyWAfSd99uwvf2
B/+VXkZFAWz3devN4zOqXGE5+OZKTJNNH2fm+gcI0n7V4lPByrga5xMdlx99MQZZRprmMts+yOHQ
eVL2q0jneXaC7j4j8aSjRtpPAjf6aWk9xkdj2iVGAqs6TlpdNPyA9bKumNf3XCjAnjbNwxHWWAao
tHbBrxiXF1qQUoAzJ9mjy31tCjRX+JQOzKafLw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HCeP35XEmJI6qWFf0NCtpMwzlKXadHlPRjHYAyg9tgURPYNRxozxaiAddx2KArUc7Toybm3cHhGS
HYpGHZuqNg76fiSJoZBuuoQwRn51+Jhu3tFi8Xwml4HsHRAk8+EcIYn9yi66nYTGDgV9GK3R4COz
92m5FfcsOo/pIVgCA8fESmqMPrj93hMUpbbgdAdv+0BKn84bLfUe4W5ivw7izeNDeAoDpKHDM0G7
gD8XJt2tGSjR3kD+sohHSpE8xjOYWP4BOVe/gmiTHPQ4fiX0bktDO+tRZZw5VxbYcPVMPG4mUSL3
etC9bHw32gMTYlzg9t5ynbk3feixErvvQzUWTQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PHnZKfcsSzqXceip6i6P56cRoNoHfvr35H6eniQOkpVemDHZilTZcE+Wk9d54D24bECliGJQsQyV
ndd+nDQYbXYWYs4G6tEXf4xkmCjLw5h2GKg1PuHvr8SZZoqdGTbvp6mSRfmJsEdvg29d/pAzMKIN
AVxfr/FEny0Xrjw55F2G7BFLEfNNGMzlK4y1PKJw12FY9/GPzJYAZFtAG1iK6X02NMW6MpUzpAsE
ruODmWOGBV2U4TIxzNiiyXDCTRTWASdYFi7Cjdsqf5si01EHDtpcHsIRbe07xH9sG6h93nyhYaUw
DG/k1fwUMM0D8pe2/eKeD9PEgd3WkjIucrvkqw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7664)
`pragma protect data_block
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
OBO61HwbxCCLxcWl8UUNOUGQsDcQF+ftTVY=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

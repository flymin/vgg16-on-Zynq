// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Mon Jan 14 09:20:25 2019
// Host        : eda-srv running 64-bit Red Hat Enterprise Linux Server release 6.6 (Santiago)
// Command     : write_verilog -force -mode funcsim
//               /home/class18/gaoruiyuan/vgg16/vgg16.srcs/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module mult_gen_0
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
  mult_gen_0_mult_gen_v12_0_14 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "mult_gen_v12_0_14" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_0_mult_gen_v12_0_14
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
  mult_gen_0_mult_gen_v12_0_14_viv i_mult
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
KIJJ8OWMb1b+7qvn1xiHeUT7B9XyYWkU8xmvT8UuR/+vIuBGU6852Nw62wY71rdtGEeD2w3qOoYG
5boA5XiNE6VhwikNbzbAE9Mvl73pNttjF2sbX0D/mTHX61pAQaqjcHGBkhHHipPSox6lms+sFL95
qp7YjBFLyf2hlVSEiI0x39u+FfVEe45SxK5Y9CeFSDkBidOfp+xmgDYXG1sMSaRDssrva9+JdFB5
tbSmMEv5TlLxN1+jIA8RVmgymRy1UHerxIq8EwKFr0aP73uInIwLMJGV8iKJzw2PxRlXsG25OoFU
OS6hcjKgoY7gL4eOa0r4Ha8ynG5/DMDzX3hp0w==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
3C9uxM+/RKmD1XIk6DWZ4nc554CcFDaCAebQDYvsuWgAe5aHaO2RuUKhVOmE05NJGGW5GCdBsaWn
KlZbAsSnzYX8cSm8qwGw/v7NSag/suc6xoU4Cb5CXKhM/XjrYYRrsSs3Vp67ZFKF0924WHsBT05i
4YU1S1m1RywOIyYWZe6ZF1e82Pla19nsDOXPPQvfz5teg8qR+o+X3E6B5po/UmJUeqkyTadLnb7R
ymlxDGo16JECeuRfneIiCNMnNKqFqXj1oTmPdN0Vedrvy+b48iB+R4j6ujgqybgFuTcfRwceUhry
akaXfzwZryD1TbRPnbpBmhiYTIbC9Gjy4LXCpg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7616)
`pragma protect data_block
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
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

// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Fri Apr  8 08:52:05 2022
// Host        : insa-11272 running 64-bit Ubuntu 20.04.4 LTS
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/riffard/4A/archi_mat/compteur/compteur.sim/sim_1/impl/timing/xsim/Compteur_time_impl.v
// Design      : Compteur
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "ffc4c8dc" *) 
(* NotValidForBitStream *)
module Compteur
   (CLK,
    RESET,
    LOAD,
    Din,
    ENABLE,
    SENS,
    Dout);
  input CLK;
  input RESET;
  input LOAD;
  input [15:0]Din;
  input ENABLE;
  input SENS;
  output [15:0]Dout;

  wire \Aux[0]_i_10_n_0 ;
  wire \Aux[0]_i_11_n_0 ;
  wire \Aux[0]_i_2_n_0 ;
  wire \Aux[0]_i_4_n_0 ;
  wire \Aux[0]_i_5_n_0 ;
  wire \Aux[0]_i_6_n_0 ;
  wire \Aux[0]_i_7_n_0 ;
  wire \Aux[0]_i_8_n_0 ;
  wire \Aux[0]_i_9_n_0 ;
  wire \Aux[12]_i_2_n_0 ;
  wire \Aux[12]_i_3_n_0 ;
  wire \Aux[12]_i_4_n_0 ;
  wire \Aux[12]_i_5_n_0 ;
  wire \Aux[12]_i_6_n_0 ;
  wire \Aux[12]_i_7_n_0 ;
  wire \Aux[12]_i_8_n_0 ;
  wire \Aux[4]_i_2_n_0 ;
  wire \Aux[4]_i_3_n_0 ;
  wire \Aux[4]_i_4_n_0 ;
  wire \Aux[4]_i_5_n_0 ;
  wire \Aux[4]_i_6_n_0 ;
  wire \Aux[4]_i_7_n_0 ;
  wire \Aux[4]_i_8_n_0 ;
  wire \Aux[4]_i_9_n_0 ;
  wire \Aux[8]_i_2_n_0 ;
  wire \Aux[8]_i_3_n_0 ;
  wire \Aux[8]_i_4_n_0 ;
  wire \Aux[8]_i_5_n_0 ;
  wire \Aux[8]_i_6_n_0 ;
  wire \Aux[8]_i_7_n_0 ;
  wire \Aux[8]_i_8_n_0 ;
  wire \Aux[8]_i_9_n_0 ;
  wire [15:0]Aux_reg;
  wire \Aux_reg[0]_i_3_n_0 ;
  wire \Aux_reg[0]_i_3_n_4 ;
  wire \Aux_reg[0]_i_3_n_5 ;
  wire \Aux_reg[0]_i_3_n_6 ;
  wire \Aux_reg[0]_i_3_n_7 ;
  wire \Aux_reg[12]_i_1_n_4 ;
  wire \Aux_reg[12]_i_1_n_5 ;
  wire \Aux_reg[12]_i_1_n_6 ;
  wire \Aux_reg[12]_i_1_n_7 ;
  wire \Aux_reg[4]_i_1_n_0 ;
  wire \Aux_reg[4]_i_1_n_4 ;
  wire \Aux_reg[4]_i_1_n_5 ;
  wire \Aux_reg[4]_i_1_n_6 ;
  wire \Aux_reg[4]_i_1_n_7 ;
  wire \Aux_reg[8]_i_1_n_0 ;
  wire \Aux_reg[8]_i_1_n_4 ;
  wire \Aux_reg[8]_i_1_n_5 ;
  wire \Aux_reg[8]_i_1_n_6 ;
  wire \Aux_reg[8]_i_1_n_7 ;
  wire CLK;
  wire CLK_IBUF;
  wire CLK_IBUF_BUFG;
  wire [15:0]Din;
  wire [15:0]Din_IBUF;
  wire [15:0]Dout;
  wire [15:0]Dout_OBUF;
  wire ENABLE;
  wire ENABLE_IBUF;
  wire LOAD;
  wire LOAD_IBUF;
  wire RESET;
  wire RESET_IBUF;
  wire SENS;
  wire SENS_IBUF;
  wire clear;
  wire [2:0]\NLW_Aux_reg[0]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_Aux_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Aux_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Aux_reg[8]_i_1_CO_UNCONNECTED ;

initial begin
 $sdf_annotate("Compteur_time_impl.sdf",,,,"tool_control");
end
  LUT1 #(
    .INIT(2'h1)) 
    \Aux[0]_i_1 
       (.I0(RESET_IBUF),
        .O(clear));
  LUT4 #(
    .INIT(16'hF606)) 
    \Aux[0]_i_10 
       (.I0(SENS_IBUF),
        .I1(Aux_reg[1]),
        .I2(LOAD_IBUF),
        .I3(Din_IBUF[1]),
        .O(\Aux[0]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hD1)) 
    \Aux[0]_i_11 
       (.I0(Aux_reg[0]),
        .I1(LOAD_IBUF),
        .I2(Din_IBUF[0]),
        .O(\Aux[0]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \Aux[0]_i_2 
       (.I0(LOAD_IBUF),
        .I1(ENABLE_IBUF),
        .O(\Aux[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Aux[0]_i_4 
       (.I0(SENS_IBUF),
        .I1(LOAD_IBUF),
        .O(\Aux[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Aux[0]_i_5 
       (.I0(SENS_IBUF),
        .I1(LOAD_IBUF),
        .O(\Aux[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Aux[0]_i_6 
       (.I0(SENS_IBUF),
        .I1(LOAD_IBUF),
        .O(\Aux[0]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \Aux[0]_i_7 
       (.I0(LOAD_IBUF),
        .O(\Aux[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \Aux[0]_i_8 
       (.I0(SENS_IBUF),
        .I1(Aux_reg[3]),
        .I2(LOAD_IBUF),
        .I3(Din_IBUF[3]),
        .O(\Aux[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \Aux[0]_i_9 
       (.I0(SENS_IBUF),
        .I1(Aux_reg[2]),
        .I2(LOAD_IBUF),
        .I3(Din_IBUF[2]),
        .O(\Aux[0]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Aux[12]_i_2 
       (.I0(SENS_IBUF),
        .I1(LOAD_IBUF),
        .O(\Aux[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Aux[12]_i_3 
       (.I0(SENS_IBUF),
        .I1(LOAD_IBUF),
        .O(\Aux[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Aux[12]_i_4 
       (.I0(SENS_IBUF),
        .I1(LOAD_IBUF),
        .O(\Aux[12]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \Aux[12]_i_5 
       (.I0(SENS_IBUF),
        .I1(Aux_reg[15]),
        .I2(LOAD_IBUF),
        .I3(Din_IBUF[15]),
        .O(\Aux[12]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \Aux[12]_i_6 
       (.I0(SENS_IBUF),
        .I1(Aux_reg[14]),
        .I2(LOAD_IBUF),
        .I3(Din_IBUF[14]),
        .O(\Aux[12]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \Aux[12]_i_7 
       (.I0(SENS_IBUF),
        .I1(Aux_reg[13]),
        .I2(LOAD_IBUF),
        .I3(Din_IBUF[13]),
        .O(\Aux[12]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \Aux[12]_i_8 
       (.I0(SENS_IBUF),
        .I1(Aux_reg[12]),
        .I2(LOAD_IBUF),
        .I3(Din_IBUF[12]),
        .O(\Aux[12]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Aux[4]_i_2 
       (.I0(SENS_IBUF),
        .I1(LOAD_IBUF),
        .O(\Aux[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Aux[4]_i_3 
       (.I0(SENS_IBUF),
        .I1(LOAD_IBUF),
        .O(\Aux[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Aux[4]_i_4 
       (.I0(SENS_IBUF),
        .I1(LOAD_IBUF),
        .O(\Aux[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Aux[4]_i_5 
       (.I0(SENS_IBUF),
        .I1(LOAD_IBUF),
        .O(\Aux[4]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \Aux[4]_i_6 
       (.I0(SENS_IBUF),
        .I1(Aux_reg[7]),
        .I2(LOAD_IBUF),
        .I3(Din_IBUF[7]),
        .O(\Aux[4]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \Aux[4]_i_7 
       (.I0(SENS_IBUF),
        .I1(Aux_reg[6]),
        .I2(LOAD_IBUF),
        .I3(Din_IBUF[6]),
        .O(\Aux[4]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \Aux[4]_i_8 
       (.I0(SENS_IBUF),
        .I1(Aux_reg[5]),
        .I2(LOAD_IBUF),
        .I3(Din_IBUF[5]),
        .O(\Aux[4]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \Aux[4]_i_9 
       (.I0(SENS_IBUF),
        .I1(Aux_reg[4]),
        .I2(LOAD_IBUF),
        .I3(Din_IBUF[4]),
        .O(\Aux[4]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Aux[8]_i_2 
       (.I0(SENS_IBUF),
        .I1(LOAD_IBUF),
        .O(\Aux[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Aux[8]_i_3 
       (.I0(SENS_IBUF),
        .I1(LOAD_IBUF),
        .O(\Aux[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Aux[8]_i_4 
       (.I0(SENS_IBUF),
        .I1(LOAD_IBUF),
        .O(\Aux[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Aux[8]_i_5 
       (.I0(SENS_IBUF),
        .I1(LOAD_IBUF),
        .O(\Aux[8]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \Aux[8]_i_6 
       (.I0(SENS_IBUF),
        .I1(Aux_reg[11]),
        .I2(LOAD_IBUF),
        .I3(Din_IBUF[11]),
        .O(\Aux[8]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \Aux[8]_i_7 
       (.I0(SENS_IBUF),
        .I1(Aux_reg[10]),
        .I2(LOAD_IBUF),
        .I3(Din_IBUF[10]),
        .O(\Aux[8]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \Aux[8]_i_8 
       (.I0(SENS_IBUF),
        .I1(Aux_reg[9]),
        .I2(LOAD_IBUF),
        .I3(Din_IBUF[9]),
        .O(\Aux[8]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \Aux[8]_i_9 
       (.I0(SENS_IBUF),
        .I1(Aux_reg[8]),
        .I2(LOAD_IBUF),
        .I3(Din_IBUF[8]),
        .O(\Aux[8]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[0]_i_3_n_7 ),
        .Q(Aux_reg[0]),
        .R(clear));
  CARRY4 \Aux_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\Aux_reg[0]_i_3_n_0 ,\NLW_Aux_reg[0]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Aux[0]_i_4_n_0 ,\Aux[0]_i_5_n_0 ,\Aux[0]_i_6_n_0 ,\Aux[0]_i_7_n_0 }),
        .O({\Aux_reg[0]_i_3_n_4 ,\Aux_reg[0]_i_3_n_5 ,\Aux_reg[0]_i_3_n_6 ,\Aux_reg[0]_i_3_n_7 }),
        .S({\Aux[0]_i_8_n_0 ,\Aux[0]_i_9_n_0 ,\Aux[0]_i_10_n_0 ,\Aux[0]_i_11_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[10] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[8]_i_1_n_5 ),
        .Q(Aux_reg[10]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[11] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[8]_i_1_n_4 ),
        .Q(Aux_reg[11]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[12] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[12]_i_1_n_7 ),
        .Q(Aux_reg[12]),
        .R(clear));
  CARRY4 \Aux_reg[12]_i_1 
       (.CI(\Aux_reg[8]_i_1_n_0 ),
        .CO(\NLW_Aux_reg[12]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,\Aux[12]_i_2_n_0 ,\Aux[12]_i_3_n_0 ,\Aux[12]_i_4_n_0 }),
        .O({\Aux_reg[12]_i_1_n_4 ,\Aux_reg[12]_i_1_n_5 ,\Aux_reg[12]_i_1_n_6 ,\Aux_reg[12]_i_1_n_7 }),
        .S({\Aux[12]_i_5_n_0 ,\Aux[12]_i_6_n_0 ,\Aux[12]_i_7_n_0 ,\Aux[12]_i_8_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[13] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[12]_i_1_n_6 ),
        .Q(Aux_reg[13]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[14] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[12]_i_1_n_5 ),
        .Q(Aux_reg[14]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[15] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[12]_i_1_n_4 ),
        .Q(Aux_reg[15]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[0]_i_3_n_6 ),
        .Q(Aux_reg[1]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[0]_i_3_n_5 ),
        .Q(Aux_reg[2]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[0]_i_3_n_4 ),
        .Q(Aux_reg[3]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[4]_i_1_n_7 ),
        .Q(Aux_reg[4]),
        .R(clear));
  CARRY4 \Aux_reg[4]_i_1 
       (.CI(\Aux_reg[0]_i_3_n_0 ),
        .CO({\Aux_reg[4]_i_1_n_0 ,\NLW_Aux_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Aux[4]_i_2_n_0 ,\Aux[4]_i_3_n_0 ,\Aux[4]_i_4_n_0 ,\Aux[4]_i_5_n_0 }),
        .O({\Aux_reg[4]_i_1_n_4 ,\Aux_reg[4]_i_1_n_5 ,\Aux_reg[4]_i_1_n_6 ,\Aux_reg[4]_i_1_n_7 }),
        .S({\Aux[4]_i_6_n_0 ,\Aux[4]_i_7_n_0 ,\Aux[4]_i_8_n_0 ,\Aux[4]_i_9_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[4]_i_1_n_6 ),
        .Q(Aux_reg[5]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[4]_i_1_n_5 ),
        .Q(Aux_reg[6]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[4]_i_1_n_4 ),
        .Q(Aux_reg[7]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[8]_i_1_n_7 ),
        .Q(Aux_reg[8]),
        .R(clear));
  CARRY4 \Aux_reg[8]_i_1 
       (.CI(\Aux_reg[4]_i_1_n_0 ),
        .CO({\Aux_reg[8]_i_1_n_0 ,\NLW_Aux_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Aux[8]_i_2_n_0 ,\Aux[8]_i_3_n_0 ,\Aux[8]_i_4_n_0 ,\Aux[8]_i_5_n_0 }),
        .O({\Aux_reg[8]_i_1_n_4 ,\Aux_reg[8]_i_1_n_5 ,\Aux_reg[8]_i_1_n_6 ,\Aux_reg[8]_i_1_n_7 }),
        .S({\Aux[8]_i_6_n_0 ,\Aux[8]_i_7_n_0 ,\Aux[8]_i_8_n_0 ,\Aux[8]_i_9_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \Aux_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(\Aux[0]_i_2_n_0 ),
        .D(\Aux_reg[8]_i_1_n_6 ),
        .Q(Aux_reg[9]),
        .R(clear));
  BUFG CLK_IBUF_BUFG_inst
       (.I(CLK_IBUF),
        .O(CLK_IBUF_BUFG));
  IBUF CLK_IBUF_inst
       (.I(CLK),
        .O(CLK_IBUF));
  IBUF \Din_IBUF[0]_inst 
       (.I(Din[0]),
        .O(Din_IBUF[0]));
  IBUF \Din_IBUF[10]_inst 
       (.I(Din[10]),
        .O(Din_IBUF[10]));
  IBUF \Din_IBUF[11]_inst 
       (.I(Din[11]),
        .O(Din_IBUF[11]));
  IBUF \Din_IBUF[12]_inst 
       (.I(Din[12]),
        .O(Din_IBUF[12]));
  IBUF \Din_IBUF[13]_inst 
       (.I(Din[13]),
        .O(Din_IBUF[13]));
  IBUF \Din_IBUF[14]_inst 
       (.I(Din[14]),
        .O(Din_IBUF[14]));
  IBUF \Din_IBUF[15]_inst 
       (.I(Din[15]),
        .O(Din_IBUF[15]));
  IBUF \Din_IBUF[1]_inst 
       (.I(Din[1]),
        .O(Din_IBUF[1]));
  IBUF \Din_IBUF[2]_inst 
       (.I(Din[2]),
        .O(Din_IBUF[2]));
  IBUF \Din_IBUF[3]_inst 
       (.I(Din[3]),
        .O(Din_IBUF[3]));
  IBUF \Din_IBUF[4]_inst 
       (.I(Din[4]),
        .O(Din_IBUF[4]));
  IBUF \Din_IBUF[5]_inst 
       (.I(Din[5]),
        .O(Din_IBUF[5]));
  IBUF \Din_IBUF[6]_inst 
       (.I(Din[6]),
        .O(Din_IBUF[6]));
  IBUF \Din_IBUF[7]_inst 
       (.I(Din[7]),
        .O(Din_IBUF[7]));
  IBUF \Din_IBUF[8]_inst 
       (.I(Din[8]),
        .O(Din_IBUF[8]));
  IBUF \Din_IBUF[9]_inst 
       (.I(Din[9]),
        .O(Din_IBUF[9]));
  OBUF \Dout_OBUF[0]_inst 
       (.I(Dout_OBUF[0]),
        .O(Dout[0]));
  OBUF \Dout_OBUF[10]_inst 
       (.I(Dout_OBUF[10]),
        .O(Dout[10]));
  OBUF \Dout_OBUF[11]_inst 
       (.I(Dout_OBUF[11]),
        .O(Dout[11]));
  OBUF \Dout_OBUF[12]_inst 
       (.I(Dout_OBUF[12]),
        .O(Dout[12]));
  OBUF \Dout_OBUF[13]_inst 
       (.I(Dout_OBUF[13]),
        .O(Dout[13]));
  OBUF \Dout_OBUF[14]_inst 
       (.I(Dout_OBUF[14]),
        .O(Dout[14]));
  OBUF \Dout_OBUF[15]_inst 
       (.I(Dout_OBUF[15]),
        .O(Dout[15]));
  OBUF \Dout_OBUF[1]_inst 
       (.I(Dout_OBUF[1]),
        .O(Dout[1]));
  OBUF \Dout_OBUF[2]_inst 
       (.I(Dout_OBUF[2]),
        .O(Dout[2]));
  OBUF \Dout_OBUF[3]_inst 
       (.I(Dout_OBUF[3]),
        .O(Dout[3]));
  OBUF \Dout_OBUF[4]_inst 
       (.I(Dout_OBUF[4]),
        .O(Dout[4]));
  OBUF \Dout_OBUF[5]_inst 
       (.I(Dout_OBUF[5]),
        .O(Dout[5]));
  OBUF \Dout_OBUF[6]_inst 
       (.I(Dout_OBUF[6]),
        .O(Dout[6]));
  OBUF \Dout_OBUF[7]_inst 
       (.I(Dout_OBUF[7]),
        .O(Dout[7]));
  OBUF \Dout_OBUF[8]_inst 
       (.I(Dout_OBUF[8]),
        .O(Dout[8]));
  OBUF \Dout_OBUF[9]_inst 
       (.I(Dout_OBUF[9]),
        .O(Dout[9]));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[0]),
        .Q(Dout_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[10] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[10]),
        .Q(Dout_OBUF[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[11] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[11]),
        .Q(Dout_OBUF[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[12] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[12]),
        .Q(Dout_OBUF[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[13] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[13]),
        .Q(Dout_OBUF[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[14] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[14]),
        .Q(Dout_OBUF[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[15] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[15]),
        .Q(Dout_OBUF[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[1]),
        .Q(Dout_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[2]),
        .Q(Dout_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[3]),
        .Q(Dout_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[4]),
        .Q(Dout_OBUF[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[5]),
        .Q(Dout_OBUF[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[6]),
        .Q(Dout_OBUF[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[7]),
        .Q(Dout_OBUF[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[8]),
        .Q(Dout_OBUF[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dout_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Aux_reg[9]),
        .Q(Dout_OBUF[9]),
        .R(1'b0));
  IBUF ENABLE_IBUF_inst
       (.I(ENABLE),
        .O(ENABLE_IBUF));
  IBUF LOAD_IBUF_inst
       (.I(LOAD),
        .O(LOAD_IBUF));
  IBUF RESET_IBUF_inst
       (.I(RESET),
        .O(RESET_IBUF));
  IBUF SENS_IBUF_inst
       (.I(SENS),
        .O(SENS_IBUF));
endmodule
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

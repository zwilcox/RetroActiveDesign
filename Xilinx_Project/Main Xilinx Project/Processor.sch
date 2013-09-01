<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Cin" />
        <signal name="aInv" />
        <signal name="bInv" />
        <signal name="XLXN_20(15:0)" />
        <signal name="Clk" />
        <signal name="Instruction(15:0)" />
        <signal name="Instruction(7:0)" />
        <signal name="Instruction(3:0)" />
        <signal name="Instruction(11:8)" />
        <signal name="Instruction(7:4)" />
        <signal name="RegWrite" />
        <signal name="XLXN_172(2:0)" />
        <signal name="XLXN_192(15:0)" />
        <signal name="MemWrite" />
        <signal name="ProgramCounter(15:0)" />
        <signal name="PCWrite" />
        <signal name="Reset" />
        <signal name="ReadData(15:0)" />
        <signal name="InstrWrite" />
        <signal name="Instruction(15:12)" />
        <signal name="XLXN_319" />
        <signal name="XLXN_325(1:0)" />
        <signal name="XLXN_326" />
        <signal name="MULT(15:0)" />
        <signal name="DIV(15:0)" />
        <signal name="XLXN_342(2:0)" />
        <signal name="XLXN_343(15:0)" />
        <signal name="XLXN_344(15:0)" />
        <signal name="XLXN_372(4:0)" />
        <signal name="XLXN_388(1:0)" />
        <signal name="ALUB_input3(15:0)" />
        <signal name="XLXN_361" />
        <signal name="XLXN_362" />
        <signal name="XLXN_363" />
        <signal name="XLXN_364" />
        <signal name="XLXN_365" />
        <signal name="XLXN_377(4:0)" />
        <signal name="Rsrc(15:0)" />
        <signal name="Immediate(15:0)" />
        <signal name="XLXN_408(15:0)" />
        <signal name="XLXN_413(15:0)" />
        <signal name="XLXN_420(1:0)" />
        <signal name="PCSource3(15:0)" />
        <signal name="Address(15:0)" />
        <signal name="Data(15:0)" />
        <port polarity="Input" name="Clk" />
        <port polarity="Output" name="MemWrite" />
        <port polarity="Input" name="Reset" />
        <port polarity="Input" name="ReadData(15:0)" />
        <port polarity="Input" name="ALUB_input3(15:0)" />
        <port polarity="Input" name="PCSource3(15:0)" />
        <port polarity="Output" name="Address(15:0)" />
        <port polarity="Output" name="Data(15:0)" />
        <blockdef name="ALU">
            <timestamp>2012-11-9T23:41:22</timestamp>
            <rect width="356" x="64" y="-392" height="392" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="240" y1="-448" y2="-392" x1="240" />
            <rect width="44" x="420" y="-44" height="24" />
            <line x2="420" y1="-32" y2="-32" x1="464" />
            <rect width="28" x="324" y="-448" height="56" />
            <line x2="336" y1="-448" y2="-392" x1="336" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <rect width="64" x="0" y="-316" height="24" />
            <line x2="420" y1="-80" y2="-80" x1="464" />
            <rect width="44" x="420" y="-92" height="24" />
            <line x2="288" y1="-448" y2="-392" x1="288" />
            <line x2="192" y1="-448" y2="-392" x1="192" />
            <line x2="144" y1="-448" y2="-392" x1="144" />
        </blockdef>
        <blockdef name="regfile">
            <timestamp>2012-10-18T21:42:16</timestamp>
            <rect width="256" x="64" y="-436" height="436" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-364" height="24" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="SignExtender">
            <timestamp>2012-10-19T22:11:22</timestamp>
            <rect width="256" x="64" y="0" height="80" />
            <rect width="64" x="0" y="52" height="24" />
            <line x2="0" y1="64" y2="64" x1="64" />
            <rect width="64" x="320" y="52" height="24" />
            <line x2="384" y1="64" y2="64" x1="320" />
            <line x2="80" y1="0" y2="-32" x1="80" />
        </blockdef>
        <blockdef name="InstructionRegister">
            <timestamp>2012-10-17T4:14:43</timestamp>
            <line x2="0" y1="176" y2="176" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="432" y1="48" y2="48" x1="368" />
            <rect width="64" x="368" y="36" height="24" />
            <rect width="304" x="64" y="-264" height="472" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
        </blockdef>
        <blockdef name="ALUctrl">
            <timestamp>2012-10-23T23:27:12</timestamp>
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="20" height="24" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="384" y1="224" y2="224" x1="320" />
            <line x2="384" y1="176" y2="176" x1="320" />
            <line x2="384" y1="128" y2="128" x1="320" />
            <line x2="384" y1="80" y2="80" x1="320" />
            <rect width="256" x="64" y="-128" height="376" />
            <rect width="64" x="0" y="212" height="24" />
            <line x2="0" y1="224" y2="224" x1="64" />
        </blockdef>
        <blockdef name="mux4">
            <timestamp>2012-10-17T7:34:19</timestamp>
            <rect width="256" x="64" y="-372" height="372" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="296" y1="-8" y2="-8" x1="84" />
            <line x2="272" y1="-8" y2="-16" x1="296" />
        </blockdef>
        <blockdef name="PCRegister">
            <timestamp>2012-10-17T4:54:58</timestamp>
            <rect width="432" x="64" y="-128" height="180" />
            <line x2="336" y1="-176" y2="-128" x1="336" />
            <line x2="224" y1="-176" y2="-128" x1="224" />
            <rect width="64" x="496" y="-76" height="24" />
            <line x2="560" y1="-64" y2="-64" x1="496" />
            <rect width="64" x="496" y="20" height="24" />
            <line x2="560" y1="32" y2="32" x1="496" />
            <line x2="0" y1="32" y2="32" x1="64" />
        </blockdef>
        <blockdef name="ControlLogic">
            <timestamp>2012-11-3T20:36:7</timestamp>
            <rect width="332" x="164" y="-1292" height="1116" />
            <rect width="64" x="496" y="-988" height="24" />
            <line x2="560" y1="-976" y2="-976" x1="496" />
            <rect width="64" x="496" y="-1036" height="24" />
            <line x2="560" y1="-1024" y2="-1024" x1="496" />
            <line x2="560" y1="-1072" y2="-1072" x1="496" />
            <line x2="560" y1="-1168" y2="-1168" x1="496" />
            <line x2="320" y1="-112" y2="-176" x1="320" />
            <rect width="28" x="304" y="-176" height="64" />
            <rect width="28" x="240" y="-176" height="64" />
            <line x2="256" y1="-112" y2="-176" x1="256" />
            <line x2="192" y1="-112" y2="-176" x1="192" />
            <line x2="560" y1="-432" y2="-432" x1="496" />
            <line x2="560" y1="-336" y2="-336" x1="496" />
            <line x2="368" y1="-112" y2="-176" x1="368" />
            <line x2="560" y1="-384" y2="-384" x1="496" />
            <line x2="164" y1="-912" y2="-912" x1="112" />
            <line x2="164" y1="-864" y2="-864" x1="112" />
            <line x2="164" y1="-816" y2="-816" x1="112" />
            <line x2="164" y1="-768" y2="-768" x1="112" />
            <line x2="164" y1="-720" y2="-720" x1="112" />
            <line x2="164" y1="-1056" y2="-1056" x1="112" />
            <rect width="52" x="112" y="-1068" height="24" />
            <rect width="64" x="496" y="-1084" height="24" />
            <line x2="560" y1="-928" y2="-928" x1="496" />
            <rect width="64" x="496" y="-940" height="24" />
            <line x2="560" y1="-288" y2="-288" x1="496" />
            <line x2="416" y1="-112" y2="-176" x1="416" />
            <rect width="28" x="400" y="-176" height="64" />
            <line x2="560" y1="-1120" y2="-1120" x1="496" />
            <rect width="64" x="496" y="-1132" height="24" />
            <line x2="464" y1="-112" y2="-176" x1="464" />
            <rect width="28" x="448" y="-176" height="64" />
        </blockdef>
        <blockdef name="AddOne">
            <timestamp>2012-10-19T0:52:49</timestamp>
            <rect width="304" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
            <line x2="340" y1="-8" y2="-8" x1="84" />
            <line x2="320" y1="-8" y2="-16" x1="340" />
        </blockdef>
        <blockdef name="ShiftLeft8">
            <timestamp>2012-10-19T22:20:40</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="mux8">
            <timestamp>2012-10-19T22:24:4</timestamp>
            <rect width="256" x="64" y="-576" height="576" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-556" height="24" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
        </blockdef>
        <blockdef name="PSR">
            <timestamp>2012-10-23T22:32:55</timestamp>
            <rect width="152" x="64" y="-640" height="556" />
            <line x2="128" y1="-32" y2="-84" x1="128" />
            <line x2="176" y1="-32" y2="-84" x1="176" />
            <line x2="176" y1="-704" y2="-640" x1="176" />
            <rect width="24" x="164" y="-704" height="64" />
            <line x2="180" y1="-448" y2="-468" x1="172" />
            <line x2="172" y1="-492" y2="-448" x1="172" />
            <line x2="0" y1="-368" y2="-368" x1="64" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <rect width="64" x="0" y="-524" height="24" />
        </blockdef>
        <blockdef name="Add16Bit">
            <timestamp>2012-11-1T22:27:20</timestamp>
            <rect width="384" x="64" y="-192" height="124" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="448" y="-140" height="24" />
            <line x2="512" y1="-128" y2="-128" x1="448" />
        </blockdef>
        <blockdef name="Multiply">
            <timestamp>2012-11-10T18:50:34</timestamp>
            <rect width="320" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-108" height="24" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
        </blockdef>
        <block symbolname="regfile" name="RegisterFile">
            <blockpin signalname="Clk" name="clk" />
            <blockpin signalname="RegWrite" name="regwrite" />
            <blockpin signalname="Instruction(3:0)" name="ra1(3:0)" />
            <blockpin signalname="Instruction(11:8)" name="ra2(3:0)" />
            <blockpin signalname="Instruction(11:8)" name="wa(3:0)" />
            <blockpin signalname="XLXN_20(15:0)" name="wd(15:0)" />
            <blockpin signalname="Rsrc(15:0)" name="rd1(15:0)" />
            <blockpin signalname="Data(15:0)" name="rd2(15:0)" />
        </block>
        <block symbolname="SignExtender" name="SignExtend">
            <blockpin signalname="XLXN_326" name="SignExtend" />
            <blockpin signalname="Instruction(7:0)" name="inData(7:0)" />
            <blockpin signalname="Immediate(15:0)" name="outData(15:0)" />
        </block>
        <block symbolname="ALUctrl" name="ALUControl">
            <blockpin signalname="XLXN_325(1:0)" name="ALUop(1:0)" />
            <blockpin signalname="Instruction(7:4)" name="OPCodeExtension(3:0)" />
            <blockpin signalname="Instruction(15:12)" name="OPCode(3:0)" />
            <blockpin signalname="aInv" name="Ainv" />
            <blockpin signalname="bInv" name="Binv" />
            <blockpin signalname="Cin" name="Sub" />
            <blockpin signalname="XLXN_319" name="ShiftImm" />
            <blockpin signalname="XLXN_172(2:0)" name="ALUcontrol(2:0)" />
        </block>
        <block symbolname="InstructionRegister" name="InstrReg">
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="ReadData(15:0)" name="Instruction_In(15:0)" />
            <blockpin signalname="Instruction(15:0)" name="Instruction_Out(15:0)" />
            <blockpin signalname="InstrWrite" name="InstrWrite" />
        </block>
        <block symbolname="PCRegister" name="ProgrCnt">
            <blockpin signalname="PCWrite" name="PCWrite" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="XLXN_408(15:0)" name="PCin(15:0)" />
            <blockpin signalname="XLXN_344(15:0)" name="PCout(15:0)" />
            <blockpin signalname="Clk" name="Clk" />
        </block>
        <block symbolname="AddOne" name="PCPlus1">
            <blockpin signalname="XLXN_344(15:0)" name="PC(15:0)" />
            <blockpin signalname="ProgramCounter(15:0)" name="PCPlusOne(15:0)" />
        </block>
        <block symbolname="ShiftLeft8" name="XLXI_31">
            <blockpin signalname="Instruction(7:0)" name="inData(7:0)" />
            <blockpin signalname="XLXN_343(15:0)" name="outData(15:0)" />
        </block>
        <block symbolname="mux8" name="RDataSRC">
            <blockpin signalname="XLXN_192(15:0)" name="d0(15:0)" />
            <blockpin signalname="ReadData(15:0)" name="d1(15:0)" />
            <blockpin signalname="Immediate(15:0)" name="d2(15:0)" />
            <blockpin signalname="XLXN_343(15:0)" name="d3(15:0)" />
            <blockpin signalname="Rsrc(15:0)" name="d4(15:0)" />
            <blockpin signalname="ProgramCounter(15:0)" name="d5(15:0)" />
            <blockpin signalname="MULT(15:0)" name="d6(15:0)" />
            <blockpin signalname="DIV(15:0)" name="d7(15:0)" />
            <blockpin signalname="XLXN_342(2:0)" name="s(2:0)" />
            <blockpin signalname="XLXN_20(15:0)" name="y(15:0)" />
        </block>
        <block symbolname="mux4" name="XLXI_35">
            <blockpin signalname="Immediate(15:0)" name="d0(15:0)" />
            <blockpin signalname="Rsrc(15:0)" name="d1(15:0)" />
            <blockpin signalname="XLXN_344(15:0)" name="d2(15:0)" />
            <blockpin signalname="ALUB_input3(15:0)" name="d3(15:0)" />
            <blockpin signalname="XLXN_388(1:0)" name="s(1:0)" />
            <blockpin signalname="Address(15:0)" name="y(15:0)" />
        </block>
        <block symbolname="mux4" name="XLXI_36">
            <blockpin signalname="ProgramCounter(15:0)" name="d0(15:0)" />
            <blockpin signalname="Rsrc(15:0)" name="d1(15:0)" />
            <blockpin signalname="XLXN_413(15:0)" name="d2(15:0)" />
            <blockpin signalname="PCSource3(15:0)" name="d3(15:0)" />
            <blockpin signalname="XLXN_420(1:0)" name="s(1:0)" />
            <blockpin signalname="XLXN_408(15:0)" name="y(15:0)" />
        </block>
        <block symbolname="ControlLogic" name="Control">
            <blockpin signalname="Reset" name="reset" />
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="Instruction(15:12)" name="OPCode(3:0)" />
            <blockpin signalname="Instruction(7:4)" name="OPCodeExtension(3:0)" />
            <blockpin signalname="InstrWrite" name="InstrWrite" />
            <blockpin signalname="RegWrite" name="RegWrite" />
            <blockpin signalname="XLXN_388(1:0)" name="ALUSrcB(1:0)" />
            <blockpin signalname="MemWrite" name="MemWrite" />
            <blockpin signalname="XLXN_326" name="SignExtend" />
            <blockpin signalname="XLXN_325(1:0)" name="ALUop(1:0)" />
            <blockpin signalname="XLXN_342(2:0)" name="RegDataSRC(2:0)" />
            <blockpin signalname="XLXN_361" name="SetC" />
            <blockpin signalname="XLXN_362" name="SetL" />
            <blockpin signalname="XLXN_363" name="SetF" />
            <blockpin signalname="XLXN_364" name="SetZ" />
            <blockpin signalname="XLXN_365" name="SetN" />
            <blockpin signalname="XLXN_377(4:0)" name="PSR_Value(4:0)" />
            <blockpin signalname="XLXN_420(1:0)" name="PCSource(1:0)" />
            <blockpin signalname="PCWrite" name="PCWrite" />
            <blockpin signalname="Instruction(11:8)" name="JCond(3:0)" />
            <blockpin signalname="DIV(15:0)" name="SCond(15:0)" />
            <blockpin signalname="Instruction(3:0)" name="cond(3:0)" />
        </block>
        <block symbolname="PSR" name="XLXI_32">
            <blockpin signalname="Reset" name="reset" />
            <blockpin signalname="Clk" name="clk" />
            <blockpin signalname="XLXN_372(4:0)" name="CLFZN(4:0)" />
            <blockpin signalname="XLXN_361" name="SetC" />
            <blockpin signalname="XLXN_362" name="SetL" />
            <blockpin signalname="XLXN_363" name="SetF" />
            <blockpin signalname="XLXN_364" name="SetZ" />
            <blockpin signalname="XLXN_365" name="SetN" />
            <blockpin signalname="XLXN_377(4:0)" name="PState_CLFZN(4:0)" />
        </block>
        <block symbolname="Add16Bit" name="XLXI_40">
            <blockpin signalname="XLXN_344(15:0)" name="PC(15:0)" />
            <blockpin signalname="Immediate(15:0)" name="Immediate(15:0)" />
            <blockpin signalname="XLXN_413(15:0)" name="PCPlusImm(15:0)" />
        </block>
        <block symbolname="ALU" name="XLXI_41">
            <blockpin signalname="Cin" name="sub" />
            <blockpin signalname="aInv" name="aInvert" />
            <blockpin signalname="bInv" name="bInvert" />
            <blockpin signalname="XLXN_319" name="ShiftImm" />
            <blockpin signalname="Data(15:0)" name="aInput(15:0)" />
            <blockpin signalname="Address(15:0)" name="bInput(15:0)" />
            <blockpin signalname="XLXN_172(2:0)" name="opCode(2:0)" />
            <blockpin signalname="XLXN_192(15:0)" name="res(15:0)" />
            <blockpin signalname="XLXN_372(4:0)" name="CLFZN(4:0)" />
        </block>
        <block symbolname="Multiply" name="XLXI_50">
            <blockpin signalname="Data(15:0)" name="Ainput(15:0)" />
            <blockpin signalname="Address(15:0)" name="Binput(15:0)" />
            <blockpin signalname="MULT(15:0)" name="Result(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <branch name="Cin">
            <wire x2="3152" y1="1360" y2="1712" x1="3152" />
        </branch>
        <branch name="aInv">
            <wire x2="3200" y1="1312" y2="1312" x1="3152" />
            <wire x2="3200" y1="1312" y2="1712" x1="3200" />
        </branch>
        <branch name="Instruction(7:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1440" y="2192" type="branch" />
            <wire x2="1440" y1="2192" y2="2192" x1="1424" />
            <wire x2="1776" y1="2192" y2="2192" x1="1440" />
            <wire x2="1840" y1="2192" y2="2192" x1="1776" />
            <wire x2="1776" y1="2192" y2="2272" x1="1776" />
            <wire x2="1840" y1="2272" y2="2272" x1="1776" />
        </branch>
        <branch name="XLXN_172(2:0)">
            <wire x2="3344" y1="1168" y2="1168" x1="3152" />
            <wire x2="3344" y1="1168" y2="1712" x1="3344" />
        </branch>
        <iomarker fontsize="28" x="608" y="1680" name="Clk" orien="R180" />
        <bustap x2="1424" y1="2192" y2="2192" x1="1328" />
        <branch name="Instruction(3:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1552" y="1808" type="branch" />
            <wire x2="1440" y1="1760" y2="1760" x1="1424" />
            <wire x2="1440" y1="1760" y2="1808" x1="1440" />
            <wire x2="1552" y1="1808" y2="1808" x1="1440" />
            <wire x2="1840" y1="1808" y2="1808" x1="1552" />
        </branch>
        <branch name="XLXN_192(15:0)">
            <wire x2="3488" y1="2496" y2="2496" x1="2224" />
            <wire x2="3488" y1="2128" y2="2128" x1="3472" />
            <wire x2="3488" y1="2128" y2="2496" x1="3488" />
        </branch>
        <branch name="MemWrite">
            <wire x2="2560" y1="704" y2="1424" x1="2560" />
            <wire x2="3440" y1="1424" y2="1424" x1="2560" />
        </branch>
        <instance x="832" y="2000" name="InstrReg" orien="R0">
        </instance>
        <branch name="Reset">
            <wire x2="944" y1="976" y2="976" x1="544" />
            <wire x2="944" y1="976" y2="1216" x1="944" />
            <wire x2="944" y1="48" y2="336" x1="944" />
            <wire x2="1504" y1="336" y2="336" x1="944" />
            <wire x2="944" y1="336" y2="976" x1="944" />
            <wire x2="1968" y1="48" y2="48" x1="944" />
        </branch>
        <bustap x2="1424" y1="1936" y2="1936" x1="1328" />
        <branch name="Instruction(11:8)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1488" y="1936" type="branch" />
            <wire x2="1488" y1="1936" y2="1936" x1="1424" />
            <wire x2="1712" y1="1936" y2="1936" x1="1488" />
            <wire x2="1840" y1="1936" y2="1936" x1="1712" />
            <wire x2="1840" y1="1872" y2="1872" x1="1712" />
            <wire x2="1712" y1="1872" y2="1936" x1="1712" />
        </branch>
        <bustap x2="1424" y1="1760" y2="1760" x1="1328" />
        <text style="fontsize:24;fontname:Arial" x="1552" y="2168">Immediate</text>
        <text style="fontsize:24;fontname:Arial" x="1664" y="1784">Rsrc</text>
        <text style="fontsize:24;fontname:Arial" x="1604" y="1916">Rdest</text>
        <branch name="Instruction(15:0)">
            <wire x2="1328" y1="2048" y2="2048" x1="1264" />
            <wire x2="1328" y1="2048" y2="2192" x1="1328" />
            <wire x2="1328" y1="400" y2="464" x1="1328" />
            <wire x2="1328" y1="464" y2="560" x1="1328" />
            <wire x2="1328" y1="560" y2="608" x1="1328" />
            <wire x2="1328" y1="608" y2="1104" x1="1328" />
            <wire x2="1328" y1="1104" y2="1200" x1="1328" />
            <wire x2="1328" y1="1200" y2="1760" x1="1328" />
            <wire x2="1328" y1="1760" y2="1936" x1="1328" />
            <wire x2="1328" y1="1936" y2="2048" x1="1328" />
        </branch>
        <branch name="Instruction(7:4)">
            <attrtext style="alignment:HARD-TCENTER" attrname="Name" x="1472" y="1104" type="branch" />
            <wire x2="1472" y1="1104" y2="1104" x1="1424" />
            <wire x2="2768" y1="1104" y2="1104" x1="1472" />
        </branch>
        <instance x="720" y="1392" name="ProgrCnt" orien="R0">
        </instance>
        <branch name="XLXN_319">
            <wire x2="3296" y1="1216" y2="1216" x1="3152" />
            <wire x2="3296" y1="1216" y2="1712" x1="3296" />
        </branch>
        <bustap x2="1424" y1="1200" y2="1200" x1="1328" />
        <branch name="Instruction(15:12)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1472" y="1200" type="branch" />
            <wire x2="1472" y1="1200" y2="1200" x1="1424" />
            <wire x2="2608" y1="1200" y2="1200" x1="1472" />
            <wire x2="2608" y1="1200" y2="1360" x1="2608" />
            <wire x2="2768" y1="1360" y2="1360" x1="2608" />
        </branch>
        <instance x="1840" y="2128" name="SignExtend" orien="R0">
        </instance>
        <instance x="1840" y="2304" name="XLXI_31" orien="R0">
        </instance>
        <text style="alignment:VCENTER;fontsize:44;fontname:Arial" x="1952" y="2776">RegDataSRC</text>
        <text x="2064" y="2516">ALU Result</text>
        <text x="2064" y="2576">MEM Data</text>
        <text x="2068" y="2640">Immediate</text>
        <branch name="XLXN_343(15:0)">
            <wire x2="2320" y1="2272" y2="2272" x1="2224" />
            <wire x2="2320" y1="2272" y2="2688" x1="2320" />
            <wire x2="2320" y1="2688" y2="2688" x1="2224" />
        </branch>
        <text x="2072" y="2708">Upper Imm</text>
        <text x="2072" y="2772">Rsrc</text>
        <text x="2068" y="2836">PC+1</text>
        <text x="2068" y="2900">MULT result</text>
        <text x="2012" y="3008">Select 0-7</text>
        <iomarker fontsize="28" x="544" y="976" name="Reset" orien="R180" />
        <branch name="DIV(15:0)">
            <wire x2="2512" y1="2944" y2="2944" x1="2224" />
            <wire x2="2512" y1="704" y2="2944" x1="2512" />
        </branch>
        <branch name="XLXN_20(15:0)">
            <wire x2="1840" y1="2000" y2="2000" x1="1824" />
            <wire x2="1824" y1="2000" y2="2496" x1="1824" />
            <wire x2="1840" y1="2496" y2="2496" x1="1824" />
        </branch>
        <instance x="2224" y="3040" name="RDataSRC" orien="M0">
        </instance>
        <branch name="InstrWrite">
            <wire x2="816" y1="1648" y2="1840" x1="816" />
            <wire x2="832" y1="1840" y2="1840" x1="816" />
            <wire x2="1728" y1="1648" y2="1648" x1="816" />
            <wire x2="1728" y1="704" y2="1648" x1="1728" />
        </branch>
        <branch name="XLXN_326">
            <wire x2="1776" y1="704" y2="2080" x1="1776" />
            <wire x2="1920" y1="2080" y2="2080" x1="1776" />
            <wire x2="1920" y1="2080" y2="2096" x1="1920" />
        </branch>
        <branch name="RegWrite">
            <wire x2="1824" y1="704" y2="1744" x1="1824" />
            <wire x2="1840" y1="1744" y2="1744" x1="1824" />
        </branch>
        <branch name="XLXN_344(15:0)">
            <wire x2="2352" y1="1424" y2="1424" x1="1280" />
            <wire x2="2352" y1="1424" y2="1456" x1="2352" />
            <wire x2="2352" y1="1456" y2="2064" x1="2352" />
            <wire x2="2544" y1="2064" y2="2064" x1="2352" />
            <wire x2="3408" y1="1456" y2="1456" x1="2352" />
            <wire x2="2352" y1="1328" y2="1328" x1="2336" />
            <wire x2="2352" y1="1328" y2="1424" x1="2352" />
            <wire x2="3408" y1="832" y2="832" x1="3280" />
            <wire x2="3408" y1="832" y2="1456" x1="3408" />
        </branch>
        <line x2="2064" y1="1796" y2="1716" x1="2020" />
        <instance x="2544" y="1904" name="XLXI_35" orien="M180">
        </instance>
        <branch name="XLXN_388(1:0)">
            <wire x2="2464" y1="704" y2="1936" x1="2464" />
            <wire x2="2544" y1="1936" y2="1936" x1="2464" />
        </branch>
        <branch name="ALUB_input3(15:0)">
            <wire x2="2320" y1="1552" y2="1552" x1="448" />
            <wire x2="2320" y1="1552" y2="2000" x1="2320" />
            <wire x2="2544" y1="2000" y2="2000" x1="2320" />
        </branch>
        <instance x="1840" y="2032" name="RegisterFile" orien="R0">
        </instance>
        <iomarker fontsize="28" x="448" y="1552" name="ALUB_input3(15:0)" orien="R180" />
        <line x2="2108" y1="1884" y2="1968" x1="2044" />
        <branch name="ProgramCounter(15:0)">
            <wire x2="1872" y1="1248" y2="1328" x1="1872" />
            <wire x2="1904" y1="1328" y2="1328" x1="1872" />
            <wire x2="2320" y1="1248" y2="1248" x1="1872" />
            <wire x2="2384" y1="1248" y2="1248" x1="2320" />
            <wire x2="2384" y1="1248" y2="2816" x1="2384" />
            <wire x2="2384" y1="2816" y2="2816" x1="2224" />
            <wire x2="2320" y1="992" y2="992" x1="2256" />
            <wire x2="2320" y1="992" y2="1248" x1="2320" />
        </branch>
        <branch name="XLXN_361">
            <wire x2="2304" y1="224" y2="256" x1="2304" />
        </branch>
        <branch name="XLXN_362">
            <wire x2="2256" y1="224" y2="256" x1="2256" />
        </branch>
        <branch name="XLXN_363">
            <wire x2="2208" y1="224" y2="256" x1="2208" />
        </branch>
        <branch name="XLXN_364">
            <wire x2="2160" y1="224" y2="256" x1="2160" />
        </branch>
        <branch name="XLXN_365">
            <wire x2="2112" y1="224" y2="256" x1="2112" />
        </branch>
        <branch name="XLXN_377(4:0)">
            <wire x2="2448" y1="224" y2="256" x1="2448" />
        </branch>
        <instance x="1392" y="144" name="Control" orien="R90">
        </instance>
        <instance x="1936" y="224" name="XLXI_32" orien="M270">
        </instance>
        <branch name="PCWrite">
            <wire x2="1056" y1="768" y2="1216" x1="1056" />
            <wire x2="1680" y1="768" y2="768" x1="1056" />
            <wire x2="1680" y1="704" y2="768" x1="1680" />
        </branch>
        <branch name="XLXN_342(2:0)">
            <wire x2="2416" y1="3008" y2="3008" x1="2224" />
            <wire x2="2416" y1="704" y2="3008" x1="2416" />
        </branch>
        <branch name="XLXN_372(4:0)">
            <wire x2="4000" y1="48" y2="48" x1="2640" />
            <wire x2="4000" y1="48" y2="2080" x1="4000" />
            <wire x2="4000" y1="2080" y2="2080" x1="3472" />
        </branch>
        <instance x="2336" y="1360" name="PCPlus1" orien="M0">
        </instance>
        <branch name="XLXN_408(15:0)">
            <wire x2="1680" y1="1328" y2="1328" x1="1280" />
            <wire x2="1680" y1="992" y2="1328" x1="1680" />
            <wire x2="1872" y1="992" y2="992" x1="1680" />
        </branch>
        <text x="2620" y="2212">Immediate</text>
        <text x="2624" y="2148">Rsrc</text>
        <text x="2624" y="2084">PC</text>
        <text x="2624" y="2020">ALUBinput</text>
        <text x="2624" y="1956">SelectLine</text>
        <text x="2120" y="1016">PC+1</text>
        <instance x="2256" y="704" name="XLXI_36" orien="R180">
        </instance>
        <branch name="bInv">
            <wire x2="3248" y1="1264" y2="1264" x1="3152" />
            <wire x2="3248" y1="1264" y2="1712" x1="3248" />
        </branch>
        <instance x="3280" y="992" name="XLXI_40" orien="M0">
        </instance>
        <branch name="Immediate(15:0)">
            <wire x2="2288" y1="2192" y2="2192" x1="2224" />
            <wire x2="2288" y1="2192" y2="2624" x1="2288" />
            <wire x2="2480" y1="2192" y2="2192" x1="2288" />
            <wire x2="2544" y1="2192" y2="2192" x1="2480" />
            <wire x2="2288" y1="2624" y2="2624" x1="2224" />
            <wire x2="2480" y1="1792" y2="2192" x1="2480" />
            <wire x2="2832" y1="1792" y2="1792" x1="2480" />
            <wire x2="3376" y1="1520" y2="1520" x1="2832" />
            <wire x2="2832" y1="1520" y2="1792" x1="2832" />
            <wire x2="3376" y1="896" y2="896" x1="3280" />
            <wire x2="3376" y1="896" y2="1520" x1="3376" />
        </branch>
        <branch name="XLXN_420(1:0)">
            <wire x2="2320" y1="736" y2="736" x1="2256" />
            <wire x2="2320" y1="704" y2="736" x1="2320" />
        </branch>
        <branch name="PCSource3(15:0)">
            <wire x2="2720" y1="800" y2="800" x1="2256" />
            <wire x2="2720" y1="560" y2="800" x1="2720" />
        </branch>
        <iomarker fontsize="28" x="2720" y="560" name="PCSource3(15:0)" orien="R270" />
        <branch name="Instruction(11:8)">
            <attrtext style="alignment:HARD-BCENTER" attrname="Name" x="1440" y="560" type="branch" />
            <wire x2="1440" y1="560" y2="560" x1="1424" />
            <wire x2="1504" y1="560" y2="560" x1="1440" />
        </branch>
        <instance x="3008" y="2160" name="XLXI_41" orien="R0">
        </instance>
        <branch name="Instruction(15:12)">
            <attrtext style="alignment:HARD-BCENTER" attrname="Name" x="1440" y="400" type="branch" />
            <wire x2="1440" y1="400" y2="400" x1="1424" />
            <wire x2="1504" y1="400" y2="400" x1="1440" />
        </branch>
        <bustap x2="1424" y1="400" y2="400" x1="1328" />
        <branch name="Instruction(7:4)">
            <attrtext style="alignment:HARD-BCENTER" attrname="Name" x="1440" y="464" type="branch" />
            <wire x2="1440" y1="464" y2="464" x1="1424" />
            <wire x2="1504" y1="464" y2="464" x1="1440" />
        </branch>
        <bustap x2="1424" y1="464" y2="464" x1="1328" />
        <bustap x2="1424" y1="560" y2="560" x1="1328" />
        <instance x="2768" y="1136" name="ALUControl" orien="R0">
        </instance>
        <branch name="XLXN_325(1:0)">
            <wire x2="2368" y1="704" y2="1040" x1="2368" />
            <wire x2="2768" y1="1040" y2="1040" x1="2368" />
        </branch>
        <bustap x2="1424" y1="1104" y2="1104" x1="1328" />
        <text x="2096" y="948">Rsrc Address</text>
        <branch name="Rsrc(15:0)">
            <wire x2="2288" y1="1680" y2="1680" x1="2224" />
            <wire x2="2288" y1="1680" y2="2128" x1="2288" />
            <wire x2="2352" y1="2128" y2="2128" x1="2288" />
            <wire x2="2352" y1="2128" y2="2752" x1="2352" />
            <wire x2="2544" y1="2128" y2="2128" x1="2352" />
            <wire x2="2656" y1="1680" y2="1680" x1="2288" />
            <wire x2="2352" y1="2752" y2="2752" x1="2224" />
            <wire x2="2656" y1="928" y2="928" x1="2256" />
            <wire x2="2656" y1="928" y2="1680" x1="2656" />
        </branch>
        <branch name="XLXN_413(15:0)">
            <wire x2="2768" y1="864" y2="864" x1="2256" />
        </branch>
        <text x="2100" y="888">PC+Offset</text>
        <text x="2056" y="2964">SCond Result</text>
        <bustap x2="1424" y1="608" y2="608" x1="1328" />
        <branch name="Instruction(3:0)">
            <attrtext style="alignment:HARD-BCENTER" attrname="Name" x="1440" y="608" type="branch" />
            <wire x2="1440" y1="608" y2="608" x1="1424" />
            <wire x2="1504" y1="608" y2="608" x1="1440" />
        </branch>
        <branch name="ReadData(15:0)">
            <wire x2="832" y1="1904" y2="1904" x1="768" />
            <wire x2="768" y1="1904" y2="2352" x1="768" />
            <wire x2="2256" y1="2352" y2="2352" x1="768" />
            <wire x2="2256" y1="2352" y2="2560" x1="2256" />
            <wire x2="4144" y1="2352" y2="2352" x1="2256" />
            <wire x2="2256" y1="2560" y2="2560" x1="2224" />
        </branch>
        <branch name="Data(15:0)">
            <wire x2="2256" y1="2000" y2="2000" x1="2224" />
            <wire x2="2256" y1="1856" y2="2000" x1="2256" />
            <wire x2="2896" y1="1856" y2="1856" x1="2256" />
            <wire x2="2992" y1="1856" y2="1856" x1="2896" />
            <wire x2="3008" y1="1856" y2="1856" x1="2992" />
            <wire x2="2992" y1="1856" y2="2224" x1="2992" />
            <wire x2="3152" y1="2224" y2="2224" x1="2992" />
            <wire x2="3152" y1="2224" y2="2880" x1="3152" />
            <wire x2="3440" y1="1616" y2="1616" x1="2896" />
            <wire x2="2896" y1="1616" y2="1856" x1="2896" />
            <wire x2="3152" y1="2880" y2="2880" x1="3056" />
        </branch>
        <branch name="MULT(15:0)">
            <wire x2="2608" y1="2880" y2="2880" x1="2224" />
        </branch>
        <branch name="Address(15:0)">
            <wire x2="2960" y1="2192" y2="2192" x1="2928" />
            <wire x2="3184" y1="2192" y2="2192" x1="2960" />
            <wire x2="3184" y1="2192" y2="2944" x1="3184" />
            <wire x2="3440" y1="1552" y2="1552" x1="2960" />
            <wire x2="2960" y1="1552" y2="2064" x1="2960" />
            <wire x2="3008" y1="2064" y2="2064" x1="2960" />
            <wire x2="2960" y1="2064" y2="2192" x1="2960" />
            <wire x2="3184" y1="2944" y2="2944" x1="3056" />
        </branch>
        <iomarker fontsize="28" x="3440" y="1424" name="MemWrite" orien="R0" />
        <iomarker fontsize="28" x="3440" y="1552" name="Address(15:0)" orien="R0" />
        <iomarker fontsize="28" x="3440" y="1616" name="Data(15:0)" orien="R0" />
        <iomarker fontsize="28" x="4144" y="2352" name="ReadData(15:0)" orien="R0" />
        <branch name="Clk">
            <wire x2="624" y1="1680" y2="1680" x1="608" />
            <wire x2="1840" y1="1680" y2="1680" x1="624" />
            <wire x2="624" y1="1680" y2="2176" x1="624" />
            <wire x2="832" y1="2176" y2="2176" x1="624" />
            <wire x2="1968" y1="96" y2="96" x1="624" />
            <wire x2="624" y1="96" y2="512" x1="624" />
            <wire x2="1504" y1="512" y2="512" x1="624" />
            <wire x2="624" y1="512" y2="1424" x1="624" />
            <wire x2="720" y1="1424" y2="1424" x1="624" />
            <wire x2="624" y1="1424" y2="1680" x1="624" />
        </branch>
        <instance x="3056" y="2976" name="XLXI_50" orien="M0">
        </instance>
    </sheet>
</drawing>
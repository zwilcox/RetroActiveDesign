<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4(2:0)" />
        <signal name="ALUop(2:0)" />
        <signal name="OpCodeExtention(3:0)" />
        <signal name="A(15:0)" />
        <signal name="B(15:0)" />
        <signal name="ALUResult(15:0)" />
        <signal name="N" />
        <signal name="Z" />
        <signal name="F" />
        <signal name="L" />
        <signal name="C" />
        <port polarity="Input" name="ALUop(2:0)" />
        <port polarity="Input" name="OpCodeExtention(3:0)" />
        <port polarity="Input" name="A(15:0)" />
        <port polarity="Input" name="B(15:0)" />
        <port polarity="Output" name="ALUResult(15:0)" />
        <port polarity="Output" name="N" />
        <port polarity="Output" name="Z" />
        <port polarity="Output" name="F" />
        <port polarity="Output" name="L" />
        <port polarity="Output" name="C" />
        <blockdef name="ALU">
            <timestamp>2012-10-17T7:41:21</timestamp>
            <rect width="356" x="64" y="-392" height="392" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="96" y1="-448" y2="-392" x1="96" />
            <line x2="160" y1="-448" y2="-392" x1="160" />
            <line x2="240" y1="-448" y2="-392" x1="240" />
            <line x2="420" y1="-224" y2="-224" x1="464" />
            <line x2="420" y1="-288" y2="-288" x1="464" />
            <line x2="420" y1="-352" y2="-352" x1="464" />
            <line x2="420" y1="-96" y2="-96" x1="464" />
            <line x2="424" y1="-160" y2="-160" x1="464" />
            <rect width="44" x="420" y="-44" height="24" />
            <line x2="420" y1="-32" y2="-32" x1="464" />
            <rect width="28" x="324" y="-448" height="56" />
            <line x2="336" y1="-448" y2="-392" x1="336" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <rect width="64" x="0" y="-316" height="24" />
        </blockdef>
        <blockdef name="ALUctrl">
            <timestamp>2012-10-15T18:20:5</timestamp>
            <line x2="384" y1="96" y2="96" x1="320" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="256" x="64" y="-128" height="384" />
            <rect width="64" x="320" y="20" height="24" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="384" y1="224" y2="224" x1="320" />
            <line x2="384" y1="160" y2="160" x1="320" />
        </blockdef>
        <block symbolname="ALU" name="XLXI_1">
            <blockpin signalname="XLXN_1" name="sub" />
            <blockpin signalname="XLXN_2" name="aInvert" />
            <blockpin signalname="XLXN_3" name="bInvert" />
            <blockpin signalname="A(15:0)" name="aInput(15:0)" />
            <blockpin signalname="B(15:0)" name="bInput(15:0)" />
            <blockpin signalname="XLXN_4(2:0)" name="opCode(2:0)" />
            <blockpin signalname="C" name="C" />
            <blockpin signalname="L" name="L" />
            <blockpin signalname="F" name="F" />
            <blockpin signalname="Z" name="Z" />
            <blockpin signalname="N" name="N" />
            <blockpin signalname="ALUResult(15:0)" name="aluResult(15:0)" />
        </block>
        <block symbolname="ALUctrl" name="XLXI_2">
            <blockpin signalname="ALUop(2:0)" name="ALUop(2:0)" />
            <blockpin signalname="OpCodeExtention(3:0)" name="OPCodeExtention(3:0)" />
            <blockpin signalname="XLXN_2" name="Ainv" />
            <blockpin signalname="XLXN_3" name="Binv" />
            <blockpin signalname="XLXN_1" name="Sub" />
            <blockpin signalname="XLXN_4(2:0)" name="ALUcontrol(2:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="864" y="1328" name="XLXI_1" orien="R0">
        </instance>
        <instance x="416" y="496" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="960" y1="720" y2="720" x1="800" />
            <wire x2="960" y1="720" y2="880" x1="960" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1024" y1="656" y2="656" x1="800" />
            <wire x2="1024" y1="656" y2="880" x1="1024" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1104" y1="592" y2="592" x1="800" />
            <wire x2="1104" y1="592" y2="880" x1="1104" />
        </branch>
        <branch name="XLXN_4(2:0)">
            <wire x2="1200" y1="528" y2="528" x1="800" />
            <wire x2="1200" y1="528" y2="880" x1="1200" />
        </branch>
        <branch name="ALUop(2:0)">
            <wire x2="416" y1="400" y2="400" x1="384" />
        </branch>
        <iomarker fontsize="28" x="384" y="400" name="ALUop(2:0)" orien="R180" />
        <branch name="OpCodeExtention(3:0)">
            <wire x2="416" y1="464" y2="464" x1="384" />
        </branch>
        <iomarker fontsize="28" x="384" y="464" name="OpCodeExtention(3:0)" orien="R180" />
        <branch name="A(15:0)">
            <wire x2="864" y1="1024" y2="1024" x1="832" />
        </branch>
        <iomarker fontsize="28" x="832" y="1024" name="A(15:0)" orien="R180" />
        <branch name="B(15:0)">
            <wire x2="864" y1="1232" y2="1232" x1="832" />
        </branch>
        <iomarker fontsize="28" x="832" y="1232" name="B(15:0)" orien="R180" />
        <branch name="ALUResult(15:0)">
            <wire x2="1360" y1="1296" y2="1296" x1="1328" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1296" name="ALUResult(15:0)" orien="R0" />
        <branch name="N">
            <wire x2="1360" y1="1232" y2="1232" x1="1328" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1232" name="N" orien="R0" />
        <branch name="Z">
            <wire x2="1360" y1="1168" y2="1168" x1="1328" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1168" name="Z" orien="R0" />
        <branch name="F">
            <wire x2="1360" y1="1104" y2="1104" x1="1328" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1104" name="F" orien="R0" />
        <branch name="L">
            <wire x2="1360" y1="1040" y2="1040" x1="1328" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1040" name="L" orien="R0" />
        <branch name="C">
            <wire x2="1360" y1="976" y2="976" x1="1328" />
        </branch>
        <iomarker fontsize="28" x="1360" y="976" name="C" orien="R0" />
    </sheet>
</drawing>
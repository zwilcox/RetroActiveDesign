<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="Clk" />
        <signal name="XLXN_10" />
        <signal name="Reset" />
        <signal name="SPI_MOSI" />
        <signal name="DAC_CS" />
        <signal name="DAC_CLK" />
        <signal name="XLXN_16(15:0)" />
        <signal name="XLXN_17(15:0)" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <signal name="XLXN_24" />
        <signal name="XLXN_25" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <port polarity="Input" name="Clk" />
        <port polarity="Input" name="Reset" />
        <port polarity="Output" name="SPI_MOSI" />
        <port polarity="Output" name="DAC_CS" />
        <port polarity="Output" name="DAC_CLK" />
        <blockdef name="bitshift">
            <timestamp>2012-10-21T0:35:32</timestamp>
            <line x2="384" y1="160" y2="160" x1="320" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="384" y1="96" y2="96" x1="320" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="256" x="64" y="-256" height="448" />
        </blockdef>
        <blockdef name="ValGen">
            <timestamp>2012-10-21T0:23:0</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="bitshift" name="XLXI_1">
            <blockpin signalname="Reset" name="reset" />
            <blockpin signalname="Clk" name="clk" />
            <blockpin signalname="XLXN_16(15:0)" name="word1(15:0)" />
            <blockpin signalname="XLXN_17(15:0)" name="word2(15:0)" />
            <blockpin signalname="SPI_MOSI" name="SPI_MOSI" />
            <blockpin signalname="DAC_CS" name="DAC_CS" />
            <blockpin signalname="DAC_CLK" name="DAC_CLK" />
        </block>
        <block symbolname="ValGen" name="XLXI_2">
            <blockpin signalname="Clk" name="clk" />
            <blockpin signalname="Reset" name="reset" />
            <blockpin signalname="XLXN_16(15:0)" name="value(15:0)" />
            <blockpin signalname="XLXN_17(15:0)" name="command(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1024" y="1136" name="XLXI_2" orien="R0">
        </instance>
        <branch name="Reset">
            <wire x2="976" y1="944" y2="944" x1="864" />
            <wire x2="976" y1="944" y2="1104" x1="976" />
            <wire x2="1024" y1="1104" y2="1104" x1="976" />
            <wire x2="1552" y1="912" y2="912" x1="976" />
            <wire x2="976" y1="912" y2="944" x1="976" />
        </branch>
        <iomarker fontsize="28" x="864" y="944" name="Reset" orien="R180" />
        <iomarker fontsize="28" x="864" y="1008" name="Clk" orien="R180" />
        <branch name="Clk">
            <wire x2="928" y1="1008" y2="1008" x1="864" />
            <wire x2="928" y1="1008" y2="1040" x1="928" />
            <wire x2="1024" y1="1040" y2="1040" x1="928" />
            <wire x2="1552" y1="976" y2="976" x1="928" />
            <wire x2="928" y1="976" y2="1008" x1="928" />
        </branch>
        <branch name="SPI_MOSI">
            <wire x2="2000" y1="1168" y2="1168" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="2000" y="1168" name="SPI_MOSI" orien="R0" />
        <branch name="DAC_CS">
            <wire x2="2000" y1="1232" y2="1232" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="2000" y="1232" name="DAC_CS" orien="R0" />
        <branch name="DAC_CLK">
            <wire x2="2000" y1="1296" y2="1296" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="2000" y="1296" name="DAC_CLK" orien="R0" />
        <branch name="XLXN_16(15:0)">
            <wire x2="1552" y1="1040" y2="1040" x1="1408" />
        </branch>
        <branch name="XLXN_17(15:0)">
            <wire x2="1552" y1="1104" y2="1104" x1="1408" />
        </branch>
        <instance x="1552" y="1136" name="XLXI_1" orien="R0">
        </instance>
    </sheet>
</drawing>
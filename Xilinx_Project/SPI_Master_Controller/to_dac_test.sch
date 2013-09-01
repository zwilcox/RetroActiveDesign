<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(31:0)" />
        <signal name="XLXN_3" />
        <signal name="MOSI" />
        <signal name="sClk" />
        <signal name="clock" />
        <signal name="SPI_CS" />
        <signal name="reset" />
        <signal name="resetDac" />
        <port polarity="Output" name="MOSI" />
        <port polarity="Output" name="sClk" />
        <port polarity="Input" name="clock" />
        <port polarity="Output" name="SPI_CS" />
        <port polarity="Input" name="reset" />
        <port polarity="Output" name="resetDac" />
        <blockdef name="DAC_TEST">
            <timestamp>2012-10-26T19:15:5</timestamp>
            <line x2="0" y1="672" y2="672" x1="64" />
            <line x2="0" y1="608" y2="608" x1="64" />
            <line x2="0" y1="352" y2="352" x1="64" />
            <line x2="384" y1="352" y2="352" x1="320" />
            <line x2="384" y1="416" y2="416" x1="320" />
            <rect width="64" x="320" y="468" height="24" />
            <line x2="384" y1="480" y2="480" x1="320" />
            <rect width="256" x="64" y="300" height="404" />
        </blockdef>
        <blockdef name="SPI_Master">
            <timestamp>2012-10-26T19:49:5</timestamp>
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-256" height="320" />
        </blockdef>
        <block symbolname="DAC_TEST" name="XLXI_4">
            <blockpin signalname="clock" name="clk" />
            <blockpin signalname="SPI_CS" name="count_test" />
            <blockpin signalname="XLXN_3" name="toEnable" />
            <blockpin signalname="resetDac" name="toReset" />
            <blockpin signalname="XLXN_1(31:0)" name="toSPI(31:0)" />
            <blockpin signalname="reset" name="reset" />
        </block>
        <block symbolname="SPI_Master" name="XLXI_6">
            <blockpin signalname="clock" name="clk" />
            <blockpin signalname="XLXN_3" name="enable" />
            <blockpin signalname="resetDac" name="reset" />
            <blockpin signalname="XLXN_1(31:0)" name="ToSPI(31:0)" />
            <blockpin signalname="MOSI" name="MOSI" />
            <blockpin signalname="sClk" name="sClk" />
            <blockpin signalname="SPI_CS" name="SPI_CS" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_1(31:0)">
            <wire x2="1376" y1="1408" y2="1408" x1="1168" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1376" y1="1280" y2="1280" x1="1168" />
        </branch>
        <branch name="MOSI">
            <wire x2="1792" y1="1216" y2="1216" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="1792" y="1216" name="MOSI" orien="R0" />
        <branch name="sClk">
            <wire x2="1792" y1="1472" y2="1472" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="1792" y="1472" name="sClk" orien="R0" />
        <iomarker fontsize="28" x="768" y="1008" name="clock" orien="R180" />
        <branch name="clock">
            <wire x2="768" y1="1008" y2="1280" x1="768" />
            <wire x2="784" y1="1280" y2="1280" x1="768" />
            <wire x2="1200" y1="1008" y2="1008" x1="768" />
            <wire x2="1200" y1="1008" y2="1216" x1="1200" />
            <wire x2="1376" y1="1216" y2="1216" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="2192" y="1408" name="SPI_CS" orien="R0" />
        <branch name="SPI_CS">
            <wire x2="720" y1="1536" y2="1584" x1="720" />
            <wire x2="2000" y1="1584" y2="1584" x1="720" />
            <wire x2="784" y1="1536" y2="1536" x1="720" />
            <wire x2="2000" y1="1408" y2="1408" x1="1760" />
            <wire x2="2192" y1="1408" y2="1408" x1="2000" />
            <wire x2="2000" y1="1408" y2="1584" x1="2000" />
        </branch>
        <instance x="784" y="928" name="XLXI_4" orien="R0">
        </instance>
        <branch name="reset">
            <wire x2="768" y1="1600" y2="1600" x1="592" />
            <wire x2="784" y1="1600" y2="1600" x1="768" />
        </branch>
        <iomarker fontsize="28" x="592" y="1600" name="reset" orien="R180" />
        <branch name="resetDac">
            <wire x2="1296" y1="1344" y2="1344" x1="1168" />
            <wire x2="1376" y1="1344" y2="1344" x1="1296" />
            <wire x2="1296" y1="1344" y2="1856" x1="1296" />
            <wire x2="2304" y1="1856" y2="1856" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="2304" y="1856" name="resetDac" orien="R0" />
        <instance x="1376" y="1440" name="XLXI_6" orien="R0">
        </instance>
    </sheet>
</drawing>
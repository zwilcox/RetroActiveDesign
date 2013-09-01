<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="toPlay1(16:0)" />
        <signal name="trigger(18:1)" />
        <port polarity="Input" name="toPlay1(16:0)" />
        <port polarity="Output" name="trigger(18:1)" />
        <blockdef name="ClockDivider_50Mhz_to_30Hz">
            <timestamp>2012-11-11T3:8:19</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <block symbolname="ClockDivider_50Mhz_to_30Hz" name="XLXI_2">
            <blockpin name="clock" />
            <blockpin name="reset" />
            <blockpin name="enable" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="toPlay1(16:0)">
            <wire x2="1360" y1="1200" y2="1200" x1="1328" />
        </branch>
        <branch name="trigger(18:1)">
            <wire x2="2032" y1="1200" y2="1200" x1="1888" />
        </branch>
        <iomarker fontsize="28" x="2032" y="1200" name="trigger(18:1)" orien="R0" />
        <iomarker fontsize="28" x="1328" y="1200" name="toPlay1(16:0)" orien="R180" />
        <instance x="1584" y="1536" name="XLXI_2" orien="R0">
        </instance>
    </sheet>
</drawing>
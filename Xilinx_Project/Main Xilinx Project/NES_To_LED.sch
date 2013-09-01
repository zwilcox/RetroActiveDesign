<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="clock" />
        <signal name="latch" />
        <signal name="pulse" />
        <signal name="PlayerInput(7:0)" />
        <signal name="reset" />
        <signal name="From_Controller" />
        <signal name="XLXN_12" />
        <port polarity="Input" name="clock" />
        <port polarity="Output" name="latch" />
        <port polarity="Output" name="pulse" />
        <port polarity="Output" name="PlayerInput(7:0)" />
        <port polarity="Input" name="reset" />
        <port polarity="Input" name="From_Controller" />
        <blockdef name="NESController">
            <timestamp>2012-10-7T0:16:21</timestamp>
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-128" y2="-128" x1="320" />
            <rect width="256" x="64" y="-256" height="272" />
            <rect width="64" x="320" y="-76" height="24" />
            <line x2="384" y1="-64" y2="-64" x1="320" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-112" y2="-112" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <blockdef name="ClockDivider_50MHz_To_60Hz">
            <timestamp>2012-10-7T0:14:34</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <block symbolname="NESController" name="XLXI_1">
            <blockpin signalname="clock" name="clock" />
            <blockpin signalname="latch" name="latch" />
            <blockpin signalname="pulse" name="pulse" />
            <blockpin signalname="PlayerInput(7:0)" name="playerInput(7:0)" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="From_Controller" name="data" />
            <blockpin signalname="XLXN_12" name="enable" />
        </block>
        <block symbolname="ClockDivider_50MHz_To_60Hz" name="XLXI_2">
            <blockpin signalname="clock" name="clock" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_12" name="enable" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1904" y="1328" name="XLXI_1" orien="R0">
        </instance>
        <branch name="clock">
            <wire x2="896" y1="1104" y2="1104" x1="784" />
            <wire x2="896" y1="1104" y2="1296" x1="896" />
            <wire x2="1088" y1="1296" y2="1296" x1="896" />
            <wire x2="1904" y1="1104" y2="1104" x1="896" />
        </branch>
        <branch name="latch">
            <wire x2="2320" y1="1104" y2="1104" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2320" y="1104" name="latch" orien="R0" />
        <branch name="pulse">
            <wire x2="2320" y1="1200" y2="1200" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2320" y="1200" name="pulse" orien="R0" />
        <branch name="PlayerInput(7:0)">
            <wire x2="2320" y1="1264" y2="1264" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2320" y="1264" name="PlayerInput(7:0)" orien="R0" />
        <branch name="reset">
            <wire x2="848" y1="1168" y2="1168" x1="784" />
            <wire x2="848" y1="1168" y2="1360" x1="848" />
            <wire x2="1088" y1="1360" y2="1360" x1="848" />
            <wire x2="1904" y1="1168" y2="1168" x1="848" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1904" y1="1296" y2="1296" x1="1472" />
        </branch>
        <instance x="1088" y="1392" name="XLXI_2" orien="R0">
        </instance>
        <iomarker fontsize="28" x="784" y="1104" name="clock" orien="R180" />
        <iomarker fontsize="28" x="784" y="1168" name="reset" orien="R180" />
        <branch name="From_Controller">
            <wire x2="1792" y1="1056" y2="1056" x1="928" />
            <wire x2="1792" y1="1056" y2="1216" x1="1792" />
            <wire x2="1904" y1="1216" y2="1216" x1="1792" />
        </branch>
        <iomarker fontsize="28" x="928" y="1056" name="From_Controller" orien="R180" />
    </sheet>
</drawing>
<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Number_to_Play(5:0)" />
        <signal name="clock" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="reset" />
        <signal name="ToMP3Trigger(18:1)" />
        <signal name="XLXN_11" />
        <port polarity="Input" name="Number_to_Play(5:0)" />
        <port polarity="Input" name="clock" />
        <port polarity="Input" name="reset" />
        <port polarity="Output" name="ToMP3Trigger(18:1)" />
        <blockdef name="MP3_Controller">
            <timestamp>2012-11-13T23:51:6</timestamp>
            <rect width="400" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="464" y="-172" height="24" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
        </blockdef>
        <blockdef name="ClockDivider_50Mhz_to_30Hz">
            <timestamp>2012-11-13T23:20:48</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <block symbolname="MP3_Controller" name="XLXI_5">
            <blockpin signalname="clock" name="clock" />
            <blockpin signalname="ToMP3Trigger(18:1)" name="trigger_out(18:1)" />
            <blockpin signalname="XLXN_11" name="enable" />
            <blockpin signalname="Number_to_Play(5:0)" name="Number_to_Play(5:0)" />
        </block>
        <block symbolname="ClockDivider_50Mhz_to_30Hz" name="XLXI_7">
            <blockpin signalname="clock" name="clock" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_11" name="enable" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="Number_to_Play(5:0)">
            <wire x2="1104" y1="1632" y2="1632" x1="1056" />
        </branch>
        <branch name="clock">
            <wire x2="176" y1="1568" y2="1568" x1="112" />
            <wire x2="1104" y1="1568" y2="1568" x1="176" />
            <wire x2="176" y1="1568" y2="1792" x1="176" />
            <wire x2="320" y1="1792" y2="1792" x1="176" />
        </branch>
        <iomarker fontsize="28" x="112" y="1568" name="clock" orien="R180" />
        <instance x="1104" y="1728" name="XLXI_5" orien="R0">
        </instance>
        <iomarker fontsize="28" x="1056" y="1632" name="Number_to_Play(5:0)" orien="R180" />
        <instance x="320" y="1888" name="XLXI_7" orien="R0">
        </instance>
        <branch name="reset">
            <wire x2="320" y1="1856" y2="1856" x1="288" />
        </branch>
        <iomarker fontsize="28" x="288" y="1856" name="reset" orien="R180" />
        <branch name="ToMP3Trigger(18:1)">
            <wire x2="1664" y1="1568" y2="1568" x1="1632" />
        </branch>
        <iomarker fontsize="28" x="1664" y="1568" name="ToMP3Trigger(18:1)" orien="R0" />
        <branch name="XLXN_11">
            <wire x2="896" y1="1792" y2="1792" x1="704" />
            <wire x2="896" y1="1696" y2="1792" x1="896" />
            <wire x2="1104" y1="1696" y2="1696" x1="896" />
        </branch>
    </sheet>
</drawing>
<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_10" />
        <signal name="XLXN_31(11:0)" />
        <signal name="XLXN_32(11:0)" />
        <signal name="NES_Latch" />
        <signal name="NES_Pulse" />
        <signal name="XLXN_55(7:0)" />
        <signal name="SevenSegCat" />
        <signal name="SevenSegs(6:0)" />
        <signal name="XLXN_57(11:0)" />
        <signal name="XLXN_58(13:0)" />
        <signal name="XLXN_59(15:0)" />
        <signal name="Clock" />
        <signal name="XLXN_62(15:0)" />
        <signal name="XLXN_63(15:0)" />
        <signal name="XLXN_65" />
        <signal name="XLXN_66(15:0)" />
        <signal name="XLXN_68(15:0)" />
        <signal name="XLXN_69(15:0)" />
        <signal name="reset" />
        <signal name="MP3Trig(18:1)" />
        <signal name="hSync" />
        <signal name="vSync" />
        <signal name="XLXN_94(11:0)" />
        <signal name="XLXN_95(11:0)" />
        <signal name="XLXN_96(11:0)" />
        <signal name="XLXN_99" />
        <signal name="XLXN_102" />
        <signal name="XLXN_109(13:0)" />
        <signal name="XLXN_111(3:0)" />
        <signal name="XLXN_116(3:0)" />
        <signal name="XLXN_118(15:0)" />
        <signal name="red" />
        <signal name="green" />
        <signal name="blue" />
        <signal name="XLXN_135(10:0)" />
        <signal name="XLXN_136(10:0)" />
        <signal name="XLXN_146(15:0)" />
        <signal name="XLXN_151(15:0)" />
        <signal name="XLXN_152" />
        <signal name="XLXN_153" />
        <signal name="XLXN_157" />
        <signal name="XLXN_159" />
        <signal name="XLXN_160" />
        <signal name="XLXN_161" />
        <signal name="XLXN_162" />
        <signal name="XLXN_164(15:0)" />
        <signal name="XLXN_165(15:0)" />
        <signal name="XLXN_166(15:0)" />
        <signal name="XLXN_167(15:0)" />
        <signal name="XLXN_168(15:0)" />
        <signal name="XLXN_169(15:0)" />
        <signal name="XLXN_170(15:0)" />
        <signal name="XLXN_189" />
        <signal name="XLXN_191" />
        <signal name="XLXN_192(5:0)" />
        <signal name="XLXN_193(15:0)" />
        <signal name="XLXN_197(2:0)" />
        <signal name="XLXN_202(7:0)" />
        <signal name="XLXN_203" />
        <signal name="controller_data" />
        <signal name="XLXN_205(7:0)" />
        <port polarity="Output" name="XLXN_31(11:0)" />
        <port polarity="Output" name="XLXN_32(11:0)" />
        <port polarity="Output" name="NES_Latch" />
        <port polarity="Output" name="NES_Pulse" />
        <port polarity="Output" name="SevenSegCat" />
        <port polarity="Output" name="SevenSegs(6:0)" />
        <port polarity="Output" name="XLXN_57(11:0)" />
        <port polarity="Input" name="Clock" />
        <port polarity="Input" name="XLXN_68(15:0)" />
        <port polarity="Input" name="XLXN_69(15:0)" />
        <port polarity="Input" name="reset" />
        <port polarity="Output" name="MP3Trig(18:1)" />
        <port polarity="Output" name="hSync" />
        <port polarity="Output" name="vSync" />
        <port polarity="Output" name="red" />
        <port polarity="Output" name="green" />
        <port polarity="Output" name="blue" />
        <port polarity="Input" name="XLXN_202(7:0)" />
        <port polarity="Input" name="controller_data" />
        <blockdef name="Memory">
            <timestamp>2012-11-21T23:6:34</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="84" height="24" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <rect width="64" x="384" y="20" height="24" />
            <line x2="448" y1="32" y2="32" x1="384" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-236" height="24" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
            <rect width="320" x="64" y="-256" height="384" />
        </blockdef>
        <blockdef name="IO_Mem_Controller">
            <timestamp>2012-12-7T8:35:48</timestamp>
            <rect width="64" x="0" y="724" height="24" />
            <line x2="0" y1="736" y2="736" x1="64" />
            <rect width="64" x="0" y="660" height="24" />
            <line x2="0" y1="672" y2="672" x1="64" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <line x2="0" y1="224" y2="224" x1="64" />
            <line x2="0" y1="288" y2="288" x1="64" />
            <line x2="0" y1="352" y2="352" x1="64" />
            <line x2="0" y1="416" y2="416" x1="64" />
            <line x2="0" y1="480" y2="480" x1="64" />
            <line x2="0" y1="544" y2="544" x1="64" />
            <line x2="0" y1="608" y2="608" x1="64" />
            <rect width="64" x="496" y="84" height="24" />
            <line x2="560" y1="96" y2="96" x1="496" />
            <rect width="64" x="496" y="148" height="24" />
            <line x2="560" y1="160" y2="160" x1="496" />
            <rect width="64" x="496" y="212" height="24" />
            <line x2="560" y1="224" y2="224" x1="496" />
            <rect width="64" x="496" y="276" height="24" />
            <line x2="560" y1="288" y2="288" x1="496" />
            <rect width="64" x="496" y="340" height="24" />
            <line x2="560" y1="352" y2="352" x1="496" />
            <rect width="64" x="496" y="404" height="24" />
            <line x2="560" y1="416" y2="416" x1="496" />
            <rect width="64" x="496" y="468" height="24" />
            <line x2="560" y1="480" y2="480" x1="496" />
            <rect width="64" x="496" y="532" height="24" />
            <line x2="560" y1="544" y2="544" x1="496" />
            <rect width="64" x="496" y="596" height="24" />
            <line x2="560" y1="608" y2="608" x1="496" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-268" height="24" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-76" height="24" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <line x2="560" y1="-544" y2="-544" x1="496" />
            <rect width="64" x="496" y="-492" height="24" />
            <line x2="560" y1="-480" y2="-480" x1="496" />
            <rect width="64" x="496" y="-428" height="24" />
            <line x2="560" y1="-416" y2="-416" x1="496" />
            <rect width="64" x="496" y="-364" height="24" />
            <line x2="560" y1="-352" y2="-352" x1="496" />
            <rect width="64" x="496" y="-300" height="24" />
            <line x2="560" y1="-288" y2="-288" x1="496" />
            <rect width="64" x="496" y="-236" height="24" />
            <line x2="560" y1="-224" y2="-224" x1="496" />
            <rect width="64" x="496" y="-172" height="24" />
            <line x2="560" y1="-160" y2="-160" x1="496" />
            <rect width="64" x="496" y="-108" height="24" />
            <line x2="560" y1="-96" y2="-96" x1="496" />
            <rect width="64" x="496" y="-44" height="24" />
            <line x2="560" y1="-32" y2="-32" x1="496" />
            <rect width="432" x="64" y="-576" height="1344" />
        </blockdef>
        <blockdef name="PmodSSDcontroller">
            <timestamp>2012-11-10T19:39:7</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="Processor">
            <timestamp>2012-11-10T22:7:10</timestamp>
            <rect width="528" x="80" y="1060" height="332" />
            <line x2="16" y1="1284" y2="1284" x1="80" />
            <rect width="64" x="16" y="1272" height="24" />
            <line x2="16" y1="1232" y2="1232" x1="80" />
            <rect width="64" x="16" y="1220" height="24" />
            <line x2="16" y1="1156" y2="1156" x1="80" />
            <rect width="64" x="16" y="1144" height="24" />
            <line x2="16" y1="1376" y2="1376" x1="80" />
            <line x2="84" y1="1088" y2="1088" x1="16" />
            <line x2="672" y1="1104" y2="1104" x1="608" />
            <line x2="676" y1="1200" y2="1200" x1="612" />
            <rect width="64" x="612" y="1188" height="28" />
            <line x2="672" y1="1300" y2="1300" x1="608" />
            <rect width="64" x="608" y="1288" height="24" />
        </blockdef>
        <blockdef name="MP3Schematic">
            <timestamp>2012-11-13T23:51:25</timestamp>
            <rect width="64" x="320" y="20" height="24" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="256" x="64" y="-192" height="256" />
        </blockdef>
        <blockdef name="vgaControl">
            <timestamp>2012-11-21T22:25:3</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="glyphGen">
            <timestamp>2012-11-21T22:28:13</timestamp>
            <rect width="368" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="432" y="-172" height="24" />
            <line x2="496" y1="-160" y2="-160" x1="432" />
            <rect width="64" x="432" y="-108" height="24" />
            <line x2="496" y1="-96" y2="-96" x1="432" />
            <rect width="64" x="432" y="-44" height="24" />
            <line x2="496" y1="-32" y2="-32" x1="432" />
        </blockdef>
        <blockdef name="BitGen">
            <timestamp>2012-11-21T22:50:17</timestamp>
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-192" y2="-192" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
        </blockdef>
        <blockdef name="GlyphMap">
            <timestamp>2012-11-21T22:53:7</timestamp>
            <rect width="304" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-236" height="24" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <rect width="64" x="368" y="-140" height="24" />
            <line x2="432" y1="-128" y2="-128" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="milliSecondCounter">
            <timestamp>2012-11-28T0:48:42</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="CounterMax3">
            <timestamp>2012-12-7T8:36:53</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="NES_To_LED">
            <timestamp>2012-12-16T20:33:58</timestamp>
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="480" y1="-160" y2="-160" x1="416" />
            <line x2="480" y1="-96" y2="-96" x1="416" />
            <rect width="352" x="64" y="-192" height="244" />
            <line x2="480" y1="32" y2="32" x1="416" />
            <rect width="64" x="416" y="20" height="24" />
        </blockdef>
        <block symbolname="Memory" name="XLXI_4">
            <blockpin signalname="XLXN_10" name="MemWrite" />
            <blockpin signalname="Clock" name="clk" />
            <blockpin signalname="XLXN_99" name="pxlClk" />
            <blockpin signalname="XLXN_58(13:0)" name="ADDR(13:0)" />
            <blockpin signalname="XLXN_59(15:0)" name="DATA(15:0)" />
            <blockpin signalname="XLXN_109(13:0)" name="glyphAdd(13:0)" />
            <blockpin signalname="XLXN_146(15:0)" name="ReadData(15:0)" />
            <blockpin signalname="XLXN_118(15:0)" name="glyphData(15:0)" />
        </block>
        <block symbolname="PmodSSDcontroller" name="XLXI_10">
            <blockpin signalname="Clock" name="clk" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_55(7:0)" name="value(7:0)" />
            <blockpin signalname="SevenSegCat" name="cat" />
            <blockpin signalname="SevenSegs(6:0)" name="hex(6:0)" />
        </block>
        <block symbolname="Processor" name="XLXI_12">
            <blockpin signalname="Clock" name="Clk" />
            <blockpin signalname="reset" name="Reset" />
            <blockpin signalname="XLXN_66(15:0)" name="ReadData(15:0)" />
            <blockpin signalname="XLXN_68(15:0)" name="ALUB_input3(15:0)" />
            <blockpin signalname="XLXN_69(15:0)" name="PCSource3(15:0)" />
            <blockpin signalname="XLXN_65" name="MemWrite" />
            <blockpin signalname="XLXN_62(15:0)" name="Address(15:0)" />
            <blockpin signalname="XLXN_63(15:0)" name="Data(15:0)" />
        </block>
        <block symbolname="MP3Schematic" name="XLXI_18">
            <blockpin signalname="XLXN_192(5:0)" name="Number_to_Play(5:0)" />
            <blockpin signalname="Clock" name="clock" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="MP3Trig(18:1)" name="ToMP3Trigger(18:1)" />
        </block>
        <block symbolname="vgaControl" name="XLXI_19">
            <blockpin signalname="Clock" name="clk" />
            <blockpin signalname="reset" name="clear" />
            <blockpin signalname="hSync" name="hSync" />
            <blockpin signalname="vSync" name="vSync" />
            <blockpin signalname="XLXN_102" name="bright" />
            <blockpin signalname="XLXN_99" name="enable" />
            <blockpin signalname="XLXN_136(10:0)" name="hCount(10:0)" />
            <blockpin signalname="XLXN_135(10:0)" name="vCount(10:0)" />
        </block>
        <block symbolname="glyphGen" name="XLXI_21">
            <blockpin signalname="XLXN_118(15:0)" name="glyphNUM(15:0)" />
            <blockpin signalname="XLXN_111(3:0)" name="ROW(3:0)" />
            <blockpin signalname="XLXN_94(11:0)" name="glyphRED(11:0)" />
            <blockpin signalname="XLXN_95(11:0)" name="glyphGREEN(11:0)" />
            <blockpin signalname="XLXN_96(11:0)" name="glyphBLUE(11:0)" />
        </block>
        <block symbolname="BitGen" name="XLXI_23">
            <blockpin signalname="XLXN_102" name="bright" />
            <blockpin signalname="XLXN_94(11:0)" name="glyphR(11:0)" />
            <blockpin signalname="XLXN_95(11:0)" name="glyphG(11:0)" />
            <blockpin signalname="XLXN_96(11:0)" name="glyphB(11:0)" />
            <blockpin signalname="XLXN_136(10:0)" name="hCount(10:0)" />
            <blockpin signalname="red" name="red" />
            <blockpin signalname="green" name="green" />
            <blockpin signalname="blue" name="blue" />
            <blockpin signalname="XLXN_116(3:0)" name="glyphCol(3:0)" />
        </block>
        <block symbolname="GlyphMap" name="XLXI_24">
            <blockpin signalname="Clock" name="clock" />
            <blockpin signalname="XLXN_99" name="enable" />
            <blockpin signalname="XLXN_136(10:0)" name="hCount(10:0)" />
            <blockpin signalname="XLXN_135(10:0)" name="vCount(10:0)" />
            <blockpin signalname="XLXN_111(3:0)" name="glyphRow(3:0)" />
            <blockpin signalname="XLXN_116(3:0)" name="glyphCol(3:0)" />
            <blockpin signalname="XLXN_109(13:0)" name="address(13:0)" />
        </block>
        <block symbolname="milliSecondCounter" name="XLXI_25">
            <blockpin signalname="Clock" name="clock" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_193(15:0)" name="toCount(15:0)" />
            <blockpin signalname="XLXN_191" name="countRdy" />
        </block>
        <block symbolname="milliSecondCounter" name="Pacman">
            <blockpin signalname="Clock" name="clock" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_151(15:0)" name="toCount(15:0)" />
            <blockpin signalname="XLXN_152" name="countRdy" />
        </block>
        <block symbolname="milliSecondCounter" name="XLXI_27">
            <blockpin signalname="Clock" name="clock" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_164(15:0)" name="toCount(15:0)" />
            <blockpin signalname="XLXN_153" name="countRdy" />
        </block>
        <block symbolname="milliSecondCounter" name="XLXI_28">
            <blockpin signalname="Clock" name="clock" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_165(15:0)" name="toCount(15:0)" />
            <blockpin signalname="XLXN_157" name="countRdy" />
        </block>
        <block symbolname="milliSecondCounter" name="XLXI_29">
            <blockpin signalname="Clock" name="clock" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_166(15:0)" name="toCount(15:0)" />
            <blockpin signalname="XLXN_189" name="countRdy" />
        </block>
        <block symbolname="milliSecondCounter" name="XLXI_30">
            <blockpin signalname="Clock" name="clock" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_167(15:0)" name="toCount(15:0)" />
            <blockpin signalname="XLXN_159" name="countRdy" />
        </block>
        <block symbolname="milliSecondCounter" name="MouthTimer">
            <blockpin signalname="Clock" name="clock" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_168(15:0)" name="toCount(15:0)" />
            <blockpin signalname="XLXN_160" name="countRdy" />
        </block>
        <block symbolname="milliSecondCounter" name="XLXI_32">
            <blockpin signalname="Clock" name="clock" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_169(15:0)" name="toCount(15:0)" />
            <blockpin signalname="XLXN_161" name="countRdy" />
        </block>
        <block symbolname="milliSecondCounter" name="XLXI_34">
            <blockpin signalname="Clock" name="clock" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_170(15:0)" name="toCount(15:0)" />
            <blockpin signalname="XLXN_162" name="countRdy" />
        </block>
        <block symbolname="CounterMax3" name="XLXI_38">
            <blockpin signalname="Clock" name="Clock" />
            <blockpin signalname="XLXN_197(2:0)" name="count(2:0)" />
        </block>
        <block symbolname="IO_Mem_Controller" name="XLXI_39">
            <blockpin signalname="Clock" name="clk" />
            <blockpin signalname="XLXN_65" name="MemWrite_IN" />
            <blockpin signalname="XLXN_191" name="PacmanCountRdy" />
            <blockpin signalname="XLXN_152" name="Ghost1CountRdy" />
            <blockpin signalname="XLXN_153" name="Ghost2CountRdy" />
            <blockpin signalname="XLXN_157" name="Ghost3CountRdy" />
            <blockpin signalname="XLXN_189" name="Ghost4CountRdy" />
            <blockpin signalname="XLXN_159" name="DrawTimerCountRdy" />
            <blockpin signalname="XLXN_160" name="MouthTimerCountRdy" />
            <blockpin signalname="XLXN_161" name="GhostFlashCountRdy" />
            <blockpin signalname="XLXN_162" name="ScatterModeCountRdy" />
            <blockpin signalname="XLXN_62(15:0)" name="ADDR_IN(15:0)" />
            <blockpin signalname="XLXN_63(15:0)" name="DATA_IN(15:0)" />
            <blockpin signalname="XLXN_146(15:0)" name="ReadData_IN(15:0)" />
            <blockpin signalname="XLXN_205(7:0)" name="NES_IN(7:0)" />
            <blockpin signalname="XLXN_202(7:0)" name="NES_IN2(7:0)" />
            <blockpin signalname="XLXN_10" name="MemWrite_OUT" />
            <blockpin signalname="XLXN_58(13:0)" name="ADDR_OUT(13:0)" />
            <blockpin signalname="XLXN_59(15:0)" name="DATA_OUT(15:0)" />
            <blockpin signalname="XLXN_66(15:0)" name="ReadData_OUT(15:0)" />
            <blockpin signalname="XLXN_193(15:0)" name="PacmanToCount(15:0)" />
            <blockpin signalname="XLXN_151(15:0)" name="Ghost1ToCount(15:0)" />
            <blockpin signalname="XLXN_164(15:0)" name="Ghost2ToCount(15:0)" />
            <blockpin signalname="XLXN_165(15:0)" name="Ghost3ToCount(15:0)" />
            <blockpin signalname="XLXN_166(15:0)" name="Ghost4ToCount(15:0)" />
            <blockpin signalname="XLXN_167(15:0)" name="DrawTimerToCount(15:0)" />
            <blockpin signalname="XLXN_168(15:0)" name="MouthTimerToCount(15:0)" />
            <blockpin signalname="XLXN_169(15:0)" name="GhostFlashToCount(15:0)" />
            <blockpin signalname="XLXN_170(15:0)" name="ScatterModeToCount(15:0)" />
            <blockpin signalname="XLXN_192(5:0)" name="MP3Trig_OUT(5:0)" />
            <blockpin signalname="XLXN_31(11:0)" name="DACA_OUT(11:0)" />
            <blockpin signalname="XLXN_32(11:0)" name="DACB_OUT(11:0)" />
            <blockpin signalname="XLXN_57(11:0)" name="DACC_OUT(11:0)" />
            <blockpin signalname="XLXN_55(7:0)" name="led7Seg_OUT(7:0)" />
            <blockpin signalname="XLXN_197(2:0)" name="count3(2:0)" />
        </block>
        <block symbolname="NES_To_LED" name="XLXI_45">
            <blockpin signalname="Clock" name="clock" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="controller_data" name="From_Controller" />
            <blockpin signalname="NES_Latch" name="latch" />
            <blockpin signalname="NES_Pulse" name="pulse" />
            <blockpin signalname="XLXN_205(7:0)" name="PlayerInput(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="XLXN_31(11:0)">
            <wire x2="3072" y1="864" y2="864" x1="2224" />
            <wire x2="3072" y1="864" y2="896" x1="3072" />
            <wire x2="3088" y1="896" y2="896" x1="3072" />
        </branch>
        <branch name="XLXN_32(11:0)">
            <wire x2="3072" y1="928" y2="928" x1="2224" />
            <wire x2="3072" y1="928" y2="960" x1="3072" />
            <wire x2="3088" y1="960" y2="960" x1="3072" />
        </branch>
        <iomarker fontsize="28" x="224" y="416" name="Clock" orien="R180" />
        <branch name="NES_Latch">
            <wire x2="1024" y1="1200" y2="1760" x1="1024" />
            <wire x2="1040" y1="1760" y2="1760" x1="1024" />
            <wire x2="1536" y1="1200" y2="1200" x1="1024" />
            <wire x2="1536" y1="1200" y2="1344" x1="1536" />
            <wire x2="1536" y1="1344" y2="1344" x1="1520" />
        </branch>
        <branch name="NES_Pulse">
            <wire x2="976" y1="1296" y2="1664" x1="976" />
            <wire x2="1488" y1="1664" y2="1664" x1="976" />
            <wire x2="1504" y1="1664" y2="1664" x1="1488" />
            <wire x2="1616" y1="1296" y2="1296" x1="976" />
            <wire x2="1616" y1="1296" y2="1360" x1="1616" />
            <wire x2="1536" y1="1408" y2="1408" x1="1520" />
            <wire x2="1616" y1="1360" y2="1360" x1="1536" />
            <wire x2="1536" y1="1360" y2="1408" x1="1536" />
        </branch>
        <branch name="XLXN_55(7:0)">
            <wire x2="2432" y1="1056" y2="1056" x1="2224" />
            <wire x2="2432" y1="1056" y2="1344" x1="2432" />
            <wire x2="2672" y1="1344" y2="1344" x1="2432" />
        </branch>
        <branch name="SevenSegCat">
            <wire x2="3088" y1="1216" y2="1216" x1="3056" />
        </branch>
        <branch name="SevenSegs(6:0)">
            <wire x2="3088" y1="1344" y2="1344" x1="3056" />
        </branch>
        <branch name="XLXN_57(11:0)">
            <wire x2="3072" y1="992" y2="992" x1="2224" />
            <wire x2="3072" y1="992" y2="1024" x1="3072" />
            <wire x2="3088" y1="1024" y2="1024" x1="3072" />
        </branch>
        <iomarker fontsize="28" x="3088" y="896" name="XLXN_31(11:0)" orien="R0" />
        <iomarker fontsize="28" x="3088" y="960" name="XLXN_32(11:0)" orien="R0" />
        <iomarker fontsize="28" x="3088" y="1024" name="XLXN_57(11:0)" orien="R0" />
        <instance x="2672" y="1376" name="XLXI_10" orien="R0">
        </instance>
        <iomarker fontsize="28" x="3088" y="1344" name="SevenSegs(6:0)" orien="R0" />
        <iomarker fontsize="28" x="3088" y="1216" name="SevenSegCat" orien="R0" />
        <branch name="XLXN_62(15:0)">
            <wire x2="1664" y1="736" y2="736" x1="1152" />
        </branch>
        <branch name="XLXN_63(15:0)">
            <wire x2="1664" y1="832" y2="832" x1="1152" />
        </branch>
        <branch name="XLXN_66(15:0)">
            <wire x2="480" y1="432" y2="688" x1="480" />
            <wire x2="496" y1="688" y2="688" x1="480" />
            <wire x2="2288" y1="432" y2="432" x1="480" />
            <wire x2="2288" y1="432" y2="736" x1="2288" />
            <wire x2="2288" y1="736" y2="736" x1="2224" />
        </branch>
        <branch name="XLXN_68(15:0)">
            <wire x2="496" y1="768" y2="768" x1="224" />
        </branch>
        <branch name="XLXN_69(15:0)">
            <wire x2="496" y1="816" y2="816" x1="224" />
        </branch>
        <iomarker fontsize="28" x="208" y="944" name="reset" orien="R180" />
        <branch name="XLXN_65">
            <wire x2="1664" y1="640" y2="640" x1="1152" />
        </branch>
        <instance x="480" y="-464" name="XLXI_12" orien="R0">
        </instance>
        <iomarker fontsize="28" x="224" y="768" name="XLXN_68(15:0)" orien="R180" />
        <iomarker fontsize="28" x="224" y="816" name="XLXN_69(15:0)" orien="R180" />
        <branch name="MP3Trig(18:1)">
            <wire x2="3232" y1="2032" y2="2032" x1="3136" />
            <wire x2="3248" y1="1984" y2="1984" x1="3232" />
            <wire x2="3232" y1="1984" y2="2032" x1="3232" />
        </branch>
        <iomarker fontsize="28" x="3248" y="1984" name="MP3Trig(18:1)" orien="R0" />
        <instance x="576" y="2368" name="XLXI_19" orien="R0">
        </instance>
        <branch name="hSync">
            <wire x2="992" y1="2016" y2="2016" x1="960" />
        </branch>
        <iomarker fontsize="28" x="992" y="2016" name="hSync" orien="R0" />
        <branch name="vSync">
            <wire x2="992" y1="2080" y2="2080" x1="960" />
        </branch>
        <iomarker fontsize="28" x="992" y="2080" name="vSync" orien="R0" />
        <branch name="XLXN_94(11:0)">
            <wire x2="2624" y1="2016" y2="2016" x1="2560" />
            <wire x2="2624" y1="2016" y2="2448" x1="2624" />
            <wire x2="2688" y1="2448" y2="2448" x1="2624" />
        </branch>
        <branch name="XLXN_95(11:0)">
            <wire x2="2592" y1="2080" y2="2080" x1="2560" />
            <wire x2="2592" y1="2080" y2="2512" x1="2592" />
            <wire x2="2688" y1="2512" y2="2512" x1="2592" />
        </branch>
        <branch name="XLXN_96(11:0)">
            <wire x2="2576" y1="2144" y2="2144" x1="2560" />
            <wire x2="2576" y1="2144" y2="2576" x1="2576" />
            <wire x2="2688" y1="2576" y2="2576" x1="2576" />
        </branch>
        <branch name="XLXN_99">
            <wire x2="1280" y1="2208" y2="2208" x1="960" />
            <wire x2="1376" y1="2208" y2="2208" x1="1280" />
            <wire x2="1280" y1="1584" y2="2208" x1="1280" />
            <wire x2="2576" y1="1584" y2="1584" x1="1280" />
            <wire x2="2576" y1="704" y2="1584" x1="2576" />
            <wire x2="2944" y1="704" y2="704" x1="2576" />
        </branch>
        <instance x="1376" y="2368" name="XLXI_24" orien="R0">
        </instance>
        <branch name="XLXN_109(13:0)">
            <wire x2="2608" y1="2336" y2="2336" x1="1808" />
            <wire x2="2944" y1="768" y2="768" x1="2608" />
            <wire x2="2608" y1="768" y2="2336" x1="2608" />
        </branch>
        <branch name="XLXN_111(3:0)">
            <wire x2="2064" y1="2144" y2="2144" x1="1808" />
        </branch>
        <instance x="2064" y="2176" name="XLXI_21" orien="R0">
        </instance>
        <instance x="2688" y="2672" name="XLXI_23" orien="R0">
        </instance>
        <branch name="XLXN_116(3:0)">
            <wire x2="2240" y1="2240" y2="2240" x1="1808" />
            <wire x2="2240" y1="2240" y2="2320" x1="2240" />
            <wire x2="2688" y1="2320" y2="2320" x1="2240" />
        </branch>
        <branch name="XLXN_59(15:0)">
            <wire x2="2928" y1="672" y2="672" x1="2224" />
            <wire x2="2944" y1="640" y2="640" x1="2928" />
            <wire x2="2928" y1="640" y2="672" x1="2928" />
        </branch>
        <branch name="XLXN_58(13:0)">
            <wire x2="2928" y1="608" y2="608" x1="2224" />
            <wire x2="2944" y1="576" y2="576" x1="2928" />
            <wire x2="2928" y1="576" y2="608" x1="2928" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="2928" y1="544" y2="544" x1="2224" />
            <wire x2="2944" y1="448" y2="448" x1="2928" />
            <wire x2="2928" y1="448" y2="544" x1="2928" />
        </branch>
        <instance x="2944" y="672" name="XLXI_4" orien="R0">
        </instance>
        <branch name="red">
            <wire x2="3104" y1="2320" y2="2320" x1="3072" />
        </branch>
        <iomarker fontsize="28" x="3104" y="2320" name="red" orien="R0" />
        <branch name="green">
            <wire x2="3104" y1="2480" y2="2480" x1="3072" />
        </branch>
        <iomarker fontsize="28" x="3104" y="2480" name="green" orien="R0" />
        <branch name="blue">
            <wire x2="3104" y1="2640" y2="2640" x1="3072" />
        </branch>
        <iomarker fontsize="28" x="3104" y="2640" name="blue" orien="R0" />
        <branch name="XLXN_135(10:0)">
            <wire x2="1376" y1="2336" y2="2336" x1="960" />
        </branch>
        <branch name="XLXN_102">
            <wire x2="976" y1="2144" y2="2144" x1="960" />
            <wire x2="976" y1="2144" y2="2384" x1="976" />
            <wire x2="2688" y1="2384" y2="2384" x1="976" />
        </branch>
        <branch name="XLXN_136(10:0)">
            <wire x2="1216" y1="2272" y2="2272" x1="960" />
            <wire x2="1376" y1="2272" y2="2272" x1="1216" />
            <wire x2="1216" y1="2272" y2="2640" x1="1216" />
            <wire x2="2688" y1="2640" y2="2640" x1="1216" />
        </branch>
        <branch name="XLXN_146(15:0)">
            <wire x2="1520" y1="336" y2="928" x1="1520" />
            <wire x2="1664" y1="928" y2="928" x1="1520" />
            <wire x2="3456" y1="336" y2="336" x1="1520" />
            <wire x2="3456" y1="336" y2="448" x1="3456" />
            <wire x2="3456" y1="448" y2="448" x1="3392" />
        </branch>
        <instance x="1248" y="3152" name="Pacman" orien="R0">
        </instance>
        <instance x="1232" y="3472" name="XLXI_27" orien="R0">
        </instance>
        <instance x="1232" y="3808" name="XLXI_28" orien="R0">
        </instance>
        <instance x="1200" y="4144" name="XLXI_29" orien="R0">
        </instance>
        <instance x="2096" y="3152" name="XLXI_30" orien="R0">
        </instance>
        <instance x="2128" y="3520" name="MouthTimer" orien="R0">
        </instance>
        <instance x="2128" y="3920" name="XLXI_32" orien="R0">
        </instance>
        <branch name="XLXN_151(15:0)">
            <wire x2="1248" y1="3120" y2="3120" x1="1168" />
            <wire x2="1168" y1="3120" y2="3232" x1="1168" />
            <wire x2="2656" y1="3232" y2="3232" x1="1168" />
            <wire x2="2656" y1="1248" y2="1248" x1="2224" />
            <wire x2="2656" y1="1248" y2="3232" x1="2656" />
        </branch>
        <branch name="XLXN_152">
            <wire x2="2640" y1="448" y2="448" x1="1600" />
            <wire x2="2640" y1="448" y2="3216" x1="2640" />
            <wire x2="1600" y1="448" y2="1248" x1="1600" />
            <wire x2="1664" y1="1248" y2="1248" x1="1600" />
            <wire x2="1696" y1="2992" y2="2992" x1="1632" />
            <wire x2="1696" y1="2992" y2="3216" x1="1696" />
            <wire x2="2640" y1="3216" y2="3216" x1="1696" />
        </branch>
        <branch name="XLXN_153">
            <wire x2="3520" y1="384" y2="384" x1="1504" />
            <wire x2="3520" y1="384" y2="3312" x1="3520" />
            <wire x2="1504" y1="384" y2="1312" x1="1504" />
            <wire x2="1664" y1="1312" y2="1312" x1="1504" />
            <wire x2="3520" y1="3312" y2="3312" x1="1616" />
        </branch>
        <branch name="XLXN_157">
            <wire x2="512" y1="1616" y2="2464" x1="512" />
            <wire x2="1104" y1="2464" y2="2464" x1="512" />
            <wire x2="1104" y1="2464" y2="2480" x1="1104" />
            <wire x2="1872" y1="2480" y2="2480" x1="1104" />
            <wire x2="1872" y1="2480" y2="3648" x1="1872" />
            <wire x2="1616" y1="1616" y2="1616" x1="512" />
            <wire x2="1664" y1="1376" y2="1376" x1="1616" />
            <wire x2="1616" y1="1376" y2="1616" x1="1616" />
            <wire x2="1872" y1="3648" y2="3648" x1="1616" />
        </branch>
        <branch name="XLXN_159">
            <wire x2="1632" y1="368" y2="1504" x1="1632" />
            <wire x2="1664" y1="1504" y2="1504" x1="1632" />
            <wire x2="3488" y1="368" y2="368" x1="1632" />
            <wire x2="3488" y1="368" y2="2992" x1="3488" />
            <wire x2="3488" y1="2992" y2="2992" x1="2480" />
        </branch>
        <branch name="XLXN_160">
            <wire x2="1552" y1="400" y2="1568" x1="1552" />
            <wire x2="1664" y1="1568" y2="1568" x1="1552" />
            <wire x2="3472" y1="400" y2="400" x1="1552" />
            <wire x2="3472" y1="400" y2="3360" x1="3472" />
            <wire x2="3472" y1="3360" y2="3360" x1="2512" />
        </branch>
        <branch name="XLXN_161">
            <wire x2="1472" y1="1600" y2="1920" x1="1472" />
            <wire x2="2672" y1="1920" y2="1920" x1="1472" />
            <wire x2="2672" y1="1920" y2="3760" x1="2672" />
            <wire x2="1520" y1="1600" y2="1600" x1="1472" />
            <wire x2="1648" y1="1600" y2="1600" x1="1520" />
            <wire x2="1648" y1="1600" y2="1632" x1="1648" />
            <wire x2="1664" y1="1632" y2="1632" x1="1648" />
            <wire x2="2672" y1="3760" y2="3760" x1="2512" />
        </branch>
        <instance x="2112" y="4288" name="XLXI_34" orien="R0">
        </instance>
        <branch name="XLXN_162">
            <wire x2="1664" y1="1696" y2="1696" x1="1184" />
            <wire x2="1184" y1="1696" y2="4352" x1="1184" />
            <wire x2="2512" y1="4352" y2="4352" x1="1184" />
            <wire x2="2512" y1="4128" y2="4128" x1="2496" />
            <wire x2="2512" y1="4128" y2="4352" x1="2512" />
        </branch>
        <branch name="XLXN_118(15:0)">
            <wire x2="3440" y1="1744" y2="1744" x1="2016" />
            <wire x2="2016" y1="1744" y2="2016" x1="2016" />
            <wire x2="2064" y1="2016" y2="2016" x1="2016" />
            <wire x2="3440" y1="704" y2="704" x1="3392" />
            <wire x2="3440" y1="704" y2="1744" x1="3440" />
        </branch>
        <instance x="2752" y="2000" name="XLXI_18" orien="R0">
        </instance>
        <branch name="XLXN_164(15:0)">
            <wire x2="1200" y1="1936" y2="3440" x1="1200" />
            <wire x2="1232" y1="3440" y2="3440" x1="1200" />
            <wire x2="2304" y1="1936" y2="1936" x1="1200" />
            <wire x2="2304" y1="1312" y2="1312" x1="2224" />
            <wire x2="2304" y1="1312" y2="1936" x1="2304" />
        </branch>
        <branch name="XLXN_165(15:0)">
            <wire x2="1152" y1="1952" y2="3776" x1="1152" />
            <wire x2="1232" y1="3776" y2="3776" x1="1152" />
            <wire x2="2288" y1="1952" y2="1952" x1="1152" />
            <wire x2="2288" y1="1376" y2="1376" x1="2224" />
            <wire x2="2288" y1="1376" y2="1952" x1="2288" />
        </branch>
        <branch name="XLXN_166(15:0)">
            <wire x2="1120" y1="3536" y2="4112" x1="1120" />
            <wire x2="1200" y1="4112" y2="4112" x1="1120" />
            <wire x2="3600" y1="3536" y2="3536" x1="1120" />
            <wire x2="3600" y1="1440" y2="1440" x1="2224" />
            <wire x2="3600" y1="1440" y2="3536" x1="3600" />
        </branch>
        <branch name="XLXN_167(15:0)">
            <wire x2="2096" y1="3120" y2="3120" x1="2016" />
            <wire x2="2016" y1="3120" y2="3200" x1="2016" />
            <wire x2="3552" y1="3200" y2="3200" x1="2016" />
            <wire x2="3552" y1="1504" y2="1504" x1="2224" />
            <wire x2="3552" y1="1504" y2="3200" x1="3552" />
        </branch>
        <branch name="XLXN_168(15:0)">
            <wire x2="2128" y1="3488" y2="3488" x1="2064" />
            <wire x2="2064" y1="3488" y2="3568" x1="2064" />
            <wire x2="3584" y1="3568" y2="3568" x1="2064" />
            <wire x2="3584" y1="1568" y2="1568" x1="2224" />
            <wire x2="3584" y1="1568" y2="3568" x1="3584" />
        </branch>
        <branch name="XLXN_169(15:0)">
            <wire x2="2128" y1="3888" y2="3888" x1="2064" />
            <wire x2="2064" y1="3888" y2="3968" x1="2064" />
            <wire x2="3568" y1="3968" y2="3968" x1="2064" />
            <wire x2="3568" y1="1632" y2="1632" x1="2224" />
            <wire x2="3568" y1="1632" y2="3968" x1="3568" />
        </branch>
        <branch name="XLXN_170(15:0)">
            <wire x2="2032" y1="4032" y2="4256" x1="2032" />
            <wire x2="2112" y1="4256" y2="4256" x1="2032" />
            <wire x2="3536" y1="4032" y2="4032" x1="2032" />
            <wire x2="3536" y1="1696" y2="1696" x1="2224" />
            <wire x2="3536" y1="1696" y2="4032" x1="3536" />
        </branch>
        <branch name="XLXN_189">
            <wire x2="3504" y1="3984" y2="3984" x1="1584" />
            <wire x2="3504" y1="352" y2="352" x1="1648" />
            <wire x2="3504" y1="352" y2="3984" x1="3504" />
            <wire x2="1648" y1="352" y2="1440" x1="1648" />
            <wire x2="1664" y1="1440" y2="1440" x1="1648" />
        </branch>
        <instance x="1216" y="4416" name="XLXI_25" orien="R0">
        </instance>
        <branch name="XLXN_192(5:0)">
            <wire x2="2480" y1="800" y2="800" x1="2224" />
            <wire x2="2480" y1="800" y2="1840" x1="2480" />
            <wire x2="2752" y1="1840" y2="1840" x1="2480" />
        </branch>
        <branch name="XLXN_193(15:0)">
            <wire x2="528" y1="1872" y2="4384" x1="528" />
            <wire x2="1216" y1="4384" y2="4384" x1="528" />
            <wire x2="2272" y1="1872" y2="1872" x1="528" />
            <wire x2="2272" y1="1184" y2="1184" x1="2224" />
            <wire x2="2272" y1="1184" y2="1872" x1="2272" />
        </branch>
        <iomarker fontsize="28" x="1504" y="1664" name="NES_Pulse" orien="R0" />
        <branch name="XLXN_191">
            <wire x2="1664" y1="1184" y2="1184" x1="336" />
            <wire x2="336" y1="1184" y2="4496" x1="336" />
            <wire x2="1664" y1="4496" y2="4496" x1="336" />
            <wire x2="1664" y1="4256" y2="4256" x1="1600" />
            <wire x2="1664" y1="4256" y2="4496" x1="1664" />
        </branch>
        <branch name="XLXN_197(2:0)">
            <wire x2="1088" y1="2608" y2="2608" x1="992" />
            <wire x2="1088" y1="2128" y2="2608" x1="1088" />
            <wire x2="1104" y1="2128" y2="2128" x1="1088" />
            <wire x2="1664" y1="1824" y2="1824" x1="1104" />
            <wire x2="1104" y1="1824" y2="2128" x1="1104" />
        </branch>
        <instance x="608" y="2704" name="XLXI_38" orien="R0">
        </instance>
        <instance x="1664" y="1088" name="XLXI_39" orien="R0">
        </instance>
        <instance x="1040" y="1504" name="XLXI_45" orien="R0">
        </instance>
        <branch name="Clock">
            <wire x2="320" y1="416" y2="416" x1="224" />
            <wire x2="1568" y1="416" y2="416" x1="320" />
            <wire x2="2656" y1="416" y2="416" x1="1568" />
            <wire x2="2656" y1="416" y2="1216" x1="2656" />
            <wire x2="2672" y1="1216" y2="1216" x1="2656" />
            <wire x2="2800" y1="416" y2="416" x1="2656" />
            <wire x2="2800" y1="416" y2="512" x1="2800" />
            <wire x2="2944" y1="512" y2="512" x1="2800" />
            <wire x2="1568" y1="416" y2="544" x1="1568" />
            <wire x2="1664" y1="544" y2="544" x1="1568" />
            <wire x2="320" y1="416" y2="624" x1="320" />
            <wire x2="496" y1="624" y2="624" x1="320" />
            <wire x2="320" y1="624" y2="1040" x1="320" />
            <wire x2="320" y1="1040" y2="1344" x1="320" />
            <wire x2="1040" y1="1344" y2="1344" x1="320" />
            <wire x2="320" y1="1344" y2="1856" x1="320" />
            <wire x2="1296" y1="1856" y2="1856" x1="320" />
            <wire x2="1296" y1="1856" y2="2144" x1="1296" />
            <wire x2="1376" y1="2144" y2="2144" x1="1296" />
            <wire x2="1328" y1="1856" y2="1856" x1="1296" />
            <wire x2="1328" y1="1856" y2="1904" x1="1328" />
            <wire x2="2752" y1="1904" y2="1904" x1="1328" />
            <wire x2="320" y1="1856" y2="2016" x1="320" />
            <wire x2="576" y1="2016" y2="2016" x1="320" />
            <wire x2="320" y1="2016" y2="2608" x1="320" />
            <wire x2="320" y1="2608" y2="2736" x1="320" />
            <wire x2="1040" y1="2736" y2="2736" x1="320" />
            <wire x2="1920" y1="2736" y2="2736" x1="1040" />
            <wire x2="1920" y1="2736" y2="2992" x1="1920" />
            <wire x2="2096" y1="2992" y2="2992" x1="1920" />
            <wire x2="1920" y1="2992" y2="3360" x1="1920" />
            <wire x2="2128" y1="3360" y2="3360" x1="1920" />
            <wire x2="1920" y1="3360" y2="3760" x1="1920" />
            <wire x2="2128" y1="3760" y2="3760" x1="1920" />
            <wire x2="1920" y1="3760" y2="4128" x1="1920" />
            <wire x2="2112" y1="4128" y2="4128" x1="1920" />
            <wire x2="1040" y1="2736" y2="2992" x1="1040" />
            <wire x2="1248" y1="2992" y2="2992" x1="1040" />
            <wire x2="1040" y1="2992" y2="3312" x1="1040" />
            <wire x2="1232" y1="3312" y2="3312" x1="1040" />
            <wire x2="1040" y1="3312" y2="3648" x1="1040" />
            <wire x2="1232" y1="3648" y2="3648" x1="1040" />
            <wire x2="1040" y1="3648" y2="3984" x1="1040" />
            <wire x2="1200" y1="3984" y2="3984" x1="1040" />
            <wire x2="608" y1="2608" y2="2608" x1="320" />
            <wire x2="320" y1="1040" y2="4256" x1="320" />
            <wire x2="1216" y1="4256" y2="4256" x1="320" />
        </branch>
        <branch name="reset">
            <wire x2="240" y1="944" y2="944" x1="208" />
            <wire x2="240" y1="944" y2="1024" x1="240" />
            <wire x2="240" y1="1024" y2="1104" x1="240" />
            <wire x2="240" y1="1104" y2="1248" x1="240" />
            <wire x2="1456" y1="1248" y2="1248" x1="240" />
            <wire x2="1456" y1="1248" y2="1280" x1="1456" />
            <wire x2="2672" y1="1280" y2="1280" x1="1456" />
            <wire x2="240" y1="1248" y2="1408" x1="240" />
            <wire x2="240" y1="1408" y2="1712" x1="240" />
            <wire x2="240" y1="1712" y2="2336" x1="240" />
            <wire x2="240" y1="2336" y2="2816" x1="240" />
            <wire x2="1088" y1="2816" y2="2816" x1="240" />
            <wire x2="1984" y1="2816" y2="2816" x1="1088" />
            <wire x2="1984" y1="2816" y2="3056" x1="1984" />
            <wire x2="2096" y1="3056" y2="3056" x1="1984" />
            <wire x2="1984" y1="3056" y2="3424" x1="1984" />
            <wire x2="2128" y1="3424" y2="3424" x1="1984" />
            <wire x2="1984" y1="3424" y2="3824" x1="1984" />
            <wire x2="2128" y1="3824" y2="3824" x1="1984" />
            <wire x2="1984" y1="3824" y2="4192" x1="1984" />
            <wire x2="2112" y1="4192" y2="4192" x1="1984" />
            <wire x2="1088" y1="2816" y2="3056" x1="1088" />
            <wire x2="1248" y1="3056" y2="3056" x1="1088" />
            <wire x2="1088" y1="3056" y2="3376" x1="1088" />
            <wire x2="1232" y1="3376" y2="3376" x1="1088" />
            <wire x2="1088" y1="3376" y2="3712" x1="1088" />
            <wire x2="1232" y1="3712" y2="3712" x1="1088" />
            <wire x2="1088" y1="3712" y2="4048" x1="1088" />
            <wire x2="1200" y1="4048" y2="4048" x1="1088" />
            <wire x2="576" y1="2336" y2="2336" x1="240" />
            <wire x2="1488" y1="1712" y2="1712" x1="240" />
            <wire x2="1488" y1="1712" y2="1968" x1="1488" />
            <wire x2="2752" y1="1968" y2="1968" x1="1488" />
            <wire x2="1040" y1="1408" y2="1408" x1="240" />
            <wire x2="304" y1="1104" y2="1104" x1="240" />
            <wire x2="304" y1="1104" y2="4320" x1="304" />
            <wire x2="1216" y1="4320" y2="4320" x1="304" />
            <wire x2="496" y1="912" y2="912" x1="240" />
            <wire x2="240" y1="912" y2="944" x1="240" />
        </branch>
        <branch name="XLXN_202(7:0)">
            <wire x2="1664" y1="1760" y2="1760" x1="1632" />
        </branch>
        <iomarker fontsize="28" x="1632" y="1760" name="XLXN_202(7:0)" orien="R180" />
        <iomarker fontsize="28" x="1040" y="1760" name="NES_Latch" orien="R0" />
        <branch name="controller_data">
            <wire x2="1024" y1="1472" y2="1472" x1="1008" />
            <wire x2="1040" y1="1472" y2="1472" x1="1024" />
        </branch>
        <iomarker fontsize="28" x="1008" y="1472" name="controller_data" orien="R180" />
        <branch name="XLXN_205(7:0)">
            <wire x2="1584" y1="1536" y2="1536" x1="1520" />
            <wire x2="1584" y1="1024" y2="1536" x1="1584" />
            <wire x2="1664" y1="1024" y2="1024" x1="1584" />
        </branch>
    </sheet>
</drawing>
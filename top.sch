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
        <signal name="XLXN_4(7:0)" />
        <signal name="XLXN_5(3:0)" />
        <signal name="XLXN_6(7:0)" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9(7:0)" />
        <signal name="XLXN_10" />
        <signal name="Clk" />
        <signal name="Reset" />
        <signal name="SDA" />
        <signal name="SCL" />
        <signal name="NACK" />
        <port polarity="Input" name="Clk" />
        <port polarity="Input" name="Reset" />
        <port polarity="BiDirectional" name="SDA" />
        <port polarity="BiDirectional" name="SCL" />
        <port polarity="Output" name="NACK" />
        <blockdef name="I2C_Master">
            <timestamp>2015-11-24T13:12:50</timestamp>
            <rect width="336" x="64" y="-512" height="572" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="464" y1="-480" y2="-480" x1="400" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="464" y1="-256" y2="-256" x1="400" />
            <line x2="464" y1="-192" y2="-192" x1="400" />
            <rect width="64" x="400" y="-140" height="24" />
            <line x2="464" y1="-128" y2="-128" x1="400" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
            <line x2="464" y1="32" y2="32" x1="400" />
        </blockdef>
        <blockdef name="adxl_i2c">
            <timestamp>2020-5-25T11:31:41</timestamp>
            <rect width="416" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="544" y1="-416" y2="-416" x1="480" />
            <line x2="544" y1="-352" y2="-352" x1="480" />
            <line x2="544" y1="-288" y2="-288" x1="480" />
            <rect width="64" x="480" y="-236" height="24" />
            <line x2="544" y1="-224" y2="-224" x1="480" />
            <rect width="64" x="480" y="-172" height="24" />
            <line x2="544" y1="-160" y2="-160" x1="480" />
            <rect width="64" x="480" y="-108" height="24" />
            <line x2="544" y1="-96" y2="-96" x1="480" />
        </blockdef>
        <block symbolname="I2C_Master" name="XLXI_1">
            <blockpin signalname="XLXN_1" name="Go" />
            <blockpin signalname="XLXN_4(7:0)" name="Address(7:0)" />
            <blockpin signalname="XLXN_5(3:0)" name="ReadCnt(3:0)" />
            <blockpin signalname="SDA" name="SDA" />
            <blockpin signalname="SCL" name="SCL" />
            <blockpin signalname="XLXN_3" name="FIFO_Pop" />
            <blockpin signalname="XLXN_2" name="FIFO_Push" />
            <blockpin signalname="XLXN_6(7:0)" name="FIFO_DI(7:0)" />
            <blockpin signalname="XLXN_7" name="FIFO_Empty" />
            <blockpin signalname="XLXN_8" name="FIFO_Full" />
            <blockpin signalname="XLXN_9(7:0)" name="FIFO_DO(7:0)" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="XLXN_10" name="Busy" />
            <blockpin signalname="NACK" name="NACK" />
        </block>
        <block symbolname="adxl_i2c" name="XLXI_2">
            <blockpin signalname="XLXN_8" name="I2C_FIFO_FULL" />
            <blockpin signalname="XLXN_7" name="I2C_FIFO_EMPTY" />
            <blockpin signalname="XLXN_10" name="I2C_Busy" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="XLXN_9(7:0)" name="I2C_FIFO_DO(7:0)" />
            <blockpin signalname="XLXN_1" name="I2C_GO" />
            <blockpin signalname="XLXN_2" name="I2C_FIFO_PUSH" />
            <blockpin signalname="XLXN_3" name="I2C_FIFO_POP" />
            <blockpin signalname="XLXN_4(7:0)" name="I2C_Address(7:0)" />
            <blockpin signalname="XLXN_5(3:0)" name="I2C_Read_Cnt(3:0)" />
            <blockpin signalname="XLXN_6(7:0)" name="I2C_FIFO_DI(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2000" y="1440" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1168" y="1440" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1856" y1="1024" y2="1024" x1="1712" />
            <wire x2="1856" y1="960" y2="1024" x1="1856" />
            <wire x2="2000" y1="960" y2="960" x1="1856" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1856" y1="1088" y2="1088" x1="1712" />
            <wire x2="1856" y1="1088" y2="1248" x1="1856" />
            <wire x2="2000" y1="1248" y2="1248" x1="1856" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1840" y1="1152" y2="1152" x1="1712" />
            <wire x2="1840" y1="1152" y2="1184" x1="1840" />
            <wire x2="2000" y1="1184" y2="1184" x1="1840" />
        </branch>
        <branch name="XLXN_4(7:0)">
            <wire x2="1872" y1="1216" y2="1216" x1="1712" />
            <wire x2="1872" y1="1024" y2="1216" x1="1872" />
            <wire x2="2000" y1="1024" y2="1024" x1="1872" />
        </branch>
        <branch name="XLXN_5(3:0)">
            <wire x2="1888" y1="1280" y2="1280" x1="1712" />
            <wire x2="1888" y1="1088" y2="1280" x1="1888" />
            <wire x2="2000" y1="1088" y2="1088" x1="1888" />
        </branch>
        <branch name="XLXN_6(7:0)">
            <wire x2="1856" y1="1344" y2="1344" x1="1712" />
            <wire x2="1856" y1="1312" y2="1344" x1="1856" />
            <wire x2="2000" y1="1312" y2="1312" x1="1856" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="1168" y1="1088" y2="1088" x1="1088" />
            <wire x2="1088" y1="1088" y2="1568" x1="1088" />
            <wire x2="2544" y1="1568" y2="1568" x1="1088" />
            <wire x2="2544" y1="1184" y2="1184" x1="2464" />
            <wire x2="2544" y1="1184" y2="1568" x1="2544" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1168" y1="1024" y2="1024" x1="1104" />
            <wire x2="1104" y1="1024" y2="1552" x1="1104" />
            <wire x2="2528" y1="1552" y2="1552" x1="1104" />
            <wire x2="2528" y1="1248" y2="1248" x1="2464" />
            <wire x2="2528" y1="1248" y2="1552" x1="2528" />
        </branch>
        <branch name="XLXN_9(7:0)">
            <wire x2="1152" y1="864" y2="1408" x1="1152" />
            <wire x2="1168" y1="1408" y2="1408" x1="1152" />
            <wire x2="2512" y1="864" y2="864" x1="1152" />
            <wire x2="2512" y1="864" y2="1312" x1="2512" />
            <wire x2="2512" y1="1312" y2="1312" x1="2464" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="1136" y1="848" y2="1152" x1="1136" />
            <wire x2="1168" y1="1152" y2="1152" x1="1136" />
            <wire x2="2496" y1="848" y2="848" x1="1136" />
            <wire x2="2496" y1="848" y2="1408" x1="2496" />
            <wire x2="2496" y1="1408" y2="1408" x1="2464" />
        </branch>
        <branch name="Clk">
            <wire x2="1024" y1="1280" y2="1280" x1="672" />
            <wire x2="1168" y1="1280" y2="1280" x1="1024" />
            <wire x2="1024" y1="1280" y2="1504" x1="1024" />
            <wire x2="1936" y1="1504" y2="1504" x1="1024" />
            <wire x2="2000" y1="1472" y2="1472" x1="1936" />
            <wire x2="1936" y1="1472" y2="1504" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="672" y="1280" name="Clk" orien="R180" />
        <branch name="Reset">
            <wire x2="960" y1="1216" y2="1216" x1="672" />
            <wire x2="1168" y1="1216" y2="1216" x1="960" />
            <wire x2="960" y1="1216" y2="1472" x1="960" />
            <wire x2="1776" y1="1472" y2="1472" x1="960" />
            <wire x2="1776" y1="1408" y2="1472" x1="1776" />
            <wire x2="2000" y1="1408" y2="1408" x1="1776" />
        </branch>
        <iomarker fontsize="28" x="672" y="1216" name="Reset" orien="R180" />
        <branch name="SDA">
            <wire x2="2608" y1="960" y2="960" x1="2464" />
        </branch>
        <branch name="SCL">
            <wire x2="2608" y1="1024" y2="1024" x1="2464" />
        </branch>
        <iomarker fontsize="28" x="2608" y="960" name="SDA" orien="R0" />
        <iomarker fontsize="28" x="2608" y="1024" name="SCL" orien="R0" />
        <branch name="NACK">
            <wire x2="2624" y1="1472" y2="1472" x1="2464" />
        </branch>
        <iomarker fontsize="28" x="2624" y="1472" name="NACK" orien="R0" />
    </sheet>
</drawing>
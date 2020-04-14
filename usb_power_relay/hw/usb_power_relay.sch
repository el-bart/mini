<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.7.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="6" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="5" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="relay">
<description>&lt;b&gt;Relays&lt;/b&gt;&lt;p&gt;
&lt;ul&gt;
&lt;li&gt;Eichhoff
&lt;li&gt;Finder
&lt;li&gt;Fujitsu
&lt;li&gt;HAMLIN
&lt;li&gt;OMRON
&lt;li&gt;Matsushita
&lt;li&gt;NAiS
&lt;li&gt;Siemens
&lt;li&gt;Schrack
&lt;/ul&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="351">
<description>&lt;b&gt;RELAY&lt;/b&gt;&lt;p&gt;
2 x switch, same as G5 V-2, Omron</description>
<wire x1="-5.08" y1="-5.08" x2="15.24" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-5.08" x2="15.24" y2="5.08" width="0.1524" layer="21"/>
<wire x1="15.24" y1="5.08" x2="-5.08" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.27" x2="-3.81" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.27" x2="-3.81" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.27" x2="-5.08" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.27" x2="-5.08" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="3.81" x2="-1.905" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="3.81" x2="-1.905" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="0.635" x2="-3.175" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="0.635" x2="-3.175" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-0.635" x2="-0.635" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0.635" x2="-1.905" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-0.635" x2="-1.905" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-0.635" x2="-1.905" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-0.635" x2="-0.635" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-3.81" x2="-2.794" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-0.635" x2="-0.635" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="2.794" x2="3.81" y2="1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.905" x2="11.43" y2="1.905" width="0.1524" layer="21"/>
<wire x1="11.43" y1="1.905" x2="11.43" y2="3.175" width="0.1524" layer="21"/>
<wire x1="11.43" y1="3.175" x2="10.795" y2="3.81" width="0.1524" layer="21"/>
<wire x1="9.9822" y1="3.81" x2="10.795" y2="3.81" width="0.1524" layer="21"/>
<wire x1="12.065" y1="3.81" x2="12.9032" y2="3.81" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-2.794" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="11.43" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="11.43" y1="-1.905" x2="11.43" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="11.43" y1="-3.175" x2="10.795" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="9.9822" y1="-3.81" x2="10.795" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-3.81" x2="10.4902" y2="-4.1402" width="0.1524" layer="21"/>
<wire x1="12.065" y1="-3.81" x2="12.9032" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="10.795" y1="3.81" x2="10.4902" y2="4.1402" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="P1" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="O1" x="8.89" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="S1" x="13.97" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="S2" x="13.97" y="3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="O2" x="8.89" y="3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="P2" x="3.81" y="3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="16" x="-3.81" y="3.81" drill="1.016" shape="long" rot="R90"/>
<text x="17.78" y="-5.08" size="1.778" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="14.732" y="-1.397" size="1.27" layer="51" ratio="10" rot="R90">351</text>
<text x="1.27" y="-0.889" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-5.08" y1="-1.27" x2="-3.81" y2="1.27" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="K">
<wire x1="-3.81" y1="-1.905" x2="-1.905" y2="-1.905" width="0.254" layer="94"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="1.905" width="0.254" layer="94"/>
<wire x1="3.81" y1="1.905" x2="1.905" y2="1.905" width="0.254" layer="94"/>
<wire x1="-3.81" y1="1.905" x2="-3.81" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="-1.905" width="0.1524" layer="94"/>
<wire x1="0" y1="-1.905" x2="3.81" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="1.905" width="0.1524" layer="94"/>
<wire x1="0" y1="1.905" x2="-3.81" y2="1.905" width="0.254" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="1.905" y2="1.905" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="0" y2="-1.905" width="0.254" layer="94"/>
<wire x1="1.905" y1="1.905" x2="0" y2="1.905" width="0.254" layer="94"/>
<text x="1.27" y="2.921" size="1.778" layer="96">&gt;VALUE</text>
<text x="1.27" y="5.08" size="1.778" layer="95">&gt;PART</text>
<pin name="2" x="0" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="1" x="0" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
</symbol>
<symbol name="U">
<wire x1="3.175" y1="5.08" x2="1.905" y2="5.08" width="0.254" layer="94"/>
<wire x1="-3.175" y1="5.08" x2="-1.905" y2="5.08" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="2.54" y2="5.715" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="0" y2="0" width="0.254" layer="94"/>
<circle x="0" y="1.27" radius="0.127" width="0.4064" layer="94"/>
<text x="2.54" y="0" size="1.778" layer="95">&gt;PART</text>
<pin name="O" x="5.08" y="5.08" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="S" x="-5.08" y="5.08" visible="pad" length="short" direction="pas"/>
<pin name="P" x="0" y="-2.54" visible="pad" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="351" prefix="K">
<description>&lt;b&gt;RELAY&lt;/b&gt;&lt;p&gt;
2 x switch, Omron</description>
<gates>
<gate name="1" symbol="K" x="0" y="0" addlevel="must"/>
<gate name="2" symbol="U" x="17.78" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="3" symbol="U" x="17.78" y="-17.78" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="351">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="16"/>
<connect gate="2" pin="O" pad="O1"/>
<connect gate="2" pin="P" pad="P1"/>
<connect gate="2" pin="S" pad="S1"/>
<connect gate="3" pin="O" pad="O2"/>
<connect gate="3" pin="P" pad="P2"/>
<connect gate="3" pin="S" pad="S2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="diode">
<description>&lt;b&gt;Diodes&lt;/b&gt;&lt;p&gt;
Based on the following sources:
&lt;ul&gt;
&lt;li&gt;Motorola : www.onsemi.com
&lt;li&gt;Fairchild : www.fairchildsemi.com
&lt;li&gt;Philips : www.semiconductors.com
&lt;li&gt;Vishay : www.vishay.de
&lt;/ul&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DO35-10">
<description>&lt;B&gt;DIODE&lt;/B&gt;&lt;p&gt;
diameter 2 mm, horizontal, grid 10.16 mm</description>
<wire x1="5.08" y1="0" x2="4.191" y2="0" width="0.508" layer="51"/>
<wire x1="-5.08" y1="0" x2="-4.191" y2="0" width="0.508" layer="51"/>
<wire x1="-0.635" y1="0" x2="0" y2="0" width="0.1524" layer="21"/>
<wire x1="1.016" y1="0.635" x2="1.016" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-0.635" x2="0" y2="0" width="0.1524" layer="21"/>
<wire x1="0" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0" y1="0" x2="1.016" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="0" width="0.1524" layer="21"/>
<wire x1="0" y1="0" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.032" y1="1.016" x2="2.286" y2="0.762" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.286" y1="0.762" x2="-2.032" y2="1.016" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.286" y1="-0.762" x2="-2.032" y2="-1.016" width="0.1524" layer="21" curve="90"/>
<wire x1="2.032" y1="-1.016" x2="2.286" y2="-0.762" width="0.1524" layer="21" curve="90"/>
<wire x1="2.286" y1="-0.762" x2="2.286" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="0.762" x2="-2.286" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="1.016" x2="2.032" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-1.016" x2="2.032" y2="-1.016" width="0.1524" layer="21"/>
<pad name="C" x="-5.08" y="0" drill="0.8128" shape="long"/>
<pad name="A" x="5.08" y="0" drill="0.8128" shape="long"/>
<text x="-2.159" y="1.27" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.159" y="-2.667" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.905" y1="-1.016" x2="-1.397" y2="1.016" layer="21"/>
<rectangle x1="2.286" y1="-0.254" x2="4.191" y2="0.254" layer="21"/>
<rectangle x1="-4.191" y1="-0.254" x2="-2.286" y2="0.254" layer="21"/>
</package>
<package name="DO35-7">
<description>&lt;B&gt;DIODE&lt;/B&gt;&lt;p&gt;
diameter 2 mm, horizontal, grid 7.62 mm</description>
<wire x1="3.81" y1="0" x2="2.921" y2="0" width="0.508" layer="51"/>
<wire x1="-3.81" y1="0" x2="-2.921" y2="0" width="0.508" layer="51"/>
<wire x1="-0.635" y1="0" x2="0" y2="0" width="0.1524" layer="21"/>
<wire x1="1.016" y1="0.635" x2="1.016" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-0.635" x2="0" y2="0" width="0.1524" layer="21"/>
<wire x1="0" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0" y1="0" x2="1.016" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="0" width="0.1524" layer="21"/>
<wire x1="0" y1="0" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.032" y1="1.016" x2="2.286" y2="0.762" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.286" y1="0.762" x2="2.286" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-1.016" x2="2.286" y2="-0.762" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.286" y1="0.762" x2="-2.032" y2="1.016" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.286" y1="-0.762" x2="-2.032" y2="-1.016" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.032" y1="-1.016" x2="2.032" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="0.762" x2="-2.286" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="1.016" x2="2.032" y2="1.016" width="0.1524" layer="21"/>
<pad name="C" x="-3.81" y="0" drill="0.8128" shape="long"/>
<pad name="A" x="3.81" y="0" drill="0.8128" shape="long"/>
<text x="-2.286" y="1.27" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-2.667" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.905" y1="-1.016" x2="-1.397" y2="1.016" layer="21"/>
<rectangle x1="2.286" y1="-0.254" x2="2.921" y2="0.254" layer="21"/>
<rectangle x1="-2.921" y1="-0.254" x2="-2.286" y2="0.254" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="D">
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<text x="2.54" y="0.4826" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-2.3114" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="C" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<text x="-2.54" y="0" size="0.4064" layer="99" align="center">SpiceOrder 1</text>
<text x="2.54" y="0" size="0.4064" layer="99" align="center">SpiceOrder 2</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="1N4148" prefix="D">
<description>&lt;B&gt;DIODE&lt;/B&gt;&lt;p&gt;
high speed (Philips)</description>
<gates>
<gate name="G$1" symbol="D" x="0" y="0"/>
</gates>
<devices>
<device name="DO35-10" package="DO35-10">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="DO35-7" package="DO35-7">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-cypressindustries">
<description>&lt;b&gt;Connectors from Cypress Industries&lt;/b&gt;&lt;p&gt;
www.cypressindustries.com&lt;br&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="85-32004-40X">
<description>&lt;b&gt;USB B Type Single Solder&lt;/b&gt;&lt;p&gt;
Source: http://www.cypressindustries.com/pdf/85-32004-40x-1.pdf</description>
<wire x1="-5.25" y1="5.3" x2="5.3" y2="5.3" width="0.1016" layer="21"/>
<wire x1="6" y1="4.6" x2="6" y2="-4.65" width="0.1016" layer="21"/>
<wire x1="5.3" y1="-5.35" x2="-5.3" y2="-5.35" width="0.1016" layer="21"/>
<wire x1="-6" y1="-4.65" x2="-6" y2="4.6" width="0.1016" layer="21"/>
<wire x1="-6" y1="4.6" x2="-5.3" y2="5.3" width="0.1016" layer="21" curve="-90"/>
<wire x1="5.3" y1="5.3" x2="6" y2="4.6" width="0.1016" layer="21" curve="-90"/>
<wire x1="6" y1="-4.65" x2="5.3" y2="-5.35" width="0.1016" layer="21" curve="-90"/>
<wire x1="-5.3" y1="-5.35" x2="-6" y2="-4.65" width="0.1016" layer="21" curve="-90"/>
<wire x1="-4.6" y1="1.55" x2="-4.6" y2="2.35" width="0.1016" layer="21"/>
<wire x1="-4.6" y1="2.35" x2="-2.6" y2="4.35" width="0.1016" layer="21"/>
<wire x1="-2.6" y1="4.35" x2="2.6" y2="4.35" width="0.1016" layer="21"/>
<wire x1="2.6" y1="4.35" x2="4.6" y2="2.35" width="0.1016" layer="21"/>
<wire x1="4.6" y1="2.35" x2="4.6" y2="1.55" width="0.1016" layer="21"/>
<wire x1="4.6" y1="1.55" x2="4.45" y2="1.4" width="0.1016" layer="21"/>
<wire x1="4.45" y1="1.4" x2="4.45" y2="-2.5" width="0.1016" layer="21"/>
<wire x1="4.45" y1="-2.5" x2="4.6" y2="-2.65" width="0.1016" layer="21"/>
<wire x1="4.6" y1="-2.65" x2="4.6" y2="-3.6" width="0.1016" layer="21"/>
<wire x1="4.6" y1="-3.6" x2="3.85" y2="-4.35" width="0.1016" layer="21"/>
<wire x1="3.85" y1="-4.35" x2="-3.85" y2="-4.35" width="0.1016" layer="21"/>
<wire x1="-3.85" y1="-4.35" x2="-4.6" y2="-3.6" width="0.1016" layer="21"/>
<wire x1="-4.6" y1="-3.6" x2="-4.6" y2="-2.65" width="0.1016" layer="21"/>
<wire x1="-4.6" y1="-2.65" x2="-4.45" y2="-2.5" width="0.1016" layer="21"/>
<wire x1="-4.45" y1="-2.5" x2="-4.45" y2="1.4" width="0.1016" layer="21"/>
<wire x1="-4.45" y1="1.4" x2="-4.6" y2="1.55" width="0.1016" layer="21"/>
<wire x1="-4.15" y1="0.85" x2="-4.15" y2="2.25" width="0.1016" layer="21"/>
<wire x1="-4.15" y1="2.25" x2="-2.5" y2="3.9" width="0.1016" layer="21"/>
<wire x1="-2.5" y1="3.9" x2="2.5" y2="3.9" width="0.1016" layer="21"/>
<wire x1="2.5" y1="3.9" x2="4.15" y2="2.25" width="0.1016" layer="21"/>
<wire x1="3.85" y1="-2.1" x2="4.15" y2="-2.4" width="0.1016" layer="21"/>
<wire x1="4.15" y1="-2.4" x2="4.15" y2="-3.55" width="0.1016" layer="21"/>
<wire x1="4.15" y1="-3.55" x2="3.8" y2="-3.9" width="0.1016" layer="21"/>
<wire x1="3.8" y1="-3.9" x2="-3.8" y2="-3.9" width="0.1016" layer="21"/>
<wire x1="-3.8" y1="-3.9" x2="-4.15" y2="-3.55" width="0.1016" layer="21"/>
<wire x1="-4.15" y1="-3.55" x2="-4.15" y2="-2.4" width="0.1016" layer="21"/>
<wire x1="-4.15" y1="-2.4" x2="-3.85" y2="-2.1" width="0.1016" layer="21"/>
<wire x1="-3.85" y1="-2.1" x2="-3.85" y2="0.55" width="0.1016" layer="21"/>
<wire x1="-3.85" y1="0.55" x2="-4.15" y2="0.85" width="0.1016" layer="21"/>
<wire x1="3.85" y1="0.55" x2="3.85" y2="-2.1" width="0.1016" layer="21"/>
<wire x1="3.85" y1="0.55" x2="4.15" y2="0.85" width="0.1016" layer="21"/>
<wire x1="4.15" y1="0.85" x2="4.15" y2="2.25" width="0.1016" layer="21"/>
<wire x1="2.3" y1="1.15" x2="2.3" y2="-1.15" width="0.1016" layer="21"/>
<wire x1="2.3" y1="-1.15" x2="-2.3" y2="-1.15" width="0.1016" layer="51"/>
<wire x1="-2.8" y1="1.55" x2="2.8" y2="1.55" width="0.1016" layer="51"/>
<wire x1="2.8" y1="1.55" x2="2.8" y2="-1.55" width="0.1016" layer="21"/>
<wire x1="2.8" y1="-1.55" x2="-2.8" y2="-1.55" width="0.1016" layer="51"/>
<wire x1="-2.8" y1="-1.55" x2="-2.8" y2="1.55" width="0.1016" layer="21"/>
<wire x1="-2.3" y1="-1.15" x2="-2.3" y2="1.15" width="0.1016" layer="21"/>
<wire x1="-2.3" y1="1.15" x2="2.3" y2="1.15" width="0.1016" layer="51"/>
<wire x1="-1.75" y1="1.6" x2="-1.75" y2="2.25" width="0.1016" layer="51"/>
<wire x1="-1.75" y1="2.25" x2="-0.75" y2="2.25" width="0.1016" layer="51"/>
<wire x1="-0.75" y1="2.25" x2="-0.75" y2="1.6" width="0.1016" layer="51"/>
<wire x1="0.75" y1="1.6" x2="0.75" y2="2.25" width="0.1016" layer="51"/>
<wire x1="0.75" y1="2.25" x2="1.75" y2="2.25" width="0.1016" layer="51"/>
<wire x1="1.75" y1="2.25" x2="1.75" y2="1.6" width="0.1016" layer="51"/>
<wire x1="-0.75" y1="-1.6" x2="-0.75" y2="-2.25" width="0.1016" layer="51"/>
<wire x1="-0.75" y1="-2.25" x2="-1.75" y2="-2.25" width="0.1016" layer="51"/>
<wire x1="-1.75" y1="-2.25" x2="-1.75" y2="-1.6" width="0.1016" layer="51"/>
<wire x1="1.75" y1="-1.6" x2="1.75" y2="-2.25" width="0.1016" layer="51"/>
<wire x1="1.75" y1="-2.25" x2="0.75" y2="-2.25" width="0.1016" layer="51"/>
<wire x1="0.75" y1="-2.25" x2="0.75" y2="-1.6" width="0.1016" layer="51"/>
<pad name="1" x="1.25" y="1.8" drill="0.7" diameter="1.27"/>
<pad name="4" x="1.25" y="-1.8" drill="0.7" diameter="1.27"/>
<pad name="2" x="-1.25" y="1.8" drill="0.7" diameter="1.27"/>
<pad name="3" x="-1.25" y="-1.8" drill="0.7" diameter="1.27"/>
<text x="-4.5" y="5.5" size="1.27" layer="25">&gt;NAME</text>
<text x="-4.5" y="-7" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="32005-101">
<description>&lt;b&gt;MINI USB 4P R/A SMT&lt;/b&gt; Two Salient Point&lt;p&gt;
Source: http://www.cypressindustries.com/pdf/32005-101.pdf</description>
<wire x1="-3.5464" y1="3.6429" x2="-1.8857" y2="3.6429" width="0.1016" layer="21"/>
<wire x1="-1.8857" y1="3.6429" x2="-1.8857" y2="3.1125" width="0.1016" layer="21"/>
<wire x1="-1.8857" y1="-3.2125" x2="-1.8857" y2="-3.6428" width="0.1016" layer="21"/>
<wire x1="-1.8857" y1="-3.6428" x2="-3.5464" y2="-3.6428" width="0.1016" layer="21"/>
<wire x1="-3.5464" y1="-3.6428" x2="-3.5464" y2="3.6429" width="0.1016" layer="21"/>
<wire x1="-1.8321" y1="3.1072" x2="-0.4794" y2="3.1072" width="0.1016" layer="51"/>
<wire x1="-0.4794" y1="3.1072" x2="-0.4794" y2="4.4465" width="0.1016" layer="51"/>
<wire x1="-0.4794" y1="4.4465" x2="2.2661" y2="4.4465" width="0.1016" layer="51"/>
<wire x1="2.2661" y1="4.4465" x2="2.2661" y2="3.1072" width="0.1016" layer="51"/>
<wire x1="2.4269" y1="3.1072" x2="2.4269" y2="-3.2072" width="0.1016" layer="51"/>
<wire x1="2.4269" y1="-3.2072" x2="2.2661" y2="-3.2072" width="0.1016" layer="51"/>
<wire x1="2.2661" y1="-3.2072" x2="2.2661" y2="-4.4465" width="0.1016" layer="51"/>
<wire x1="2.2661" y1="-4.4465" x2="-0.466" y2="-4.4465" width="0.1016" layer="51"/>
<wire x1="-0.466" y1="-4.4465" x2="-0.466" y2="-3.2143" width="0.1016" layer="51"/>
<wire x1="-1.8321" y1="-3.2143" x2="-0.466" y2="-3.2143" width="0.1016" layer="51"/>
<wire x1="1.4626" y1="-3.234" x2="1.4626" y2="-3.9108" width="0.1016" layer="51"/>
<wire x1="1.4626" y1="-3.9108" x2="0.2304" y2="-3.9108" width="0.1016" layer="51"/>
<wire x1="0.2304" y1="-3.9108" x2="0.2304" y2="-3.234" width="0.1016" layer="51"/>
<wire x1="1.4626" y1="3.9108" x2="0.2304" y2="3.9108" width="0.1016" layer="51"/>
<wire x1="0.2304" y1="3.9108" x2="0.2304" y2="3.134" width="0.1016" layer="51"/>
<wire x1="1.4626" y1="3.1339" x2="1.4626" y2="3.9108" width="0.1016" layer="51"/>
<wire x1="-0.4794" y1="3.1072" x2="2.2661" y2="3.1072" width="0.1016" layer="51"/>
<wire x1="2.2661" y1="3.1072" x2="2.4269" y2="3.1072" width="0.1016" layer="51"/>
<wire x1="-0.466" y1="-3.2143" x2="2.429" y2="-3.2143" width="0.1016" layer="51"/>
<smd name="M1" x="0.85" y="3.875" dx="2.25" dy="3.8" layer="1" rot="R270"/>
<smd name="M2" x="0.85" y="-3.875" dx="2.25" dy="3.8" layer="1" rot="R270"/>
<smd name="1" x="3.15" y="1.2" dx="0.55" dy="2.5" layer="1" rot="R270"/>
<smd name="2" x="3.15" y="0.4" dx="0.55" dy="2.5" layer="1" rot="R270"/>
<smd name="3" x="3.15" y="-0.4" dx="0.55" dy="2.5" layer="1" rot="R270"/>
<smd name="4" x="3.15" y="-1.2" dx="0.55" dy="2.5" layer="1" rot="R270"/>
<text x="-2" y="5.5" size="1.27" layer="25">&gt;NAME</text>
<text x="-2" y="-6.5" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="3.0125" y1="0.4125" x2="3.4125" y2="1.9875" layer="51" rot="R270"/>
<rectangle x1="3.025" y1="-0.375" x2="3.425" y2="1.175" layer="51" rot="R270"/>
<rectangle x1="3.025" y1="-1.175" x2="3.425" y2="0.375" layer="51" rot="R270"/>
<rectangle x1="3.0375" y1="-1.9625" x2="3.4375" y2="-0.4375" layer="51" rot="R270"/>
<hole x="0" y="1.5" drill="1"/>
<hole x="0" y="-1.5" drill="1"/>
</package>
<package name="85-32004-10X">
<description>&lt;b&gt;USB B TYPE SINGLE R/A DIP&lt;/b&gt; With Rear Shell, Without Rear Shell&lt;p&gt;
Source: http://www.cypressindustries.com/pdf/85-32004-10x.pdf</description>
<wire x1="-10.225" y1="5.9625" x2="-10.225" y2="-5.9625" width="0.1016" layer="21"/>
<wire x1="-10.225" y1="-5.9625" x2="6.1625" y2="-5.9625" width="0.1016" layer="51"/>
<wire x1="6.1625" y1="-5.9625" x2="6.1625" y2="5.9625" width="0.1016" layer="21"/>
<wire x1="6.1625" y1="5.9625" x2="-10.225" y2="5.9625" width="0.1016" layer="51"/>
<wire x1="1.15" y1="6.0125" x2="0.975" y2="7.175" width="0.1016" layer="51"/>
<wire x1="0.975" y1="7.175" x2="-0.975" y2="7.175" width="0.1016" layer="51"/>
<wire x1="-0.975" y1="7.175" x2="-1.1375" y2="6.025" width="0.1016" layer="51"/>
<wire x1="-1.15" y1="-6.0125" x2="-0.975" y2="-7.175" width="0.1016" layer="51"/>
<wire x1="-0.975" y1="-7.175" x2="0.975" y2="-7.175" width="0.1016" layer="51"/>
<wire x1="0.975" y1="-7.175" x2="1.1375" y2="-6.025" width="0.1016" layer="51"/>
<wire x1="-1.8375" y1="5.9625" x2="-10.225" y2="5.9625" width="0.1016" layer="21"/>
<wire x1="-10.225" y1="-5.9625" x2="-1.8375" y2="-5.9625" width="0.1016" layer="21"/>
<wire x1="6.1625" y1="5.9625" x2="1.775" y2="5.9625" width="0.1016" layer="21"/>
<wire x1="1.775" y1="-5.9625" x2="6.1625" y2="-5.9625" width="0.1016" layer="21"/>
<pad name="M1" x="0" y="6.02" drill="2.3" diameter="3" rot="R270"/>
<pad name="M2" x="0" y="-6.02" drill="2.3" diameter="3" rot="R270"/>
<pad name="2" x="4.71" y="1.25" drill="0.92" diameter="1.27" rot="R270"/>
<pad name="3" x="2.71" y="1.25" drill="0.92" diameter="1.27" rot="R270"/>
<pad name="1" x="4.71" y="-1.25" drill="0.92" diameter="1.27" rot="R270"/>
<pad name="4" x="2.71" y="-1.25" drill="0.92" diameter="1.27" rot="R270"/>
<text x="-7.62" y="6.35" size="1.27" layer="25">&gt;NAME</text>
<text x="-8.255" y="1.27" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="85-32006-601-1">
<description>&lt;b&gt;1394-4P R/A SMT W/ SIDE FLANGE&lt;/b&gt;&lt;p&gt;
IEEE1394 4 Pin Firewire Connector&lt;br&gt;
Source: http://www.cypressindustries.com/pdf/85-32006-601-1.pdf</description>
<wire x1="4.2155" y1="-3.5433" x2="3.7635" y2="-3.9953" width="0.1016" layer="21" curve="-90"/>
<wire x1="-4.2215" y1="4.4416" x2="-4.2215" y2="7.5301" width="0.1016" layer="51"/>
<wire x1="-4.2215" y1="7.5301" x2="-5.9541" y2="7.5301" width="0.1016" layer="51"/>
<wire x1="-5.9541" y1="7.5301" x2="-6.2554" y2="7.2288" width="0.1016" layer="51" curve="90"/>
<wire x1="-6.2554" y1="7.2288" x2="-6.2554" y2="6.7768" width="0.1016" layer="51"/>
<wire x1="-4.2215" y1="2.5584" x2="-8.2139" y2="2.5584" width="0.1016" layer="21"/>
<wire x1="-8.2139" y1="2.5584" x2="-8.5153" y2="2.257" width="0.1016" layer="21" curve="90"/>
<wire x1="-8.5153" y1="2.257" x2="-8.5153" y2="-2.1121" width="0.1016" layer="21"/>
<wire x1="-8.5153" y1="-2.1121" x2="-8.214" y2="-2.4134" width="0.1016" layer="21" curve="89.923986"/>
<wire x1="-8.214" y1="-2.4134" x2="-4.2215" y2="-2.4134" width="0.1016" layer="21"/>
<wire x1="-6.2553" y1="6.7768" x2="-5.502" y2="6.0235" width="0.1016" layer="51" curve="-90.015214"/>
<wire x1="-5.502" y1="6.0235" x2="-6.2553" y2="5.2702" width="0.1016" layer="51" curve="-90"/>
<wire x1="-6.2553" y1="5.2702" x2="-6.2553" y2="4.7429" width="0.1016" layer="51"/>
<wire x1="-6.2553" y1="4.7429" x2="-5.954" y2="4.4416" width="0.1016" layer="51" curve="90.076115"/>
<wire x1="-5.954" y1="4.4416" x2="-4.2214" y2="4.4416" width="0.1016" layer="51"/>
<wire x1="-4.2214" y1="4.4416" x2="-4.2214" y2="3.0103" width="0.1016" layer="51"/>
<wire x1="-4.2214" y1="3.0103" x2="-4.2214" y2="1.3531" width="0.1016" layer="21"/>
<wire x1="-4.2214" y1="1.3531" x2="-4.2214" y2="-1.9614" width="0.1016" layer="21"/>
<wire x1="-4.2214" y1="-1.9614" x2="-4.2214" y2="-3.5433" width="0.1016" layer="21"/>
<wire x1="-4.2214" y1="-3.5433" x2="-3.7694" y2="-3.9953" width="0.1016" layer="21" curve="90"/>
<wire x1="-3.7694" y1="-3.9953" x2="3.7636" y2="-3.9953" width="0.1016" layer="21"/>
<wire x1="4.2156" y1="-3.5433" x2="4.2156" y2="-2.4134" width="0.1016" layer="21"/>
<wire x1="4.2156" y1="-2.4134" x2="4.2156" y2="2.5584" width="0.1016" layer="21"/>
<wire x1="4.2156" y1="2.5584" x2="4.2156" y2="3.0103" width="0.1016" layer="21"/>
<wire x1="4.2156" y1="3.0103" x2="4.2156" y2="4.4416" width="0.1016" layer="51"/>
<wire x1="4.2156" y1="4.4416" x2="4.2156" y2="7.5301" width="0.1016" layer="51"/>
<wire x1="4.2156" y1="7.5301" x2="5.9482" y2="7.5301" width="0.1016" layer="51"/>
<wire x1="5.9482" y1="7.5301" x2="6.2495" y2="7.2288" width="0.1016" layer="51" curve="-90"/>
<wire x1="6.2495" y1="7.2288" x2="6.2495" y2="6.7768" width="0.1016" layer="51"/>
<wire x1="6.2495" y1="6.7768" x2="5.4962" y2="6.0235" width="0.1016" layer="51" curve="89.98479"/>
<wire x1="5.4962" y1="6.0235" x2="6.2495" y2="5.2702" width="0.1016" layer="51" curve="90"/>
<wire x1="6.2495" y1="5.2702" x2="6.2495" y2="4.7429" width="0.1016" layer="51"/>
<wire x1="6.2495" y1="4.7429" x2="5.9482" y2="4.4416" width="0.1016" layer="51" curve="-90"/>
<wire x1="5.9482" y1="4.4416" x2="4.2156" y2="4.4416" width="0.1016" layer="51"/>
<wire x1="4.2156" y1="2.5584" x2="8.208" y2="2.5584" width="0.1016" layer="21"/>
<wire x1="8.208" y1="2.5584" x2="8.5094" y2="2.257" width="0.1016" layer="21" curve="-90"/>
<wire x1="8.5094" y1="2.257" x2="8.5094" y2="-2.1121" width="0.1016" layer="21"/>
<wire x1="8.5094" y1="-2.1121" x2="8.2081" y2="-2.4134" width="0.1016" layer="21" curve="-89.923986"/>
<wire x1="8.2081" y1="-2.4134" x2="4.2156" y2="-2.4134" width="0.1016" layer="21"/>
<wire x1="-3.2421" y1="-4.0707" x2="-3.2421" y2="-5.8786" width="0.1016" layer="21"/>
<wire x1="-3.2421" y1="-5.8786" x2="3.2363" y2="-5.8786" width="0.1016" layer="21"/>
<wire x1="3.2363" y1="-5.8786" x2="3.2363" y2="-4.0707" width="0.1016" layer="21"/>
<wire x1="2.5583" y1="7.5301" x2="3.4623" y2="7.5301" width="0.1016" layer="51"/>
<wire x1="3.4623" y1="7.5301" x2="3.7636" y2="7.2288" width="0.1016" layer="51" curve="-90"/>
<wire x1="3.7636" y1="7.2288" x2="3.7636" y2="3.4623" width="0.1016" layer="51"/>
<wire x1="2.5583" y1="7.5301" x2="2.5583" y2="3.4623" width="0.1016" layer="21"/>
<wire x1="2.5583" y1="3.4623" x2="2.5583" y2="3.0103" width="0.1016" layer="21"/>
<wire x1="2.6336" y1="3.4623" x2="3.7636" y2="3.4623" width="0.1016" layer="21"/>
<wire x1="3.7636" y1="3.4623" x2="4.2156" y2="3.0103" width="0.1016" layer="21" curve="-90"/>
<wire x1="2.5583" y1="3.0103" x2="3.5377" y2="3.0103" width="0.1016" layer="21"/>
<wire x1="3.5377" y1="3.0103" x2="3.7636" y2="2.7844" width="0.1016" layer="21" curve="-90"/>
<wire x1="3.7636" y1="2.7844" x2="3.7636" y2="1.6544" width="0.1016" layer="21"/>
<wire x1="3.7636" y1="1.6544" x2="3.387" y2="1.2777" width="0.1016" layer="21"/>
<wire x1="3.387" y1="1.2777" x2="3.387" y2="-1.8861" width="0.1016" layer="21"/>
<wire x1="3.387" y1="-1.8861" x2="3.7636" y2="-2.2628" width="0.1016" layer="21"/>
<wire x1="3.7636" y1="-2.2628" x2="3.7636" y2="-3.3174" width="0.1016" layer="21"/>
<wire x1="3.7636" y1="-3.3174" x2="3.613" y2="-3.468" width="0.1016" layer="21" curve="-90"/>
<wire x1="3.613" y1="-3.468" x2="-3.6187" y2="-3.468" width="0.1016" layer="21"/>
<wire x1="-3.6187" y1="-3.468" x2="-3.7694" y2="-3.3173" width="0.1016" layer="21" curve="-89.924011"/>
<wire x1="-3.7694" y1="-3.3173" x2="-3.7694" y2="-2.2627" width="0.1016" layer="21"/>
<wire x1="-3.7694" y1="-2.2627" x2="-3.3928" y2="-1.8861" width="0.1016" layer="21"/>
<wire x1="-3.3928" y1="-1.8861" x2="-3.3928" y2="1.2778" width="0.1016" layer="21"/>
<wire x1="-3.3928" y1="1.2778" x2="-3.7694" y2="1.6544" width="0.1016" layer="21"/>
<wire x1="-3.7694" y1="1.6544" x2="-3.7694" y2="2.8597" width="0.1016" layer="21"/>
<wire x1="-3.7694" y1="2.8597" x2="-3.6188" y2="3.0103" width="0.1016" layer="21" curve="-90"/>
<wire x1="-3.6188" y1="3.0103" x2="-2.5642" y2="3.0103" width="0.1016" layer="21"/>
<wire x1="-2.5642" y1="3.0103" x2="2.5583" y2="3.0103" width="0.1016" layer="21"/>
<wire x1="-2.5641" y1="7.5301" x2="-2.5641" y2="3.4623" width="0.1016" layer="21"/>
<wire x1="-2.5641" y1="3.4623" x2="-2.5642" y2="3.0103" width="0.1016" layer="21"/>
<wire x1="-2.5641" y1="7.5301" x2="-3.4681" y2="7.5301" width="0.1016" layer="51"/>
<wire x1="-3.4681" y1="7.5301" x2="-3.7694" y2="7.2288" width="0.1016" layer="51" curve="89.923986"/>
<wire x1="-3.7694" y1="7.2288" x2="-3.7694" y2="3.5377" width="0.1016" layer="51"/>
<wire x1="-2.5641" y1="3.4623" x2="-3.7694" y2="3.4623" width="0.1016" layer="21"/>
<wire x1="-3.7694" y1="3.4623" x2="-4.2214" y2="3.0103" width="0.1016" layer="21" curve="90"/>
<wire x1="-4.2214" y1="1.3531" x2="-3.8447" y2="0.9764" width="0.1016" layer="21"/>
<wire x1="-3.8447" y1="0.9764" x2="-3.8447" y2="-1.5847" width="0.1016" layer="21"/>
<wire x1="-3.8447" y1="-1.5847" x2="-4.2214" y2="-1.9614" width="0.1016" layer="21"/>
<wire x1="-2.5641" y1="3.4623" x2="-1.8862" y2="3.4623" width="0.1016" layer="21"/>
<wire x1="-1.8862" y1="3.4623" x2="-1.8862" y2="4.2156" width="0.1016" layer="21"/>
<wire x1="-1.8862" y1="4.2156" x2="-1.6602" y2="4.4416" width="0.1016" layer="21"/>
<wire x1="-1.6602" y1="4.4416" x2="1.6544" y2="4.4416" width="0.1016" layer="51"/>
<wire x1="1.6544" y1="4.4416" x2="1.8804" y2="4.2157" width="0.1016" layer="21"/>
<wire x1="1.8804" y1="4.2157" x2="1.8804" y2="3.4623" width="0.1016" layer="21"/>
<wire x1="1.8804" y1="3.4623" x2="2.5583" y2="3.4623" width="0.1016" layer="21"/>
<wire x1="4.2155" y1="-1.9614" x2="3.8388" y2="-1.5847" width="0.1016" layer="21"/>
<wire x1="3.8388" y1="-1.5847" x2="3.8388" y2="0.9764" width="0.1016" layer="21"/>
<wire x1="3.8388" y1="0.9764" x2="4.2155" y2="1.3531" width="0.1016" layer="21"/>
<wire x1="-4.2214" y1="7.5301" x2="-3.4681" y2="7.5301" width="0.1016" layer="51"/>
<wire x1="3.4622" y1="7.5301" x2="4.2155" y2="7.5301" width="0.1016" layer="51"/>
<wire x1="-2.5641" y1="7.5301" x2="-3.2681" y2="7.5301" width="0.1016" layer="21"/>
<wire x1="2.5583" y1="7.5301" x2="3.2623" y2="7.5301" width="0.1016" layer="21"/>
<smd name="M1" x="-5.05" y="6" dx="3.4" dy="3.4" layer="1"/>
<smd name="M2" x="5.05" y="6" dx="3.4" dy="3.4" layer="1"/>
<smd name="1" x="-1.2" y="4.775" dx="0.5" dy="1.95" layer="1"/>
<smd name="2" x="-0.4" y="4.775" dx="0.5" dy="1.95" layer="1"/>
<smd name="3" x="0.4" y="4.775" dx="0.5" dy="1.95" layer="1"/>
<smd name="4" x="1.2" y="4.775" dx="0.5" dy="1.95" layer="1"/>
<text x="-2.2" y="6.4" size="1.27" layer="25">&gt;NAME</text>
<text x="-3" y="1.4" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.4" y1="4.45" x2="-1" y2="5.7" layer="51"/>
<rectangle x1="-0.6" y1="4.45" x2="-0.2" y2="5.7" layer="51"/>
<rectangle x1="0.2" y1="4.45" x2="0.6" y2="5.7" layer="51"/>
<rectangle x1="1" y1="4.45" x2="1.4" y2="5.7" layer="51"/>
<hole x="-6.5" y="0" drill="2.8"/>
<hole x="6.5" y="0" drill="2.8"/>
</package>
<package name="85-32006-201-1">
<description>&lt;b&gt;1394-4P R/A DIP TWO Legs 1.2 PITCH&lt;/b&gt;&lt;p&gt;
IEEE1394 4 Pin Firewire Connector&lt;br&gt;
Source: http://www.cypressindustries.com/pdf/85-32006-201-1.pdf</description>
<wire x1="3.3" y1="3.4" x2="3.8" y2="3.9" width="0" layer="46" curve="-90"/>
<wire x1="3.8" y1="3.9" x2="4.3" y2="3.4" width="0" layer="46" curve="-90"/>
<wire x1="4.3" y1="3.4" x2="4.3" y2="2.4" width="0" layer="46"/>
<wire x1="4.3" y1="2.4" x2="3.8" y2="1.9" width="0" layer="46" curve="-90"/>
<wire x1="3.8" y1="1.9" x2="3.3" y2="2.4" width="0" layer="46" curve="-90"/>
<wire x1="3.3" y1="2.4" x2="3.3" y2="3.4" width="0" layer="46"/>
<wire x1="-4.3" y1="3.4" x2="-3.8" y2="3.9" width="0" layer="46" curve="-90"/>
<wire x1="-3.8" y1="3.9" x2="-3.3" y2="3.4" width="0" layer="46" curve="-90"/>
<wire x1="-3.3" y1="3.4" x2="-3.3" y2="2.4" width="0" layer="46"/>
<wire x1="-3.3" y1="2.4" x2="-3.8" y2="1.9" width="0" layer="46" curve="-90"/>
<wire x1="-3.8" y1="1.9" x2="-4.3" y2="2.4" width="0" layer="46" curve="-90"/>
<wire x1="-4.3" y1="2.4" x2="-4.3" y2="3.4" width="0" layer="46"/>
<wire x1="3.3" y1="8.15" x2="3.8" y2="8.65" width="0" layer="46" curve="-90"/>
<wire x1="3.8" y1="8.65" x2="4.3" y2="8.15" width="0" layer="46" curve="-90"/>
<wire x1="4.3" y1="8.15" x2="4.3" y2="7.15" width="0" layer="46"/>
<wire x1="4.3" y1="7.15" x2="3.8" y2="6.65" width="0" layer="46" curve="-90"/>
<wire x1="3.8" y1="6.65" x2="3.3" y2="7.15" width="0" layer="46" curve="-90"/>
<wire x1="3.3" y1="7.15" x2="3.3" y2="8.15" width="0" layer="46"/>
<wire x1="-4.3" y1="8.15" x2="-3.8" y2="8.65" width="0" layer="46" curve="-90"/>
<wire x1="-3.8" y1="8.65" x2="-3.3" y2="8.15" width="0" layer="46" curve="-90"/>
<wire x1="-3.3" y1="8.15" x2="-3.3" y2="7.15" width="0" layer="46"/>
<wire x1="-3.3" y1="7.15" x2="-3.8" y2="6.65" width="0" layer="46" curve="-90"/>
<wire x1="-3.8" y1="6.65" x2="-4.3" y2="7.15" width="0" layer="46" curve="-90"/>
<wire x1="-4.3" y1="7.15" x2="-4.3" y2="8.15" width="0" layer="46"/>
<wire x1="-4.0064" y1="8.666" x2="-3.5273" y2="8.666" width="0.1016" layer="51"/>
<wire x1="-3.5273" y1="8.666" x2="-3.5273" y2="7.6209" width="0.1016" layer="51"/>
<wire x1="-3.5273" y1="7.6209" x2="-2.5257" y2="7.6209" width="0.1016" layer="51"/>
<wire x1="-2.5257" y1="7.6209" x2="-2.5257" y2="6.5322" width="0.1016" layer="21"/>
<wire x1="-3.5273" y1="7.6209" x2="-3.5273" y2="6.4887" width="0.1016" layer="51"/>
<wire x1="-4.0064" y1="8.666" x2="-4.0064" y2="6.4451" width="0.1016" layer="51"/>
<wire x1="-4.0064" y1="6.4451" x2="-4.0064" y2="0.0688" width="0.1016" layer="51"/>
<wire x1="-4.0064" y1="0.0688" x2="-3.3714" y2="-0.5662" width="0.1016" layer="21" curve="90"/>
<wire x1="-3.3714" y1="-0.5662" x2="3.3714" y2="-0.5662" width="0.1016" layer="21"/>
<wire x1="3.3714" y1="-0.5662" x2="4.0064" y2="0.0688" width="0.1016" layer="21" curve="90"/>
<wire x1="4.0064" y1="0.0688" x2="4.0064" y2="6.4451" width="0.1016" layer="51"/>
<wire x1="4.0064" y1="6.4451" x2="4.0064" y2="8.666" width="0.1016" layer="51"/>
<wire x1="4.0064" y1="8.666" x2="3.571" y2="8.666" width="0.1016" layer="51"/>
<wire x1="3.5274" y1="7.6209" x2="2.5258" y2="7.6209" width="0.1016" layer="51"/>
<wire x1="2.5258" y1="7.6209" x2="2.5258" y2="6.4886" width="0.1016" layer="21"/>
<wire x1="3.5274" y1="6.4886" x2="-3.5273" y2="6.4886" width="0.1016" layer="51"/>
<wire x1="-3.5273" y1="6.4886" x2="-3.5273" y2="0.2304" width="0.1016" layer="51"/>
<wire x1="-3.5273" y1="0.2304" x2="-3.2098" y2="-0.0871" width="0.1016" layer="21" curve="90.036103"/>
<wire x1="-3.2098" y1="-0.0871" x2="3.2099" y2="-0.0871" width="0.1016" layer="21"/>
<wire x1="3.2099" y1="-0.0871" x2="3.5274" y2="0.2304" width="0.1016" layer="21" curve="90.036103"/>
<wire x1="3.5274" y1="0.2304" x2="3.5274" y2="6.9241" width="0.1016" layer="51"/>
<wire x1="3.5274" y1="6.9241" x2="3.5274" y2="8.666" width="0.1016" layer="51"/>
<wire x1="-3.4838" y1="5.6177" x2="-3.266" y2="5.6177" width="0.1016" layer="21"/>
<wire x1="-3.266" y1="5.6177" x2="-3.266" y2="5.1822" width="0.1016" layer="21" curve="-180"/>
<wire x1="-3.266" y1="5.1822" x2="-3.4838" y2="5.1822" width="0.1016" layer="21"/>
<wire x1="-3.4838" y1="0.8274" x2="-3.266" y2="0.8274" width="0.1016" layer="21"/>
<wire x1="-3.266" y1="0.8274" x2="-3.266" y2="0.3919" width="0.1016" layer="21" curve="-180"/>
<wire x1="-3.266" y1="0.3919" x2="-3.4838" y2="0.3919" width="0.1016" layer="21"/>
<wire x1="3.4404" y1="0.3919" x2="3.2226" y2="0.3919" width="0.1016" layer="21"/>
<wire x1="3.2226" y1="0.3919" x2="3.2226" y2="0.8274" width="0.1016" layer="21" curve="-180"/>
<wire x1="3.2226" y1="0.8274" x2="3.4404" y2="0.8274" width="0.1016" layer="21"/>
<wire x1="3.4839" y1="5.1822" x2="3.2661" y2="5.1822" width="0.1016" layer="21"/>
<wire x1="3.2661" y1="5.1822" x2="3.2661" y2="5.6177" width="0.1016" layer="21" curve="-180"/>
<wire x1="3.2661" y1="5.6177" x2="3.4839" y2="5.6177" width="0.1016" layer="21"/>
<wire x1="-2.5693" y1="6.9241" x2="-3.5274" y2="6.9241" width="0.1016" layer="51"/>
<wire x1="-3.5274" y1="6.9241" x2="-4.0064" y2="6.4451" width="0.1016" layer="51" curve="90"/>
<wire x1="2.5693" y1="6.9241" x2="3.5274" y2="6.9241" width="0.1016" layer="51"/>
<wire x1="3.5274" y1="6.9241" x2="4.0064" y2="6.4451" width="0.1016" layer="51" curve="-90"/>
<wire x1="-3.1354" y1="-0.6097" x2="-3.1354" y2="-2.4387" width="0.1016" layer="21"/>
<wire x1="-3.1354" y1="-2.4387" x2="3.1355" y2="-2.4387" width="0.1016" layer="21"/>
<wire x1="3.1355" y1="-2.4387" x2="3.1355" y2="-0.6097" width="0.1016" layer="21"/>
<wire x1="-4.0064" y1="5.9451" x2="-4.0064" y2="4.5688" width="0.1016" layer="21"/>
<wire x1="4.0064" y1="0.0688" x2="4.0064" y2="0.9451" width="0.1016" layer="21"/>
<wire x1="-4.0064" y1="0.9451" x2="-4.0064" y2="0.0688" width="0.1016" layer="21"/>
<wire x1="4.0064" y1="4.5688" x2="4.0064" y2="5.9451" width="0.1016" layer="21"/>
<wire x1="-3.5273" y1="5.9886" x2="-3.5273" y2="4.7304" width="0.1016" layer="21"/>
<wire x1="3.5274" y1="4.7304" x2="3.5274" y2="5.9241" width="0.1016" layer="21"/>
<wire x1="-3.5273" y1="0.9886" x2="-3.5273" y2="0.2304" width="0.1016" layer="21"/>
<wire x1="3.5274" y1="0.2304" x2="3.5274" y2="0.9241" width="0.1016" layer="21"/>
<wire x1="3.0274" y1="6.4886" x2="-3.0273" y2="6.4886" width="0.1016" layer="21"/>
<pad name="M1" x="-3.8" y="2.9" drill="1" diameter="1.4" shape="long" rot="R90"/>
<pad name="M2" x="3.8" y="2.9" drill="1" diameter="1.4" shape="long" rot="R90"/>
<pad name="M3" x="-3.8" y="7.65" drill="1" diameter="1.4" shape="long" rot="R90"/>
<pad name="M4" x="3.8" y="7.65" drill="1" diameter="1.4" shape="long" rot="R90"/>
<pad name="1" x="-1.2" y="8.1" drill="0.7" diameter="1.1"/>
<pad name="2" x="-0.4" y="6.9" drill="0.7" diameter="1.1"/>
<pad name="3" x="0.4" y="8.1" drill="0.7" diameter="1.1"/>
<pad name="4" x="1.2" y="6.9" drill="0.7" diameter="1.1"/>
<text x="-5" y="0.5" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="6.5" y="0.5" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="MINI-USB-4P-">
<wire x1="-2.54" y1="6.35" x2="-2.54" y2="-3.81" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-3.81" x2="-1.27" y2="-5.08" width="0.254" layer="94" curve="90"/>
<wire x1="-1.27" y1="-5.08" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="-5.08" x2="6.35" y2="-3.81" width="0.254" layer="94" curve="90"/>
<wire x1="6.35" y1="-3.81" x2="6.35" y2="6.35" width="0.254" layer="94"/>
<wire x1="-2.54" y1="6.35" x2="-1.27" y2="7.62" width="0.254" layer="94" curve="-90"/>
<wire x1="-1.27" y1="7.62" x2="5.08" y2="7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="7.62" x2="6.35" y2="6.35" width="0.254" layer="94" curve="-90"/>
<wire x1="0" y1="5.08" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="1.27" y2="-3.81" width="0.254" layer="94"/>
<wire x1="1.27" y1="-3.81" x2="2.54" y2="-3.81" width="0.254" layer="94"/>
<wire x1="3.81" y1="-2.54" x2="3.81" y2="5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="6.35" x2="1.27" y2="6.35" width="0.254" layer="94"/>
<wire x1="1.27" y1="6.35" x2="0" y2="5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="6.35" x2="3.81" y2="5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="-3.81" x2="3.81" y2="-2.54" width="0.254" layer="94"/>
<text x="-2.54" y="10.16" size="1.778" layer="95">&gt;NAME</text>
<text x="10.16" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="1" x="-5.08" y="5.08" visible="pin" direction="pas"/>
<pin name="2" x="-5.08" y="2.54" visible="pin" direction="pas"/>
<pin name="3" x="-5.08" y="0" visible="pin" direction="pas"/>
<pin name="4" x="-5.08" y="-2.54" visible="pin" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MINI-USB_4P-" prefix="X">
<description>&lt;b&gt;MINI USB 4 Pol.&lt;/b&gt;&lt;p&gt;
Source: www.cypressindustries.com</description>
<gates>
<gate name="G$1" symbol="MINI-USB-4P-" x="0" y="0"/>
</gates>
<devices>
<device name="85-32004-40X" package="85-32004-40X">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="32005-101" package="32005-101">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="85-32004-10X" package="85-32004-10X">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="85-32006-601-1" package="85-32006-601-1">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="85-32006-201-1" package="85-32006-201-1">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-amp-mt">
<description>&lt;b&gt;AMP Connectors, Type MT&lt;/b&gt;&lt;p&gt;
include  Type MT6; con-amp-mt6.lbr&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="S02P">
<description>&lt;b&gt;AMP MT CONNECTOR&lt;/b&gt;</description>
<wire x1="0.869" y1="0.381" x2="0.869" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="1.631" y1="0.381" x2="0.869" y2="0.381" width="0.1524" layer="51"/>
<wire x1="1.631" y1="-0.381" x2="1.631" y2="0.381" width="0.1524" layer="51"/>
<wire x1="0.869" y1="0.381" x2="1.631" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="1.631" y1="0.381" x2="0.869" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="0.869" y1="-0.381" x2="1.631" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-1.62" y1="0.381" x2="-1.62" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-0.858" y1="0.381" x2="-1.62" y2="0.381" width="0.1524" layer="51"/>
<wire x1="-0.858" y1="-0.381" x2="-0.858" y2="0.381" width="0.1524" layer="51"/>
<wire x1="-1.62" y1="0.381" x2="-0.858" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-0.858" y1="0.381" x2="-1.62" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-1.62" y1="-0.381" x2="-0.858" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="3.638" y1="-2.667" x2="3.892" y2="-2.413" width="0.1524" layer="21" curve="90"/>
<wire x1="3.638" y1="2.667" x2="3.892" y2="2.413" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.805" y1="2.413" x2="-3.551" y2="2.667" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.805" y1="-2.413" x2="-3.551" y2="-2.667" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.313" y1="3.683" x2="4.4" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-3.551" y1="2.667" x2="3.638" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-3.551" y1="-2.667" x2="-2.662" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="-3.805" y1="-2.413" x2="-3.805" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.821" y1="3.175" x2="-4.821" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="4.4" y1="3.683" x2="4.908" y2="3.175" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.821" y1="-3.175" x2="-4.313" y2="-3.683" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.821" y1="3.175" x2="-4.313" y2="3.683" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.4" y1="-3.683" x2="4.908" y2="-3.175" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.281" y1="-2.667" x2="-2.281" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-2.281" y1="-3.683" x2="-2.662" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-2.662" y1="-2.667" x2="-2.662" y2="-3.683" width="0.0508" layer="21"/>
<wire x1="-2.662" y1="-2.667" x2="-2.281" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="-2.662" y1="-3.683" x2="-4.313" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-3.805" y1="-1.27" x2="3.892" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.805" y1="1.27" x2="3.892" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.805" y1="-1.27" x2="-3.805" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.805" y1="1.27" x2="-3.805" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-2.281" y1="-2.667" x2="-2.281" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-2.281" y1="-2.159" x2="2.368" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="3.892" y1="-1.27" x2="3.892" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.892" y1="1.27" x2="3.892" y2="2.413" width="0.1524" layer="21"/>
<wire x1="3.892" y1="-2.413" x2="3.892" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.908" y1="3.175" x2="4.908" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="2.749" y1="-2.667" x2="3.638" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="2.749" y1="-2.667" x2="2.749" y2="-3.683" width="0.0508" layer="21"/>
<wire x1="4.4" y1="-3.683" x2="2.749" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="2.749" y1="-3.683" x2="2.368" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="2.368" y1="-2.667" x2="2.749" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="2.368" y1="-3.683" x2="2.368" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="2.368" y1="-2.667" x2="2.368" y2="-2.159" width="0.1524" layer="21"/>
<pad name="2" x="-1.25" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="1" x="1.25" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-4.7952" y="4.191" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.465" y="-5.461" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="2.5708" y="-0.635" size="1.27" layer="21" ratio="10">1</text>
<text x="-3.3982" y="-0.635" size="1.27" layer="21" ratio="10">2</text>
</package>
</packages>
<symbols>
<symbol name="M">
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="0" width="0.6096" layer="94"/>
<text x="-0.508" y="1.016" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<text x="0.254" y="-2.413" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="S02P" prefix="SV" uservalue="yes">
<description>&lt;b&gt;AMP MT CONNECTOR&lt;/b&gt;</description>
<gates>
<gate name="-1" symbol="M" x="0" y="2.54" addlevel="always"/>
<gate name="-2" symbol="M" x="0" y="-2.54" addlevel="always"/>
</gates>
<devices>
<device name="" package="S02P">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="K1" library="relay" deviceset="351" device=""/>
<part name="D1" library="diode" deviceset="1N4148" device="DO35-7"/>
<part name="X1" library="con-cypressindustries" deviceset="MINI-USB_4P-" device="85-32006-201-1"/>
<part name="SV1" library="con-amp-mt" deviceset="S02P" device=""/>
<part name="SV2" library="con-amp-mt" deviceset="S02P" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="K1" gate="1" x="48.26" y="60.96"/>
<instance part="K1" gate="2" x="38.1" y="45.72" rot="R270"/>
<instance part="K1" gate="3" x="38.1" y="30.48" rot="R270"/>
<instance part="D1" gate="G$1" x="38.1" y="60.96" rot="R90"/>
<instance part="X1" gate="G$1" x="10.16" y="66.04" rot="R180"/>
<instance part="SV1" gate="-1" x="12.7" y="45.72"/>
<instance part="SV1" gate="-2" x="12.7" y="30.48"/>
<instance part="SV2" gate="-1" x="55.88" y="35.56" rot="R180"/>
<instance part="SV2" gate="-2" x="55.88" y="50.8" rot="R180"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="4"/>
<pinref part="K1" gate="1" pin="1"/>
<wire x1="15.24" y1="68.58" x2="38.1" y2="68.58" width="0.1524" layer="91"/>
<wire x1="38.1" y1="68.58" x2="48.26" y2="68.58" width="0.1524" layer="91"/>
<wire x1="48.26" y1="68.58" x2="48.26" y2="66.04" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="C"/>
<wire x1="38.1" y1="68.58" x2="38.1" y2="63.5" width="0.1524" layer="91"/>
<junction x="38.1" y="68.58"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="1"/>
<wire x1="15.24" y1="60.96" x2="15.24" y2="55.88" width="0.1524" layer="91"/>
<pinref part="K1" gate="1" pin="2"/>
<wire x1="15.24" y1="55.88" x2="38.1" y2="55.88" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="A"/>
<wire x1="38.1" y1="55.88" x2="48.26" y2="55.88" width="0.1524" layer="91"/>
<wire x1="38.1" y1="58.42" x2="38.1" y2="55.88" width="0.1524" layer="91"/>
<junction x="38.1" y="55.88"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="SV1" gate="-1" pin="S"/>
<pinref part="K1" gate="2" pin="P"/>
<wire x1="35.56" y1="45.72" x2="17.78" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="SV1" gate="-2" pin="S"/>
<pinref part="K1" gate="3" pin="P"/>
<wire x1="35.56" y1="30.48" x2="17.78" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="K1" gate="2" pin="S"/>
<pinref part="SV2" gate="-2" pin="S"/>
<wire x1="50.8" y1="50.8" x2="43.18" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="K1" gate="3" pin="S"/>
<pinref part="SV2" gate="-1" pin="S"/>
<wire x1="50.8" y1="35.56" x2="43.18" y2="35.56" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>

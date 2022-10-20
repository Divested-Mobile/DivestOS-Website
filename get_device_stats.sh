#!/bin/bash
#Copyright (c) 2021-2022 Divested Computing Group
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.

devices=(a3xelte a52q a5xelte a5y17lte a6020 a72q a7xelte a7y17lte addison ahannah akari akatsuki albus alioth amber angler anne apollo apollon armani athene aura aurora avicii axolotl axon7 bacon barbet bardock bardockpro beckham berkeley berlin beryllium beyond0lte beyond1lte beyond2lte beyondlte beyondx bluejay blueline bonito bramble bullhead cancro capricorn castor castor_windy cedric cepheus chagalllte chagallwifi channel chaozu charlotte che10 cheeseburger cheetah chef cherry cheryl chiron clark condor coral crackling crosshatch crownlte d1 d2att d2s d2spr d2tmo d2vzw d2x d800 d801 d802 d803 d850 d851 d852 d855 davinci deadpool deb dipper discovery dogo dragon dre drg dubai dumpling enchilada equuleus espresso espresso3g espressowifi ether evert f1f f400 fajita falcon figo find7 flame flo flounder flounder_lte flox foster foster_tab fp2 fp3 fp4 fugu g2m gauguin gemini ghost ginkgo gohan griffin grouper grus gta4xl gta4xlwifi gtelwifiue gtesqltespr gts210ltexx gts210vewifi gts210wifi gts28vewifi gts4lv gts4lvwifi guacamole guacamoleb h811 h815 h830 h850 h870 h910 h918 h990 ha3g ham hammerhead hannah harpia hayabusa heart hero2lte herolte hiae himaul himawl hlte hltechn hltekor hltetmo hotdog hotdogb huashan hydrogen i001d i01wd i9100 i9300 i9305 ido instantnoodle instantnoodlep ivy j7elte jactivelte jag3gds jagnm jalebi jasmine jasmine_sprout jason jellypro jflteatt jfltespr jfltevzw jfltexx jfvelte k3gxx kane karin karin_windy kccat6 kebab kenzo kiev kingdom kipper kirin kiwi klimtwifi klte klteactivexx klteaio kltechn kltechnduo klteduos kltedv kltekdi kltekor kltesprsports ks01lte ks01ltexx kugo kuntao lake land lavender lemonade lemonadep lentislte lettuce libra lithium lmi ls990 ls997 lt02ltespr lt03lte lux m20lte m216 m7 m7vzw m8 m8d maguro mako manta marlin maserati mata mdarcy mdarcy_tab merlin mermaid miatol miatoll mido mint mondrianwifi monet montana ms013g mt2 n1awifi n2awifi n3 n5100 n5110 n5120 n7100 nairo nash natrium nex nicki nio nx512j nx563j obiwan ocean odin onclite oneplus2 oneplus3 onyx oriole osprey otus p024 paella panther payton pdx203 peach peregrine piccolo pioneer pl2 platina pme polaris pollux pollux_windy porg porg_tab pro1 pstar pyxis quill quill_tab r5 r7plus r7sf racer raphael raven redfin rhannah river rmx1801 rmx1851 roth rs988 s2 s3ve3gds s3ve3gjv s3ve3gxx s5neolte sagit sailfish sake santoni sargo scorpio seed serrano3gxx serranodsdd serranoltexx shamu shieldtablet sirius spyder star2lte starlte sumire sunfish surnia surya suzu suzuran t0lte t6 t6vzw taimen taoshan targa tenshi thea thor tilapia tissot titan tomato toro toroplus tp1803 troika tsubasa tulip twolip umts_spyder ursa us996 us997 v1awifi v400 v410 v480 v500 v521 vayu vegetalte victara violet voyager vs985 vs995 w5 w7 wade walleye wayne whyred wt88047 x00p x00td x01ad x01bd x2 xmsirius xt897 xz2c yellowstone ytx703f ytx703l yuga z008 z00a z00d z00l z00t z01r z2_plus z3 z3c zangya zangyapro zenfone3 zerofltexx zeroltexx zippo zl1);

for device in "${devices[@]}"
do
	echo -n "$device: ";
	grep "updater\.php?base=LineageOS&device=$device&inc=" /var/log/httpd/access_log* | wc -l;
done;

echo -n "Total: ";
grep "updater\.php?base=LineageOS&device=" /var/log/httpd/access_log* | wc -l;

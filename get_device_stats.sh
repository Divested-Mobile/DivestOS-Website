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

devices=(a5y17lte akari alioth amber angler apollo aura aurora avicii axon7 bacon beryllium blueline bonito bramble bullhead cepheus channel cheeseburger cheryl clark coral crackling crosshatch d2att d2spr d2tmo d2vzw d800 d801 d802 d803 d850 d851 d852 d855 davinci deb discovery dragon dumpling enchilada ether f400 fajita flame flo flounder flounder_lte flox foster fp2 fp3 fp4 fugu ginkgo griffin grouper gta4xlwifi guacamole guacamoleb h811 h815 h830 h850 h870 h910 h918 h990 ham hammerhead harpia hero2lte herolte himaul himawl hotdog hotdogb huashan i9100 i9300 i9305 instantnoodle instantnoodlep jactivelte jellypro jflteatt jfltespr jfltevzw jfltexx jfvelte kccat6 kebab kipper kirin klte klteaio kltechn kltechnduo klteduos kltedv kltekdi kltekor ks01ltexx lake land lavender lemonade lemonadep lentislte lmi ls990 ls997 m7 m8 m8d maguro mako manta marlin mata merlin mermaid miatol montana n5100 n5110 n5120 n7100 nex ocean oneplus2 oneplus3 onyx osprey payton pioneer pl2 pro1 raphael redfin river roth rs988 sailfish santoni sargo seed serrano3gxx serranoltexx shamu shieldtablet star2lte starlte sunfish surnia surya taimen targa thor tilapia toro toroplus us996 us997 v1awifi vayu victara voyager vs985 vs995 walleye xz2c yellowstone Z00T z00t z2_plus z3 z3c zenfone3);

for device in "${devices[@]}"
do
	echo -n "$device: ";
	grep "updater\.php?base=LineageOS&device=$device&inc=" /var/log/httpd/access_log* | wc -l;
done;

echo -n "Total: ";
grep "updater\.php?base=LineageOS&device=" /var/log/httpd/access_log* | wc -l;

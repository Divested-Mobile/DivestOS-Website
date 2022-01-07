#!/bin/bash
#Copyright (c) 2021 Divested Computing Group
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

devices=(akari alioth amber angler apollo aura aurora avicii axon7 bacon beryllium blueline bonito bramble bullhead cheeseburger cheryl clark coral crackling crosshatch d802 d852 d855 davinci deb discovery dragon dumpling enchilada ether fajita flame flo flounder flox fp2 fp3 fugu griffin grouper guacamole guacamoleb h815 h850 h870 h910 h990 ham hammerhead harpia herolte himaul hotdog hotdogb i9100 i9300 i9305 jellypro jfltexx kccat6 kipper klte land lavender lentislte lmi m7 m8 maguro mako manta marlin mata merlin n5110 n7100 nex oneplus2 oneplus3 osprey pioneer pro1 raphael redfin rs988 sailfish santoni sargo serrano3gxx serranoltexx shamu star2lte starlte sunfish surnia taimen thor tilapia toro toroplus us996 us997 v1awifi vayu victara voyager walleye xz2c yellowstone z00t z2_plus zenfone3);

for device in "${devices[@]}"
do
	echo -n "$device: ";
	grep "updater\.php?base=LineageOS&device=$device&inc=" /var/log/httpd/access_log* | wc -l;
done;

echo -n "Total: ";
grep "updater\.php?base=LineageOS&device=" /var/log/httpd/access_log* | wc -l;

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

#TODO: finish adding release dates

mkdir -p a5y17lte akari alioth amber angler apollo aura aurora avicii axon7 bacon beryllium blueline bonito bramble bullhead cepheus channel cheeseburger cheryl clark coral crackling crosshatch d2att d2spr d2tmo d2vzw d800 d801 d802 d803 d850 d851 d852 d855 davinci deb discovery dragon dumpling enchilada ether f400 fajita flame flo flounder flounder_lte flox foster fp2 fp3 fp4 fugu ginkgo griffin grouper gta4xlwifi guacamole guacamoleb h811 h815 h830 h850 h870 h910 h918 h990 ham hammerhead harpia hero2lte herolte himaul himawl hotdog hotdogb huashan i9100 i9300 i9305 instantnoodle instantnoodlep jactivelte jellypro jflteatt jfltespr jfltevzw jfltexx jfvelte kccat6 kebab kipper kirin klte klteaio kltechn kltechnduo klteduos kltedv kltekdi kltekor ks01ltexx lake land lavender lemonade lemonadep lentislte lmi ls990 ls997 m7 m8 m8d maguro mako manta marlin mata merlin mermaid miatol montana n5100 n5110 n5120 n7100 nex ocean oneplus2 oneplus3 onyx osprey payton pioneer pl2 pro1 raphael redfin river roth rs988 sailfish santoni sargo seed serrano3gxx serranoltexx shamu shieldtablet star2lte starlte sunfish surnia surya taimen targa thor tilapia toro toroplus us996 us997 v1awifi vayu victara voyager vs985 vs995 walleye xz2c yellowstone Z00T z00t z2_plus z3 z3c zenfone3;

echo "Sony Xperia XZ2" > akari/friendlyName;
echo "Sony Xperia XZ2 Premium" > aurora/friendlyName;
echo "Sony Xperia XZ2 Compact" > xz2c/friendlyName;
echo 4 > akari/status-18.1;
echo 4 > aurora/status-18.1;
echo 7 > xz2c/status-18.1;
echo -e "Fastboot (Sony)\nUnknown\n2.0" > akari/bootloader_information;
echo -e "Fastboot (Sony)\nUnknown\n2.0" > aurora/bootloader_information;
echo -e "Fastboot (Sony)\nUnknown\n2.0" > xz2c/bootloader_information;
echo "2018-04-05" > akari/releasedate;
echo "2018-07-30" > aurora/releasedate;
echo "2018-04-05" > xz2c/releasedate;

echo "Xiaomi POCO F3 / Redmi K40 / Mi 11X" > alioth/friendlyName;
echo 7 > alioth/status-18.1;
echo -e "Fastboot (Xiaomi)\nWill Brick\n2.0" > alioth/bootloader_information;
echo "2021-03-04" > alioth/releasedate;

echo "Yandex Phone" > amber/friendlyName;
echo 2 > amber/status-17.1;
echo -e "Fastboot (Yandex)\nUnknown\n2.0" > amber/bootloader_information;
echo "2018-12-05" > amber/releasedate;

echo "Google Nexus 6P" > angler/friendlyName;
echo 7 > angler/status-15.1;
echo -e "Fastboot\nReported Working\n1.0" > angler/bootloader_information;
echo "2015-09-29" > angler/releasedate;

echo "Razer Phone 2" > aura/friendlyName;
echo 2 > aura/status-19.1;
echo -e "Fastboot\nYes, Untested\n2.0" > aura/bootloader_information;

echo "OnePlus Nord" > avicii/friendlyName;
echo 7 > avicii/status-17.1;
echo -e "Fastboot\nReported Working\n2.0" > avicii/bootloader_information;
echo "2020-08-04" > avicii/releasedate;

echo "ZTE Axon 7" > axon7/friendlyName;
echo 2 > axon7/status-15.1;
echo -e "Custom\nNot Unlockable\nNo" > axon7/bootloader_information;
echo "2016-05-01" > axon7/releasedate; #?

echo "OnePlus One" > bacon/friendlyName;
echo 0 > bacon/status-18.1;
echo -e "Fastboot\nYes, but irreversible\nNo" > bacon/bootloader_information;
echo "2014-04-23" > bacon/releasedate;

echo "Xiaomi Poco F1" > beryllium/friendlyName;
echo 5 > beryllium/status-18.1;
echo 2 > beryllium/status-19.1;
echo -e "Fastboot (Xiaomi)\nWill Brick\n2.0" > beryllium/bootloader_information;
echo "2018-08-01" > beryllium/releasedate; #?

echo "Google Pixel 3" > blueline/friendlyName;
echo "Google Pixel 3 XL" > crosshatch/friendlyName;
echo 8 > blueline/status-18.1;
echo 2 > blueline/status-19.1;
echo 7 > crosshatch/status-18.1;
echo 2 > crosshatch/status-19.1;
echo -e "Fastboot\nYes, Untested\n2.0" > blueline/bootloader_information;
echo -e "Fastboot\nReported Working\n2.0" > crosshatch/bootloader_information;
echo "2018-10-18" > blueline/releasedate;
echo "2018-10-18" > crosshatch/releasedate;

echo "Google Pixel 3a XL" > bonito/friendlyName;
echo "Google Pixel 3a" > sargo/friendlyName;
echo 2 > bonito/status-19.1;
echo 2 > sargo/status-19.1;
echo -e "Fastboot\nYes, Untested\n2.0" > bonito/bootloader_information;
echo -e "Fastboot\nYes, Untested\n2.0" > sargo/bootloader_information;
echo "2019-05-07" > bonito/releasedate;
echo "2019-05-07" > sargo/releasedate;

echo "Google Pixel 4a 5G" > bramble/friendlyName;
echo 2 > bramble/status-19.1;
echo -e "Fastboot\nYes, Untested\n2.0" > bramble/bootloader_information;
echo "2020-08-20" > bramble/releasedate;

echo "Google Nexus 5X" > bullhead/friendlyName;
echo 7 > bullhead/status-15.1;
echo -e "Fastboot\nReported Working\n1.0" > bullhead/bootloader_information;
echo "2015-10-22" > bullhead/releasedate;

echo "OnePlus 5" > cheeseburger/friendlyName;
echo "OnePlus 5T" > dumpling/friendlyName;
echo 0 > cheeseburger/status-18.1;
echo 7 > dumpling/status-18.1;
echo -e "Fastboot\nTested Working\n1.0" > cheeseburger/bootloader_information;
echo -e "Fastboot\nReported Working\n1.0" > dumpling/bootloader_information;
echo "2017-06-20" > cheeseburger/releasedate;
echo "2017-11-21" > dumpling/releasedate;

echo "Razer Phone" > cheryl/friendlyName;
echo 8 > cheryl/status-18.1;
echo -e "Fastboot\nYes, Untested\n1.0" > cheryl/bootloader_information;
echo "2017-11-15" > cheryl/releasedate;

echo "Moto X Pure 2015" > clark/friendlyName;
echo 0 > clark/status-14.1;
echo 0 > clark/status-17.1;
echo -e "Fastboot (Motorola)\nNo*\nNo" > clark/bootloader_information;
echo "2015-09-02" > clark/releasedate;

echo "Pixel 4 XL" > coral/friendlyName;
echo "Pixel 4" > flame/friendlyName;
echo 2 > coral/status-19.1;
echo 2 > flame/status-19.1;
echo -e "Fastboot\nYes, Untested\n2.0" > coral/bootloader_information;
echo -e "Fastboot\nYes, Untested\n2.0" > flame/bootloader_information;
echo "2019-10-24" > coral/releasedate;
echo "2019-10-24" > flame/releasedate;

echo "Wileyfox Swift" > crackling/friendlyName;
echo 8 > crackling/status-17.1;
echo -e "Fastboot\nUnknown\nNo" > crackling/bootloader_information;

echo "LG G2 ATT" > d800/friendlyName;
echo "LG G2 TMO" > d801/friendlyName;
echo "LG G2 INTL" > d802/friendlyName;
echo "LG G2 CAN" > d803/friendlyName;
echo 4 > d800/status-18.1;
echo 4 > d801/status-18.1;
echo 8 > d802/status-18.1;
echo 4 > d803/status-18.1;
echo -e "LG UP\nNot Unlockable\nNo" > d800/bootloader_information;
echo -e "LG UP\nNot Unlockable\nNo" > d801/bootloader_information;
echo -e "LG UP\nNot Unlockable\nNo" > d802/bootloader_information;
echo -e "LG UP\nNot Unlockable\nNo" > d803/bootloader_information;
echo "2013-09-12" > d802/releasedate;

echo "LG G3 ATT" > d850/friendlyName;
echo "LG G3 TMO" > d851/friendlyName;
echo "LG G3 CAN" > d852/friendlyName;
echo "LG G3 INTL" > d855/friendlyName;
echo "LG G3 KOR" > f400/friendlyName;
echo "LG G3 SPR" > ls990/friendlyName;
echo "LG G3 VZW" > vs985/friendlyName;
echo 2 > d850/status-18.1;
echo 2 > d851/status-18.1;
echo 5 > d852/status-18.1;
echo 5 > d855/status-18.1;
echo 2 > f400/status-18.1;
echo 2 > ls990/status-18.1;
echo 2 > vs985/status-18.1;
echo -e "LG UP/LG LAF\nNot Unlockable\nNo" > d850/bootloader_information;
echo -e "LG UP/LG LAF\nNot Unlockable\nNo" > d851/bootloader_information;
echo -e "LG UP/LG LAF\nNot Unlockable\nNo" > d852/bootloader_information;
echo -e "LG UP/LG LAF\nNot Unlockable\nNo" > d855/bootloader_information;
echo -e "LG UP/LG LAF\nNot Unlockable\nNo" > f400/bootloader_information;
echo -e "LG UP/LG LAF\nNot Unlockable\nNo" > ls990/bootloader_information;
echo -e "LG UP/LG LAF\nNot Unlockable\nNo" > vs985/bootloader_information;
echo "2014-05-28" > d852/releasedate;
echo "2014-05-28" > d855/releasedate;

echo "Xiaomi Redmi K20 / Mi 9T" > davinci/friendlyName;
echo 7 > davinci/status-17.1;
echo -e "Fastboot (Xiaomi)\nWill Brick\n2.0" > davinci/bootloader_information;
echo "2019-05-01" > davinci/releasedate; #?

echo "Google Pixel C" > dragon/friendlyName;
echo 0 > dragon/status-15.1;
echo -e "Fastboot\nYes, but will error\n1.0" > dragon/bootloader_information;
echo "2015-12-08" > dragon/releasedate;

echo "OnePlus 6" > enchilada/friendlyName;
echo "OnePlus 6T" > fajita/friendlyName;
echo 7 > enchilada/status-18.1;
echo 7 > enchilada/status-19.1;
echo 0 > fajita/status-18.1;
echo 0 > fajita/status-19.1;
echo -e "Fastboot\nReported Working\n2.0" > enchilada/bootloader_information;
echo -e "Fastboot\nTested Working\n2.0" > fajita/bootloader_information;
echo "2018-05-02" > enchilada/releasedate;
echo "2018-11-06" > fajita/releasedate;

echo "Nextbit Robin" > ether/friendlyName;
echo 8 > ether/status-15.1;
echo 7 > ether/status-18.1;
echo -e "Fastboot\nReported Working\nNo" > ether/bootloader_information;
echo "2016-02-16" > ether/releasedate;

echo "Google Nexus 7 LTE [2013]" > deb/friendlyName;
echo "Google Nexus 7 [2013]" > flo/friendlyName;
echo "Google Nexus 7 [2013] (repartitioned)" > flox/friendlyName;
echo 4 > deb/status-15.1;
echo 0 > flo/status-15.1;
echo 0 > flox/status-18.1;
echo -e "Fastboot\nYes, Untested\nNo" > deb/bootloader_information;
echo -e "Fastboot\nTested Working\nNo" > flo/bootloader_information;
echo -e "Fastboot\nTested Working\nNo" > flox/bootloader_information;

echo "Google Nexus 9" > flounder/friendlyName;
echo "Google Nexus 9 LTE" > flounder_lte/friendlyName;
echo 0 > flounder/status-15.1;
echo 4 > flounder_lte/status-15.1;
echo -e "Fastboot\nYes, Might Brick\n1.0" > flounder/bootloader_information;
echo -e "Fastboot\nYes, Might Brick\n1.0" > flounder_lte/bootloader_information;

echo "Fairphone 2" > fp2/friendlyName;
echo 7 > fp2/status-18.1;
echo -e "Pre-Unlocked\nUnknown\nNo" > fp2/bootloader_information;
echo "2015-12-01" > fp2/releasedate; #?

echo "Fairphone 3" > fp3/friendlyName;
echo 7 > fp3/status-18.1;
echo -e "Fastboot\nReported Working\n2.0" > fp3/bootloader_information;
echo "2019-09-03" > fp3/releasedate;

echo "Google Nexus Player" > fugu/friendlyName;
echo 7 > fugu/status-15.1;
echo -e "Fastboot\nYes, Untested\nNo" > fugu/bootloader_information;

echo "Moto Z" > griffin/friendlyName;
echo 8 > griffin/status-17.1;
echo -e "Fastboot (Motorola)\nNo*\nNo" > griffin/bootloader_information;
echo "2016-09-01" > griffin/releasedate; #?

echo "Google Nexus 7 [2012]" > grouper/friendlyName;
echo 0 > grouper/status-14.1;
echo -e "Fastboot\nWill Brick\nNo" > grouper/bootloader_information;
echo -e "Fastboot\nWill Brick\nNo" > tilapia/bootloader_information;

echo "OnePlus 7 Pro" > guacamole/friendlyName;
echo "OnePlus 7" > guacamoleb/friendlyName;
echo 7 > guacamole/status-18.1;
echo 7 > guacamole/status-19.1;
echo 8 > guacamoleb/status-17.1;
echo -e "Fastboot\nReported Working\n2.0" > guacamole/bootloader_information;
echo -e "Fastboot\nYes, Untested\n2.0" > guacamoleb/bootloader_information;
echo "2019-05-14" > guacamole/releasedate;
echo "2019-05-14" > guacamoleb/releasedate;

echo "LG G4 TMO" > h811/friendlyName;
echo "LG G4 INTL" > h815/friendlyName;
echo 2 > h811/status-14.1;
echo 2 > h815/status-14.1;
echo -e "Fastboot (LGE)\nNo*\nNo" > h811/bootloader_information;
echo -e "Fastboot (LGE)\nNo*\nNo" > h815/bootloader_information;
echo "2015-04-29" > h815/releasedate;

echo "LG G5 TMO" > h830/friendlyName;
echo "LG G5 INTL" > h850/friendlyName;
echo "LG G5 US" > rs988/friendlyName;
echo 2 > h830/status-18.1;
echo 5 > h850/status-18.1;
echo 2 > rs988/status-18.1;
echo -e "Fastboot (LGE)\nNo*\nNo" > h830/bootloader_information;
echo -e "Fastboot (LGE)\nNo*\nNo" > h850/bootloader_information;
echo -e "Fastboot (LGE)\nNo*\nNo" > rs988/bootloader_information;
echo "2016-04-23" > h850/releasedate;
echo "2016-04-23" > rs988/releasedate;

echo "LG G6 INTL" > h870/friendlyName;
echo "LG G6 US" > us997/friendlyName;
echo 1 > h870/status-15.1;
echo 1 > us997/status-15.1;
echo -e "Fastboot (LGE)\nNo*\nNo" > h870/bootloader_information;
echo -e "Fastboot (LGE)\nNo*\nNo" > us997/bootloader_information;
echo "2017-02-26" > h870/releasedate;
echo "2017-02-26" > us997/releasedate;

echo "LG V20 ATT" > h910/friendlyName;
echo "LG V20 TMO" > h918/friendlyName;
echo "LG V20 INTL" > h990/friendlyName;
echo "LG V20 SPR" > ls997/friendlyName;
echo "LG V20 US" > us996/friendlyName;
echo "LG V20 VZW" > vs995/friendlyName;
echo 8 > h910/status-18.1
echo 4 > h918/status-18.1
echo 8 > h990/status-18.1;
echo 4 > ls997/status-18.1
echo 8 > us996/status-18.1;
echo 4 > vs995/status-18.1
echo -e "Exploit\nNot Unlockable\nNo" > h910/bootloader_information;
echo -e "Exploit\nNot Unlockable\nNo" > h918/bootloader_information;
echo -e "Exploit\nNot Unlockable\nNo" > h990/bootloader_information;
echo -e "Exploit\nNot Unlockable\nNo" > ls997/bootloader_information;
echo -e "Exploit\nNot Unlockable\nNo" > us996/bootloader_information;
echo -e "Exploit\nNot Unlockable\nNo" > vs995/bootloader_information;
echo "2016-10-01" > h910/releasedate; #?
echo "2016-11-01" > h990/releasedate; #?
echo "2016-10-01" > us996/releasedate; #?

echo "Zuk Z1" > ham/friendlyName;
echo 4 > ham/status-16.0;
echo -e "Fastboot\nUnknown\nNo" > ham/bootloader_information;
echo "2015-08-11" > ham/releasedate;

echo "Google Nexus 5" > hammerhead/friendlyName;
echo 7 > hammerhead/status-15.1;
echo 5 > hammerhead/status-16.0;
echo -e "Fastboot\nYes, Untested\nNo" > hammerhead/bootloader_information;
echo "2013-10-31" > hammerhead/releasedate;

echo "Moto G4 Play" > harpia/friendlyName;
echo 7 > harpia/status-17.1;
echo -e "Fastboot (Motorola)\nNo*\nNo" > harpia/bootloader_information;
echo "2016-05-17" > harpia/releasedate;

echo "Samsung Galaxy S7" > herolte/friendlyName;
echo "Samsung Galaxy S7 Edge" > hero2lte/friendlyName;
echo 1 > herolte/status-14.1;
echo 1 > hero2lte/status-14.1;
echo -e "Heimdall\nNot Unlockable\nNo" > herolte/bootloader_information;
echo -e "Heimdall\nNot Unlockable\nNo" > hero2lte/bootloader_information;
echo "2016-03-11" > herolte/releasedate;

echo "HTC One M9 GSM" > himaul/friendlyName;
echo "HTC One M9 VZW" > himawl/friendlyName;
echo 2 > himaul/status-14.1;
echo 2 > himawl/status-14.1;
echo -e "Fastboot (HTC)\nNo*\nNo" > himaul/bootloader_information;
echo -e "Fastboot (HTC)\nNo*\nNo" > himawl/bootloader_information;
echo "2015-04-10" > himaul/releasedate;

echo "OnePlus 7T Pro" > hotdog/friendlyName;
echo "OnePlus 7T" > hotdogb/friendlyName;
echo 8 > hotdog/status-18.1;
echo 8 > hotdog/status-19.1;
echo 7 > hotdogb/status-18.1;
echo 7 > hotdogb/status-19.1;
echo -e "Fastboot\nYes, Untested\n2.0" > hotdog/bootloader_information;
echo -e "Fastboot\nReported Working\n2.0" > hotdogb/bootloader_information;
echo "2019-10-17" > hotdog/releasedate;
echo "2019-09-28" > hotdogb/releasedate;

echo "Samsung Galaxy S2" > i9100/friendlyName;
echo 7 > i9100/status-14.1;
echo -e "Heimdall\nNot Unlockable\nNo" > i9100/bootloader_information;
echo "2011-05-02" > i9100/releasedate;

echo "Samsung Galaxy S3 GSM" > i9300/friendlyName;
echo "Samsung Galaxy S3 LTE" > i9305/friendlyName;
echo 7 > i9300/status-14.1;
echo 7 > i9305/status-14.1;
echo -e "Heimdall\nNot Unlockable\nNo" > i9300/bootloader_information;
echo -e "Heimdall\nNot Unlockable\nNo" > i9305/bootloader_information;
echo "2012-05-29" > i9300/releasedate;
echo "2012-05-29" > i9305/releasedate;

echo "Samsung Galaxy S3 ATT" > d2att/friendlyName;
echo "Samsung Galaxy S3 SPR" > d2spr/friendlyName;
echo "Samsung Galaxy S3 TMO" > d2tmo/friendlyName;
echo "Samsung Galaxy S3 VZW" > d2vzw/friendlyName;
echo 2 > d2att/status-14.1;
echo 2 > d2spr/status-14.1;
echo 2 > d2tmo/status-14.1;
echo 2 > d2vzw/status-14.1;
echo -e "Heimdall\nNot Unlockable\nNo" > d2att/bootloader_information;
echo -e "Heimdall\nNot Unlockable\nNo" > d2spr/bootloader_information;
echo -e "Heimdall\nNot Unlockable\nNo" > d2tmo/bootloader_information;
echo -e "Heimdall\nNot Unlockable\nNo" > d2vzw/bootloader_information;

echo "Unihertz Jelly Pro" > jellypro/friendlyName;
echo -e "Unknown\nUnknown\nNo" > jellypro/bootloader_information;

echo "Samsung Galaxy S4" > jfltexx/friendlyName;
echo "Samsung Galaxy S4 ATT" > jflteatt/friendlyName;
echo "Samsung Galaxy S4 SPR" > jfltespr/friendlyName;
echo "Samsung Galaxy S4 VZW" > jfltevzw/friendlyName;
echo 7 > jfltexx/status-18.1;
echo 8 > jflteatt/status-18.1;
echo 4 > jfltespr/status-18.1;
echo 4 > jfltevzw/status-18.1;
echo -e "Heimdall\nNot Unlockable\nNo" > jfltexx/bootloader_information;
echo -e "Heimdall\nNot Unlockable\nNo" > jflteatt/bootloader_information;
echo -e "Heimdall\nNot Unlockable\nNo" > jfltespr/bootloader_information;
echo -e "Heimdall\nNot Unlockable\nNo" > jfltevzw/bootloader_information;
echo "2013-04-27" > jfltexx/releasedate;

echo "Samsung Galaxy S5 Plus" > kccat6/friendlyName;
echo 1 > kccat6/status-16.0;
echo -e "Heimdall\nNot Unlockable\nNo" > kccat6/bootloader_information;

echo "Wileyfox Storm" > kipper/friendlyName;
echo 2 > kipper/status-16.0;
echo -e "Fastboot\nUnknown\nNo" > kipper/bootloader_information;

echo "Samsung Galaxy S5" > klte/friendlyName;
echo 0 > klte/status-18.1;
echo -e "Heimdall\nNot Unlockable\nNo" > klte/bootloader_information;
echo "2014-04-11" > klte/releasedate;

echo "Xiaomi Redmi 3S/3X" > land/friendlyName;
echo 4 > land/status-16.0;
echo -e "Fastboot (Xiaomi)\nLikely not possible\nNo" > land/bootloader_information;

echo "Xiaomi Redmi Note 7" > lavender/friendlyName;
echo 7 > lavender/status-18.1;
echo -e "Fastboot (Xiaomi)\nWill Brick\n2.0" > lavender/bootloader_information;

echo "Samsung Galaxy S5 LTE-A" > lentislte/friendlyName;
echo 1 > lentislte/status-16.0;
echo -e "Heimdall\nNot Unlockable\nNo" > lentislte/bootloader_information;

echo "Xiaomi POCO F2 Pro / Redmi K30 Pro / Redmi K30 Pro Zoom Edition" > lmi/friendlyName;
echo 7 > lmi/status-18.1;
echo -e "Fastboot (Xiaomi)\nWill Brick\n2.0" > lmi/bootloader_information;

echo "HTC One" > m7/friendlyName;
echo 4 > m7/status-14.1;
echo -e "Fastboot (HTC)\nNo*\nNo" > m7/bootloader_information;

echo "HTC One M8" > m8/friendlyName;
echo "HTC One M8 DS" > m8d/friendlyName;
echo 7 > m8/status-18.1;
echo 4 > m8d/status-18.1;
echo -e "Fastboot (HTC)\nNo*\nNo" > m8/bootloader_information;
echo -e "Fastboot (HTC)\nNo*\nNo" > m8d/bootloader_information;

echo "Samsung Galaxy Nexus GSM" > maguro/friendlyName;
echo "Samsung Galaxy Nexus VZW" > toro/friendlyName;
echo "Samsung Galaxy Nexus SPR" > toroplus/friendlyName;
echo 7 > maguro/status-14.1;
echo 8 > toro/status-14.1;
echo 0 > toroplus/status-14.1;
echo -e "Fastboot\nReported Working\nNo" > maguro/bootloader_information;
echo -e "Fastboot\nYes, Untested\nNo" > toro/bootloader_information;
echo -e "Fastboot\nTested Working\nNo" > toroplus/bootloader_information;

echo "Google Nexus 4 (repartitioned)" > mako/friendlyName;
echo 0 > mako/status-18.1;
echo -e "Fastboot\nTested Working\nNo" > mako/bootloader_information;

echo "Google Nexus 10" > manta/friendlyName;
echo 7 > manta/status-14.1;
echo -e "Fastboot\nUnknown\nNo" > manta/bootloader_information;

echo "Google Pixel XL" > marlin/friendlyName;
echo "Google Pixel" > sailfish/friendlyName;
echo 7 > marlin/status-18.1;
echo 0 > sailfish/status-18.1;
echo -e "Fastboot\nReported Working\n1.0" > marlin/bootloader_information;
echo -e "Fastboot\nTested Working\n1.0" > sailfish/bootloader_information;

echo "Essential PH-1" > mata/friendlyName;
echo 0 > mata/status-18.1;
echo -e "Fastboot\nTested Working\n1.0" > mata/bootloader_information;

echo "Moto G3 Turbo" > merlin/friendlyName;
echo 4 > merlin/status-17.1;
echo -e "Fastboot (Motorola)\nNo*\nNo" > merlin/bootloader_information;

echo "Samsung Galaxy Note 8.0 GSM" > n5100/friendlyName;
echo "Samsung Galaxy Note 8.0 Wi-Fi" > n5110/friendlyName;
echo "Samsung Galaxy Note 8.0 LTE" > n5120/friendlyName;
echo 2 > n5100/status-14.1;
echo 2 > n5110/status-14.1;
echo 2 > n5120/status-14.1;
echo -e "Heimdall\nNot Unlockable\nNo" > n5100/bootloader_information;
echo -e "Heimdall\nNot Unlockable\nNo" > n5110/bootloader_information;
echo -e "Heimdall\nNot Unlockable\nNo" > n5120/bootloader_information;

echo "Samsung Galaxy Note 2" > n7100/friendlyName;
echo -e "Heimdall\nNot Unlockable\nNo" > n7100/bootloader_information;

echo "ZTE AWE SPR" > nex/friendlyName;
echo 5 > nex/status-11.0;
echo -e "Exploit\nNot Unlockable\nNo" > nex/bootloader_information;

echo "OnePlus 2" > oneplus2/friendlyName;
echo 7 > oneplus2/status-17.1;
echo -e "Fastboot\nYes, but irreversible\nNo" > oneplus2/bootloader_information;

echo "OnePlus 3/T" > oneplus3/friendlyName;
echo 7 > oneplus3/status-18.1;
echo -e "Fastboot\nYes, test-keys only?\n1.0" > oneplus3/bootloader_information;

echo "Moto G 2015" > osprey/friendlyName;
echo 7 > osprey/status-17.1;
echo -e "Fastboot (Motorola)\nNo*\nNo" > osprey/bootloader_information;

echo "Sony Xperia XA2" > pioneer/friendlyName;
echo "Sony Xperia XA2 Plus" > voyager/friendlyName;
echo "Sony Xperia XA2 Ultra" > discovery/friendlyName;
echo 7 > pioneer/status-18.1;
echo 2 > pioneer/status-19.1;
echo 8 > voyager/status-18.1;
echo 2 > voyager/status-19.1;
echo 8 > discovery/status-18.1;
echo 2 > discovery/status-19.1;
echo -e "Fastboot (Sony)\nUnknown\nNo" > pioneer/bootloader_information;
echo -e "Fastboot (Sony)\nUnknown\nNo" > voyager/bootloader_information;
echo -e "Fastboot (Sony)\nUnknown\nNo" > discovery/bootloader_information;

echo "F(x)tec Pro¹" > pro1/friendlyName;
echo 2 > pro1/status-19.1;
echo -e "Fastboot\nYes, Untested\n2.0" > pro1/bootloader_information;

echo "Google Pixel 5" > redfin/friendlyName;
echo 2 > redfin/status-19.1;
echo -e "Fastboot\nYes, Untested\n2.0" > redfin/bootloader_information;

echo "Xiaomi Redmi 4/4X" > santoni/friendlyName;
echo 8 > santoni/status-16.0;
echo -e "Fastboot (Xiaomi)\nLikely not possible\nNo" > santoni/bootloader_information;

echo "Galaxy S4 Mini INTL (3G)" > serrano3gxx/friendlyName;
echo 8 > serrano3gxx/status-18.1;
echo -e "Heimdall\nNot Unlockable\nNo" > serrano3gxx/bootloader_information;

echo "Galaxy S4 Mini INTL (LTE)" > serranoltexx/friendlyName;
echo 7 > serranoltexx/status-18.1;
echo -e "Heimdall\nNot Unlockable\nNo" > serranoltexx/bootloader_information;

echo "Google Nexus 6" > shamu/friendlyName;
echo 4 > shamu/status-15.1;
echo 7 > shamu/status-18.1;
echo -e "Fastboot\nReported Working\n1.0" > shamu/bootloader_information;

echo "Samsung Galaxy S9" > starlte/friendlyName;
echo "Samsung Galaxy S9+" > star2lte/friendlyName;
echo 1 > starlte/status-17.1;
echo 1 > star2lte/status-17.1;
echo -e "Heimdall\nNot Unlockable\nNo" > starlte/bootloader_information;
echo -e "Heimdall\nNot Unlockable\nNo" > star2lte/bootloader_information;

echo "Google Pixel 4a" > sunfish/friendlyName;
echo 2 > sunfish/status-19.1;
echo -e "Fastboot\nYes, Untested\n2.0" > sunfish/bootloader_information;

echo "Xiaomi Mi 9T Pro" > raphael/friendlyName;
echo -e "Fastboot (Xiaomi)\nWill Brick\n2.0" > raphael/bootloader_information;
echo "2019-05-01" > raphael/releasedate; #?

echo "Moto E 2015 LTE" > surnia/friendlyName;
echo 7 > surnia/status-17.1;
echo -e "Fastboot (Motorola)\nNo*\nNo" > surnia/bootloader_information;

echo "Google Pixel 2 XL" > taimen/friendlyName;
echo "Google Pixel 2" > walleye/friendlyName;
echo 0 > taimen/status-18.1;
echo 0 > taimen/status-19.1;
echo 7 > walleye/status-18.1;
echo 7 > walleye/status-19.1;
echo -e "Fastboot\nTested Working\n2.0" > taimen/bootloader_information;
echo -e "Fastboot\nReported Working\n2.0" > walleye/bootloader_information;

echo "Amazon Kindle Fire HDX 8.9" > apollo/friendlyName;
echo "Amazon Kindle Fire HDX 7" > thor/friendlyName;
echo 7 > apollo/status-14.1;
echo 0 > thor/status-14.1;
echo -e "Bulk Mode\nNot Unlockable\nNo" > apollo/bootloader_information;
echo -e "Bulk Mode\nNot Unlockable\nNo" > thor/bootloader_information;

echo "Samsung Galaxy Note Pro 12.2" > v1awifi/friendlyName;
echo 2 > v1awifi/status-14.1;
echo -e "Heimdall\nNot Unlockable\nNo" > v1awifi/bootloader_information;

echo "Xiaomi POCO X3 Pro" > vayu/friendlyName;
echo 7 > vayu/status-18.1;
echo -e "Fastboot (Xiaomi)\nWill Brick\n2.0" > vayu/bootloader_information;

echo "Moto X 2014" > victara/friendlyName;
echo 4 > victara/status-18.1;
echo -e "Fastboot (Motorola)\nNo*\nNo" > victara/bootloader_information;

echo "Google Project Tango Tablet" > yellowstone/friendlyName;
echo 2 > yellowstone/status-16.0;
echo -e "Fastboot\nYes, Untested\nNo" > yellowstone/bootloader_information;

echo "ASUS Zenfone 2 Laser" > z00t/friendlyName;
echo 2 > z00t/status-15.1;
echo -e "Fastboot (ASUS)\nNo\nNo" > z00t/bootloader_information;

echo "ZUK Z2 Plus" > z2_plus/friendlyName;
echo 4 > z2_plus/status-18.1;
echo -e "Fastboot (ZUK)\nUnknown\n1.0" > z2_plus/bootloader_information;

echo "ASUS Zenfone 3" > zenfone3/friendlyName;
echo 2 > zenfone3/status-16.0;
echo -e "Fastboot (ASUS)\nNo\nNo" > zenfone3/bootloader_information;

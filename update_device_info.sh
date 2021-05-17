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

mkdir -p amber angler apollo avicii axon7 bacon beryllium blueline bonito bullhead cheeseburger cheryl clark coral crackling crosshatch d802 d852 d855 deb dragon dumpling enchilada ether fajita flame flo flounder flox fp2 fp3 fugu griffin grouper guacamoleb guacamole h815 h850 h870 h990 ham hammerhead herolte himaul i9100 i9300 i9305 jfltexx kipper klte m7 m8 maguro mako manta marlin mata n5110 n7100 nex oneplus2 oneplus3 osprey pro1 rs988 sailfish sargo shamu star2lte starlte taimen tilapia thor toro toroplus us996 us997 v1awifi victara walleye yellowstone z00t z2_plus zenfone3;

echo "Yandex Phone" > amber/friendlyName;
echo 2 > amber/status-17.1;
echo -e "Fastboot (Yandex)\nUnknown\nYes" > amber/bootloader_information;

echo "Google Nexus 6P" > angler/friendlyName;
echo 0 > angler/status-15.1;
echo -e "Fastboot\nTested Working\nYes" > angler/bootloader_information;

echo "OnePlus Nord" > avicii/friendlyName;
echo 2 > avicii/status-17.1;
echo -e "Fastboot\nUnknown\nYes" > avicii/bootloader_information;

echo "ZTE Axon 7" > axon7/friendlyName;
echo 2 > axon7/status-15.1;
echo -e "Custom\nNot Unlockable\nNo" > axon7/bootloader_information;

echo "OnePlus One" > bacon/friendlyName;
echo 0 > bacon/status-18.1;
echo -e "Fastboot\nYes, but irreversible\nNo" > bacon/bootloader_information;

echo "Xiaomi Poco F1" > beryllium/friendlyName;
echo -e "Fastboot (Xiaomi)\nNo\nNo" > beryllium/bootloader_information;

echo "Google Pixel 3" > blueline/friendlyName;
echo "Google Pixel 3 XL" > crosshatch/friendlyName;
echo 4 > blueline/status-17.1;
echo 4 > blueline/status-18.1;
echo 0 > crosshatch/status-17.1;
echo 4 > crosshatch/status-18.1;
echo -e "Fastboot\nYes, Untested\nYes" > blueline/bootloader_information;
echo -e "Fastboot\nYes, Untested\nYes" > crosshatch/bootloader_information;

echo "Google Pixel 3a XL" > bonito/friendlyName;
echo "Google Pixel 3a" > sargo/friendlyName;
echo 2 > bonito/status-17.1;
echo 2 > sargo/status-17.1;
echo -e "Fastboot\nYes, Untested\nYes" > bonito/bootloader_information;
echo -e "Fastboot\nYes, Untested\nYes" > sargo/bootloader_information;

echo "Google Nexus 5X" > bullhead/friendlyName;
echo 0 > bullhead/status-15.1;
echo -e "Fastboot\nYes, Untested\nYes" > bullhead/bootloader_information;

echo "OnePlus 5" > cheeseburger/friendlyName;
echo "OnePlus 5T" > dumpling/friendlyName;
echo 0 > cheeseburger/status-16.0;
echo 0 > cheeseburger/status-18.1;
echo 0 > dumpling/status-16.0;
echo 0 > dumpling/status-18.1;
echo -e "Fastboot\nTested Working\nYes" > cheeseburger/bootloader_information;
echo -e "Fastboot\nTested Working\nYes" > dumpling/bootloader_information;

echo "Razer Phone" > cheryl/friendlyName;
echo 2 > cheryl/status-18.1;
echo -e "Fastboot\nUnknown\nYes" > cheryl/bootloader_information;

echo "Moto X Pure 2015" > clark/friendlyName;
echo 0 > clark/status-14.1;
echo 0 > clark/status-17.1;
echo -e "Fastboot (Motorola)\nNo*\nNo" > clark/bootloader_information;

echo "Pixel 4 XL" > coral/friendlyName;
echo "Pixel 4" > flame/friendlyName;
echo 2 > coral/status-18.1;
echo 2 > flame/status-18.1;
echo -e "Fastboot\nYes, Untested\nYes" > coral/bootloader_information;
echo -e "Fastboot\nYes, Untested\nYes" > flame/bootloader_information;

echo "Wileyfox Swift" > crackling/friendlyName;
echo 2 > crackling/status-17.1;
echo -e "Fastboot\nUnknown\nNo" > crackling/bootloader_information;

echo "LG G2 INTL" > d802/friendlyName;
echo 2 > d802/status-18.1;
echo -e "LG UP\nNot Unlockable\nNo" > d802/bootloader_information;

echo "LG G3 CAN" > d852/friendlyName;
echo "LG G3 INTL" > d855/friendlyName;
echo 0 > d852/status-18.1;
echo 0 > d855/status-18.1;
echo -e "LG UP/LG LAF\nNot Unlockable\nNo" > d852/bootloader_information;
echo -e "LG UP/LG LAF\nNot Unlockable\nNo" > d855/bootloader_information;

echo "Google Pixel C" > dragon/friendlyName;
echo 0 > dragon/status-15.1;
echo -e "Fastboot\nYes, but will error\nYes" > dragon/bootloader_information;

echo "OnePlus 6" > enchilada/friendlyName;
echo "OnePlus 6T" > fajita/friendlyName;
echo 2 > enchilada/status-17.1;
echo 2 > enchilada/status-18.1;
echo 2 > fajita/status-17.1;
echo 2 > fajita/status-18.1;
echo -e "Fastboot\nUnknown\nYes" > enchilada/bootloader_information;
echo -e "Fastboot\nUnknown\nYes" > fajita/bootloader_information;

echo "Nextbit Robin" > ether/friendlyName;
echo 2 > ether/status-15.1;
echo 2 > ether/status-18.1;
echo -e "Fastboot\nUnknown\nNo" > ether/bootloader_information;

echo "Google Nexus 7 [2013]" > flo/friendlyName;
echo "Google Nexus 7 [2013] REPART" > flox/friendlyName;
echo 0 > flo/status-15.1;
echo 0 > flox/status-18.1;
echo -e "Fastboot\nYes, Untested\nNo" > deb/bootloader_information;
echo -e "Fastboot\nTested Working\nNo" > flo/bootloader_information;
echo -e "Fastboot\nTested Working\nNo" > flox/bootloader_information;

echo "Google Nexus 9" > flounder/friendlyName;
echo 0 > flounder/status-15.1;
echo -e "Fastboot\nYes, Untested\nNo" > flounder/bootloader_information;

echo "Fairphone 2" > fp2/friendlyName;
echo 0 > fp2/status-17.1;
echo -e "Pre-Unlocked\nUnknown\nNo" > fp2/bootloader_information;

echo "Fairphone 3" > fp3/friendlyName;
echo 0 > fp3/status-17.1;
echo -e "Fastboot\nYes, Untested\nYes" > fp3/bootloader_information;

echo "Google Nexus Player" > fugu/friendlyName;
echo 2 > fugu/status-15.1;
echo -e "Fastboot\nYes, Untested\nNo" > fugu/bootloader_information;

echo "Moto Z" > griffin/friendlyName;
echo 2 > griffin/status-17.1;
echo -e "Fastboot (Motorola)\nNo*\nNo" > griffin/bootloader_information;

echo "Google Nexus 7 [2012]" > grouper/friendlyName;
echo 0 > grouper/status-14.1;
echo -e "Fastboot\nWill Brick\nNo" > grouper/bootloader_information;
echo -e "Fastboot\nWill Brick\nNo" > tilapia/bootloader_information;

echo "OnePlus 7 Pro" > guacamole/friendlyName;
echo "OnePlus 7" > guacamoleb/friendlyName;
echo 2 > guacamole/status-17.1;
echo 2 > guacamole/status-18.1;
echo 2 > guacamoleb/status-17.1;
echo -e "Fastboot\nUnknown\nYes" > guacamole/bootloader_information;
echo -e "Fastboot\nUnknown\nYes" > guacamoleb/bootloader_information;

echo "LG G4 INTL" > h815/friendlyName;
echo 2 > h815/status-14.1;
echo -e "Fastboot (LGE)\nNo*\nNo" > h815/bootloader_information;

echo "LG G5 INTL" > h850/friendlyName;
echo "LG G5 US" > rs988/friendlyName;
echo 0 > h850/status-18.1;
echo 4 > rs988/status-18.1;
echo -e "Fastboot (LGE)\nNo*\nNo" > h850/bootloader_information;
echo -e "Fastboot (LGE)\nNo*\nNo" > rs988/bootloader_information;

echo "LG G6 INTL" > h870/friendlyName;
echo "LG G6 US" > us997/friendlyName;
echo 2 > h870/status-15.1;
echo 2 > us997/status-15.1;
echo -e "Fastboot (LGE)\nNo*\nNo" > h870/bootloader_information;
echo -e "Fastboot (LGE)\nNo*\nNo" > us997/bootloader_information;

echo "LG V20 INTL" > h990/friendlyName;
echo "LG V20 US" > us996/friendlyName;
echo 2 > h990/status-18.1;
echo 2 > us996/status-18.1;
echo -e "Exploit\nNot Unlockable\nNo" > h990/bootloader_information;
echo -e "Fastboot (LGE)\nNo*\nNo" > us996/bootloader_information;

echo "Zuk Z1" > ham/friendlyName;
echo 2 > ham/status-16.0;
echo -e "Fastboot\nUnknown\nNo" > ham/bootloader_information;

echo "Google Nexus 5" > hammerhead/friendlyName;
echo 0 > hammerhead/status-15.1;
echo 0 > hammerhead/status-16.0;
echo -e "Fastboot\nYes, Untested\nNo" > hammerhead/bootloader_information;

echo "Samsung Galaxy S7" > herolte/friendlyName;
echo 1 > herolte/status-14.1;
echo -e "Heimdall\nNot Unlockable\nNo" > herolte/bootloader_information;

echo "HTC One M9" > himaul/friendlyName;
echo 2 > himaul/status-14.1;
echo -e "Fastboot (HTC)\nNo*\nNo" > himaul/bootloader_information;

echo "Samsung Galaxy S2" > i9100/friendlyName;
echo 1 > i9100/status-14.1;
echo -e "Heimdall\nNot Unlockable\nNo" > i9100/bootloader_information;

echo "Samsung Galaxy S3 GSM" > i9300/friendlyName;
echo "Samsung Galaxy S3 LTE" > i9305/friendlyName;
echo 0 > i9300/status-14.1;
echo 0 > i9305/status-14.1;
echo -e "Heimdall\nNot Unlockable\nNo" > i9300/bootloader_information;
echo -e "Heimdall\nNot Unlockable\nNo" > i9305/bootloader_information;

echo "Samsung Galaxy S4" > jfltexx/friendlyName;
echo 0 > jfltexx/status-18.1;
echo -e "Heimdall\nNot Unlockable\nNo" > jfltexx/bootloader_information;

echo "Wileyfox Storm" > kipper/friendlyName;
echo 2 > kipper/status-16.0;
echo -e "Fastboot\nUnknown\nNo" > kipper/bootloader_information;

echo "Samsung Galaxy S5" > klte/friendlyName;
echo 0 > klte/status-18.1;
echo -e "Heimdall\nNot Unlockable\nNo" > klte/bootloader_information;

echo "HTC One" > m7/friendlyName;
echo 2 > m7/status-14.1;
echo -e "Fastboot (HTC)\nNo*\nNo" > m7/bootloader_information;

echo "HTC One M8" > m8/friendlyName;
echo 0 > m8/status-17.1;
echo 4 > m8/status-18.1;
echo -e "Fastboot (HTC)\nNo*\nNo" > m8/bootloader_information;

echo "Samsung Galaxy Nexus GSM" > maguro/friendlyName;
echo "Samsung Galaxy Nexus VZW" > toro/friendlyName;
echo "Samsung Galaxy Nexus SPR" > toroplus/friendlyName;
echo 0 > maguro/status-14.1;
echo 4 > toro/status-14.1;
echo 0 > toroplus/status-14.1;
echo -e "Fastboot\nTested Working\nNo" > maguro/bootloader_information;
echo -e "Fastboot\nYes, Untested\nNo" > toro/bootloader_information;
echo -e "Fastboot\nTested Working\nNo" > toroplus/bootloader_information;

echo "Google Nexus 4" > mako/friendlyName;
echo 0 > mako/status-17.1;
echo 5 > mako/status-18.1;
echo -e "Fastboot\nTested Working\nNo" > mako/bootloader_information;

echo "Google Nexus 10" > manta/friendlyName;
echo 5 > manta/status-14.1;
echo -e "Fastboot\nUnknown\nNo" > manta/bootloader_information;

echo "Google Pixel XL" > marlin/friendlyName;
echo "Google Pixel" > sailfish/friendlyName;
echo 0 > marlin/status-17.1;
echo 0 > sailfish/status-17.1;
echo -e "Fastboot\nYes, Untested\nYes" > marlin/bootloader_information;
echo -e "Fastboot\nTested Working\nYes" > sailfish/bootloader_information;

echo "Essential PH-1" > mata/friendlyName;
echo 0 > mata/status-18.1;
echo -e "Fastboot\nTested Working\nYes" > mata/bootloader_information;

echo "Samsung Galaxy Note 8.0" > n5110/friendlyName;
echo 2 > n5110/status-14.1;
echo -e "Heimdall\nNot Unlockable\nNo" > n5110/bootloader_information;

echo "Samsung Galaxy Note 2" > n7100/friendlyName;
echo -e "Heimdall\nNot Unlockable\nNo" > n7100/bootloader_information;

echo "ZTE AWE SPR" > nex/friendlyName;
echo 5 > nex/status-11.0;
echo -e "Exploit\nNot Unlockable\nNo" > nex/bootloader_information;

echo "OnePlus 2" > oneplus2/friendlyName;
echo 2 > oneplus2/status-17.1;
echo -e "Fastboot\nYes, Untested\nNo" > oneplus2/bootloader_information;

echo "OnePlus 3/T" > oneplus3/friendlyName;
echo 0 > oneplus3/status-18.1;
echo -e "Fastboot\nYes, test-keys only?\nYes" > oneplus3/bootloader_information;

echo "Moto G 2015" > osprey/friendlyName;
echo 0 > osprey/status-14.1;
echo -e "Fastboot (Motorola)\nNo*\nNo" > osprey/bootloader_information;

echo "F(x)tec Pro¹" > pro1/friendlyName;
echo 2 > pro1/status-18.1;
echo -e "Fastboot\nUnknown\nYes" > pro1/bootloader_information;

echo "Google Nexus 6" > shamu/friendlyName;
echo 4 > shamu/status-15.1;
echo 0 > shamu/status-18.1;
echo -e "Fastboot\nTested Working\nYes" > shamu/bootloader_information;

echo "Samsung Galaxy S9" > starlte/friendlyName;
echo "Samsung Galaxy S9+" > star2lte/friendlyName;
echo 1 > starlte/status-17.1;
echo 1 > star2lte/status-17.1;
echo -e "Heimdall\nNot Unlockable\nNo" > starlte/bootloader_information;
echo -e "Heimdall\nNot Unlockable\nNo" > star2lte/bootloader_information;

echo "Google Pixel 2 XL" > taimen/friendlyName;
echo "Google Pixel 2" > walleye/friendlyName;
echo 0 > taimen/status-18.1;
echo 4 > walleye/status-18.1;
echo -e "Fastboot\nTested Working\nYes" > taimen/bootloader_information;
echo -e "Fastboot\nYes, Untested\nYes" > walleye/bootloader_information;

echo "Amazon Kindle Fire HDX 7" > thor/friendlyName;
echo 0 > thor/status-14.1;
echo -e "Bulk Mode\nNot Unlockable\nNo" > apollo/bootloader_information;
echo -e "Bulk Mode\nNot Unlockable\nNo" > thor/bootloader_information;

echo "Samsung Galaxy Note Pro 12.2" > v1awifi/friendlyName;
echo 2 > v1awifi/status-14.1;
echo -e "Heimdall\nNot Unlockable\nNo" > v1awifi/bootloader_information;

echo "Moto X 2014" > victara/friendlyName;
echo 2 > victara/status-18.1;
echo -e "Fastboot (Motorola)\nNo*\nNo" > victara/bootloader_information;

echo "Google Project Tango Tablet" > yellowstone/friendlyName;
echo 2 > yellowstone/status-16.0;
echo -e "Fastboot\nYes, Untested\nNo" > yellowstone/bootloader_information;

echo "ASUS Zenfone 2 Laser" > z00t/friendlyName;
echo 2 > z00t/status-14.1;
echo -e "Fastboot (ASUS)\nNo\nNo" > z00t/bootloader_information;

echo "ZUK Z2 Plus" > z2_plus/friendlyName;
echo 2 > z2_plus/status-17.1;
echo -e "Fastboot (ZUK)\nUnknown\nYes" > z2_plus/bootloader_information;

echo "ASUS Zenfone 3" > zenfone3/friendlyName;
echo 2 > zenfone3/status-16.0;
echo -e "Fastboot (ASUS)\nNo\nNo" > zenfone3/bootloader_information;

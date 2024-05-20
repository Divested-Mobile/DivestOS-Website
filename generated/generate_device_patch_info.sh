#!/bin/bash
#Copyright (c) 2021-2023 Divested Computing Group
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

getVendorPatchLevel() {
	devicePath="Build/$1/device/$2";
	if [ -d "$devicePath" ]; then
		level=$(sed -n '/VENDOR_SECURITY_PATCH/s/.*= //p' $devicePath/*.mk);
	fi;
	if [ -z "$level" ]; then
		level=$(sed -n '/vendor_security_patch/s/.*=//p' $devicePath/*.mk);
	fi;
	if [ -z "$level" ] && [ -f "$devicePath/system.prop" ]; then
		level=$(sed -n '/vendor_security_patch/s/.*=//p' $devicePath/system.prop);
	fi;
	if [ "$level" = '$(BOOT_SECURITY_PATCH)' ]; then
		level=$(sed -n '/BOOT_SECURITY_PATCH :=/s/.*= //p' $devicePath/*.mk);
	fi;
	if [ -z "$level" ]; then
		level="Unknown";
	fi;
	if [ "$level" = '$(PLATFORM_SECURITY_PATCH)' ]; then
		if [ $1 == "LineageOS-15.1" ]; then
			level="2018-12";
		elif [ $1 == "LineageOS-16.0" ]; then
			level="2019-08";
		elif [ $1 == "LineageOS-17.1" ]; then
			level="2020-08";
		elif [ $1 == "LineageOS-18.1" ]; then
			level="2021-10";
		elif [ $1 == "LineageOS-19.1" ]; then
			level="2022-07";
		elif [ $1 == "LineageOS-20.0" ]; then
			level="2023-09";
		elif [ $1 == "LineageOS-21.0" ]; then
			level="2024-04";
		else
			level="Unknown";
		fi;
	fi;
	echo -n $(sed -e 's/^"//' -e 's/"$//' <<< "$level");
}

getKernelVersion() {
	#Credit (CC BY-SA 3.0): https://stackoverflow.com/a/6677413
	kernelPath="Build/$1/kernel/$2";
	if [ -f "$kernelPath/Makefile" ]; then
		version=$(head -n5 "$kernelPath/Makefile" | sed '/# SPDX-License-Identifier: GPL-2.0/d;/EXTRAVERSION/d;/NAME/d' | sed 's/.*= //;s/\n//' | sed -e :a -e N -e '$!ba' -e 's/\n/ /g' | sed 's/\ /./g');
	fi;
	patcherPath="Scripts/$1/CVE_Patchers/android_kernel_$(echo $2 | sed 's/\//_/').sh";
	if [ -f "$patcherPath" ]; then
		patchCount=$(cat "$patcherPath" | wc -l);
		patchCount=$(($patchCount-6))
		patchCount=" + $patchCount patches";
	fi;
	echo -n "$version$patchCount";
}

createTable() {
	name=$1;
	version=$2;
	versionStripped=$(echo "$version" | sed 's/.*-//')
	#green: latest branch
	#yellow: non-eol branches
	if [[ $versionStripped == "21.0" ]]; then
		versionStyle="style=\"color:#4CAF50;\"";
	elif [[ $versionStripped == "19.1" ]] || [[ $versionStripped == "20.0" ]]; then
		versionStyle="style=\"color:#FFC107;\"";
	else
		versionStyle="style=\"color:#F44336;\"";
	fi;

	devicePath=$3;
	kernelPath=$4;
	kernelName=$(echo "$kernelPath" | sed 's|/|_|');
	vASB=$(getVendorPatchLevel $version $devicePath)
	#green: keep 4 months + 1 future
	#yellow: previous year
	if [[ $vASB == "2024-06"* ]] || [[ $vASB == "2024-05"* ]] || [[ $vASB == "2024-04"* ]] || [[ $vASB == "2024-03"* ]] || [[ $vASB == "2024-02"* ]]; then
		vASBStyle="style=\"color:#4CAF50;\"";
	elif [[ $vASB == "2024-"* ]] || [[ $vASB == "2023-"* ]]; then
		vASBStyle="style=\"color:#FFC107;\"";
	else
		vASBStyle="style=\"color:#F44336;\"";
	fi;

	kernelVersion=$(getKernelVersion $version $kernelPath);
	#green: non-eol branches
	#yellow: most recent and externally supported branches
	if [[ $kernelVersion == "4.19."* ]] || [[ $kernelVersion == "5."* ]] || [[ $kernelVersion == "6."* ]]; then
		kernelStyle="style=\"color:#4CAF50;\"";
	elif [[ $kernelVersion == "4.4."* ]] || [[ $kernelVersion == "4.9."* ]] || [[ $kernelVersion == "4.14."* ]]; then
		kernelStyle="style=\"color:#FFC107;\"";
	else
		kernelStyle="style=\"color:#F44336;\"";
	fi;

	if [[ $versionStyle =~ "4CAF50" ]] && [[ $vASBStyle =~ "4CAF50" ]] && [[ $kernelStyle =~ "4CAF50" ]]; then
		allGreen=" ★";
	#elif [[ $versionStyle =~ "FFC107" ]] && [[ $vASBStyle =~ "FFC107" ]] && [[ $kernelStyle =~ "FFC107" ]]; then
	#	allGreen=" ☆";
	#elif [[ $versionStyle =~ "F44336" ]] || [[ $vASBStyle =~ "F44336" ]] || [[ $kernelStyle =~ "F44336" ]]; then
	#	allGreen=" ✘";
	else
		allGreen="";
	fi;

	nameStripped=$(echo -n $name | sed 's|/||g');

	echo -e '<tr>\n\t<td data-label="Device">'$name$allGreen'</td>\n\t<td data-label="Version" '$versionStyle'>'$versionStripped'</td>\n\t<td data-label="V-ASB" '$vASBStyle'>'$vASB'</td>\n\t<td data-label="Kernel" '$kernelStyle'><a href="https://codeberg.org/divested-mobile/divestos-build/src/branch/master/Scripts/'$version'/CVE_Patchers/android_kernel_'$kernelName'.sh" target="_blank" rel="nofollow noopener noreferrer" style="color: inherit; text-decoration: none;">'$kernelVersion'</td>\n</tr>';
}

createTable akari LineageOS-20.0 sony/tama-common sony/sdm845 sony/akari;
createTable akatsuki LineageOS-20.0 sony/tama-common sony/sdm845 sony/akatsuki;
createTable alioth LineageOS-20.0 xiaomi/sm8250-common xiaomi/sm8250 xiaomi/alioth;
createTable apollon LineageOS-20.0 xiaomi/sm8250-common xiaomi/sm8250 xiaomi/apollon;
createTable Amber LineageOS-17.1 yandex/Amber yandex/sdm660;
createTable angler LineageOS-15.1 huawei/angler huawei/angler;
createTable apollo LineageOS-14.1 amazon/apollo amazon/hdx-common amazon/hdx-common;
createTable athene LineageOS-14.1 motorola/athene motorola/msm8952;
createTable aura LineageOS-20.0 razer/aura razer/sdm845;
createTable aurora LineageOS-20.0 sony/tama-common sony/sdm845 sony/aurora;
createTable avicii LineageOS-20.0 oneplus/avicii oneplus/sm7250;
createTable axon7 LineageOS-15.1 zte/axon7 zte/msm8996;
createTable bacon LineageOS-18.1 oneplus/bacon oppo/msm8974 oppo/common oppo/msm8974-common;
createTable barbet LineageOS-20.0 google/redbull google/redbull google/barbet;
createTable beryllium LineageOS-20.0 xiaomi/sdm845-common xiaomi/sdm845;
createTable dipper LineageOS-20.0 xiaomi/sdm845-common xiaomi/sdm845;
createTable equuleus LineageOS-20.0 xiaomi/sdm845-common xiaomi/sdm845;
createTable polaris LineageOS-20.0 xiaomi/sdm845-common xiaomi/sdm845;
createTable ursa LineageOS-20.0 xiaomi/sdm845-common xiaomi/sdm845;
createTable bluejay LineageOS-20.0 google/gs101 google/gs201/private/gs-google google/bluejay;
createTable blueline LineageOS-20.0 google/crosshatch google/msm-4.9 google/crosshatch/blueline;
createTable bonito LineageOS-20.0 google/bonito google/msm-4.9 google/bonito/bonito;
createTable bramble LineageOS-20.0 google/redbull google/redbull google/bramble;
createTable bullhead LineageOS-15.1 lge/bullhead lge/bullhead;
createTable cheeseburger LineageOS-20.0 oneplus/msm8998-common oneplus/msm8998 oneplus/cheeseburger;
createTable cheetah LineageOS-20.0 google/gs201 google/gs201/private/gs-google google/pantah;
createTable cheryl LineageOS-20.0 razer/cheryl razer/msm8998;
createTable clark LineageOS-17.1 motorola/clark motorola/msm8992;
createTable coral LineageOS-20.0 google/coral google/msm-4.14 google/coral/coral;
createTable crackling LineageOS-17.1 wileyfox/crackling cyanogen/msm8916 cyanogen/msm8916-common;
createTable crosshatch LineageOS-20.0 google/crosshatch google/msm-4.9 google/crosshatch/crosshatch;
createTable crownlte LineageOS-20.0 samsung/exynos9810-common samsung/exynos9810 samsung/crownlte;
createTable d2att LineageOS-14.1 samsung/d2att samsung/d2 samsung/msm8960-common samsung/d2-common;
createTable d2spr LineageOS-14.1 samsung/d2spr samsung/d2 samsung/msm8960-common samsung/d2-common;
createTable d2tmo LineageOS-14.1 samsung/d2tmo samsung/d2 samsung/msm8960-common samsung/d2-common;
createTable d2vzw LineageOS-14.1 samsung/d2vzw samsung/d2 samsung/msm8960-common samsung/d2-common;
createTable d800 LineageOS-18.1 lge/g2-common lge/msm8974 lge/d800;
createTable d801 LineageOS-18.1 lge/g2-common lge/msm8974 lge/d801;
createTable d802 LineageOS-18.1 lge/g2-common lge/msm8974 lge/d802;
createTable d803 LineageOS-18.1 lge/g2-common lge/msm8974 lge/d803;
createTable d850 LineageOS-18.1 lge/g3-common lge/g3 lge/d850;
createTable d851 LineageOS-18.1 lge/g3-common lge/g3 lge/d851;
createTable d852 LineageOS-18.1 lge/g3-common lge/g3 lge/d852;
createTable d855 LineageOS-18.1 lge/g3-common lge/g3 lge/d855;
createTable davinci LineageOS-20.0 xiaomi/sm6150-common xiaomi/sm6150 xiaomi/davinci;
createTable debx LineageOS-18.1 asus/debx google/msm asus/flox;
createTable discovery LineageOS-20.0 sony/nile-common sony/sdm660 sony/discovery;
createTable dragon LineageOS-15.1 google/dragon google/dragon;
createTable dumpling LineageOS-20.0 oneplus/msm8998-common oneplus/msm8998 oneplus/dumpling;
createTable enchilada LineageOS-20.0 oneplus/sdm845-common oneplus/sdm845 oneplus/enchilada;
createTable ether LineageOS-18.1 nextbit/ether nextbit/msm8992;
createTable f400 LineageOS-18.1 lge/g3-common lge/g3 lge/f400;
createTable fajita LineageOS-20.0 oneplus/sdm845-common oneplus/sdm845 oneplus/fajita;
createTable felix LineageOS-20.0 google/gs201 google/gs201/private/gs-google google/felix;
createTable flame LineageOS-20.0 google/coral google/msm-4.14 google/coral/flame;
createTable flounder LineageOS-15.1 htc/flounder htc/flounder;
createTable flounder_lte LineageOS-15.1 htc/flounder_lte htc/flounder htc/flounder;
createTable flox LineageOS-18.1 asus/flox google/msm;
createTable FP2 LineageOS-18.1 fairphone/FP2 fairphone/msm8974;
createTable FP3 LineageOS-20.0 fairphone/FP3 fairphone/sdm632;
createTable FP4 LineageOS-20.0 fairphone/FP4 fairphone/sm7225;
createTable fugu LineageOS-15.1 asus/fugu asus/fugu;
createTable griffin LineageOS-18.1 motorola/griffin motorola/msm8996;
createTable grouper LineageOS-14.1 asus/grouper asus/grouper;
createTable guacamoleb LineageOS-20.0 oneplus/sm8150-common oneplus/sm8150 oneplus/guacamoleb oneplus/common;
createTable guacamole LineageOS-20.0 oneplus/sm8150-common oneplus/sm8150 oneplus/guacamole oneplus/common;
createTable h811 LineageOS-14.1 lge/h811 lge/msm8992 lge/g4-common;
createTable h815 LineageOS-14.1 lge/h815 lge/msm8992 lge/g4-common;
createTable h830 LineageOS-20.0 lge/g5-common lge/msm8996 lge/msm8996-common lge/h830;
createTable h850 LineageOS-20.0 lge/g5-common lge/msm8996 lge/msm8996-common lge/h850;
createTable h870 LineageOS-20.0 lge/g6-common lge/msm8996 lge/msm8996-common lge/h870;
createTable h910 LineageOS-20.0 lge/v20-common lge/msm8996 lge/msm8996-common lge/h910;
createTable h918 LineageOS-20.0 lge/v20-common lge/msm8996 lge/msm8996-common lge/h918;
createTable h990 LineageOS-20.0 lge/v20-common lge/msm8996 lge/msm8996-common lge/h990;
createTable ham LineageOS-16.0 zuk/ham cyanogen/msm8974;
createTable hammerhead LineageOS-18.1 lge/hammerhead lge/hammerhead;
createTable harpia LineageOS-17.1 motorola/msm8916-common motorola/msm8916 motorola/harpia;
createTable hero2lte LineageOS-14.1 samsung/hero2lte samsung/universal8890 samsung/hero-common;
createTable herolte LineageOS-14.1 samsung/herolte samsung/universal8890 samsung/hero-common;
createTable himaul LineageOS-14.1 htc/himaul htc/msm8994 htc/hima-common;
createTable himawl LineageOS-14.1 htc/himawl htc/msm8994 htc/hima-common;
createTable hotdogb LineageOS-20.0 oneplus/sm8150-common oneplus/sm8150 oneplus/hotdogb oneplus/common;
createTable hotdog LineageOS-20.0 oneplus/sm8150-common oneplus/sm8150 oneplus/hotdog oneplus/common;
createTable i9100 LineageOS-14.1 samsung/i9100 samsung/smdk4412 samsung/smdk4412-common samsung/galaxys2-common;
createTable i9300 LineageOS-14.1 samsung/i9300 samsung/smdk4412 samsung/smdk4412-common;
createTable i9305 LineageOS-14.1 samsung/i9305 samsung/smdk4412 samsung/smdk4412-common;
createTable instantnoodle LineageOS-20.0 oneplus/sm8250-common oneplus/sm8250 oneplus/instantnoodle oneplus/common;
createTable instantnoodlep LineageOS-20.0 oneplus/sm8250-common oneplus/sm8250 oneplus/instantnoodlep oneplus/common;
createTable jactivelte LineageOS-18.1 samsung/jactivelte samsung/jf samsung/jf-common;
createTable jflteatt LineageOS-18.1 samsung/jflteatt samsung/jf samsung/jf-common;
createTable jfltespr LineageOS-18.1 samsung/jfltespr samsung/jf samsung/jf-common;
createTable jfltevzw LineageOS-18.1 samsung/jfltevzw samsung/jf samsung/jf-common;
createTable jfltexx LineageOS-18.1 samsung/jfltexx samsung/jf samsung/jf-common;
createTable jfvelte LineageOS-18.1 samsung/jfvelte samsung/jf samsung/jf-common;
createTable kccat6 LineageOS-16.0 samsung/kccat6 samsung/apq8084 samsung/apq8084-common;
createTable kebab LineageOS-20.0 oneplus/sm8250-common oneplus/sm8250 oneplus/kebab oneplus/common;
createTable lemonades LineageOS-20.0 oneplus/sm8250-common oneplus/sm8250 oneplus/lemonades oneplus/common;
createTable kipper LineageOS-16.0 wileyfox/kipper cyanogen/msm8916 cyanogen/msm8916-common;
createTable klte LineageOS-18.1 samsung/klte-common samsung/msm8974 samsung/klte samsung/msm8974-common;
createTable hlte LineageOS-18.1 samsung/hlte-common samsung/msm8974 samsung/hlte samsung/msm8974-common;
createTable lavender LineageOS-18.1 xiaomi/lavender xiaomi/sdm660 xiaomi/sdm660-common;
createTable jasmine_sprout LineageOS-18.1 xiaomi/jasmine_sprout xiaomi/sdm660 xiaomi/sdm660-common;
createTable platina LineageOS-18.1 xiaomi/platina xiaomi/sdm660 xiaomi/sdm660-common;
createTable twolip LineageOS-18.1 xiaomi/twolip xiaomi/sdm660 xiaomi/sdm660-common;
createTable wayne LineageOS-18.1 xiaomi/wayne xiaomi/sdm660 xiaomi/sdm660-common;
createTable whyred LineageOS-18.1 xiaomi/whyred xiaomi/sdm660 xiaomi/sdm660-common;
createTable lemonade LineageOS-20.0 oneplus/sm8350-common oneplus/sm8350 oneplus/lemonade oplus/common;
createTable lemonadep LineageOS-20.0 oneplus/sm8350-common oneplus/sm8350 oneplus/lemonadep oplus/common;
createTable lentislte LineageOS-16.0 samsung/lentislte samsung/apq8084 samsung/apq8084-common;
createTable lmi LineageOS-20.0 xiaomi/sm8250-common xiaomi/sm8250 xiaomi/lmi;
createTable lmi LineageOS-20.0 xiaomi/sm8250-common xiaomi/sm8250 xiaomi/lmi;
createTable ls990 LineageOS-18.1 lge/g3-common lge/g3 lge/ls990;
createTable ls997 LineageOS-20.0 lge/v20-common lge/msm8996 lge/msm8996-common lge/ls997;
createTable lynx LineageOS-20.0 google/gs201 google/gs201/private/gs-google google/lynx;
createTable m7 LineageOS-14.1 htc/m7 htc/msm8960 htc/m7-common htc/msm8960-common;
createTable m8d LineageOS-18.1 htc/m8-common htc/msm8974 htc/m8d htc/msm8974-common;
createTable m8 LineageOS-18.1 htc/m8-common htc/msm8974 htc/m8 htc/msm8974-common;
createTable maguro LineageOS-14.1 samsung/maguro samsung/tuna samsung/tuna;
createTable mako LineageOS-18.1 lge/mako lge/mako;
createTable manta LineageOS-14.1 samsung/manta samsung/manta;
createTable marlin LineageOS-18.1 google/marlin google/marlin google/marlin/marlin;
createTable mata LineageOS-20.0 essential/mata essential/msm8998;
createTable Mi8937 LineageOS-20.0 xiaomi/Mi8937 xiaomi/msm8937 xiaomi/mithorium-common;
createTable Mi8917 LineageOS-20.0 xiaomi/Mi8937 xiaomi/msm8937 xiaomi/mithorium-common;
createTable merlin LineageOS-17.1 motorola/msm8916-common motorola/msm8916 motorola/merlin;
createTable n5100 LineageOS-14.1 samsung/n5100 samsung/smdk4412 samsung/smdk4412-common samsung/kona-common;
createTable n5110 LineageOS-14.1 samsung/n5110 samsung/smdk4412 samsung/smdk4412-common samsung/kona-common;
createTable n5120 LineageOS-14.1 samsung/n5120 samsung/smdk4412 samsung/smdk4412-common samsung/kona-common;
createTable oneplus2 LineageOS-17.1 oneplus/oneplus2 oneplus/msm8994 oppo/common;
createTable oneplus3 LineageOS-18.1 oneplus/oneplus3 oneplus/msm8996;
createTable oriole LineageOS-20.0 google/gs101 google/gs201/private/gs-google google/raviole;
createTable osprey LineageOS-17.1 motorola/msm8916-common motorola/msm8916 motorola/osprey;
createTable panther LineageOS-20.0 google/gs201 google/gs201/private/gs-google google/pantah;
createTable pioneer LineageOS-20.0 sony/nile-common sony/sdm660 sony/pioneer;
createTable pro1 LineageOS-20.0 fxtec/pro1 fxtec/msm8998;
createTable pro1x LineageOS-20.0 fxtec/pro1x fxtec/sm6115;
createTable raven LineageOS-20.0 google/gs101 google/gs201/private/gs-google google/raviole;
createTable redfin LineageOS-20.0 google/redbull google/redbull google/redfin;
createTable rs988 LineageOS-20.0 lge/g5-common lge/msm8996 lge/msm8996-common lge/rs988;
createTable sailfish LineageOS-18.1 google/marlin google/marlin google/marlin/sailfish;
createTable sargo LineageOS-20.0 google/bonito google/msm-4.9 google/bonito/sargo;
createTable serrano3gxx LineageOS-18.1 samsung/serrano-common samsung/msm8930-common samsung/serrano3gxx;
createTable serranoltexx LineageOS-18.1 samsung/serrano-common samsung/msm8930-common samsung/serranoltexx;
createTable serranodsdd LineageOS-18.1 samsung/serrano-common samsung/msm8930-common samsung/serranodsdd;
createTable shamu LineageOS-18.1 moto/shamu moto/shamu;
createTable starlte LineageOS-20.0 samsung/exynos9810-common samsung/exynos9810 samsung/starlte;
createTable star2lte LineageOS-20.0 samsung/exynos9810-common samsung/exynos9810 samsung/star2lte;
createTable sunfish LineageOS-20.0 google/sunfish google/msm-4.14;
createTable surnia LineageOS-17.1 motorola/msm8916-common motorola/msm8916 motorola/surnia;
createTable taimen LineageOS-20.0 google/wahoo google/wahoo google/muskie;
createTable tangorpro LineageOS-20.0 google/gs201 google/gs201/private/gs-google google/tangorpro;
createTable thor LineageOS-14.1 amazon/thor amazon/hdx-common amazon/hdx-common;
createTable toro LineageOS-14.1 samsung/toro samsung/tuna samsung/tuna;
createTable toroplus LineageOS-14.1 samsung/toroplus samsung/tuna samsung/tuna;
createTable us996 LineageOS-20.0 lge/v20-common lge/msm8996 lge/msm8996-common lge/us996;
createTable us997 LineageOS-20.0 lge/g6-common lge/msm8996 lge/msm8996-common lge/us997;
createTable v1awifi LineageOS-14.1 samsung/v1awifi samsung/exynos5420 samsung/exynos5420-common;
createTable vayu LineageOS-19.1 xiaomi/sm8150-common xiaomi/sm8150 xiaomi/vayu;
createTable victara LineageOS-18.1 motorola/victara motorola/msm8974;
createTable voyager LineageOS-20.0 sony/nile-common sony/sdm660 sony/voyager;
createTable kirin LineageOS-20.0 sony/nile-common sony/sdm660 sony/kirin;
createTable mermaid LineageOS-20.0 sony/nile-common sony/sdm660 sony/mermaid;
createTable vs985 LineageOS-18.1 lge/g3-common lge/g3 lge/vs985;
createTable vs995 LineageOS-20.0 lge/v20-common lge/msm8996 lge/msm8996-common lge/vs995;
createTable walleye LineageOS-20.0 google/wahoo google/wahoo google/muskie;
createTable xz2c LineageOS-20.0 sony/tama-common sony/sdm845 sony/xz2c;
createTable yellowstone LineageOS-16.0 google/yellowstone google/yellowstone;
createTable Z00T LineageOS-15.1 asus/msm8916-common asus/msm8916 asus/Z00T;
createTable z2_plus LineageOS-20.0 zuk/msm8996-common zuk/msm8996 zuk/z2_plus;

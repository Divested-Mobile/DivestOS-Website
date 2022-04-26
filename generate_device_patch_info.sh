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
	if [ -z "$level" ]; then
		level="Unknown";
	fi;
	if [ "$level" = '$(PLATFORM_SECURITY_PATCH)' ]; then
		level="2021-10"; #TODO: this will need special handling when 19.1 is stable
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
		patchCount=$(($patchCount-4))
		patchCount=" + $patchCount patches";
	fi;
	echo -n "$version$patchCount";
}

createTable() {
	name=$1;
	version=$2;
	versionStripped=$(echo "$version" | sed 's/.*-//')
	devicePath=$3;
	kernelPath=$4;
	kernelName=$(echo "$kernelPath" | sed 's|/|_|');
	vASB=$(getVendorPatchLevel $version $devicePath)
	kernelVersion=$(getKernelVersion $version $kernelPath);

	nameStripped=$(echo -n $name | sed 's|/||g');

	echo -e '<tr>\n\t<td data-label="Device">'$name'</td>\n\t<td data-label="Version">'$versionStripped'</td>\n\t<td data-label="V-ASB">'$vASB'</td>\n\t<td data-label="Kernel"><a href="https://gitlab.com/divested-mobile/divestos-build/-/blob/master/Scripts/'$version'/CVE_Patchers/android_kernel_'$kernelName'.sh" target="_blank" rel="nofollow noopener noreferrer">'$kernelVersion'</td></tr>';
}

createTable akari LineageOS-18.1 sony/tama-common sony/sdm845 sony/akari;
createTable alioth LineageOS-18.1 xiaomi/sm8250-common xiaomi/sm8250 xiaomi/alioth;
createTable Amber LineageOS-17.1 yandex/Amber yandex/sdm660;
createTable angler LineageOS-15.1 huawei/angler huawei/angler;
createTable apollo LineageOS-14.1 amazon/apollo amazon/hdx-common amazon/hdx-common;
createTable aura LineageOS-19.1 razer/aura razer/sdm845;
createTable aurora LineageOS-18.1 sony/tama-common sony/sdm845 sony/aurora;
createTable avicii LineageOS-17.1 oneplus/avicii oneplus/sm7250;
createTable axon7 LineageOS-15.1 zte/axon7 zte/msm8996;
createTable bacon LineageOS-18.1 oneplus/bacon oppo/msm8974 oppo/common oppo/msm8974-common;
createTable beryllium LineageOS-18.1 xiaomi/sdm845-common xiaomi/sdm845;
createTable beryllium LineageOS-19.1 xiaomi/sdm845-common xiaomi/sdm845;
createTable blueline LineageOS-18.1 google/crosshatch google/msm-4.9 google/crosshatch/blueline;
createTable blueline LineageOS-19.1 google/crosshatch google/msm-4.9 google/crosshatch/blueline;
createTable bonito LineageOS-19.1 google/bonito google/msm-4.9 google/bonito/bonito;
createTable bramble LineageOS-19.1 google/redbull google/redbull google/bramble;
createTable bullhead LineageOS-15.1 lge/bullhead lge/bullhead;
createTable cheeseburger LineageOS-18.1 oneplus/msm8998-common oneplus/msm8998 oneplus/cheeseburger;
createTable cheryl LineageOS-18.1 razer/cheryl oneplus/msm8998;
createTable clark LineageOS-14.1 motorola/clark motorola/msm8992;
createTable clark LineageOS-17.1 motorola/clark motorola/msm8992;
createTable coral LineageOS-19.1 google/coral google/coral google/coral/coral;
createTable crackling LineageOS-17.1 wileyfox/crackling cyanogen/msm8916 cyanogen/msm8916-common;
createTable crosshatch LineageOS-18.1 google/crosshatch google/msm-4.9 google/crosshatch/crosshatch;
createTable crosshatch LineageOS-19.1 google/crosshatch google/msm-4.9 google/crosshatch/crosshatch;
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
createTable davinci LineageOS-17.1 xiaomi/sm6150-common xiaomi/sm6150 xiaomi/davinci;
createTable deb LineageOS-15.1 asus/deb google/msm asus/flo;
createTable discovery LineageOS-18.1 sony/nile-common sony/sdm660 sony/discovery;
createTable discovery LineageOS-19.1 sony/nile-common sony/sdm660 sony/discovery;
createTable dragon LineageOS-15.1 google/dragon google/dragon;
createTable dumpling LineageOS-18.1 oneplus/msm8998-common oneplus/msm8998 oneplus/dumpling;
createTable enchilada LineageOS-18.1 oneplus/sdm845-common oneplus/sdm845 oneplus/enchilada;
createTable enchilada LineageOS-19.1 oneplus/sdm845-common oneplus/sdm845 oneplus/enchilada;
createTable ether LineageOS-15.1 nextbit/ether nextbit/msm8992;
createTable ether LineageOS-18.1 nextbit/ether nextbit/msm8992;
createTable f400 LineageOS-18.1 lge/g3-common lge/g3 lge/f400;
createTable fajita LineageOS-18.1 oneplus/sdm845-common oneplus/sdm845 oneplus/fajita;
createTable fajita LineageOS-19.1 oneplus/sdm845-common oneplus/sdm845 oneplus/fajita;
createTable flame LineageOS-19.1 google/coral google/coral google/coral/flame;
createTable flo LineageOS-15.1 asus/flo google/msm;
createTable flounder LineageOS-15.1 htc/flounder htc/flounder;
createTable flounder_lte LineageOS-15.1 htc/flounder_lte htc/flounder htc/flounder;
createTable flox LineageOS-18.1 asus/flox google/msm;
createTable FP2 LineageOS-18.1 fairphone/FP2 fairphone/msm8974;
createTable FP3 LineageOS-18.1 fairphone/FP3 fairphone/sdm632;
createTable fugu LineageOS-15.1 asus/fugu asus/fugu;
createTable griffin LineageOS-17.1 motorola/griffin motorola/msm8996;
createTable grouper LineageOS-14.1 asus/grouper asus/grouper;
createTable guacamoleb LineageOS-17.1 oneplus/sm8150-common oneplus/sm8150 oneplus/guacamoleb oneplus/common;
createTable guacamole LineageOS-18.1 oneplus/sm8150-common oneplus/sm8150 oneplus/guacamole oneplus/common;
createTable guacamole LineageOS-19.1 oneplus/sm8150-common oneplus/sm8150 oneplus/guacamole oneplus/common;
createTable h811 LineageOS-14.1 lge/h811 lge/msm8992 lge/g4-common;
createTable h815 LineageOS-14.1 lge/h815 lge/msm8992 lge/g4-common;
createTable h830 LineageOS-18.1 lge/g5-common lge/msm8996 lge/msm8996-common lge/h830;
createTable h850 LineageOS-18.1 lge/g5-common lge/msm8996 lge/msm8996-common lge/h850;
createTable h870 LineageOS-15.1 lge/g6-common lge/msm8996 lge/msm8996-common lge/h870;
createTable h910 LineageOS-18.1 lge/v20-common lge/msm8996 lge/msm8996-common lge/h910;
createTable h918 LineageOS-18.1 lge/v20-common lge/msm8996 lge/msm8996-common lge/h918;
createTable h990 LineageOS-18.1 lge/v20-common lge/msm8996 lge/msm8996-common lge/h990;
createTable ham LineageOS-16.0 zuk/ham cyanogen/msm8974;
createTable hammerhead LineageOS-15.1 lge/hammerhead lge/hammerhead;
createTable hammerhead LineageOS-16.0 lge/hammerhead lge/hammerhead;
createTable harpia LineageOS-17.1 motorola/msm8916-common motorola/msm8916 motorola/harpia;
createTable hero2lte LineageOS-14.1 samsung/hero2lte samsung/universal8890 samsung/hero-common;
createTable herolte LineageOS-14.1 samsung/herolte samsung/universal8890 samsung/hero-common;
createTable himaul LineageOS-14.1 htc/himaul htc/msm8994 htc/hima-common;
createTable himawl LineageOS-14.1 htc/himawl htc/msm8994 htc/hima-common;
createTable hotdogb LineageOS-18.1 oneplus/sm8150-common oneplus/sm8150 oneplus/hotdogb oneplus/common;
createTable hotdogb LineageOS-19.1 oneplus/sm8150-common oneplus/sm8150 oneplus/hotdogb oneplus/common;
createTable hotdog LineageOS-18.1 oneplus/sm8150-common oneplus/sm8150 oneplus/hotdog oneplus/common;
createTable hotdog LineageOS-19.1 oneplus/sm8150-common oneplus/sm8150 oneplus/hotdog oneplus/common;
createTable i9100 LineageOS-14.1 samsung/i9100 samsung/smdk4412 samsung/smdk4412-common samsung/galaxys2-common;
createTable i9300 LineageOS-14.1 samsung/i9300 samsung/smdk4412 samsung/smdk4412-common;
createTable i9305 LineageOS-14.1 samsung/i9305 samsung/smdk4412 samsung/smdk4412-common;
createTable jflteatt LineageOS-18.1 samsung/jflteatt samsung/jf samsung/jf-common;
createTable jfltespr LineageOS-18.1 samsung/jfltespr samsung/jf samsung/jf-common;
createTable jfltevzw LineageOS-18.1 samsung/jfltevzw samsung/jf samsung/jf-common;
createTable jfltexx LineageOS-18.1 samsung/jfltexx samsung/jf samsung/jf-common;
createTable kccat6 LineageOS-16.0 samsung/kccat6 samsung/apq8084 samsung/apq8084-common;
createTable kipper LineageOS-16.0 wileyfox/kipper cyanogen/msm8916 cyanogen/msm8916-common;
createTable klte LineageOS-18.1 samsung/klte-common samsung/msm8974 samsung/klte samsung/msm8974-common;
createTable land LineageOS-16.0 xiaomi/land xiaomi/msm8937 xiaomi/msm8937-common;
createTable lavender LineageOS-18.1 xiaomi/lavender xiaomi/sdm660 xiaomi/sdm660-common;
createTable lentislte LineageOS-16.0 samsung/lentislte samsung/apq8084 samsung/apq8084-common;
createTable lmi LineageOS-18.1 xiaomi/sm8250-common xiaomi/sm8250 xiaomi/lmi;
createTable ls990 LineageOS-18.1 lge/g3-common lge/g3 lge/ls990;
createTable ls997 LineageOS-18.1 lge/v20-common lge/msm8996 lge/msm8996-common lge/ls997;
createTable m7 LineageOS-14.1 htc/m7 htc/msm8960 htc/m7-common htc/msm8960-common;
createTable m8d LineageOS-18.1 htc/m8-common htc/msm8974 htc/m8d htc/msm8974-common;
createTable m8 LineageOS-18.1 htc/m8-common htc/msm8974 htc/m8 htc/msm8974-common;
createTable maguro LineageOS-14.1 samsung/maguro samsung/tuna samsung/tuna;
createTable mako LineageOS-18.1 lge/mako lge/mako;
createTable manta LineageOS-14.1 samsung/manta samsung/manta;
createTable marlin LineageOS-18.1 google/marlin google/marlin google/marlin/marlin;
createTable mata LineageOS-18.1 essential/mata essential/msm8998;
createTable merlin LineageOS-17.1 motorola/msm8916-common motorola/msm8916 motorola/merlin;
createTable n5100 LineageOS-14.1 samsung/n5100 samsung/smdk4412 samsung/smdk4412-common samsung/kona-common;
createTable n5110 LineageOS-14.1 samsung/n5110 samsung/smdk4412 samsung/smdk4412-common samsung/kona-common;
createTable n5120 LineageOS-14.1 samsung/n5120 samsung/smdk4412 samsung/smdk4412-common samsung/kona-common;
createTable oneplus2 LineageOS-17.1 oneplus/oneplus2 oneplus/msm8994 oppo/common;
createTable oneplus3 LineageOS-18.1 oneplus/oneplus3 oneplus/msm8996;
createTable osprey LineageOS-17.1 motorola/msm8916-common motorola/msm8916 motorola/osprey;
createTable pioneer LineageOS-18.1 sony/nile-common sony/sdm660 sony/pioneer;
createTable pioneer LineageOS-19.1 sony/nile-common sony/sdm660 sony/pioneer;
createTable pro1 LineageOS-19.1 fxtec/pro1 fxtec/msm8998;
createTable raphael LineageOS-18.1 xiaomi/sm8150-common xiaomi/sm8150 xiaomi/raphael;
createTable redfin LineageOS-19.1 google/redbull google/redbull google/redfin;
createTable rs988 LineageOS-18.1 lge/g5-common lge/msm8996 lge/msm8996-common lge/rs988;
createTable sailfish LineageOS-18.1 google/marlin google/marlin google/marlin/sailfish;
createTable santoni LineageOS-16.0 xiaomi/santoni xiaomi/msm8937 xiaomi/msm8937-common;
createTable sargo LineageOS-19.1 google/bonito google/msm-4.9 google/bonito/sargo;
createTable serrano3gxx LineageOS-18.1 samsung/serrano-common samsung/msm8930-common samsung/serrano3gxx;
createTable serranoltexx LineageOS-18.1 samsung/serrano-common samsung/msm8930-common samsung/serranoltexx;
createTable shamu LineageOS-15.1 moto/shamu moto/shamu;
createTable shamu LineageOS-18.1 moto/shamu moto/shamu;
createTable sunfish LineageOS-19.1 google/sunfish google/sunfish;
createTable surnia LineageOS-17.1 motorola/msm8916-common motorola/msm8916 motorola/surnia;
createTable taimen/walleye LineageOS-18.1 google/wahoo google/wahoo google/muskie;
createTable taimen/walleye LineageOS-19.1 google/wahoo google/wahoo google/muskie;
createTable thor LineageOS-14.1 amazon/thor amazon/hdx-common amazon/hdx-common;
createTable toro LineageOS-14.1 samsung/toro samsung/tuna samsung/tuna;
createTable toroplus LineageOS-14.1 samsung/toroplus samsung/tuna samsung/tuna;
createTable us996 LineageOS-18.1 lge/v20-common lge/msm8996 lge/msm8996-common lge/us996;
createTable us997 LineageOS-15.1 lge/g6-common lge/msm8996 lge/msm8996-common lge/us997;
createTable v1awifi LineageOS-14.1 samsung/v1awifi samsung/exynos5420 samsung/exynos5420-common;
createTable vayu LineageOS-18.1 xiaomi/sm8150-common xiaomi/sm8150 xiaomi/vayu;
createTable victara LineageOS-18.1 motorola/victara motorola/msm8974;
createTable voyager LineageOS-18.1 sony/nile-common sony/sdm660 sony/voyager;
createTable voyager LineageOS-19.1 sony/nile-common sony/sdm660 sony/voyager;
createTable vs985 LineageOS-18.1 lge/g3-common lge/g3 lge/vs985;
createTable vs995 LineageOS-18.1 lge/v20-common lge/msm8996 lge/msm8996-common lge/vs995;
createTable xz2c LineageOS-18.1 sony/tama-common sony/sdm845 sony/xz2c;
createTable yellowstone LineageOS-16.0 google/yellowstone google/yellowstone;
createTable Z00T LineageOS-15.1 asus/msm8916-common asus/msm8916 asus/Z00T;
createTable z2_plus LineageOS-18.1 zuk/msm8996-common zuk/msm8996 zuk/z2_plus;

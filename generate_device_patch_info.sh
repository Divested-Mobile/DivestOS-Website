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
		level="2021-07";
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
	vASB=$(getVendorPatchLevel $version $devicePath)
	kernelVersion=$(getKernelVersion $version $kernelPath);
	echo -e '<tr>\n\t<td data-label="Device">'$name'</td>\n\t<td data-label="Version">'$versionStripped'</td>\n\t<td data-label="V-ASB">'$vASB'</td>\n\t<td data-label="Kernel">'$kernelVersion'</td>\n</tr>';
}

createTable Amber LineageOS-17.1 yandex/Amber yandex/sdm660;
createTable angler LineageOS-15.1 huawei/angler huawei/angler;
createTable aura LineageOS-18.1 razer/aura razer/sdm845;
createTable avicii LineageOS-17.1 oneplus/avicii oneplus/sm7250;
createTable axon7 LineageOS-15.1 zte/axon7 zte/msm8996;
createTable bacon LineageOS-18.1 oneplus/bacon oppo/msm8974;
createTable beryllium LineageOS-16.0 xiaomi/sdm845-common xiaomi/sdm845;
createTable beryllium LineageOS-18.1 xiaomi/sdm845-common xiaomi/sdm845;
createTable bonito/sargo LineageOS-17.1 google/bonito google/msm-4.9;
createTable bonito/sargo LineageOS-18.1 google/bonito google/msm-4.9;
createTable bullhead LineageOS-15.1 lge/bullhead lge/bullhead;
createTable cheeseburger/dumpling LineageOS-18.1 oneplus/msm8998-common oneplus/msm8998;
createTable cheryl LineageOS-18.1 razer/cheryl oneplus/msm8998;
createTable clark LineageOS-14.1 motorola/clark motorola/msm8992;
createTable clark LineageOS-17.1 motorola/clark motorola/msm8992;
createTable coral/flame LineageOS-18.1 google/coral google/coral;
createTable crackling LineageOS-17.1 wileyfox/crackling cyanogen/msm8916;
createTable crosshatch/blueline LineageOS-18.1 google/crosshatch google/msm-4.9;
createTable d802 LineageOS-18.1 lge/g2-common lge/msm8974;
createTable d852/d855 LineageOS-18.1 lge/g3-common lge/g3;
createTable dragon LineageOS-15.1 google/dragon google/dragon;
createTable enchilada/fajita LineageOS-18.1 oneplus/sdm845-common oneplus/sdm845;
createTable ether LineageOS-15.1 nextbit/ether nextbit/msm8992;
createTable ether LineageOS-18.1 nextbit/ether nextbit/msm8992;
createTable flo LineageOS-15.1 asus/flo google/msm;
createTable flounder LineageOS-15.1 htc/flounder htc/flounder;
createTable flox LineageOS-18.1 asus/flox google/msm;
createTable FP2 LineageOS-18.1 fairphone/FP2 fairphone/msm8974;
createTable FP3 LineageOS-18.1 fairphone/FP3 fairphone/sdm632;
createTable fugu LineageOS-15.1 asus/fugu asus/fugu;
createTable fugu LineageOS-16.0 asus/fugu asus/fugu;
createTable fugu LineageOS-17.1 asus/fugu asus/fugu;
createTable griffin LineageOS-17.1 motorola/griffin motorola/msm8996;
createTable grouper LineageOS-14.1 asus/grouper asus/grouper;
createTable guacamoleb LineageOS-17.1 oneplus/sm8150-common oneplus/sm8150;
createTable guacamole/hotdog/hotdogb LineageOS-18.1 oneplus/sm8150-common oneplus/sm8150;
createTable h815 LineageOS-14.1 lge/h815 lge/msm8992;
createTable h850/rs988 LineageOS-18.1 lge/g5-common lge/msm8996;
createTable h870/us997 LineageOS-15.1 lge/g6-common lge/msm8996;
createTable h990/us996 LineageOS-18.1 lge/v20-common lge/msm8996;
createTable ham LineageOS-16.0 zuk/ham cyanogen/msm8974;
createTable hammerhead LineageOS-15.1 lge/hammerhead lge/hammerhead;
createTable hammerhead LineageOS-16.0 lge/hammerhead lge/hammerhead;
createTable herolte LineageOS-14.1 samsung/herolte samsung/universal8890;
createTable himaul LineageOS-14.1 htc/himaul htc/msm8994;
createTable himaul LineageOS-15.1 htc/himaul htc/msm8994;
createTable i9100 LineageOS-14.1 samsung/galaxys2-common samsung/smdk4412;
createTable i9300 LineageOS-14.1 samsung/i9300 samsung/smdk4412;
createTable i9305 LineageOS-14.1 samsung/i9305 samsung/smdk4412;
createTable jfltexx LineageOS-18.1 samsung/jfltexx samsung/jf;
createTable kipper LineageOS-16.0 wileyfox/kipper cyanogen/msm8916;
createTable klte LineageOS-18.1 samsung/klte-common samsung/msm8974;
createTable m7 LineageOS-14.1 htc/m7 htc/msm8960;
createTable m8 LineageOS-17.1 htc/m8-common htc/msm8974;
createTable m8 LineageOS-18.1 htc/m8-common htc/msm8974;
createTable maguro LineageOS-14.1 samsung/maguro samsung/tuna;
createTable mako LineageOS-18.1 lge/mako lge/mako;
createTable manta LineageOS-14.1 samsung/manta samsung/manta;
createTable marlin/sailfish LineageOS-17.1 google/marlin google/marlin;
createTable mata LineageOS-18.1 essential/mata essential/msm8998;
createTable n5110 LineageOS-14.1 samsung/n5110 samsung/smdk4412;
createTable n7100 LineageOS-14.1 samsung/n7100 samsung/smdk4412;
createTable oneplus2 LineageOS-15.1 oneplus/oneplus2 oneplus/msm8994;
createTable oneplus2 LineageOS-17.1 oneplus/oneplus2 oneplus/msm8994;
createTable oneplus3 LineageOS-18.1 oneplus/oneplus3 oneplus/msm8996;
createTable osprey LineageOS-17.1 motorola/osprey motorola/msm8916;
createTable pro1 LineageOS-18.1 fxtec/pro1 fxtec/msm8998;
createTable serrano3gxx/serranoltexx LineageOS-18.1 samsung/serrano-common samsung/msm8930-common;
createTable shamu LineageOS-15.1 moto/shamu moto/shamu;
createTable shamu LineageOS-18.1 moto/shamu moto/shamu;
createTable taimen/walleye LineageOS-18.1 google/wahoo google/wahoo;
createTable thor LineageOS-14.1 amazon/thor amazon/hdx-common;
createTable toro LineageOS-14.1 samsung/toro samsung/tuna;
createTable toroplus LineageOS-14.1 samsung/toroplus samsung/tuna;
createTable v1awifi LineageOS-14.1 samsung/v1awifi samsung/exynos5420;
createTable victara LineageOS-18.1 motorola/victara motorola/msm8974;
createTable yellowstone LineageOS-16.0 google/yellowstone google/yellowstone;
createTable yellowstone LineageOS-17.1 google/yellowstone google/yellowstone;
createTable Z00T LineageOS-15.1 asus/msm8916-common asus/msm8916;
createTable z2_plus LineageOS-17.1 zuk/msm8996-common zuk/msm8996;
createTable zenfone3 LineageOS-16.0 asus/zenfone3 asus/msm8953;

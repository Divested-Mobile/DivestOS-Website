#!/bin/bash
rm -rf output;
cp -r static output;
mkdir output/pages;

alias asmpage='bwrap --dev-bind / / --ro-bind /dev/null /etc/ld.so.preload php assemble_pages.php';

declare -a staticPages=("about" "bootloader" "broken" "browsers" "bug_reporting" "build" "community" "faq" "functionality_tables" "history" "home" "messengers" "network_connections" "news" "our_apps" "patch_counts" "patch_levels" "post_install" "privacy_policy" "recommended_apps" "saving_data" "screenshots_dark" "screenshots" "technical_details" "terms_of_service" "troubleshooting" "verified_boot_hashes");

for page in "${staticPages[@]}"
do
	asmpage "$page" > "output/pages/$page.html";
done;

asmpage devices LineageOS false > "output/pages/devices.html";
asmpage devices LineageOS true > "output/pages/devices_golden.html";

ln -sf pages/home.html output/index.html;

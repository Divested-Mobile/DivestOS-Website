#!/bin/bash
#Copyright (c) 2023-2024 Divested Computing Group
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU Affero General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU Affero General Public License for more details.
#
#You should have received a copy of the GNU Affero General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.

rm -rf output;
cp -r --reflink=auto static output;
mkdir output/pages;

#workaround hmalloc on host
if command -v bwrap &> /dev/null && [ -f /etc/ld.so.preload ]; then
	alias asmpage='bwrap --dev-bind / / --ro-bind /dev/null /etc/ld.so.preload php assemble_pages.php';
else
	alias asmpage='php assemble_pages.php';
fi;

#helper
if command -v firejail &> /dev/null; then
	alias fjnn='firejail --net=none';
else
	alias fjnn='';
fi;

declare -a staticPages=("about" "bootloader" "broken" "browsers" "bug_reporting" "build" "community" "faq" "functionality_tables" "history" "home" "messengers" "network_connections" "news" "our_apps" "patch_counts" "patch_history" "patch_levels" "post_install" "privacy_policy" "recommended_apps" "saving_data" "screenshots_dark" "screenshots" "search" "technical_details" "terms_of_service" "troubleshooting" "verified_boot_hashes" "wallpaper-2024" "fdroid_stats");

for page in "${staticPages[@]}"
do
	asmpage "$page" > "output/pages/$page.html";
done;

asmpage "devices" > "output/pages/devices.php";
sed -i 's/\[PHP INCLUDER\]/<?php include "..\/gen_devices.php" ?>/' "output/pages/devices.php";

#gzip -k output/pages/*.html output/assets/css/*.css;
#brotli -k output/pages/*.html output/assets/css/*.css;

ln -sf pages/home.html output/index.html;

if command -v pagefind &> /dev/null; then
	fjnn pagefind --site output/pages;
else
	echo "pagefind is unavailable, not generating search index"
fi;

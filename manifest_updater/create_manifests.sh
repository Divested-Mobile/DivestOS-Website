date=$1
$base=/var/www/spotco.us/de/devices/
cd $base
for device in $(find . -type d -maxdepth 1);
do
	cp template.json $device/um.json;
	sed -i "s/DEVICE/$device/" $device/um.json;
	sed -i "s/IMAGE/lineage-14.1-$date-dsc-$device.zip/g" $device/um.json;
	#md5=($(md5sum $device/lineage-14.1-$date-dsc-$device.zip));
	md5=$(cat $device/lineage-14.1-$date-dsc-$device.zip.md5sum | cut -d ' ' -f1);
	sed -i "s/HASH/$md5/" $device/um.json;
	time=$(date +%s);
	sed -i "s/TIME/$time/" $device/um.json;
done

date=$1
base=/var/www/spotco.us/de/devices/
self=/var/www/spotco.us/de/manifest_updater/
cd $base
for device in $(find . -maxdepth 1 -mindepth 1 -type d -print);
do
	device=$(basename $device);
	echo "Creating manifest for $device"; 
	cp $self/template.json $device/um.json;
	sed -i "s/DEVICE/$device/" $device/um.json;
	sed -i "s/IMAGE/lineage-14.1-$date-dsc-$device.zip/g" $device/um.json;
	md5=$(cat $device/lineage-14.1-$date-dsc-$device.zip.md5sum | cut -d ' ' -f1);
	sed -i "s/HASH/$md5/" $device/um.json;
	time=$(date +%s);
	sed -i "s/TIME/$time/" $device/um.json;
done

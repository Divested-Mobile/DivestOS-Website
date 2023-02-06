mkdir -p generated
bwrap --dev-bind / / --ro-bind /dev/null /etc/ld.so.preload php gen_devices.php LineageOS false > generated/LineageOS-false.html
bwrap --dev-bind / / --ro-bind /dev/null /etc/ld.so.preload php gen_devices.php LineageOS true  > generated/LineageOS-true.html

while IFS= read -r line
do
	if [[ "$line" == *"payout		https://chromereleases.googleblog.com"* ]]; then
		url=$(sed -e 's/.*https/https/' -e 's/\.html.*/.html/' <<< "$line");
		echo "processing $url"
		lynx -dump "$url" > /tmp/chromium-payout
		payout=$(/usr/bin/printf "$%'d" $(sed -e 's/\[\$/\n[$/g' /tmp/chromium-payout | grep "\[\\$" | sed -e 's/\[\$//' -e 's/\].*//' | grep -v -e "NA" -e "N/A" -e "TBD" -e "^$" | sort | awk '{ sum += $1 } END { print sum }'));
		if grep -q "TBD\]" /tmp/chromium-payout; then
			payout="$payout+"
		fi;
		sed -i "s#payout\t\t$url#$payout\t\t$url#" ch-dates.txt;
	fi;
done < "ch-dates.txt"

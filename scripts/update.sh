#!/bin/sh

sort -uf dist/apple1.txt | grep -v "^$" >gen/apple.txt
sed -r "s/'\./'+\./" dist/apple2.txt | sort -uf | grep -v "^$" | sed -e '1s/^/payload:\n/' >coo/apple.yaml

sort -uf dist/cnip1.txt | grep -v "^$" >gen/cnip.txt
sort -uf dist/cnip2.txt | grep -v "^$" | sed -e '1s/^/payload:\n/' >coo/cnip.yaml

grep -vE 'blogspot|discord|facebook|flickr|google|instagram|netflix|pinterest|porn|telegram|twitch|twitter|whatsapp|wikileaks|wikipedia|yahoo|youtube' dist/direct1.txt >dist/direct11.txt
sort -uf dist/direct11.txt | grep -vE '[a-z0-9]\.cn$' | grep -v "^$" >gen/direct.txt
grep -vE 'blogspot|discord|facebook|flickr|google|instagram|netflix|pinterest|porn|telegram|twitch|twitter|whatsapp|wikileaks|wikipedia|yahoo|youtube' dist/direct2.txt >dist/direct22.txt
sed -r "s/'\./'+\./" dist/direct22.txt | grep -vE "[a-z0-9]\.cn'$" | sort -uf | grep -v "^$" | sed -e '1s/^/payload:\n/' >coo/direct.yaml
cat dist/direct3.txt | grep -vE 'blogspot|discord|facebook|flickr|google|instagram|netflix|pinterest|porn|telegram|twitch|twitter|whatsapp|wikileaks|wikipedia|yahoo|youtube' >dist/direct34.txt
sed 's|server=/\.|server=/|' dist/direct34.txt | grep -vE "[a-z0-9]\.cn/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$" | sort -uf | grep -v "^$" >fan/dnsmasqCN.txt
sed 's/^\.//' dist/direct11.txt | grep -vE '[a-z0-9]\.cn$|jsdelivr\.|ghproxy\.|gh-proxy\.|moeyy\.xyz|1888866\.xyz|isteed\.cc' | sort -uf | grep -v "^$" >fan/smartdnsCN.txt

sort -uf dist/proxy1.txt | grep -v "^$" >gen/proxy.txt
sort -uf dist/proxy2.txt | grep -v "^$" | sed -e '1s/^/payload:\n/' >coo/proxy.yaml

sed -r "s/[[:space:]]+/ /g" dist/adguard1.txt | sed -r 's/^\s+|\s+$//g' | sort -u | grep -v "^$" >fan/adguard.txt
grep -vE 'adservice|advertising|guanggao' dist/reject1.txt | sort -u | grep -v "^$" >gen/reject.txt
grep -vE 'adservice|advertising|guanggao' dist/reject2.txt | sort -u | grep -v "^$" | sed -e '1s/^/payload:\n/' >coo/reject.yaml
sort -uf dist/reject3.txt | grep -v "^$" >fan/dnsmasqAd.txt
sort -uf dist/reject4.txt | grep -v "^$" >fan/smartdnsAd.txt

sort -uf dist/telegram1.txt | grep -v "^$" >temp/telegram.txt
sort -uf dist/telegram2.txt | grep -v "^$" | sed -e '1s/^/payload:\n/' >coo/telegram.yaml

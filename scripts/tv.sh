#!/bin/sh

rm -rf fan/[0-9].json

curl -o- "https://raw.githubusercontent.com/n3rddd/N3RD/master/JN/lem.json" | sed 's/\r/\n/g' | grep -vE '^(\s*)(//|"notice"|"logo")' | grep -v "^$" >dist/1.json
curl -o- "https://raw.githubusercontent.com/xyq254245/xyqonlinerule/main/XYQTVBox.json" | sed 's/\r/\n/g' | grep -vE '^(\s*)(//|"notice"|"logo")' | grep -v "^$" >dist/2.json
curl -o- "https://raw.githubusercontent.com/yoursmile66/TVBox/main/XC.json" | sed 's/\r/\n/g' | grep -vE '^(\s*)(//|"notice"|"logo")' | grep -v "^$" >dist/3.json
curl -o- "https://raw.githubusercontent.com/ne7359/tvurl/main/0821.json" | sed 's/\r/\n/g' | grep -vE '^(\s*)(//|"notice"|"logo")' | grep -v "^$" >dist/4.json
curl -o- "https://raw.githubusercontent.com/ne7359/tvurl/main/xiaosa/api.json" | sed 's/\r/\n/g' | grep -vE '^(\s*)(//|"notice"|"logo")' | grep -v "^$" >dist/5.json
curl -o- "https://raw.githubusercontent.com/wanganni/yinshiyuan/main/tvbox18.json" | sed 's/\r/\n/g' | grep -vE '^(\s*)(//|"notice"|"logo")' | grep -v "^$" >dist/6.json
find dist -name '6.json' | xargs perl -pi -e "s/\'/\"/g"

find dist -name '[0-9].json' | xargs perl -pi -e 's|\t| |g'
find dist -name '[0-9].json' | xargs perl -pi -e 's|http([s]?):(/{1,4})([^/]+)|http$1://$3|g'
find dist -name '[0-9].json' | xargs perl -pi -e 's|"http([s]?)://([^"]+)(?<!:)//([^"]*)"|"http$1://$2/$3"|g'
find dist -name '[0-9].json' | xargs perl -pi -e 's|"http([s]?)://([^"]+)(?<!:)//([^"]*)"|"http$1://$2/$3"|g'
find dist -name '[0-9].json' | xargs perl -pi -e 's|(["=])(\.{2,3})/|$1./|g'
find dist -name '[0-9].json' | xargs perl -pi -e 's|"\./([^"]+)(?<!:)//([^"]*)"|"./$1/$2"|g'
find dist -name '[0-9].json' | xargs perl -pi -e 's|"\./([^"]+)(?<!:)//([^"]*)"|"./$1/$2"|g'
find dist -name '[0-9].json' | xargs perl -pi -e 's|(?<!:)//.*||g'
find dist -name '[0-9].json' | xargs perl -pi -e 's|/refs/heads/|/|g'
find dist -name '[0-9].json' | xargs perl -pi -e 's|^(\s*)/\*|『|g'
find dist -name '[0-9].json' | xargs perl -pi -e 's|\*/(\s*)$|』|g'
find dist -name '[0-9].json' | xargs perl -pi -e 's|\n||g'
find dist -name '[0-9].json' | xargs perl -pi -e 's|『[\s\S]*』||g'
find dist -name '[0-9].json' | xargs perl -pi -e 's/("lives"|"doh")\s*:\s*\[((?!\],).)+(\],)//g'
find dist -name '[0-9].json' | xargs perl -pi -e 's/#([^#]*)(短剧|音乐|短视频|小说|相声|少儿|戏曲|MTV|评书)([^\$]*)\$([0-9]+)//g'
find dist -name '[0-9].json' | xargs perl -pi -e 's/("短剧",|"短剧大全",|"音乐",|"预告片",|"汽车",|"搞笑",|"影视",)//g'
find dist -name '[0-9].json' | xargs perl -pi -e 's/\{([^\{]*)"key"((?!"key").)+(公告|Market|FirstAid|csp_Push|LocalFile|YouTube|Youtube|bili|Bili|DJMV|哔哩|短剧|少儿|戏曲|墙外|小说|童趣|兔小贝|听书|广播|相声|评书|音乐|短视频|酷奇MV|预告|翻墙|完全免费|任何广告|push_agent|KkSs|UuSs|PanSso|YpanSo|Xzso|MIPanSo|PanSearch|Aliso|YiSo|PanTa|PanBaiDu|PanUc|PanQuark|PanAli|小纸条)((?!"key").)+\{([^\{]*)"key"/{$5"key"/g'
find dist -name '[0-9].json' | xargs perl -pi -e 's/\{([^\{]*)"key"((?!"key").)+(公告|Market|FirstAid|csp_Push|LocalFile|YouTube|Youtube|bili|Bili|DJMV|哔哩|短剧|少儿|戏曲|墙外|小说|童趣|兔小贝|听书|广播|相声|评书|音乐|短视频|酷奇MV|预告|翻墙|完全免费|任何广告|push_agent|KkSs|UuSs|PanSso|YpanSo|Xzso|MIPanSo|PanSearch|Aliso|YiSo|PanTa|PanBaiDu|PanUc|PanQuark|PanAli|小纸条)((?!"key").)+\{([^\{]*)"key"/{$5"key"/g'
find dist -name '[0-9].json' | xargs perl -pi -e 's/\{([^\{]*)"key"((?!"key").)+(公告|Market|FirstAid|csp_Push|LocalFile|YouTube|Youtube|bili|Bili|DJMV|哔哩|短剧|少儿|戏曲|墙外|小说|童趣|兔小贝|听书|广播|相声|评书|音乐|短视频|酷奇MV|预告|翻墙|完全免费|任何广告|push_agent|KkSs|UuSs|PanSso|YpanSo|Xzso|MIPanSo|PanSearch|Aliso|YiSo|PanTa|PanBaiDu|PanUc|PanQuark|PanAli|小纸条)((?!"key").)+\{([^\{]*)"key"/{$5"key"/g'
find dist -name '[0-9].json' | xargs perl -pi -e 's/\{([^\{]*)"key"((?!"key").)+(公告|Market|FirstAid|csp_Push|LocalFile|YouTube|Youtube|bili|Bili|DJMV|哔哩|短剧|少儿|戏曲|墙外|小说|童趣|兔小贝|听书|广播|相声|评书|音乐|短视频|酷奇MV|预告|翻墙|完全免费|任何广告|push_agent|KkSs|UuSs|PanSso|YpanSo|Xzso|MIPanSo|PanSearch|Aliso|YiSo|PanTa|PanBaiDu|PanUc|PanQuark|PanAli|小纸条)((?!"key").)+\{([^\{]*)"key"/{$5"key"/g'
find dist -name '[0-9].json' | xargs perl -pi -e 's/,\s*\{([^\{]*)"key"((?!("key"|\],)).)+(公告|Market|FirstAid|csp_Push|LocalFile|YouTube|Youtube|bili|Bili|DJMV|哔哩|短剧|少儿|戏曲|墙外|小说|童趣|兔小贝|听书|广播|相声|评书|音乐|短视频|酷奇MV|预告|翻墙|完全免费|任何广告|push_agent|KkSs|UuSs|PanSso|YpanSo|Xzso|MIPanSo|PanSearch|Aliso|YiSo|PanTa|PanBaiDu|PanUc|PanQuark|PanAli|小纸条)((?!("key"|\],)).)+([^\[]+)("parses"|"rules")/\],$8/g'

find dist -name '1.json' | xargs jq '.' >fan/1.json
find dist -name '2.json' | xargs jq '.' >fan/2.json
find dist -name '3.json' | xargs jq '.' >fan/3.json
find dist -name '4.json' | xargs jq '.' >fan/4.json
find dist -name '5.json' | xargs jq '.' >fan/5.json
find dist -name '6.json' | xargs jq '.' >fan/6.json

find fan -name '[0-9].json' | xargs perl -pi -e 's/"name": "([^" ]*)\s*([^" ]*)\s*([^" ]*)\s*([^" ]*)\s*([^" ]*)"/"name": "$1$2$3$4$5"/g'
find fan -name '[0-9].json' | xargs perl -pi -e 's/"name": "([^" ]*)(\||｜|┃|\[密\]|雷蒙影视|4K弹幕|\[无水印\])([^" ]*)"/"name": "$1$3"/g'
find fan -name '[0-9].json' | xargs perl -pi -e 's/"name": "([^" ]*)(\||｜|┃|\[密\]|雷蒙影视|4K弹幕|\[无水印\])([^" ]*)"/"name": "$1$3"/g'
find fan -name '[0-9].json' | xargs perl -pi -e 's/"name": "([^" ]*)(（|\[)([^" ]*)"/"name": "$1($3"/g'
find fan -name '[0-9].json' | xargs perl -pi -e 's/"name": "([^" ]*)(）|\])([^" ]*)"/"name": "$1)$3"/g'

find fan -name '[0-9].json' | xargs perl -pi -e 's|(["=])https?:/([^"=]*)/raw\.([^/]+)/([^/]+)/([^/]+)/|$1https://gh-proxy.com/https://raw.githubusercontent.com/$4/$5/|g'
find fan -name '[0-9].json' | xargs perl -pi -e 's|(["=])https?:/([^"=]*)/github\.com/([^/]+)/([^/]+)/raw/|$1https://gh-proxy.com/https://raw.githubusercontent.com/$3/$4/|g'
find fan -name '[0-9].json' | xargs perl -pi -e 's|(["=])https?:/([^"=]+)\.jsdelivr\.net/gh/([^/]+)/([^/]+)@|$1https://gh-proxy.com/https://raw.githubusercontent.com/$3/$4/|g'

find fan -name '1.json' | xargs perl -pi -e 's|(["=])\./|$1https://gh-proxy.com/https://raw.githubusercontent.com/n3rddd/N3RD/master/JN/|g'
find fan -name '2.json' | xargs perl -pi -e 's|(["=])\./|$1https://gh-proxy.com/https://raw.githubusercontent.com/xyq254245/xyqonlinerule/main/|g'
find fan -name '3.json' | xargs perl -pi -e 's|(["=])\./|$1https://gh-proxy.com/https://raw.githubusercontent.com/yoursmile66/TVBox/main/|g'
find fan -name '4.json' | xargs perl -pi -e 's|(["=])\./|$1https://gh-proxy.com/https://raw.githubusercontent.com/ne7359/tvurl/main/|g'
find fan -name '5.json' | xargs perl -pi -e 's|(["=])\./|$1https://gh-proxy.com/https://raw.githubusercontent.com/ne7359/tvurl/main/xiaosa/|g'
find fan -name '6.json' | xargs perl -pi -e 's|(["=])\./|$1https://gh-proxy.com/https://raw.githubusercontent.com/wanganni/yinshiyuan/main/|g'

find fan -name '3.json' | xargs perl -pi -e 's|"https://jihulab\.com/([^/]+)/([^/]+)/-/raw/|"https://gh-proxy.com/https://raw.githubusercontent.com/$1/$2/|g'

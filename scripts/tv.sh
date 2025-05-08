#!/bin/sh

rm -rf fan/[0-9].json

curl -o- "https://raw.githubusercontent.com/n3rddd/N3RD/master/JN/lem.json" | grep -vE '^(\s+)?(//|"notice"|"logo")' > dist/1.json
curl -o- "https://raw.githubusercontent.com/wanganni/yinshiyuan/main/tvbox18.json" | grep -vE '^(\s+)?(//|"notice"|"logo")' > dist/2.json
find dist -name '2.json' | xargs perl -pi -e "s|\'|\"|g"
find dist -name '2.json' | xargs perl -pi -e 's|com//api|com/api|g'
curl -o- "https://raw.githubusercontent.com/yoursmile66/TVBox/main/XC.json" | grep -vE '^(\s+)?(//|"notice"|"logo")' > dist/3.json
find dist -name '3.json' | xargs perl -pi -e 's|xyz//"|xyz/"|g'
curl -o- "https://raw.githubusercontent.com/ne7359/tvurl/main/0821.json" | grep -vE '^(\s+)?(//|"notice"|"logo")' > dist/4.json

find dist -name '[0-9].json' | xargs perl -pi -e 's|(?<!:)\/\/.*||g'
find dist -name '[0-9].json' | xargs perl -pi -e 's|\n||g'

find dist -name '1.json' | xargs perl -pi -e 's|\/\*-[\s\S]+-\*\/||g'

find dist -name '1.json' | xargs jq '.' > fan/1.json
find dist -name '2.json' | xargs jq '.' > fan/2.json
find dist -name '3.json' | xargs jq '.' > fan/3.json
find dist -name '4.json' | xargs jq '.' > fan/4.json

find fan -name '[0-9].json' | xargs perl -pi -e 's|/refs/heads/|/|g'
find fan -name '[0-9].json' | xargs perl -pi -e 's|"https?:/(.*)/github\.com/([^/]+)/([^/]+)/raw/|"https://gh-proxy.com/https://raw.githubusercontent.com/$2/$3/|g'
find fan -name '[0-9].json' | xargs perl -pi -e 's|=https?:/(.*)/github\.com/([^/]+)/([^/]+)/raw/|=https://gh-proxy.com/https://raw.githubusercontent.com/$2/$3/|g'
find fan -name '[0-9].json' | xargs perl -pi -e 's|"https?:/(.*)/raw\.([^/]+)/([^/]+)/|"https://gh-proxy.com/https://raw.githubusercontent.com/$3/|g'
find fan -name '[0-9].json' | xargs perl -pi -e 's|=https?:/(.*)/raw\.([^/]+)/([^/]+)/|=https://gh-proxy.com/https://raw.githubusercontent.com/$3/|g'
find fan -name '[0-9].json' | xargs perl -pi -e 's|"https?:/(.*)\.jsdelivr\.net/gh/([^/]+)/([^/]+)@|"https://gh-proxy.com/https://raw.githubusercontent.com/$2/$3/|g'
find fan -name '[0-9].json' | xargs perl -pi -e 's|=https?:/(.*)\.jsdelivr\.net/gh/([^/]+)/([^/]+)@|=https://gh-proxy.com/https://raw.githubusercontent.com/$2/$3/|g'

find fan -name '3.json' | xargs perl -pi -e 's|"https?://([^/]+)/([^/]+)/([^/]+)/-/raw/|"https://gh-proxy.com/https://raw.githubusercontent.com/$2/$3/|g'
find fan -name '3.json' | xargs perl -pi -e 's|=https?://([^/]+)/([^/]+)/([^/]+)/-/raw/|=https://gh-proxy.com/https://raw.githubusercontent.com/$2/$3/|g'

find fan -name '1.json' | xargs perl -pi -e 's|"\./|"https://gh-proxy.com/https://raw.githubusercontent.com/n3rddd/N3RD/master/JN/|g'
find fan -name '1.json' | xargs perl -pi -e 's|=\./|=https://gh-proxy.com/https://raw.githubusercontent.com/n3rddd/N3RD/master/JN/|g'
find fan -name '2.json' | xargs perl -pi -e 's|"\./|"https://gh-proxy.com/https://raw.githubusercontent.com/wanganni/yinshiyuan/main/|g'
find fan -name '2.json' | xargs perl -pi -e 's|=\./|=https://gh-proxy.com/https://raw.githubusercontent.com/wanganni/yinshiyuan/main/|g'
find fan -name '3.json' | xargs perl -pi -e 's|"\./|"https://gh-proxy.com/https://raw.githubusercontent.com/yoursmile66/TVBox/main/|g'
find fan -name '3.json' | xargs perl -pi -e 's|=\./|=https://gh-proxy.com/https://raw.githubusercontent.com/yoursmile66/TVBox/main/|g'
find fan -name '4.json' | xargs perl -pi -e 's|"\./|"https://gh-proxy.com/https://raw.githubusercontent.com/ne7359/tvurl/main/|g'
find fan -name '4.json' | xargs perl -pi -e 's|=\./|=https://gh-proxy.com/https://raw.githubusercontent.com/ne7359/tvurl/main/|g'

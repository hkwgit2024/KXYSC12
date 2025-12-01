/*
@header({
  searchable: 1,
  filterable: 0,
  quickSearch: 1,
  title: '金牌影院',
  '类型': '影视',
  lang: 'dr2'
})
*/

// 自动生成于 7/22/2025, 3:45:45 PM
// 原始文件: 金牌[优].js

var rule = {
    类型: "影视",
    title: "金牌影院",
    desc: "金牌影院纯js版本",
    host: "",
    homeUrl: "",
    url: "/api/mw-movie/anonymous/video/list?pageNum=fypage&pageSize=30&sort=1&sortBy=1&type1=fyclass",
    searchUrl: "/api/mw-movie/anonymous/video/searchByWordPageable?keyword=**&pageNum=fypage&pageSize=12&type=false",
    searchable: 1,
    quickSearch: 1,
    timeout: 5000,
    play_parse: true,
    search_match: true, 
    common: {
        key: "cb808529bae6b6be45ecfab29a4889bc",
        deviceId: "58a80c52-138c-48fd-8edb-138fd74d12c8",
        ua: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
    },
    _sign: function(params) {
        let t = new Date().getTime();
        let signkey = `${params}&key=${this.common.key}&t=${t}`;
        return {
            key: CryptoJS.SHA1(CryptoJS.MD5(signkey).toString()).toString(),
            t: t
        };
    },
    _request: function(url, params) {
        let sign = this._sign(params);
        return request(url, {
    headers: {
                "User-Agent": this.common.ua,
                "deviceId": this.common.deviceId,
                "sign": sign.key,
                "t": sign.t
            }
        });
    },
    hostJs: $js.toString(() => {
    const hosts = [
        "https://www.sizhengxt.com", 
        "https://www.jiabaide.cn",
        "https://m.9zhoukj.com",
        "https://m.cqzuoer.com"
    ];
    
    console.log('开始检测域名可用性...');
    let selectedHost = hosts[0];
    
    for (let host of hosts) {
        try {
            console.log(`🔍 测试: ${host}`);
            const response = request(host, { 
                timeout: 2000,
                method: 'HEAD'
            });
            
            // 解析响应数据
            const data = JSON.parse(response);
            // 检查 statusCode 是否为 200
            if (data && data.statusCode === 200) {
                console.log(`✅ 域名可用: ${host} (状态码: ${data.statusCode})`);
                selectedHost = host;
                break; // 找到可用的就退出循环
            } else {
                console.log(`❌ 域名不可用: ${host} (状态码: ${data.statusCode})`);
            }
        } catch (error) {
            console.log('使用默认域名');
                selectedHost = hosts[0];
            
        }
    }
    HOST = selectedHost;
    }),
    
    class_name: '电影&电视剧&综艺&动漫',
    class_url: '1&2&3&4',
    /*
    class_parse: $js.toString(() => {
        let responseData = JSON.parse(rule._request(`${rule.host}/api/mw-movie/anonymous/get/filer/type`, {}));
        console.log(`✅responseData的结果: ${JSON.stringify(responseData, null, 4)}`);
    }),
    */
    一级: $js.toString(() => {
        let params = `pageNum=${MY_PAGE}&pageSize=30&sort=1&sortBy=1&type1=${MY_CATE}`;
        let responseData = JSON.parse(rule._request(input, params)).data.list;
        let result = responseData.map(it => ({
            title: it.vodName,
            desc: it.vodRemarks,
            img: it.vodPic,
            url: `/detail/${it.vodId}`
        }));
        setResult(result);
    }),
    二级: $js.toString(() => {
        let id_ = orId.split("/")[2];
        let params = `id=${id_}`;
        let detailResponse = rule._request(
            `${rule.host}/api/mw-movie/anonymous/video/detail?id=${id_}`,
            params
        );
        let detailData = JSON.parse(detailResponse).data;
        VOD = {
            vod_name: detailData.vodName,
            type_name: detailData.ctypeName,
            vod_pic: detailData.vodPic,
            vod_content: detailData.vodContent,
            vod_year: detailData.vodYear,
            vod_area: detailData.vodArea,
            vod_actor: detailData.vodActor || '未知',
            vod_director: detailData.vodDirector || '未知',
            vod_remarks: detailData.vodRemarks || '完结'
        };
        let playUrls = detailData.episodeList.map(it =>
            `${it.name}$${`/vod/play/${id_}/sid/${it.nid}`}`
        );
        VOD.vod_play_from = "金牌";
        VOD.vod_play_url = playUrls.join("#");
    }),
    搜索: $js.toString(() => {
        let d = [];
        let params = `keyword=${KEY}&pageNum=${MY_PAGE}&pageSize=12&type=false`;
        let data = JSON.parse(rule._request(input, params)).data.list; 
        if (rule.search_match) {
            data = data.filter(item =>
                item.vodName &&
                new RegExp(KEY, "i").test(item.vodName)
            );
        }
        data.forEach(item => {
            let title = item.vodName;
            if (!/名称|排除/.test(title)) {
                d.push({
                    title: title,
                    desc: item.vodVersion,
                    img: item.vodPic,
                    url: `/detail/${item.vodId}`,
                });
            }
        });
        setResult(d);
    }),
    lazy: $js.toString(() => {
        let pid = input.split("/")[3];
        let nid = input.split("/")[5];
        let params = `clientType=1&id=${pid}&nid=${nid}`;
        let playData = JSON.parse(rule._request(
            `${rule.host}/api/mw-movie/anonymous/v2/video/episode/url?${params}`,
            params
        )).data;
        let list = playData.list;
        let urls = [];
        list.forEach((it) => {
            urls.push(it.resolutionName, it.url);
        });
        input = {
            parse: 0,
            url: urls
        };
    })
};
const crypto = require('crypto');

function generateMD5(input) {
    return crypto.createHash('md5').update(input).digest('hex');
}

gd = function(e) {
    var t = new Array
      , n = 0;
    for (var i in e)
        t[n] = i,
        n++;
    return t.sort()
}

_d = function e(t) {
    var n;
    if (Array.isArray(t)) {
        for (var r in n = new Array,
        t) {
            var o = t[r];
            for (var i in o)
                null == o[i] ? delete t[r][i] : Array.isArray(t[r][i]) && e(t[r][i])
        }
        return n = t,
        JSON.stringify(n).replace(/^(\s|")+|(\s|")+$/g, "")
    }
    return n = t && t.constructor === Object ? JSON.stringify(t) : t
}

md = function(e) {
    var t = gd(e)
      , n = "";
    for (var i in t) {
        var r = _d(e[t[i]]);
        null != r && "" != r.toString() && (n += t[i] + "=" + r + "&")
    }
    return n
}
pd = function(e, t, time) {
    var n = t + e + time;
    return n = generateMD5(n) //fd为MD5加密对象
}




function get_sign(json_data) {
    headers = {}
    f = (new Date).getTime()
    headers["timestamp"] = f,
    headers["sign"] = (param = json_data,
        time = f,
        t = md(param),
        pd("ghaepVf6IhcHmgnk4NCTXLApxQkBcvh1",
            pd("mwMlWOdyM7OXbjzQPulT1ndRZIAjShDB",
                pd("ZuSj0gwgsKXP4fTEz55oAG2q2p1SVGKK", t, time), time), time))
                return headers
}
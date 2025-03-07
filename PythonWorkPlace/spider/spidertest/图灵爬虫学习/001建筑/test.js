headers = {}

json_data = {
    'eid': '',
    'achievementQueryType': 'and',
    'achievementQueryDto': [],
    'personnelQueryDto': {
        'queryType': 'and',
    },
    'aptitudeQueryDto': {
        'queryType': 'and',
        'nameStr': '',
        'aptitudeQueryType': 'and',
        'businessScopeQueryType': 'or',
        'filePlaceType': '1',
        'aptitudeDtoList': [
            {
                'codeStr': '',
                'queryType': 'and',
                'aptitudeType': 'qualification',
            },
        ],
        'aptitudeSource': 'new',
    },
    'page': {
        'page': 3,
        'limit': 20,
        'field': '',
        'order': '',
    },
}

f = (new Date).getTime()
headers["timestamp"] = f,
headers["sign"] = (param = e.data,
    time = f,
    t = md(param),
    pd("ghaepVf6IhcHmgnk4NCTXLApxQkBcvh1",
        pd("mwMlWOdyM7OXbjzQPulT1ndRZIAjShDB",
            pd("ZuSj0gwgsKXP4fTEz55oAG2q2p1SVGKK", t, time),
            time), time))
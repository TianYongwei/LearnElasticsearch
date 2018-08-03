ES集群：5台都有
"cluster_name" : "es_last7days"
curl -XGET 'http://192.168.55.138:9200/_cluster/health?pretty'
curl -XGET 'http://192.168.55.157:9200/_cluster/health?pretty'
curl -XGET 'http://192.168.55.158:9200/_cluster/health?pretty'
curl -XGET 'http://192.168.55.159:9200/_cluster/health?pretty'
curl -XGET 'http://192.168.55.161:9200/_cluster/health?pretty'


curl 192.168.55.157:9200/_cluster/health?v

curl 192.168.55.157:9200/_cat/indices?pretty

curl -XGET '192.168.55.157:9200/_search?pretty' -H 'Content-Type: application/json' -d'
{
    "query": {
        "match_all": {}
    }
}
'

curl -XDELETE '192.168.55.157:9200/yijian-tyw?pretty&pretty'
curl -XGET '192.168.55.157:9200/_cat/indices?v&pretty'


curl -XGET '192.168.55.157:9200/yijian-common/News/_count?pretty' -H 'Content-Type: application/json' -d'
{
    "query": {
        "match_all": {}
    }
}
'

curl -XGET '192.168.55.157:9200/yijian-common/News/_search?pretty' -H 'Content-Type: application/json' -d'
{
  "query": {
    "term": {
      "timeDay": {
        "value": "2017-08-19"
      }
    }
  }
}
'

curl -XGET '172.31.187.163:9300/yijian-common/News/_search?pretty' -H 'Content-Type: application/json' -d'
{
  "query": {
    "term": {
      "timeDay": {
        "value": "2017-08-19"
      }
    }
  }
}
'

curl -XGET '172.31.187.163:9200/xinhua-common/News/_search?pretty' -H 'Content-Type: application/json' -d'
{
  "query": {
    "term": {
      "pubDay": {
        "value": "2017-09-16"
      }
    }
  }
}
'

curl -XGET '172.31.187.163:9200/xinhua-common/News/_search?pretty' -H 'Content-Type: application/json' -d'
{
  "query": {
    "match_all": {}
  }
}
'

curl -XGET '172.31.187.163:9200/xinhua-common/Socials/_search?pretty' -H 'Content-Type: application/json' -d'
{
  "query": {
    "match_all": {}
  }
}
'

curl -XGET '192.168.55.157:9200/yijian-common/News/_search?pretty' -H 'Content-Type: application/json' -d'
{
  "query": {
    "range" : {
    "timeDay" : {
        "gt" : "2017-07-19"
    }
}
  }
}
'

"range" : {
    "timestamp" : {
        "gt" : "now-1h"
    }
}
curl -XGET '192.168.55.157:9200/yijian-common/News/_search?pretty' -H 'Content-Type: application/json' -d'
{
  "query": {
    "term": {
      "uuid": "801504739236880571F1AFAEFEBA5F2"
    }
  }
}
'

curl -XGET '192.168.55.157:9200/yijian-common/News/_search?pretty' -H 'Content-Type: application/json' -d'
{
 "_source": {
    "include": [
      "a",
      "b"
    ]
  },
  "query": {
    "term": {
      "finger": "23016915"
    }
  }
}
'

curl -XGET '192.168.55.157:9200/yijian/News/_search?pretty' -H 'Content-Type: application/json' -d'
{
  "query": {
    "term": {
      "uuid": "311498658340131AAC01CC34D7D6C7B"
    }
  }
}
'

curl -XGET '192.168.55.157:9200/yijian/News/_search?pretty' -H 'Content-Type: application/json' -d'
{
  "query": {
    "filtered": {
      "query": {},
      "filter": {
        "missing": {
          "field": "dayOrHistory"
        }
      }
    }
  }
}
'



curl -XDELETE '192.168.55.157:9200/yijian?pretty&pretty'
curl -XGET 'localhost:9200/_cat/indices?v&pretty'



curl -XGET '192.168.55.157:9200/yijian/_mapping/News?pretty'


curl 192.168.55.157:8081/esmanager/index/crt/yijian
curl 192.168.55.157:8081/esmanager/index/del/yijian
curl 192.168.55.157:8081/esmanager/mapping/crt/yijian/news
curl 192.168.55.157:8081/esmanager/mapping/crt/yijian/socials

curl 192.168.55.157:8877/history/data/subject/595bbd992b8a9b45b9191ca2

========

# bool 查询
GET xinhua-2018-5-10,xinhua-2018-5-3,xinhua-2018-5-2,xinhua-2018-4-26/News/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "match_phrase": {
            "textSrc": "中国联通"
          }
        },
        {
          "term": {
            "mediaTname": {
              "value": "APP"
            }
          }
        },
        {
          "range": {
            "pubDay": {
              "gte": "2018-01-01",
              "lte": "2018-03-31"
            }
          }
        }
      ]
    }
  }
}

# 聚合
GET xinhua-2018-5-10/News/_search
{
    "size": 0, 
    "aggs" : { 
        "zewen" : { 
            "terms" : { 
              "field" : "mediaTname",
              "size": 100,
              "order": {
                "_term": "desc"
              }
            }
        }
    }
}

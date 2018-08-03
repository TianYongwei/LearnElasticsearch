curl 172.31.187.163:9200/_cluster/health?v

curl 172.31.187.163:9200/_cat/indices?pretty

curl -XGET '172.31.187.163:9200/_search?pretty' -H 'Content-Type: application/json' -d'
{
    "query": {
        "match_all": {}
    }
}
'

curl -XDELETE '172.31.187.163:9200/yijian-tyw?pretty&pretty'
curl -XGET '172.31.187.163:9200/_cat/indices?v&pretty'


curl -XGET '172.31.187.163:9200/xinhua/News/_count?pretty' -H 'Content-Type: application/json' -d'
{
    "query": {
        "match_all": {}
    }
}
'

curl -XGET '172.31.187.163:9200/xinhua/Socials/_search?pretty' -H 'Content-Type: application/json' -d'
{
  "query": {
    "term": {
      "sourceType": {
        "value": "weibo"
      }
    }
  }
}
'

curl -XGET '172.31.187.163:9300/xinhua/News/_search?pretty' -H 'Content-Type: application/json' -d'
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


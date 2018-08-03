# 删除命令
#
curl -XPOST '172.31.187.163:9200/xinhua-common/News/_delete_by_query?pretty' -H 'Content-Type: application/json' -d'
{
  "query": {
    "range": {
      "pubdate": {
        "lt": "2017-07-10 00:00:00"
      }
    }
  }
}
'
# 查询命令
#
curl -XGET '172.31.187.163:9200/xinhua-common/News/_count?pretty' -H 'Content-Type: application/json' -d'
{
  "query": {
    "range": {
      "pubdate": {
        "lt": "2017-07-10 00:00:00"
      }
    }
  }
}
'

curl -XGET '172.31.187.163:9200/xinhua-common/_mapping/News?pretty'
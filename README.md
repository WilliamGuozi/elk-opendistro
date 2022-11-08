# ELK-opendistro

For log collection and monitor

## Getting started


* `opensearch-dashborad`
  - log query view platform
* `opensearch-node`
  - log store database
* `search-guard-tlstool`
  - tls certificate generate tool
* `elastalert`
  - log alert tool by query keyword period
* `log-pilot`
  - log collector tool


## Test and Deploy

```bash

plugins/opensearch-security/tools/hash.sh -p <new-password>
docker-compose build
docker-compose up -d search-guard-tlstool
sleep 5
chmod -R 777 /opt/elk/data1 /opt/elk/data2
docker-compose up -d
update filebeat role permissions
```

***
## Reference

https://opensearch.org/
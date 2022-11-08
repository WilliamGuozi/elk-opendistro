## 启动命令


```bash
#!/bin/bash
#
# Created by William Guozi
#

# 获取镜像地址
DOCKER_IMAGE="${1:-williamguozi/log-pilot-filebeat:docker-210702}"

# 判断容器是否存在，并将其删除
docker pull $DOCKER_IMAGE && \
docker ps -a | awk -F' ' '{print $NF}' | grep ops-log-pilot-filebeat && \
docker stop ops-log-pilot-filebeat && \
docker rm -f ops-log-pilot-filebeat || \
echo "Image $DOCKER_IMAGE pull failed or No container ops-log-pilot-filebeat."

# 启动容器
    docker run -d \
   --name ops-log-pilot-filebeat \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -v /etc/localtime:/etc/localtime \
   -v /:/host:ro \
   --cap-add SYS_ADMIN \
   -e PILOT_LOG_PREFIX=dc \
   -e LOGGING_OUTPUT=elasticsearch \
   -e ELASTICSEARCH_SCHEME=https \
   -e ELASTICSEARCH_HOST=es-ops.example.com \
   -e ELASTICSEARCH_PORT=9200 \
   -e ELASTICSEARCH_INDEX="%{[docker_container]}" \
   -e ELASTICSEARCH_USER=admin \
   -e ELASTICSEARCH_PASSWORD=admin \
   -e SSL_VERIFICATION_MODE=none \
   -e FILEBEAT_MAX_PROCS=4 \
   -e ELASTICSEARCH_WORKER=4 \
   -e ELASTICSEARCH_BULK_MAX_SIZE=15000 \
   --cpus "2" \
   -m 4G \
   --restart=always \
   $DOCKER_IMAGE
```

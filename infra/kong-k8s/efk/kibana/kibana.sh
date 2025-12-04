#!/bin/bash
helm uninstall kibana -n logs 2>/dev/null || true
sleep 10

  helm install kibana elastic/kibana \
    --version=7.17.1 \
    --namespace=logs \
    --set service.type=NodePort \
    --set service.nodePort=31000 \
    --set resources.requests.cpu="100m" \
    --set resources.requests.memory="512Mi" \
    --set resources.limits.cpu="500m" \
    --set resources.limits.memory="1Gi" \
    --set elasticsearchHosts="http://elasticsearch-master:9200" \
    --set elasticsearchUsername="elastic" \
    --set elasticsearchPassword="changeme" \
    --set env.NODE_OPTIONS="-Xmx512m -Xms512m"
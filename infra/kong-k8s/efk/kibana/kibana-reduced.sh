#!/bin/bash
helm install kibana elastic/kibana \
  --version=7.17.1 \
  --namespace=logs \
  --set service.type=NodePort \
  --set service.nodePort=31000 \
  --set resources.requests.cpu="100m" \
  --set resources.requests.memory="256Mi" \
  --set resources.limits.cpu="500m" \
  --set resources.limits.memory="512Mi"
#!/usr/bin/env bash
set -e

kubectl --namespace tekton-pipelines port-forward svc/tekton-dashboard 9097:9097

http://localhost:9097

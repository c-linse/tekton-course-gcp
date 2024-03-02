#!/usr/bin/env bash
set -e

kubectl delete pipelinerun --all

kubectl apply -f 7.03_pr.yaml

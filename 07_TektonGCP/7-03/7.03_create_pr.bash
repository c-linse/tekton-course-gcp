#!/usr/bin/env bash
set -e

kubectl delete pipelinerun --all

kubectl apply -f pr.yaml

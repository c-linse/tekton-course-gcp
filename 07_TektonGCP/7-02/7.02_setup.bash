#!/usr/bin/env bash
set -e

kubectl config use gke_peerless-fabric-414907_europe-west3-c_tekton-cluster

kubectl delete taskrun --all
kubectl delete pipelinerun --all

#kubectl apply -f ./secrets/
kubectl apply -f ./tasks/
kubectl apply -f ./pipelines/
kubectl apply -f ./trigger/

kubectl patch serviceaccount default -n default --patch '{"secrets": [{"name": "07-git-credentials"}]}'

tkn hub install task git-clone --version 0.9 --namespace default
tkn hub install task golangci-lint --version 0.2 --namespace default
tkn hub install task golang-test --version 0.2 --namespace default
tkn hub install task buildah --version 0.7 --namespace default

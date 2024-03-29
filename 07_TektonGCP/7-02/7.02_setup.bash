 #!/usr/bin/env bash
set -e

kubectl config use gke_peerless-fabric-414907_europe-west3-c_tekton-cluster

kubectl delete taskrun --all
kubectl delete pipelinerun --all

#kubectl apply -f ./secrets/
kubectl apply -f ./tasks/
kubectl apply -f ./rbac/
kubectl apply -f ./pipelines/
kubectl apply -f ./trigger/

kubectl patch serviceaccount default -n default --patch '{"secrets": [{"name": "7-02-git-repo-secret"}]}'

tkn hub install task git-clone --version 0.9 --namespace default || true
tkn hub install task golangci-lint --version 0.2 --namespace default || true
tkn hub install task golang-test --version 0.2 --namespace default || true
tkn hub install task buildah --version 0.7 --namespace default || true
tkn hub install task helm-upgrade-from-repo --version 0.2 --namespace default || true
tkn hub install task github-set-status --version 0.4 --namespace default || true

#!/usr/bin/env bash

set -e

tekton_cluster="tekton-cluster"
tekton_version="v0.52.0"
tekton_triggers_version="v0.25.3"
tekton_dashboard_version="v0.43.0"

kubectl config use gke_peerless-fabric-414907_europe-west3-c_tekton-cluster
kubectl config current-context
kubectl apply --filename "https://storage.googleapis.com/tekton-releases/pipeline/previous/${tekton_version}/release.yaml"
kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/previous/${tekton_triggers_version}/release.yaml
kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/previous/${tekton_triggers_version}/interceptors.yaml
kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/previous/${tekton_dashboard_version}/release.yaml

echo "Setup has been finished. Checkout with the following commands:"
printf "%s\t" "kubectl get pods -n tekton-pipelines"
printf "\n%s\n" "kubectl get pods -n tekton-pipelines-resolvers"

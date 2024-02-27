#!/usr/bin/env bash
set -e

gcloud container clusters resize tekton-cluster --num-nodes=1 --zone=europe-west3-c -q
kubectl config use gke_peerless-fabric-414907_europe-west3-c_tekton-cluster

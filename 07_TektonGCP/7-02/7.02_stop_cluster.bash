#!/usr/bin/env bash
set -e

gcloud container clusters resize tekton-cluster --num-nodes=0 --zone=europe-west3-c -q

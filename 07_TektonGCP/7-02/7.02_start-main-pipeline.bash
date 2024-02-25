#!/usr/bin/env bash
set -e

kubectl delete pipelinerun --all
tkn pipeline start \
go-pipeline \
-w name=shared-workspace,claimName=07-test \
-w name=dockerconfig-ws,secret=dockerconfig-secret \
-w name=helm-workspace,emptyDir=Memory \
--use-param-defaults \
--showlog

#!/usr/bin/env bash
set -e

kubectl delete pipelinerun --all

tkn pipeline start \
07-go-pipeline \
--param git-url="https://github.com/c-linse/go-add-app.git" \
--param git-repo-full-name="c-linse/go-add-app" \
--param git-revision="dd7812e5c13d9769cbd7b5ea2ce628811a323033" \
--param app-name="go-add-app" \
--param image-tag="latest" \
--param chart-tag="1.0.0" \
--param is-main-branch=true \
-w name=shared-workspace,claimName=07-test \
-w name=dockerconfig-ws,secret=07-dockerconfig-secret \
-w name=helm-workspace,emptyDir=Memory \
--use-param-defaults \
--showlog

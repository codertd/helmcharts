#!/bin/bash

echo 'Helm init'
/home/tdoyle/.local/bin/helm init

sleep 2

echo 'Creating Tiller Account'
/usr/bin/kubectl --namespace kube-system create serviceaccount tiller

/bin/sleep 2

echo 'Assigning role'
/usr/bin/kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

/bin/sleep 10

echo 'Patch tiller-deploy'
/usr/bin/kubectl --namespace kube-system patch deploy tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}' 

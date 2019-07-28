#!/bin/bash

/usr/bin/kubectl --namespace kube-system create serviceaccount tiller

/usr/bin/kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

/usr/bin/kubectl --namespace kube-system patch deploy tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}' 

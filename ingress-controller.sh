#!/bin/bash

helm uninstall streak-ingress --namespace nginx-ingress
helm repo remove ingress-nginx
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm upgrade --install streak-ingress ingress-nginx/ingress-nginx --debug \
        --namespace nginx-ingress \
        --set controller.replicaCount=2 \
        --set controller.ingressClass="nginx" \
        --set controller.ingressClassResource.name="nginx" \
        --set controller.ingressClassResource.enabled="true" \
        --set controller.ingressClassResource.default="false" \
        --set controller.ingressClassResource.controllerValue="k8s.io/internal-ingress-nginx" \
        --set controller.nodeSelector."kubernetes\.io/os"=linux \
        --set defaultBackend.nodeSelector."kubernetes\.io/os"=linux \
	--set controller.service.loadBalancerIP="10.160.0.11"

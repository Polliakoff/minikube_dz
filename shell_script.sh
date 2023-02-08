#!/bin/bash

echo
echo "Pull and create necessary images"
echo
eval $(minikube docker-env)
docker compose pull
docker compose build

echo
echo "Create Kubernetes secret from file"
echo
kubectl apply -f db-password-secret.yaml

echo
echo "Create database deployment and service"
echo
kubectl apply -f db-deployment.yaml
kubectl apply -f db-service.yaml

echo
echo "Create webapp deployment and service"
echo
kubectl apply -f webapp-deployment.yaml
kubectl apply -f webapp-service.yaml

echo
echo "Check Kubernetes configuration"
echo
sleep 5
echo
echo "-- Secrets"
echo
kubectl get secrets
echo
echo "-- Pods"
echo
kubectl get pods
echo
echo "-- Services"
echo
kubectl get services





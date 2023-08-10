#!/usr/bin/env bash

set -eux -o pipefail

# This script is used to deploy the `Sensor` and the `Workflow` (casting it as a `ConfigMap`) to the cluster.
# To run this, you will need to have the following installed:
# - kubectl
# - kustomize

# If kubectl context gke_ce-builder_us-central1_ce-builder does not exist, create it
if ! kubectl config get-contexts gke_ce-builder_us-central1_ce-builder &> /dev/null; then
    gcloud container clusters get-credentials ce-builder --region us-central1 --project ce-builder
fi

# Set the kubectl context to gke_ce-builder_us-central1_ce-builder
kubectl config use-context gke_ce-builder_us-central1_ce-builder

# Deploy to the cluster
kustomize build . | kubectl apply -f -

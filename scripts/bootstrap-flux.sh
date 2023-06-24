#!/bin/bash


read -p -r "Press Enter to apply bootstrap-flux' or Ctrl+C to cancel."
kubectl apply --server-side --kustomize ./kubernetes/bootstrap/flux

# Apply Flux bootstrap configuration

read -p -r "Press Enter to apply 'sops --decrypt kubernetes/bootstrap/flux/age-key.sops.yaml' or Ctrl+C to cancel."

# Apply decrypted secrets
sops --decrypt kubernetes/bootstrap/flux/age-key.sops.yaml | kubectl apply -f -


read -p -r "Press Enter to apply 'sops --decrypt kubernetes/bootstrap/flux/github-deploy-key.sops.yaml' or Ctrl+C to cancel."
sops --decrypt kubernetes/bootstrap/flux/github-deploy-key.sops.yaml | kubectl apply -f -

read -p -r "Press Enter to apply 'sops --decrypt kubernetes/flux/vars/cluster-secrets.sops.yaml' or Ctrl+C to cancel."
sops --decrypt kubernetes/flux/vars/cluster-secrets.sops.yaml | kubectl apply -f -

read -p -r "Press Enter to apply 'sops --decrypt kubernetes/flux/vars/cluster-settings.yaml' or Ctrl+C to cancel."
sops --decrypt kubernetes/flux/vars/cluster-settings.yaml | kubectl apply -f -



read -p -r "Press Enter to apply config' or Ctrl+C to cancel."
kubectl apply --server-side --kustomize ./kubernetes/flux/config

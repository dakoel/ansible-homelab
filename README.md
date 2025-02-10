# ansible-homelab

This repository contains an Ansible-based setup for deploying a k3s cluster and installing ArgoCD with predefined applications.

## Overview

The main entry point is [`site.yaml`](./playbooks/site.yaml), which:

- Deploys a k3s cluster
- Installs ArgoCD
- Loads the [argocd-homelab](https://github.com/dakoel/argocd-homelab) repository into ArgoCD
- Deploys applications defined in the `argocd-homelab` repository

## Features

- Simple multipass-based environment setup
- Automated cluster deployment and configuration
- Helm and sealed-secrets preinstalled
- ArgoCD-based GitOps workflow

## Usage

The easiest way to set up the environment is to install [Task](https://taskfile.dev/) and use the provided [Taskfile.yaml](./Taskfile.yaml). For the playbooks to work, you need to create a `.vault-pass` file and use it to regenerate the encrypted variables (see [Ansible Vault](https://docs.ansible.com/ansible/latest/vault_guide/vault_encrypting_content.html)).

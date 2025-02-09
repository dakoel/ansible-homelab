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
- ArgoCD-based GitOps workflow

## Usage

To set up the environment, use the provided Taskfile.

# Docs Builder

Building is done by [Argo Workflows](https://argoproj.github.io/argo-workflows/) and [Argo Events](https://argoproj.github.io/argo-events/)
is used to automatically trigger builds when new commits are pushed to the repository.

- [spfi-docs-public-wf.yaml](spfi-docs-public-wf.yaml) - This is the `Workflow` definition.  Here you can define the steps to build. In its simplest form, it can call an existing `WorkflowTemplate`  (more on this later).
- [repo-sensor.yaml](repo-sensor.yaml) - This defines the "Sensor" which will trigger the [spfi-docs-public-wf.yaml](spfi-docs-public-wf.yaml) `Workflow` when a new commit is pushed to the repository.
- [kustomization.yaml](kustomization.yaml) - This is the `Kustomization` definition.  It helps deploy the `Workflow` and `Sensor` to the cluster.
- [deploy-sensor.sh](deploy-sensor.sh) - This is a helper script to deploy the `Workflow` and `Sensor` to the cluster.
- [submit-wf.sh](submit-wf.sh) - This is a helper script to submit the `Workflow` to the cluster. This can be run at any time to manually trigger a build.

## Workflow Templates

There are a number of predefined `WorkflowTemplate`s. These are shared across
all projects. These workflows are defined in an internal private repo.

This workflow runs a subset of what we run when building the docs when a PR is
published against this repo.

We acknowledge that contributors may have a limited view of these builds. If
this causes a problem for you please feel free to contact the maintainers of
this project and we'll be happy to help.

# flask-app Helm chart

This chart deploys the `bharathchatakondu/flask-docker-app` container on Kubernetes.

Quick install (local cluster or configured kubeconfig):

```bash
helm repo add localfile "file://charts"
helm install my-flask charts/flask-app
```

To create a ServiceAccount and enable it in the chart, set in `values.yaml`:

```yaml
serviceAccount:
  create: true
  name: ""
```

Customize image, replicas, resources and service type in `values.yaml`.

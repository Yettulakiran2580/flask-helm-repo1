# flask-helm-repo1

This repository contains a Helm chart to deploy a Flask application container image `bharathchatakondu/flask-docker-app`.

Local validation and install:

```bash
# Lint the chart
helm lint charts/flask-app

# Install (requires kubectl context)
helm install my-flask charts/flask-app
```

CI: A GitHub Actions workflow in `.github/workflows/helm-deploy.yml` can lint and deploy the chart if a `KUBECONFIG` secret is provided.
# flask-helm-repo1
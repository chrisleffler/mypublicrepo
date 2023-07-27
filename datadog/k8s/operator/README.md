## Install

1. Install [Helm](https://v3.helm.sh/docs/intro/install/)

2. Add Datadog's Helm repo

```bash
helm repo add datadog https://helm.datadoghq.com
helm repo update
```

3. Create a namespace for Datadog

```bash
kubectl create ns datadog
```

4. Create a secret with a Datadog API key.

```bash
kubectl create secret generic datadog-secret --from-literal api-key=<DATADOG_API_KEY> --from-literal app-key=<DATADOG_APP_KEY>

```

5. Deploy the operator datadog-agent.yaml  

```bash
kubectl apply -f /path/to/your/datadog-agent.yaml
```
## Install

1. Install [Helm](https://v3.helm.sh/docs/intro/install/)

2. Create a namespace for Datadog

```bash
kubectl create ns datadog
```

3. Add Datadog's Helm repo

```bash
helm repo add datadog https://helm.datadoghq.com
helm repo update
helm install datadog-operator datadog/datadog-operator -n datadog
```

4. Create a secret with a Datadog API key.

```bash
kubectl create secret generic datadog-secret -n datadog --from-literal api-key=<DATADOG_API_KEY>

```

5. Deploy the appropriate operator's datadog-agent.yaml

- [EKS](eks-datadog-agent.yaml)
- [OCP](ocp-datadog-agent.yaml)

with the following command:

```bash
kubectl apply -f /path/to/your/datadog-agent.yaml
```
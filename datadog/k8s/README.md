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
kubectl create secret generic datadog-keys -n datadog --from-literal=api-key=<API-KEY>
```

5. Deploy the distribution specific values.yaml  

- [EKS](eks-values.yaml)
- [EKS on Bottlerocket](eks-values-bottlerocket.yaml)
- [Red Hat OpenShift Container Platform v4](ocp-values.yaml)
- [AKS](aks-values.yaml)
- [GKE](gke-values.yaml)

```bash
helm install datadog datadog/datadog -n datadog -f values.yaml
```
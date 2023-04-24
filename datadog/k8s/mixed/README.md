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

5. Deploy the OS specific values.yaml. Deploy Linux first then Windows.  

- [LINUX](eks-values-linux.yaml)
- [WIN](eks-values-win.yaml)

```bash
helm install datadog-linux datadog/datadog -n datadog -f eks-values-linux.yaml
```

```bash
helm install datadog-win datadog/datadog -n datadog -f eks-values-win.yaml
```
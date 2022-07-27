## Install

1. Install [Helm](https://v3.helm.sh/docs/intro/install/).

2. Add Vectors's Helm repo.

```bash
helm repo add vector https://helm.vector.dev
helm repo update
```

3. Create a namespace for Vector.

```bash
kubectl create ns vector
```

4. Create a secret with a Datadog Observability Pipeline keys.

```bash
kubectl create secret generic vector-keys -n vector --from-literal=op-api-key=<API-KEY> --from-literal=op-app-key=<API-KEY> --from-literal=op-conf-key=<API-KEY>
```

5. Create a secret with a Datadog Sink API key(s).

```bash
kubectl create secret generic dd-sand-keys -n vector --from-literal=sand-api-key=<API-KEY> --from-literal=sand2-api-key=<API-KEY>
```

6. Deploy the Vector [vector-values.yaml](values.yaml).

```bash
helm install vector vector/vector -n vector -f vector-values.yaml
```

7. [Install the Datadog Agent on the cluster](../../datadog/k8s/).
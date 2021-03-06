apiVersion: helm.toolkit.fluxcd.io/v2beta1
kind: HelmRelease
metadata:
# Change the Helm release name
  name: <CHANGEME>

# Don't change the fields below
  namespace: flux-system
spec:
  interval: 1m
  chart:
    spec:
      chart: ./charts/capi-vsphere
      sourceRef:
        kind: GitRepository
        name: capi-vsphere
        namespace: flux-system
      interval: 1m
      valuesFiles:
        - charts/capi-vsphere/values.yaml 

# Adjust fields below for the new cluster.
# Beware of IP/subnet duplicates.
# CIDR block should be on a different subnet as the vip.
  values:
    cluster:
      name: cluster-xx
      cidrblocks: 172.xx.0.0/16
      vip: 192.168.1.x
    controllers:
      replicas: 1
    workers:
      replicas: 1

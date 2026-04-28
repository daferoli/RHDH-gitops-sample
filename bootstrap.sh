# This can be used in a new cluster to setup the gitops server before applying any applications
# Make sure you're logged into the cluster before running
helm upgrade -i openshift-gitops helm-charts/operator-installer -f .bootstrap/values.yaml -n openshift-operators --create-namespace
oc apply -f .bootstrap/cluster-rolebinding.yaml
envsubst < .bootstrap/argocd.yaml | oc apply -f -
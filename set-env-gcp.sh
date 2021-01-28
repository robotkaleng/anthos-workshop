
export BASE_DIR=$(pwd)
export WORK_DIR=$BASE_DIR/workdir
export PATH=$PATH:$WORK_DIR/bin:
export PROJECT=$(gcloud config get-value project)

export ISTIO_VERSION=1.3.2
export KUBECTX_VERSION=v0.7.0
export HELM_VERSION=v2.14.3

export CLUSTER_NAME="central"
export CLUSTER_ZONE="us-central1-b"
export CLUSTER_KUBECONFIG=$WORK_DIR/$CLUSTER_NAME.context

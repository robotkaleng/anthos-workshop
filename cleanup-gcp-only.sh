#!/usr/bin/env bash

# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Variables

if [[ $OSTYPE == "linux-gnu" && $CLOUD_SHELL == true ]]; then 
    # if user is cleaning up from a refreshed shell, this needs to be done
    source ./env

    export PROJECT=$(gcloud config get-value project)
    export WORK_DIR=${WORK_DIR:="${PWD}/workdir"}

    echo "WORK_DIR set to $WORK_DIR"

    gcloud config set project $PROJECT

    echo -e "\nMultiple tasks are running asynchronously to cleanup your environment.  It may appear frozen, but you can check the logs in $WORK_DIR for additional details in another terminal window."

    ./gke/cleanup-gke.sh &> ${WORK_DIR}/cleanup-gke.log &

    wait

    rm -rf $WORK_DIR

    # Delete config-repo from CSR
    gcloud source repos delete config-repo --quiet

    # Delete remaining files and folders
    rm -rf $HOME/.kube/config \
           $HOME/config-repo \
           $HOME/csm-alpha-onboard-logs \
           $HOME/gopath \
           $HOME/.ssh/id_rsa.nomos.*

else
    echo "This has only been tested in GCP Cloud Shell.  Only Linux (debian) is supported".
fi

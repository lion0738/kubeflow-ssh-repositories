#/bin/bash

images=(
    "codeserver-python"
)

for image in "${images[@]}"; do
    buildah bud \
        --build-arg BASE_IMG=ghcr.io/kubeflow/kubeflow/notebook-servers/${image}:v1.10.0 \
        --tag knu-kubeflow.duckdns.org:30500/${image}-ssh:v1.10.0 \
        -f Dockerfile .
    buildah push knu-kubeflow.duckdns.org:30500/${image}-ssh:v1.10.0
done
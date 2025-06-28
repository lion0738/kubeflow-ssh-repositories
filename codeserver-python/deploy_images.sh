#/bin/bash

images=(
    "codeserver-python"
)

for image in "${images[@]}"; do
    buildah bud \
        --build-arg BASE_IMG=ghcr.io/kubeflow/kubeflow/notebook-servers/${image}:v1.10.0 \
        --tag harbor.knu-kubeflow.duckdns.org/kubeflow-images/${image}-ssh:v1.10.0 \
        -f Dockerfile .
    buildah push harbor.knu-kubeflow.duckdns.org/kubeflow-images/${image}-ssh:v1.10.0
done
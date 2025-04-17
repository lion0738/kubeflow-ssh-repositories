#/bin/bash

#jupyter-pytorch-cuda-full, jupyter-pytorch-full, jupyter-pytorch-gaudi-full
#jupyter-tensorflow-cuda-full, jupyter-tensorflow-full
#jupyter-scipy, jupyter
images=(
    "jupyter-pytorch-cuda-full"
    "jupyter-pytorch-full"
    "jupyter-pytorch-gaudi-full"
    "jupyter-tensorflow-cuda-full"
    "jupyter-tensorflow-full"
    "jupyter-scipy"
    "jupyter"
)

for image in "${images[@]}"; do
    buildah bud \
        --build-arg BASE_IMG=ghcr.io/kubeflow/kubeflow/notebook-servers/$image:v1.10.0 \
        --tag docker.io/lion0738/${image}-ssh:v1.10.0 \
        -f Dockerfile .
    buildah push docker.io/lion0738/${image}-ssh:v1.10.0
done
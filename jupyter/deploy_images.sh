#/bin/bash

#jupyter-pytorch-cuda-full, jupyter-pytorch-full, jupyter-pytorch-gaudi-full
#jupyter-tensorflow-cuda-full, jupyter-tensorflow-full
#jupyter-scipy, jupyter
images=(
    "jupyter-tensorflow-cuda-full"
    "jupyter-scipy"
)

for image in "${images[@]}"; do
    buildah bud \
        --build-arg BASE_IMG=ghcr.io/kubeflow/kubeflow/notebook-servers/$image:v1.10.0 \
        --tag ghcr.io/lion0738/${image}-ssh:v1.10.0 \
        -f Dockerfile .
    buildah push ghcr.io/lion0738/${image}-ssh:v1.10.0
done
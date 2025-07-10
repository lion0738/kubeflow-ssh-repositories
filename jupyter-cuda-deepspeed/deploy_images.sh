#/bin/bash

#jupyter-pytorch-cuda-full, jupyter-pytorch-full, jupyter-pytorch-gaudi-full
#jupyter-tensorflow-cuda-full, jupyter-tensorflow-full
#jupyter-scipy, jupyter
images=(
    "jupyter-pytorch-cuda-full-deepspeed"
)

for image in "${images[@]}"; do
    buildah bud \
        --build-arg BASE_IMG=harbor.knu-kubeflow.duckdns.org/kubeflow-images/jupyter-pytorch-cuda-full-ssh:v1.10.0 \
        --tag harbor.knu-kubeflow.duckdns.org/kubeflow-images/${image}-ssh:v1.10.0 \
        -f Dockerfile .
    buildah push harbor.knu-kubeflow.duckdns.org/kubeflow-images/${image}-ssh:v1.10.0
done
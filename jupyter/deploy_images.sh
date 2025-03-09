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
    docker build --build-arg BASE_IMG=docker.io/kubeflownotebookswg/$image:v1.9.2 --tag "docker.io/lion0738/$image-ssh" -f Dockerfile .
    docker push "docker.io/lion0738/$image-ssh"
done
#/bin/bash

images=(
    "codeserver-python"
)

for image in "${images[@]}"; do
    docker build --build-arg BASE_IMG=docker.io/kubeflownotebookswg/$image:v1.9.2 --tag "docker.io/lion0738/$image-ssh" -f Dockerfile .
    docker push "docker.io/lion0738/$image-ssh"
done
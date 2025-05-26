ARG BASE_IMG=<base>
FROM $BASE_IMG

USER root

RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub
RUN add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /"

RUN apt-get -yq update \
 && apt-get -yq install --no-install-recommends \
    openssh-server \
    cuda-toolkit-12-4 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade numpy transformers accelerate deepspeed minio s3fs --no-cache-dir

COPY --chown=${NB_USER}:${NB_GID} --chmod=755 s6/ /etc
ARG BASE_IMG=<base>
FROM $BASE_IMG

USER root

RUN apt-get -yq update \
 && apt-get -yq install --no-install-recommends \
    openssh-server \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade numpy transformers accelerate minio s3fs datasets evaluate trl diffusers hub peft --no-cache-dir

COPY --chown=${NB_USER}:${NB_GID} --chmod=755 s6/ /etc
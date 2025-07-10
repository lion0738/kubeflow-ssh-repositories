ARG BASE_IMG=<base>
FROM $BASE_IMG

USER root

RUN pip install --upgrade numpy transformers accelerate minio s3fs datasets evaluate trl diffusers hub peft --no-cache-dir

COPY --chown=${NB_USER}:${NB_GID} --chmod=755 s6/ /etc
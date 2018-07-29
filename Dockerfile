FROM dclong/jupyter:conda3

RUN conda install -y -c conda-forge \
        nodejs=8.11.3 \
        jupyterlab

COPY scripts /scripts
COPY settings /settings

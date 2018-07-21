FROM dclong/jupyter:conda3

RUN conda install -y -c conda-forge \
        nodejs \
        jupyterlab

COPY scripts /scripts
COPY settings /settings

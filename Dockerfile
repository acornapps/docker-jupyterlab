FROM dclong/jupyter:conda3

RUN conda install -y -c conda-forge \
        nodejs \
        jupyterlab \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter labextension install @mflevine/jupyterlab_html \
    && jupyter lab build

COPY scripts /scripts
COPY settings /settings

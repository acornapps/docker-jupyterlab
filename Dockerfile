FROM dclong/jupyter:conda3

RUN conda install -y -c conda-forge \
        nodejs=8.11.3 \
        jupyterlab \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter labextension install jupyterlab-flake8 \
    && jupyter labextension install @mflevine/jupyterlab_html

COPY scripts /scripts
COPY settings /settings

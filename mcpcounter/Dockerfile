FROM continuumio/miniconda3:4.9.2

LABEL org.opencontainers.image.source https://github.com/icgc-argo-rna-wg/deconvolute-cell-types

# add ps (required by nextflow)
RUN apt-get --allow-releaseinfo-change update  && \
    apt-get install -y procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# install MCPCounter
RUN /opt/conda/bin/conda install --yes -c conda-forge r-base=4.0.3 r-optparse=1.6.6 r-devtools=2.4.2 r-curl=4.3.2 r-memoise=2.0.0
RUN R -e "devtools::install_github('ebecht/MCPcounter',ref='master', subdir='Source')"

# Add main wrapper:
RUN mkdir -p /tools
ENV PATH="/tools:${PATH}"
COPY runMCPCounter.R /tools/


ENTRYPOINT ["/usr/bin/env"]

CMD ["/bin/bash"]

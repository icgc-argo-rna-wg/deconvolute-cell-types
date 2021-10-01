FROM continuumio/miniconda3:4.9.2

LABEL org.opencontainers.image.source https://github.com/icgc-argo-rna-wg/deconvolute-cell-types

# add ps (required by nextflow)
RUN apt-get --allow-releaseinfo-change update  && \
    apt-get install -y procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# install MCPCounter
RUN /opt/conda/bin/conda install --yes  -c bioconda r-mcpcounter=1.1.0 r-optparse=1.3.2

# Add main wrapper:
RUN mkdir -p /tools
COPY runMCPCounter.R /tools/
ENV PATH="/tools:${PATH}"

ENTRYPOINT ["/usr/bin/env"]

CMD ["/bin/bash"]

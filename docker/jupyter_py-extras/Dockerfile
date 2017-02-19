FROM jupyter/all-spark-notebook

RUN conda install --quiet --yes -n python2 pymongo nltk gensim && \
    conda clean -tipsy
RUN pip2 install -U jsonpath_rw


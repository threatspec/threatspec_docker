FROM python:3.8.7-alpine3.12 as builder
LABEL maintainer="joubin.jabbari@owasp.org"

ARG PIP=true
ARG BRANCH=master
RUN apk update && apk add graphviz graphviz-dev libmagic musl-dev git ttf-freefont && rm -rf /var/cache/apk/* && pip install libmagic

RUN if [[ ${PIP} == true ]] ;\
then \
pip install threatspec; \
else \
echo "Building from source" ;\
cd /tmp ; \
git clone https://github.com/threatspec/threatspec.git ; \
cd threatspec ; \
git checkout ${BRANCH} ;\
python setup.py install; \
cd /tmp && rm -rf *; \
fi

RUN threatspec --version

RUN cd /tmp && git clone https://github.com/threatspec/threatspec_examples.git && cd threatspec_examples && threatspec init && threatspec run && threatspec report && rm -rf /tmp/*

ENTRYPOINT [ "threatspec" ]
FROM openjdk:19-alpine3.16

RUN apk add --update bash wget unzip && \
    rm -rf /var/cache/apk/*

# readme
# https://docs.search-guard.com/latest/tls-certificates-sample-scripts
# https://git.floragunn.com/search-guard/legacy/search-guard-ssl

RUN wget https://search.maven.org/remotecontent?filepath=com/floragunn/search-guard-tlstool/1.5/search-guard-tlstool-1.5.zip \
    -O search-guard-tlstool.zip && \
    unzip search-guard-tlstool.zip && \
    rm -f search-guard-tlstool.zip

ENV PATH $PATH:/tools
WORKDIR /tools

COPY tls-tool_certificate_config.yml ./
COPY docker-entrypoint.sh /


ENTRYPOINT ["/docker-entrypoint.sh"]

# readme
# https://github.com/xtermi2/elasticsearch-searchguard/tree/6.8.0/example
FROM alpine/helm:3.2.4
RUN apk add --no-cache bash git jq
RUN helm plugin install https://github.com/hypnoglow/helm-s3.git
COPY bin /opt

FROM alpine/helm:3.2.4
RUN apk add --no-cache bash git jq aws-cli
RUN helm plugin install https://github.com/hypnoglow/helm-s3.git --version 0.9.2
COPY bin /opt/resource

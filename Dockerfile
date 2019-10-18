
FROM lambci/lambda:build-nodejs10.x


LABEL version="1.0.0"
LABEL repository="https://github.com/jaigouk/serverless-rust-action"
LABEL homepage="https://github.com/jaigouk/serverless-rust-action"
LABEL maintainer="Jaigouk Kim <jaigouk@gmail.com>"

LABEL "com.github.actions.name"="serverless-rust-action"
LABEL "com.github.actions.description"="Wraps the Serverless Framework to enable common Serverless commands."
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="grey dark"

RUN yum install -y jq
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
 | sh -s -- -y --profile minimal --default-toolchain stable

RUN npm i -g serverless@1.54.0
ENTRYPOINT ["serverless"]

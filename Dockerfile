#
# My personal node.js development environment using vim and tmux.
# https://github.com/chasdev/dev-env-nodejs
#
# Uses a base image: https://github.com/chasdev/dev-env
#
# Note: This Dockerfile content was primarily stolen from
#       https://github.com/dockerfile/nodejs
#       (thus all credit is attributed to dockerfile/nodejs)

FROM chasdev/dev-env

RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-latest.tar.gz && \
  rm -f node-latest.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  npm install -g npm && \
  printf '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc

WORKDIR /working

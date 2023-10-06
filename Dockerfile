# this file builds nvidia instant nerf

FROM ubuntu

RUN echo "Installing the base dependencies..."
RUN DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y && apt install -y --no-install-recommends \
  git-core \
  python3 \
  python3-pip \
  python3-venv \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*


RUN echo "Setting up certificates so git will work properly"
RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y --no-install-recommends --reinstall ca-certificates && apt clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /venv
RUN python3 -m venv /venv
RUN /venv/bin/pip install --upgrade pip
RUN /venv/bin/pip install wheel setuptools
RUN /venv/bin/pip install open-interpreter
RUN mkdir /workdir
WORKDIR /workdir

ENTRYPOINT ["/venv/bin/interpreter"]

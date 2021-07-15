FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Or your actual UID, GID on Linux if not the default 1000
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG TERRAFORM_VERSION=1.0.2
ARG KUBECTL_VERSION="v1.19.3"

RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    #
    # Verify git, process tools, lsb-release (common in install instructions for CLIs) installed
    && apt-get -y install git procps lsb-release awscli wget python3 python3-pip fish unzip curl \
    # Install terraform
    && wget -O ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" \
    && unzip ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip && mv terraform /usr/local/bin \
    && rm -f ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    # Install kubectl
    && curl -LO "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/bin/ \    
    # Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # [Optional] Add sudo support for non-root user
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \    
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
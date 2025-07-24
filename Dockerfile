# Dockerfile - Node.js 22 with NVM and Google Gemini CLI (via npm) for Android Static Analysis on Kali Linux
FROM kalilinux/kali-rolling

# Set environment variables for non-interactive apt and locale
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

# Ensure bash is available and set as default shell for subsequent RUN commands
RUN rm -f /bin/sh && ln -s /bin/bash /bin/sh
SHELL ["/bin/bash", "--login", "-c"]

# Install core dependencies, Android-specific static analysis tools, and base traffic analysis tools
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    build-essential \
    g++ \
    make \
    pkg-config \
    xz-utils \
    # --- General utilities for file handling and scripting (minimal) ---
    unzip \
    zip \
    7zip \
    python3 \
    python3-pip \
    jq \
    # --- Core binary static analysis tools (minimal) ---
    file \
    bsdmainutils \
    grep \
    binutils \
    # --- Android APK analysis tools ---
    default-jdk \
    apktool \
    dex2jar \
    google-nexus-tools \
    # --- ADDED: Base Traffic Analysis Tools ---
    tcpdump \
    tshark \
    nmap \
    netcat-traditional \
    \
    && update-ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# --- ADDED: Create a symlink for 'adb' to 'nexus-adb' for convenience ---
# This allows you to use 'adb' directly instead of 'nexus-adb'
RUN ln -s /usr/bin/nexus-adb /usr/local/bin/adb

# --- NVM and Node.js Installation ---
# Define NVM_DIR
ENV NVM_DIR=/root/.nvm

# Create the NVM directory and install NVM
RUN mkdir -p ${NVM_DIR} && \
    curl -o /tmp/install_nvm.sh https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh && \
    chmod +x /tmp/install_nvm.sh && \
    /tmp/install_nvm.sh

# Install Node.js 22 via NVM and set it as default
# It's crucial to source NVM within the SAME RUN command.
RUN . "$NVM_DIR/nvm.sh" && \
    nvm install 22 && \
    nvm alias default 22 && \
    nvm use 22

# --- Google Gemini CLI (via npm) Installation ---
# Source NVM again to ensure 'npm' is in PATH, then install @google/gemini-cli globally.
RUN . "$NVM_DIR/nvm.sh" && \
    npm install -g @google/gemini-cli

# Set default working directory inside the container
# This is where your shell will start when you enter the container
WORKDIR /working-directory/

# NEW CMD: Source NVM and then execute gemini -y.
# If gemini -y exits, the container will exit.
CMD bash -c "export NVM_DIR=/root/.nvm && [ -s \"$NVM_DIR/nvm.sh\" ] && \\. \"$NVM_DIR/nvm.sh\" && nvm use 22 && exec gemini -y"


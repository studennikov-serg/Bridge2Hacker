#!/bin/bash

# --- Script to Install NVM, Node.js 22, and Google Gemini CLI on Host ---

echo "--- Starting Gemini CLI Host Setup ---"
echo "This script will install Node Version Manager (NVM), Node.js v22, and the Google Gemini CLI."
echo "These tools are necessary for running the Gemini CLI directly on your system and for managing credentials."
echo ""

# 1. Install Node Version Manager (NVM)
echo "1. Installing Node Version Manager (NVM)..."
# Check if NVM is already installed to avoid re-downloading
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    # Source NVM for the current session
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    echo "NVM installed and sourced for this session."
else
    echo "NVM is already installed. Sourcing it for this session..."
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

echo ""

# 2. Install Node.js Version 22 using NVM
echo "2. Installing Node.js v22 using NVM..."
# Corrected check: See if v22 is listed as installed by NVM
if nvm list | grep -q "v22"; then
    echo "Node.js v22 is already installed. Setting as default and using it..."
    nvm alias default 22
    nvm use 22
else
    echo "Node.js v22 not found. Installing it now..."
    nvm install 22
    nvm alias default 22
    nvm use 22
    echo "Node.js v22 installed and set as default."
fi

echo "Node.js version: $(node -v)"
echo "npm version: $(npm -v)"
echo ""

# 3. Install Google Gemini CLI
echo "3. Installing Google Gemini CLI globally..."
# Corrected check: Use 'command -v' to check if 'gemini' executable is in PATH
if command -v gemini > /dev/null 2>&1; then
    echo "Google Gemini CLI is already installed. Updating it..."
    npm update -g @google/gemini-cli
else
    npm install -g @google/gemini-cli
    echo "Google Gemini CLI installed."
fi

echo ""
echo "--- Gemini CLI Setup Complete ---"
echo ""
echo "IMPORTANT: For the first launch of the Gemini CLI, you will be prompted to authenticate."
echo "This project is prepared to use your personal Google account for authentication."
echo "You will likely see a browser window open to complete the login process."
echo "Your credentials will be securely saved in the ~/.gemini/ directory on your host system."
echo "You can switch to using an API key later if needed."
echo ""
read -p "Press Enter to launch the Gemini CLI for the first time... " -n 1 -r
echo "" # Add a newline after the prompt

# Launch Gemini CLI for the first-time setup/authentication
gemini

echo ""
echo "Gemini CLI has launched. Your credentials should now be saved."
echo "You can now use 'gemini' directly from your host terminal or mount ~/.gemini/ into your Docker containers."
echo "--- Script Finished ---"


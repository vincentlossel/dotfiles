#!/usr/bin/env zsh

# Homebrew
HOMEBREW_BIN="/opt/homebrew/bin"
HOMEBREW_SBIN="/opt/homebrew/sbin"
HOMEBREW_LIB="/opt/homebrew/lib"

# GoLang
export GOPATH="${HOME}/.go"
export GOBIN="${GOPATH}/bin"

# Rust
export CARGO_HOME="${HOME}/.cargo"
export CARGO="${CARGO_HOME}/bin"

export RUSTUP_HOME="${HOME}/.rustup"

# Python
PYTHON_PATH="/usr/local/share/python"

# Update the PATH
export PATH=$PATH:$HOMEBREW_BIN:$HOMEBREW_SBIN:$PYTHON_PATH:$GOBIN:$CARGO

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

# Node
export NVM_DIR="${HOME}/.nvm"

# Android
export ANDROID_HOME="${HOME}/Library/Android/sdk"

# PNPM
export PNPM_HOME="${HOME}/Library/pnpm"

# Java
export JAVA_HOME="/opt/homebrew/opt/openjdk"

# Swift
export SWIFT_HOME="/Library/Developer/Toolchains/swift-latest.xctoolchain"

# Update the PATH
export PATH=$HOMEBREW_BIN:$HOMEBREW_SBIN:$GOBIN:$CARGO:$PNPM_HOME:$ANDROID_HOME:$JAVA_HOME:$SWIFT_HOME:$PATH

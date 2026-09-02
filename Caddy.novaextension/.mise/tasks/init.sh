#!/usr/bin/env bash
#MISE description="Initialize submodules"

if [[ ! -e "${MISE_CONFIG_ROOT}"/tree-sitter-caddyfile/Makefile ]]; then
  echo "Initializing submodules..."
  git submodule update --init --recursive
fi
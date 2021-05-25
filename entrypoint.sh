#!/bin/bash

set -e
set -x
set -o pipefail

if [[ -z "$GITHUB_WORKSPACE" ]]; then
  echo "Set the GITHUB_WORKSPACE env variable."
  exit 1
fi

if [[ -z "$GITHUB_REPOSITORY" ]]; then
  echo "Set the GITHUB_REPOSITORY env variable."
  exit 1
fi

root_path="$GITHUB_WORKSPACE"
echo "Root path is: ${root_path}"
blog_path="$GITHUB_WORKSPACE/.blog"
echo "Blog path is: ${blog_path}"
mkdir -p "$blog_path"
mkdir -p "$root_path"
cd "$root_path"
echo "Preparing to build blog"
hugo
echo "Building is done. Copying over generated files"
cp -R public/* "$blog_path"/
echo "Copy is done."

exit 0

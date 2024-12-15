#!/usr/bin/env bash

set -euo pipefail

if [[ $# != 3 ]]
then
    echo "Usage: $0 <base> <filter> <flake>"
    exit 1
fi

data="$1"
filter="$2"
shift 2

rm -rf result
mkdir -p result
cp photo.jpg result

yq -f "$filter" "$data" | (cd result && nix run -- "$@")
echo "Done"

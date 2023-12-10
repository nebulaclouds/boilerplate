#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

echo "     - generating Dockerfile in root directory."
sed -e "s/{{REPOSITORY}}/${REPOSITORY}/g" ${DIR}/Dockerfile.GoTemplate > ${DIR}/../../../Dockerfile

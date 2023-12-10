#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

mkdir -p ${DIR}/../../../.github/workflows

echo "     - generating github action workflows in root directory."
sed -e "s/{{REPOSITORY}}/${REPOSITORY}/g" ${DIR}/master.yml > ${DIR}/../../../.github/workflows/master.yml
sed -e "s/{{REPOSITORY}}/${REPOSITORY}/g" ${DIR}/pull_request.yml > ${DIR}/../../../.github/workflows/pull_request.yml
cp ${DIR}/stale.yml ${DIR}/../../../.github/stale.yml

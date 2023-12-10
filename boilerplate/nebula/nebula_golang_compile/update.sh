#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

echo "     - generating ${DIR}/nebula_golang_compile.sh"
sed -e "s/{{REPOSITORY}}/${REPOSITORY}/g" ${DIR}/nebula_golang_compile.Template > ${DIR}/nebula_golang_compile.sh

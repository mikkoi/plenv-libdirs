#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail
[ -n "${PLENV_DEBUG-}" ] && set -o xtrace

if ! declare -p 'PERL5LIB' &>/dev/null; then
      PERL5LIB="$(plenv-libdirs)"
      export PERL5LIB
fi

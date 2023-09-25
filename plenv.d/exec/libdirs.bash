#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail
d="${PLENV_DEBUG-}" && [ "${#d}" -gt 0 ] && set -o xtrace
unset d

PLENV_LIBDIRS="$(plenv-libdirs)"
PLENV_PERL5LIB="${PERL5LIB-NOT_SET}"
# If PERL5LIB is set (even if empty), we simply let it pass without changes
if [ "$PLENV_PERL5LIB" = "NOT_SET" ]; then
    if [ -n "$PLENV_LIBDIRS" ]; then
        PERL5LIB="$PLENV_LIBDIRS"
        export PERL5LIB
    fi
fi

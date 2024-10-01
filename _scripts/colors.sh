#!/usr/bin/env bash

set -Eumo pipefail

DISABLE_COLORS=${DISABLE_COLORS:-}

function P () {
  [ -z "$DISABLE_COLORS" ] || return 0
  tput "$@" 2>/dev/null
}

_normal_="$(P sgr0)"

_bold_="$(P bold)"
_uline_="$(P smul)"

COLORS_ARRAY=( black red green yellow blue magenta cyan white unused default )

for i in "${!COLORS_ARRAY[@]}"; do
  eval "_fg_${COLORS_ARRAY[$i]}_=\"$(P setaf "$i")\""
  eval "_bg_${COLORS_ARRAY[$i]}_=\"$(P setab "$i")\""
done

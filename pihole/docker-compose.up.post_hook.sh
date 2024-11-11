#!/usr/bin/env bash
# shellcheck disable=SC2154

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

echo -n "${_fg_white_}${_bg_magenta_}${_bold_} * ${_normal_} "
echo -n "${_bold_}$(basename "$SELF_DIR")${_normal_} may now be accessed on "
echo "${_fg_magenta_}${_uline_}https://${SERVER_LAN_FQDN}:${SERVER_LAN_HTTPS_PORT}/${PIHOLE_BASE_PATH}/${_normal_}"

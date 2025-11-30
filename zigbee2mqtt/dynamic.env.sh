#!/usr/bin/env bash

DIALOUT_OR_UUCP_GROUP=$( getent group dialout || getent group uucp )
echo DIALOUT_OR_UUCP_GROUP_ID=$( echo "$DIALOUT_OR_UUCP_GROUP" | cut -d: -f3 )

#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/share_urls.sh"

declare -A ADMIN_ENV_VARS
declare -A ADMIN_PROD_ENV_VARS

ADMIN_ENV_VARS["NULL"]=$(cat <<EOF
EOF
)

ADMIN_PROD_ENV_VARS["local"]=$(cat <<EOF
NEXT_PUBLIC_BASE_URL="http://localhost"
EOF
)

ADMIN_PROD_ENV_VARS["rent"]=$(cat <<EOF
NEXT_PUBLIC_BASE_URL="https://admin.sedrehgroup.ir"
EOF
)

ADMIN_PROD_ENV_VARS["test"]=$(cat <<EOF
NEXT_PUBLIC_BASE_URL="https://monitoring.srem.ir"
EOF
)

ADMIN_PROD_ENV_VARS["new"]=$(cat <<EOF
NEXT_PUBLIC_BASE_URL="https://newad.srem.ir"
EOF
)

ADMIN_PROD_ENV_VARS["prod"]=$(cat <<EOF
NEXT_PUBLIC_BASE_URL="https://pmt.srem.ir"
EOF
)
#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/share_urls.sh"

declare -A AGENT_ENV_VARS
declare -A AGENT_PROD_ENV_VARS

AGENT_ENV_VARS["local"]=$(cat <<EOF
NEXT_PUBLIC_REAL_LOGIN_URL=""
NEXT_PUBLIC_LEGAL_LOGIN_URL=""
EOF
)

AGENT_ENV_VARS["rent"]=$(cat <<EOF
NEXT_PUBLIC_REAL_LOGIN_URL=""
NEXT_PUBLIC_LEGAL_LOGIN_URL=""
EOF
)

AGENT_ENV_VARS["test"]=$(cat <<EOF
NEXT_PUBLIC_REAL_LOGIN_URL="$LOGIN_URL&state=test"
NEXT_PUBLIC_LEGAL_LOGIN_URL="$LEGAL_URL&state=testlegal"
EOF
)

AGENT_ENV_VARS["new"]=$(cat <<EOF
NEXT_PUBLIC_REAL_LOGIN_URL="$LOGIN_URL&state=new"
NEXT_PUBLIC_LEGAL_LOGIN_URL="$LEGAL_URL&state=newlegal"
EOF
)

AGENT_ENV_VARS["prod"]=$(cat <<EOF
NEXT_PUBLIC_REAL_LOGIN_URL="$LOGIN_URL"
NEXT_PUBLIC_LEGAL_LOGIN_URL="$LEGAL_URL"
EOF
)

AGENT_PROD_ENV_VARS["local"]=$(cat <<EOF
NEXT_PUBLIC_BASE_URL="http://localhost"
EOF
)

AGENT_PROD_ENV_VARS["rent"]=$(cat <<EOF
NEXT_PUBLIC_BASE_URL="https://rent.sedrehgroup.ir"
EOF
)

AGENT_PROD_ENV_VARS["test"]=$(cat <<EOF
NEXT_PUBLIC_BASE_URL="https://test.srem.ir"
EOF
)

AGENT_PROD_ENV_VARS["new"]=$(cat <<EOF
NEXT_PUBLIC_BASE_URL="https://new.srem.ir"
EOF
)

AGENT_PROD_ENV_VARS["prod"]=$(cat <<EOF
NEXT_PUBLIC_BASE_URL="https://khodnevis.mrud.ir"
EOF
)

#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/share_urls.sh"


declare -A ADVISER_ENV_VARS
declare -A ADVISER_PROD_ENV_VARS


# .env

ADVISER_ENV_VARS["local"]=$(cat <<EOF
NEXT_PUBLIC_REAL_LOGIN_URL=""
NEXT_PUBLIC_INQUERY_TIMER=60
EOF
)

ADVISER_ENV_VARS["rent"]=$(cat <<EOF
NEXT_PUBLIC_REAL_LOGIN_URL="$LOGIN_URL&state=gharardadha"
NEXT_PUBLIC_INQUERY_TIMER=60
EOF
)

ADVISER_ENV_VARS["test"]=$(cat <<EOF
NEXT_PUBLIC_REAL_LOGIN_URL="$LOGIN_URL&state=testgharardadha"
NEXT_PUBLIC_INQUERY_TIMER=60
EOF
)

ADVISER_ENV_VARS["new"]=$(cat <<EOF
NEXT_PUBLIC_REAL_LOGIN_URL="$LOGIN_URL&state=newgharardad"
NEXT_PUBLIC_INQUERY_TIMER=60
EOF
)

ADVISER_ENV_VARS["prod"]=$(cat <<EOF
NEXT_PUBLIC_REAL_LOGIN_URL="$LOGIN_URL&state=gharardad"
NEXT_PUBLIC_INQUERY_TIMER=60
EOF
)

# .env.production

ADVISER_PROD_ENV_VARS["local"]=$(cat <<EOF
NEXT_PUBLIC_BASE_URL="http://localhost"
NEXT_PUBLIC_KHODNEVIS_URL="http://localhost"
EOF
)

ADVISER_PROD_ENV_VARS["rent"]=$(cat <<EOF
NEXT_PUBLIC_BASE_URL="https://rent.sedrehgroup.ir"
NEXT_PUBLIC_KHODNEVIS_URL="https://rent.sedrehgroup.ir"
EOF
)

ADVISER_PROD_ENV_VARS["test"]=$(cat <<EOF
NEXT_PUBLIC_BASE_URL="https://gharardadha.srem.ir"
NEXT_PUBLIC_KHODNEVIS_URL="https://test.srem.ir"
EOF
)

ADVISER_PROD_ENV_VARS["new"]=$(cat <<EOF
NEXT_PUBLIC_BASE_URL="https://newgharardad.srem.ir"
NEXT_PUBLIC_KHODNEVIS_URL="https://new.srem.ir"
EOF
)

ADVISER_PROD_ENV_VARS["prod"]=$(cat <<EOF
NEXT_PUBLIC_BASE_URL="https://gharardadha.mrud.ir"
NEXT_PUBLIC_KHODNEVIS_URL="https://khodnevis.mrud.ir"
EOF
)
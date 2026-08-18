#!/bin/bash
set -e

# Load environment configs
source ./env_configs/rent_envs.sh
# source ./env_configs/agent_envs.sh
source ./env_configs/admin_envs.sh
source ./env_configs/adviser_envs.sh

ENVIRONMENT=$1
IMAGE_TAG=${2:-latest}

if [[ -z "$ENVIRONMENT" ]]; then
    echo "Usage: ./build.sh <local|test|new|khodnevis> [image_tag]"
    exit 1
fi

# Set repository based on environment
if [[ "$ENVIRONMENT" == "rent" ||  "$ENVIRONMENT" == "local" ||  "$ENVIRONMENT" == "test" ]]; then
  REPO="registry.sedrehgroup.ir"
elif [[ "$ENVIRONMENT" == "new" || "$ENVIRONMENT" == "prod"  ]]; then
  REPO="harbor.kosarut.ir"
else
  echo "Invalid environment: $ENVIRONMENT"
  exit 1
fi
echo "🏗️ Building for environment: $ENVIRONMENT"
echo "📦 Using image tag: $IMAGE_TAG"
echo "📤 Target repository: $REPO"
echo "---------------------------------------------------------"

write_env() {
    local app=$1
    local env_vars=$2
    local prod_vars=$3

    echo -e "$env_vars" > apps/$app/.env
    echo -e "$prod_vars" > apps/$app/.env.production

    # Fancy output with colors
    local GREEN="\033[0;32m"
    local CYAN="\033[0;36m"
    local NC="\033[0m" # No Color

    echo -e "\n${CYAN}############### $app #################${NC}\n"

    echo -e "${CYAN}# .env${NC}"
    cat "apps/$app/.env"
    echo

    echo -e "${GREEN}# .env.production${NC}"
    cat "apps/$app/.env.production"
    echo

    echo -e "${CYAN}############### END $app ###############${NC}\n"
}

write_env "rent" "${RENT_ENV_VARS[$ENVIRONMENT]}" "${RENT_PROD_ENV_VARS[$ENVIRONMENT]}"
# write_env "agent"     "${AGENT_ENV_VARS[$ENVIRONMENT]}" "${AGENT_PROD_ENV_VARS[$ENVIRONMENT]}"
write_env "admin"     "${ADMIN_ENV_VARS["NULL"]}"     "${ADMIN_PROD_ENV_VARS[$ENVIRONMENT]}"
write_env "adviser"   "${ADVISER_ENV_VARS[$ENVIRONMENT]}" "${ADVISER_PROD_ENV_VARS[$ENVIRONMENT]}"

build_and_tag() {
    local app=$1
    local image="front-worksapce-$app"

    docker compose build $app

    FULL_IMAGE_NAME=$REPO/$ENVIRONMENT/$app-front
    docker tag $image $FULL_IMAGE_NAME:$IMAGE_TAG
    docker tag $image $FULL_IMAGE_NAME:latest
    echo "📦 Tagged: $FULL_IMAGE_NAME:$IMAGE_TAG and :latest"
}

#build_and_tag "rent"
# build_and_tag "agent"
#build_and_tag "admin"
#build_and_tag "adviser"


echo "✅ Build and tagging complete!"

# clean up
#git restore .
#git clean -fd

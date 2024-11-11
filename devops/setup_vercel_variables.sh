#!/bin/sh

###############################################################################
# Creating environment file inside .env folder
###############################################################################

# Check if a flavor name is provided
if [ -z "$1" ]; then
  echo "No flavor name provided. Usage: ./setup_vercel_variables.sh <flavor>"
  exit 1
else
     echo "Creating environment file for flavor: $1"
fi

FLAVOR=$1


# Create the .env folder if it doesn't exist
if [ ! -d ".env" ]; then
  mkdir .env
fi

# Create the environment file within the folder
touch ".env/${FLAVOR}.env"

# Add content to the Env file
echo "redirectUrl=$redirectUrl" >> .env/${FLAVOR}.env
echo "supabaseAnonKey=$supabaseAnonKey" >> .env/${FLAVOR}.env
echo "supabaseUrl=$supabaseUrl" >> .env/${FLAVOR}.env
echo "sentryDsn=$sentryDsn" >> .env/${FLAVOR}.env
echo "privacyPolicyUrl=$privacyPolicyUrl" >> .env/${FLAVOR}.env
echo "termsOfServiceUrl=$termsOfServiceUrl" >> .env/${FLAVOR}.env

echo "${FLAVOR}.env file created with all the keys..............."

ls -l .env/${FLAVOR}.env
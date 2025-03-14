#/bin/bash 

# This script is intended to be run on a fresh Ubuntu LTS instance.
# It will install all the necessary dependencies to run the Skipify app locally.

# Download the repositories from repos.txt
pushd ..
while read repo; do
  git clone $repo
done < repos.txt

popd
pushd config/
mkdir -p certs

# Create a self-signed SSL certificate for local development
# This is necessary for the local server to run with HTTPS
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 \
  -nodes -keyout certs/spotify.local.key -out certs/spotify.local.crt -subj "/CN=spotify.local" \
  -addext "subjectAltName=DNS:spotify.local"

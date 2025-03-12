#/bin/bash 

# This script is intended to be run on a fresh Ubuntu LTS instance.
# It will install all the necessary dependencies to run the Skipify app locally.

# Download the repositories from repos.txt
cd ..
while read repo; do
  git clone $repo
done < repos.txt


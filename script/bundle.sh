#/bin/bash

# Clear previous bundle (if any)
if [ -d ".bundle" ]
then
  echo "Removing previous .bundle..."
  rm -r .bundle/*
else
  echo "Creating .bundle folder..."
  mkdir .bundle
fi

# Create bundle
echo "Creating Meteor bundle file..."
meteor bundle aufond.tgz

# Unzip bundle in .bundle/ folder
# --strip-components removes root "bundle" folder from archive
# -C dumps it into a different folder than the current one
echo "Unzipping bundle in .bundle folder..."
tar xzf aufond.tgz --strip-components=1 -C .bundle

# Fix node fibers package
echo "Re-install fibers package in .bundle folder..."
cd .bundle/server
npm uninstall fibers
npm install fibers
cd -
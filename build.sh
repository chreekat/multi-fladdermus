#!/bin/sh

SERVER=fladdermus
CLIENT=fladdermus-client

# Build the client
stack build --stack-yaml=$CLIENT/stack.yaml

# Copy over the javascript
rm -f $SERVER/static/all.js
cp $(stack path --stack-yaml=$CLIENT/stack.yaml --local-install-root)/bin/*.jsexe/all.js $SERVER/static/all.js

# TODO: Is this needed?
touch $SERVER/Settings/StaticFiles.hs

# Build the server
stack build --stack-yaml=$SERVER/stack.yaml

#!/usr/bin/env bash

# use the compiled version so that org-build tsconfig applies
cd ../org-generate
npx plop "$@"
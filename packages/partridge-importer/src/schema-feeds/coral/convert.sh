#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

pushd "${DIR}"

# xml-js - https://goo.gl/h7otFa
# npx xml-js category1s.xml --compact=false --out category1s.json
# npx xml-js category2s.xml --compact=false --out category2s.json
# npx xml-js category3s.xml --compact=false --out category3s.json
# npx xml-js events.xml --compact=false --out events.json
# npx xml-js event.xml --compact=false --out event.json
# npx xml-js market-collections.xml --compact=false --out market-collections.json


# npx xml-js debug/market-collections-dump.xml --compact=false --out debug/market-collections-dump.json

popd
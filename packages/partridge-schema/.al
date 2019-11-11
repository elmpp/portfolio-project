# options - https://goo.gl/vUHgfq
alias typeorm="npx typeorm"

alias migrate="./scripts/changeset.sh migrate --debug"
alias createMigration="./scripts/changeset.sh migration-create --debug"
alias dumpData="echo 'source .bash_profile if no pg_dump'; ../partridge-shell/scripts/db.sh dump-create-data-only --debug"
alias loadCode="npx ts-node ./src/code/load-code.ts"
alias loadSeed="./scripts/changeset.sh seed-load"
#alias runSeeds="loadSeed 1-rename-rules.sql --debug && loadSeed 2-queue-single-run.sql --debug"
alias runSeeds="loadSeed 1-rename-rules.sql --debug"
alias dropSchemaAndMigrate="rm -rf ./dist || true && yarn build && ./scripts/changeset.sh schema-clear --debug && ./scripts/changeset.sh migrate --debug"
alias dropSchemaAndMigrateWithSeed="dropSchemaAndMigrate && runSeeds"
alias deleteDbAndMigrate='pushd ../../; ./packages/partridge-shell/scripts/local.sh delete --debug && yarn env:up && popd; dropSchemaAndMigrate; echo "now do YARN DEV"'

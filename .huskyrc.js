module.exports = {
  hooks: {
    "commit-msg": "commitlint -E HUSKY_GIT_PARAMS",
    // "pre-push": "npx yarn lint", // lint only for release branches
  }
}

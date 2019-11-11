module.exports = {
  printWidth: 120,
  overrides: [
    {
      files: ['*.js', '*.ts', '*.tsx'],
      options: {
        bracketSpacing: false,
        semi: false,
        singleQuote: true,
        trailingComma: "es5",
      }
    }
  ]
}
/**
 * This builds upon the airbnb eslint rules but has loads of extra stuff added incrementally
 * Airbnb already includes react etc etc (via command `npx install-peerdeps --dev eslint-config-airbnb`)
 *
 * ! Remember that typescript has its own "rules" when it comes to transpiling
 * ! see `tsconfig.base.json#compilerOptions`
 *
 *  - airbnb eslint rules - https://tinyurl.com/nm3bjqh
 *  - good blog post about typescript eslint - https://tinyurl.com/y29eselt
 */

const path = require('path')

module.exports = {
  extends: [
    'airbnb',
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
    'prettier',
    'prettier/@typescript-eslint',
    'prettier/react',
    'plugin:jest/recommended',
    'plugin:react/recommended',
    'plugin:compat/recommended',
  ],
  plugins: ['@typescript-eslint', 'promise', 'compat', 'prettier', 'jest', 'react-hooks'],
  // plugins: ['@typescript-eslint', 'import', 'promise', 'compat', 'react', 'prettier', 'jest'],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    // project: './packages/**/tsconfig.json', // all tsconfigs are needed - https://tinyurl.com/y3xc4v7s
    project: [  // all tsconfigs are needed - https://tinyurl.com/y3xc4v7s
      './packages/org-common/tsconfig.json',
      './packages/org-build/tsconfig.json',
      './packages/org-image/tsconfig.json',
      './packages/org-generate/tsconfig.json',
      './packages/partridge-api/tsconfig.json',
      './packages/partridge-client-components/tsconfig.json',
      './packages/partridge-client-core/tsconfig.json',
      './packages/partridge-client-mobile/tsconfig.json',
      './packages/partridge-config/tsconfig.json',
      './packages/partridge-importer/tsconfig.json',
      './packages/partridge-logging/tsconfig.json',
      './packages/partridge-models/tsconfig.json',
      './packages/partridge-schema/tsconfig.json',
      './packages/partridge-storybook/tsconfig.json',
    ],
    tsconfigRootDir: path.resolve(__dirname),
  },
  globals: {
    page: true,
    browser: true,
    jestPuppeteer: true,
  },
  env: {
    browser: true,
    jest: true,
  },
  rules: {
    'import/no-unresolved': 0,
    'react/jsx-filename-extension': {
      extensions: ['.jsx', '.tsx'],
    },

    'arrow-body-style': 0,
    'arrow-parens': ['off'],
    'class-methods-use-this': 0,
    'comma-dangle': [
      'error',
      {
        arrays: 'always-multiline',
        objects: 'always-multiline',
        imports: 'always-multiline',
        exports: 'always-multiline',
        functions: 'ignore',
      },
    ],
    'compat/compat': 2,
    'consistent-return': 0,
    'func-names': 0,
    'function-paren-newline': 0,
    'generator-star-spacing': 0,
    'global-require': 0,
    'import/no-cycle': 0,
    'import/no-extraneous-dependencies': 0,
    'import/no-unresolved': [2],
    'import/order': 0,
    'import/prefer-default-export': 0,
    'max-len': 0,
    'no-case-declarations': 0,
    'no-console': 0,
    'no-else-return': 0,
    'no-multi-assign': 0,
    'no-multi-spaces': 0,
    'no-param-reassign': 0,
    'no-restricted-syntax': 0,
    'no-script-url': 0,
    'no-unused-vars': [1, {varsIgnorePattern: '^_', argsIgnorePattern: '^_', ignoreRestSiblings: true}],
    'no-use-before-define': 0,
    'no-underscore-dangle': 0,
    'object-curly-newline': 0,
    'object-curly-spacing': [2, 'never'],
    'object-shorthand': 0,
    'prefer-promise-reject-errors': 1,
    'prettier/prettier': 'error',
    'promise/always-return': 'error',
    'promise/catch-or-return': 2,
    'promise/no-native': 0,
    'promise/param-names': 2,
    semi: [2, 'never'],
    'space-before-function-paren': [
      'error',
      {
        anonymous: 'never',
        named: 'never',
        asyncArrow: 'ignore',
      },
    ],

    // overriding airbnb - https://tinyurl.com/y65rbugm
    'jsx-a11y/alt-text': 0,
    'jsx-a11y/anchor-is-valid': 0,
    'jsx-a11y/click-events-have-key-events': 0,
    'jsx-a11y/href-no-hash': 0,
    'jsx-a11y/img-has-alt': 0,
    'jsx-a11y/no-noninteractive-element-interactions': 0,
    'jsx-a11y/no-static-element-interactions': 0,
    // overriding react hooks - https://tinyurl.com/y25926tx
    'react-hooks/rules-of-hooks': 2,
    'react-hooks/exhaustive-deps': 2,
    // overriding react - https://tinyurl.com/y4dcrm8f
    'react/destructuring-assignment': [1, 'always', {ignoreClassFields: true}],
    'react/jsx-filename-extension': [2, {extensions: ['.js', '.tsx']}],
    'react/jsx-props-no-spreading': 0,
    'react/jsx-no-bind': 0,
    'react/no-multi-comp': 0,
    'react/no-string-refs': 0,
    'react/no-unused-state': 1,
    'react/prefer-stateless-function': 0,
    'react/prop-types': 0,
    'react/react-in-jsx-scope': 0,
    'react/static-property-placement': [2, 'static public field'],
    // not found rule definitions following typescript-eslint move...
    'react/static-property-placement': 0,
    'react/jsx-curly-newline': 0,
    'react/state-in-constructor': 0,
    // overriding @typescript-eslint
    '@typescript-eslint/camelcase': 0,
    '@typescript-eslint/no-empty-interface': 1,
    '@typescript-eslint/no-explicit-any': 0,
    // "@typescript-eslint/no-object-literal-type-assertion": [1, { // "definition for rule not found"
    //   "allowAsParameter": true
    // }],
    '@typescript-eslint/explicit-function-return-type': [
      0,
      {allowExpressions: true, allowTypedFunctionExpressions: true},
    ],
    '@typescript-eslint/no-non-null-assertion': 0,
    '@typescript-eslint/no-namespace': [0, {allowDeclarations: true}],
    '@typescript-eslint/no-unused-vars': [1, {varsIgnorePattern: '^_', argsIgnorePattern: '^_', ignoreRestSiblings: true}],
  },
  settings: {
    'import/extensions': ['.js', '.jsx', '.ts', '.tsx'],
    'import/parsers': {
      '@typescript-eslint/parser': ['.ts', '.tsx'],
    },
    'import/resolver': {
      // webpack: {
      //   config: 'webpack.config.development.js',
      // },
      node: {
        extensions: ['.js', '.jsx', '.ts', '.tsx'],
      },
    },
  },
}

---
id: snippets-babel-etc
title: Snippets (babel etc)
sidebar_label: Babel etc Snippets
---

# Babel

##### Apply rule to only one module

```
// https://tinyurl.com/yyvfhugr

// babel.config.js / babelrc.js
const node = [`${__dirname}/src/api`]

module.exports = {
  presets: [
    [
      '@babel/preset-env',
      {
        targets: {
          ie: 11,
          edge: 14,
          firefox: 45,
          chrome: 49,
          safari: 10,
          node: '6.11',
        },
      },
    ],
  ],
  overrides: [
    {
      test: filename => node.some(prefix => filename.startsWith(prefix)),   // <-- do a test
      presets: [
        [
          '@babel/preset-env',
          {
            targets: {
              node: 'current',
            },
          },
        ],
      ],
    },
  ],
}
```




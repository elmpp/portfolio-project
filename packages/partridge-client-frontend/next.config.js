// const withTypescript = require('@zeit/next-typescript')
const fs = require('fs')
const path = require('path')
const webpack = require('webpack')
const pick = require('lodash.pick')
const {config} = require('partridge-config')
const deepmerge = require('lodash.merge')

// const withFonts = require('next-fonts') // https://tinyurl.com/y4eky99x / https://tinyurl.com/yxkp52gl
// const withImages = require('next-images') // https://tinyurl.com/yyxr5dgr
// const withPlugins = require('next-compose-plugins') // https://tinyurl.com/y5vgb4v7
// const withDynamic = require('babel-plugin-dynamic-import-node')
// const withTypescript = require('@zeit/next-typescript')
const withTranspileModules = require('next-transpile-modules')

// This will take the config based on the current NODE_ENV and save it to 'build/client.json'
// Note: If '/build' does not exist, this command will error; alternatively, write to '/config'.
// The webpack alias below for `partridge-config` will then build that file into the client build.
fs.writeFileSync(path.resolve(__dirname, 'build/node-config.json'), JSON.stringify(config))

module.exports = withTranspileModules({
  // module.exports = {
    
    // transpiling node_modules packages with next-transpile-modules - https://tinyurl.com/y4sr2yj8
    transpileModules: ['partridge-client-components', 'react-native-paper', 'react-native-vector-icons', 'react-native-safe-area-view'], // react-native-paper etc (from partridge-client-components) needs compiling in /node_modules - https://tinyurl.com/y3g2ms7b
    
    publicRuntimeConfig: pick(config, ['frontend', 'environment', 'logging']),

    webpack: (webpackConfig, webpackOptions) => {
      // webpackConfig.devtool = 'source-map' // https://goo.gl/dn6Yur
      const {isServer} = webpackOptions

      if (webpackOptions.isServer) {
        webpackConfig = deepmerge(webpackConfig, {
          resolve: {
            alias: {
              // Because `node-config` uses the current NODE_ENV at runtime to choose the config file to parse,
              // webpack can't bundle it. We will therefore need extra directive to handle this
              // - https://goo.gl/jonVaD
              'partridge-config$': path.resolve(__dirname, 'build/node-config.json'),
            },
          },
          watchOptions: {
            // https://goo.gl/kLQZb5
            poll: 4000,
          },
        })
      } else {
        // webpack config schema - https://goo.gl/6QYXQ9
        webpackConfig = deepmerge(webpackConfig, {
          // allows "mocking" of modules when not in node (i.e. browser etc) - https://goo.gl/Xkfnjk
          node: {
            fs: 'empty',
            config: 'empty', // our node-config module is getting included but we can just blank it out for client build
            child_process: 'empty', // http://tinyurl.com/y6kxff3m
            'merge-graphql-schemas': 'empty',
          },
          // https://goo.gl/F4iPgP
          plugins: [
            new webpack.DefinePlugin({
              'process.env': {
                BUILD_TARGET: JSON.stringify('client'), // @see 'partridge-logging/src/index.ts'
              },
            }),
          ],
        })
      }

      // react-native-paper icon loading - https://tinyurl.com/yxkp52gl
      webpackConfig.module.rules.push({
        test: /\.(jpg|png|woff|woff2|eot|svg)$/,
        loader: 'file-loader',
      })

      // Basically copied from here - https://tinyurl.com/yyytqrv6
      webpackConfig.module.rules.push({
        test: /\.ttf$/,
        use: [
          {
            loader: 'url-loader',
            options: {
              limit: 8192,
              fallback: 'file-loader',
              publicPath: `/_next/static/fonts/`,
              outputPath: `${isServer ? "../" : ""}static/fonts/`,
              include: path.resolve(__dirname, "node_modules/react-native-vector-icons"), // (no-hoist rule essential) https://tinyurl.com/y2f24huj
              name: '[name]-[hash].[ext]'
            }
          }
        ]
      })


      webpackConfig.resolve.alias = {
        ...(webpackConfig.resolve.alias || {}),
        'react-native$': 'react-native-web', // react-native-web aliasing - https://tinyurl.com/y43qrr3f
      }

      return webpackConfig
    },
  }
)

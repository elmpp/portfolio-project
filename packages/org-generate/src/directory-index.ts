/**
 * Defines a simple generator
 *
 * Running directory through CLI:
 * `npx plop directory-index -- --directory=/Users/matt/dev/partridge/partridge/packages/partridge-client-components/assets/__generated__/img`
 *
 *  - plop docs - https://tinyurl.com/y2phrzsg
 *  - inquirer prompt types - https://tinyurl.com/yaewkyku
 */

import fs from 'fs'
import _ from 'lodash'
import inquirer from 'inquirer'
import path from 'path'

inquirer.registerPrompt('fuzzypath', require('inquirer-fuzzy-path'))

export const directoryIndex = (plop: NodePlopAPI) => {
  plop.setGenerator('directory-index', {
    description: 'traverses a directory of files and produces an index file',
    prompts: [
      {
        type: 'fuzzypath',
        name: 'directory',
        message: 'Choose a directory to add index.js for',
        // custom fields - https://tinyurl.com/y28xvl52
        excludePath: (nodePath: string) => nodePath.match('node_modules'),
        rootPath: path.resolve(__dirname, '../../'),
        itemType: 'directory',
      },
    ],
    actions: answers => [
      findFiles(answers),
      // doTemplating(plop),
      {
        type: 'add',
        templateFile: 'src/templates/template-index.hbs',
        path: `${answers.directory}/index.js`,
        // data: answers.findFiles,
        force: true,
        // skipIfExists: false,
        // abortOnFail: true,
      },
    ],
  })
  plop.setHelper('camelCaseBasename', (str: string) => _.camelCase((str.match(/^([^\.]+)\..+$/) || str)[1]))
}

/**
 * Plop custom action example
 *
 *  - docs - https://tinyurl.com/y49qq9z9
 *  - code - https://tinyurl.com/yy33ea24
 */
const findFiles: CustomActionFunction = answers => {
  const files = fs.readdirSync(answers.directory).filter(filename => !filename.startsWith('.'))

  // we'll just stick the files it onto the answers
  answers.files = files

  return `found ${files.length} files`
}

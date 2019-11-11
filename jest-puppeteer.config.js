// sets up jest puppeteer. Config format: -
let devtools = false
const config = {}

switch (process.env.APP_ENV) {
  // this will be just against local express servers
  case 'local':
    console.log('Running Functional Tests for local environment')

    devtools = false
    // https://goo.gl/E8yQua
    config.launch = {
      dumpio: true,
      headless: !devtools && process.env.HEADLESS !== 'false',
      devtools,
    }

    // start the dev server for our functional tests only - https://goo.gl/fnuUVW / https://goo.gl/bVUb6z
    config.server = {
      command: 'yarn --cwd ./packages/partridge-client-frontend server-test:dev',
      launchTimeout: 90000,
      debug: true,
      port: 3010,
      usedPortAction: 'ignore', // should be "ignore" - seems to fall over its own started servers
    }
    break
    // this will be against local docker-compose
  case 'local_e2e':
    console.log('Running E2E Tests against local environment')

    devtools = false
    // https://goo.gl/E8yQua
    config.launch = {
      dumpio: true,
      headless: !devtools && process.env.HEADLESS !== 'false',
      devtools,
    }
    break
  case 'ci':
    console.log('Running Functional Tests for ci environment')

    config.launch = {
      executablePath: '/usr/bin/chromium-browser',
      args: ['--no-sandbox', '--disable-setuid-sandbox', '--headless'],
      dumpio: true,
      headless: true,
      devtools,
    }

    // start the dev server for our functional tests only - https://goo.gl/fnuUVW
    config.server = {
      command: 'yarn --cwd ./packages/partridge-client-frontend server-test:dev',
      launchTimeout: 600000, // 6 mins!
      debug: true,
      port: 3010,
      usedPortAction: 'ignore',
    }
    break
  case 'ci_e2e':
    console.log('Running E2E Tests against ci environment')

    // shippable headless chrome - https://goo.gl/cChoxj / https://goo.gl/nnQVky
    config.launch = {
      executablePath: '/usr/bin/google-chrome',
      args: ['--no-sandbox', '--disable-setuid-sandbox', '--headless'],
      dumpio: true,
      headless: true,
      devtools,
    }
    break
  default:
    throw new Error('APP_ENV not set. This is required when running functional/e2e tests')
}

module.exports = config

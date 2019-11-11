// need check like this as will be provided through DefinePlugin or equivalent
if (
  0 ||
  typeof process.env.NODE_ENV === 'undefined' ||
  typeof process.env.APP_ENV === 'undefined' ||
  typeof process.env.APP_NAME === 'undefined' ||
  typeof process.env.APP_VERSION === 'undefined'
) {
  throw new Error(`The following envs are required when running the app: [NODE_ENV, APP_ENV, APP_NAME, APP_VERSION]`)
}

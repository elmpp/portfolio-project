if (0 || typeof process.env.NODE_ENV === 'undefined') {
  throw new Error(`The following envs are required when running the app: [NODE_ENV]`)
}

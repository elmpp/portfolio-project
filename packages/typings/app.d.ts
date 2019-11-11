/**
 * define common app env environments variables
 */
declare namespace NodeJS {
  interface ProcessEnv {
    BUILD_TARGET: 'node' | 'web' | 'mobile'
  }
}
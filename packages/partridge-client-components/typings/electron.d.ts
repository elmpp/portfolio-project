/**
 *  - devhub original - https://tinyurl.com/y54a6ejr
 *  - import syntax - https://tinyurl.com/y2zol2mc
 */

interface Window {
  partridge?: boolean
  eval: never
  ipc: import('electron').IpcRenderer
  process?: {
    type?: string
  }
  require: NodeRequireFunction
}

declare namespace NodeJS {
  interface ProcessVersions {
    electron?: boolean
  }
}

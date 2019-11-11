/**
 * Webpack plugin to bring up a server once compilation completes (in dev mode basically)
 * Required as start-server-webpack-plugin only understands executing emitted
 * entrypoints whereas we want to give this as an argument to the functions-framework
 * server
 *
 *  - start-server-webpack-plugin - https://tinyurl.com/y6s53vb5
 *  - functions-framework - https://tinyurl.com/yyvnv7dv
 */

import cluster from 'cluster'

export class StartServerFunctionsFrameworkPlugin {
  options: any
  worker: any
  _entryPoint: any

  constructor(options: any) {
    if (options == undefined) {
      options = {}
    }
    if (typeof options === 'string') {
      options = {name: options}
    }
    this.options = {
      signal: false,
      // Only listen on keyboard in development, so the server doesn't hang forever
      keyboard: process.env.NODE_ENV === 'development',
      ...options,
    }
    this.afterEmit = this.afterEmit.bind(this)
    this.apply = this.apply.bind(this)
    this.startServer = this.startServer.bind(this)

    this.worker = null
    if (this.options.restartable !== false) {
      this._enableRestarting()
    }
  }

  _enableRestarting() {
    if (this.options.keyboard) {
      process.stdin.setEncoding('utf8')
      process.stdin.on('data', data => {
        if (data.trim() === 'rs') {
          console.log('Restarting app...')
          process.kill(this.worker.process.pid)
          this._startServer((worker: any) => {
            this.worker = worker
          })
        }
      })
    }
  }

  _getExecArgv() {
    const {options} = this
    const execArgv = (options.nodeArgs || []).concat(process.execArgv)
    return execArgv
  }

  _getArgs() {
    const {options} = this
    const argv = options.args || []
    return argv
  }

  _getInspectPort(execArgv: string[]) {
    const inspectArg = execArgv.find(arg => arg.includes('--inspect'))
    if (!inspectArg || !inspectArg.includes('=')) {
      return
    }
    const hostPort = inspectArg.split('=')[1]
    const port = hostPort.includes(':') ? hostPort.split(':')[1] : hostPort
    return parseInt(port)
  }

  _getSignal() {
    const {signal} = this.options
    // allow users to disable sending a signal by setting to `false`...
    if (signal === false) return
    if (signal === true) return 'SIGUSR2'
    return signal
  }

  afterEmit(compilation: any, callback: any) {
    if (this.worker && this.worker.isConnected()) {
      const signal = this._getSignal()
      if (signal) {
        process.kill(this.worker.process.pid, signal)
      }
      return callback()
    }

    this.startServer(compilation, callback)
  }

  apply(compiler: any) {
    // Use the Webpack 4 Hooks API when possible.
    if (compiler.hooks) {
      const plugin = {name: 'StartServerPlugin'}

      compiler.hooks.afterEmit.tapAsync(plugin, this.afterEmit)
    } else {
      compiler.plugin('after-emit', this.afterEmit)
    }
  }

  startServer(compilation: any, callback: any) {
    const {options} = this
    let name
    const names = Object.keys(compilation.assets)
    if (options.name) {
      name = options.name
      if (!compilation.assets[name]) {
        console.error('Entry ' + name + ' not found. Try one of: ' + names.join(' '))
      }
    } else {
      throw new Error('must supply options.name with correct entrypoint. All names: ' + names.join(' '))
      // name = names[0]
      // if (names.length > 1) {
      //   console.log('More than one entry built, selected ' + name + '. All names: ' + names.join(' '))
      // }
    }
    const {existsAt} = compilation.assets[name]
    this._entryPoint = existsAt

    this._startServer((worker: any) => {
      this.worker = worker
      callback()
    })
  }

  _startServer(callback: any) {
    const args = this._getArgs()
    const execArgv = this._getExecArgv()
    const inspectPort = this._getInspectPort(execArgv)

    // https://nodejs.org/api/cluster.html#cluster_cluster_settings
    const clusterOptions = {
      exec: `./node_modules/.bin/functions-framework`,
      execArgv,
      args: [`--target=importer`, `--signature-type=event`, ...execArgv],
    } as any
    // const clusterOptions = {
    //   exec: this._entryPoint,
    //   execArgv,
    //   args,
    // } as any

    if (inspectPort) {
      clusterOptions.inspectPort = inspectPort
    }
    cluster.setupMaster(clusterOptions)

    cluster.on('online', worker => {
      callback(worker)
    })

    cluster.fork()
  }
}

// module.exports = StartServerFunctionsFramework

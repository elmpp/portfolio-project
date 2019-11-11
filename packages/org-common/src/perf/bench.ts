import {Bench, BenchSnapshot, MemoryUsage, MemoryDiff, TimeDiff} from './__types__/bench'
import prettyBytes from 'pretty-bytes'
import {fmt as humanDuration} from 'human-duration'

export * from './__types__/bench'

const createMemoryDiff = (startMemory: MemoryUsage, stopMemory: MemoryUsage): MemoryDiff => ({
  rss: readableMemory(stopMemory.rss - startMemory.rss),
  heapTotal: readableMemory(stopMemory.heapTotal - startMemory.heapTotal),
  heapUsed: readableMemory(stopMemory.heapUsed - startMemory.heapUsed),
  external: readableMemory(stopMemory.external - startMemory.external),
})

const createTimeDiff = (startTime: Date, stopTime: Date): TimeDiff =>
  readableDuration(stopTime.valueOf() - startTime.valueOf())

const createBenchSnapshot = (): BenchSnapshot => {
  let lastSnapshot: BenchSnapshot

  return (lastSnapshot = {
    memory: process.memoryUsage(),
    time: new Date(),
    asFormat: (_logLevel: LogLevel): Omit<BenchSnapshot, 'asFormat'> => ({
      memory: createMemoryDiff(lastSnapshot.memory, process.memoryUsage()),
      time: createTimeDiff(lastSnapshot.time, new Date()),
    }),
  })
}

export const createBench = (): Bench => {
  let startSnapshot: BenchSnapshot
  let stopSnapshot: BenchSnapshot

  return {
    start: () => {
      startSnapshot = createBenchSnapshot()
      return startSnapshot
    },
    snapshot: () => createBenchSnapshot(),
    stop: () => {
      stopSnapshot = createBenchSnapshot()
      return {
        startSnapshot,
        stopSnapshot,
        memory: createMemoryDiff(startSnapshot.memory, stopSnapshot.memory),
        time: createTimeDiff(startSnapshot.time, stopSnapshot.time),
      }
    },
    asFormat: () => ({
      memory: createMemoryDiff(startSnapshot.memory, stopSnapshot.memory),
      time: createTimeDiff(startSnapshot.time, stopSnapshot.time),
    }),
  }
}

const readableMemory = (bytes: number): string => {
  // https://goo.gl/tDirg6
  return prettyBytes(bytes, {signed: true})
}

const readableDuration = (milliseconds: number): string => {
  // https://goo.gl/1kAAJh
  return humanDuration(milliseconds).toString()
}

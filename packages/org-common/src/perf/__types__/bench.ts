export interface Bench extends Formattable {
  start: () => BenchSnapshot
  stop: () => BenchSnapshotDiff
  snapshot: () => BenchSnapshot
}

export interface BenchSnapshot extends Formattable {
  time: Date
  memory: MemoryUsage
}

export interface BenchSnapshotDiff {
  startSnapshot: BenchSnapshot
  stopSnapshot: BenchSnapshot
  time: TimeDiff
  memory: MemoryDiff
}

export type MemoryUsage = NodeJS.MemoryUsage

export type MemoryDiff = {
  [k in keyof MemoryUsage]: string
}

export type TimeDiff = string

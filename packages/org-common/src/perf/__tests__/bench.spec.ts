import {createBench} from '../bench'
import {MemoryUsage} from '../__types__/bench'
import lolex, {InstalledClock, Clock} from 'lolex'

describe('bench', () => {
  const memoryValues: MemoryUsage[] = [
    {
      rss: 10000000, // 10mb
      heapTotal: 10000000,
      heapUsed: 10000000,
      external: 10000000,
    },
    {
      rss: 20000000, // 10mb
      heapTotal: 20000000,
      heapUsed: 20000000,
      external: 20000000,
    },
    {
      rss: 30000000, // 10mb
      heapTotal: 30000000,
      heapUsed: 30000000,
      external: 30000000,
    },
  ]

  const dateValues = [new Date('1995-12-17T12:00:00'), new Date('1995-12-17T13:00:00'), new Date('1995-12-17T14:00:00')]

  let clock: InstalledClock<Clock>

  beforeEach(() => {
    clock = lolex.install({
      // https://goo.gl/YoZdzi
      now: new Date('1995-12-17T12:00:00').valueOf(),
    })

    jest
      .spyOn(process, 'memoryUsage')
      .mockImplementationOnce(() => memoryValues[0])
      .mockImplementationOnce(() => memoryValues[1])
      .mockImplementationOnce(() => memoryValues[2])
  })

  afterEach(() => {
    clock.uninstall()
  })

  it('produces snapshots', () => {
    const bench = createBench()
    const snapshot1 = bench.start()
    clock.tick('01:00:00') // https://goo.gl/EdYqhn
    const snapshot2 = bench.snapshot()
    clock.tick('01:00:00')
    const snapshotDiff = bench.stop()

    expect(snapshot1.memory).toEqual(memoryValues[0])
    expect(snapshot2.memory).toEqual(memoryValues[1])

    expect(snapshotDiff.stopSnapshot.memory).toEqual(memoryValues[2])

    expect(snapshotDiff.startSnapshot).toEqual(snapshot1)

    expect(snapshotDiff.memory.rss).toEqual('+20 MB')
    expect(snapshotDiff.memory.heapTotal).toEqual('+20 MB')
    expect(snapshotDiff.memory.heapUsed).toEqual('+20 MB')
    expect(snapshotDiff.memory.external).toEqual('+20 MB')

    expect(snapshotDiff.time).toEqual('2h 0m 0s')
  })

  it('is formattable', () => {
    const bench = createBench()
    const snapshot1 = bench.start()
    clock.tick('01:00:00') // https://goo.gl/EdYqhn
    const snapshot2 = bench.snapshot()
    clock.tick('01:00:00')
    const snapshotDiff = bench.stop()

    const formatted = bench.asFormat('warn')

    expect(formatted.memory.rss).toEqual('+20 MB') // pretty-bytes of 20000000
    expect(formatted.memory.heapTotal).toEqual('+20 MB')
    expect(formatted.memory.heapUsed).toEqual('+20 MB')
    expect(formatted.memory.external).toEqual('+20 MB')

    expect(formatted.time).toEqual('2h 0m 0s')
  })
})

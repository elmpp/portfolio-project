// typeorm entities - https://goo.gl/3gUoAn
import {Column, Entity, Index, PrimaryGeneratedColumn, CreateDateColumn} from 'typeorm'

@Entity('queue', {})
@Index('queue_data_meta_fetch_runId_idx', {synchronize: false}) // must be disabled - https://goo.gl/njc4xn
export class Queue {
  @PrimaryGeneratedColumn({
    name: 'id',
    type: 'bigint',
  })
  id: number

  // note that this has an (GIN) index added in migrations (cannot define through typeorm - https://goo.gl/jb8XcQ)
  @Column({
    name: 'data',
    type: 'jsonb',
    nullable: false,
  })
  data: object

  @CreateDateColumn({
    name: 'created_at',
    nullable: false,
  })
  createdAt: Date
}

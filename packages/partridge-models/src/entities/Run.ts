// typeorm entities - https://goo.gl/3gUoAn
import {Column, Entity, Index, PrimaryColumn, CreateDateColumn, UpdateDateColumn} from 'typeorm'

@Entity('run', {})
export class Run {
  @PrimaryColumn({type: 'uuid'}) // compatible with uuid/v4 apparently - https://goo.gl/iViwir
  id: string

  @Column({type: 'boolean'})
  processed: boolean

  @CreateDateColumn({
    name: 'created_at',
    nullable: false,
  })
  createdAt: Date

  @UpdateDateColumn({
    name: 'updated_at',
    nullable: true,
  })
  updatedAt: Date
}

import {Column, Entity, OneToOne, JoinColumn, Index} from 'typeorm'
import {Outcome} from './Outcome'
import {FeedSupplierName} from 'partridge-config'

@Entity('meta_outcome', {})
@Index(['feedId', 'feedSupplier'], {unique: true})
export class MetaOutcome {
  id: number

  @Column({type: 'bigint', name: 'feed_id'})
  feedId: number

  @Column({type: 'uuid', name: 'run_id'})
  runId: string

  @Column({
    type: 'enum',
    enum: FeedSupplierName,
    enumName: 'feed_supplier_enum',
    name: 'feed_supplier',
  })
  feedSupplier: FeedSupplierName

  @Column({type: 'text', name: 'url'})
  url: string

  @OneToOne(_type => Outcome, outcome => outcome.meta, {primary: true, cascade: false, onDelete: 'CASCADE'})
  @JoinColumn({name: 'id'})
  mesa: Outcome
}

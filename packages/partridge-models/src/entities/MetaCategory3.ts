import {Column, Entity, OneToOne, JoinColumn, Index} from 'typeorm'
import {Category3} from './Category3'
import {FeedSupplierName} from 'partridge-config'

@Entity('meta_category3', {})
@Index(['feedId', 'feedSupplier'], {unique: true})
export class MetaCategory3 {
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

  @OneToOne(_type => Category3, category3 => category3.meta, {primary: true, cascade: false, onDelete: 'CASCADE'})
  @JoinColumn({name: 'id'})
  mesa: Category3
}

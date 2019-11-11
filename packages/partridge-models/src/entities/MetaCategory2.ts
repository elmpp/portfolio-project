import {Column, Entity, OneToOne, JoinColumn, Index} from 'typeorm'
import {Category2} from './Category2'
import {FeedSupplierName} from 'partridge-config'

@Entity('meta_category2', {})
@Index(['feedId', 'feedSupplier'], {unique: true})
export class MetaCategory2 {
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

  @OneToOne(_type => Category2, category2 => category2.meta, {primary: true, cascade: false, onDelete: 'CASCADE'})
  @JoinColumn({name: 'id'})
  mesa: Category2
}

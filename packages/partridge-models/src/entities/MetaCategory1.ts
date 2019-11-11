// typeorm entities - https://goo.gl/3gUoAn
import {Column, Entity, OneToOne, JoinColumn, Index} from 'typeorm'
import {Category1} from './Category1'
import {FeedSupplierName} from 'partridge-config'

@Entity('meta_category1', {})
@Index(['feedId', 'feedSupplier'], {unique: true})
export class MetaCategory1 {
  id: number

  @Column({type: 'bigint', name: 'feed_id'})
  feedId: number

  @Column({type: 'uuid', name: 'run_id'})
  runId: string

  @Column({
    type: 'enum', // https://goo.gl/1ucHEK
    enum: FeedSupplierName,
    enumName: 'feed_supplier_enum',
    name: 'feed_supplier',
  })
  feedSupplier: FeedSupplierName

  @Column({type: 'text', name: 'url'})
  url: string

  // onetoone relations - https://goo.gl/s1HnBp
  @OneToOne(_type => Category1, category1 => category1.meta, {primary: true, cascade: false, onDelete: 'CASCADE'})
  @JoinColumn({name: 'id'})
  mesa: Category1
}

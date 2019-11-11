import {Column, Entity, OneToOne, JoinColumn, Index} from 'typeorm'
import {MarketCollection} from './MarketCollection'
import {FeedSupplierName} from 'partridge-config'

@Entity('meta_market_collection', {})
@Index(['feedId', 'feedSupplier'], {unique: true})
export class MetaMarketCollection {
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

  @OneToOne(_type => MarketCollection, marketCollection => marketCollection.meta, {
    primary: true,
    cascade: false,
    onDelete: 'CASCADE',
  })
  @JoinColumn({name: 'id'})
  mesa: MarketCollection
}

import {Column, Entity, JoinColumn, Index, ManyToOne, PrimaryGeneratedColumn, OneToOne, OneToMany} from 'typeorm'
import {Event} from './Event'
import {MetaConcreteEvent} from './MetaConcreteEvent'
import {Status} from '../__types__'
import {ConcreteMarket} from './ConcreteMarket'
import {FeedSupplierName} from 'partridge-config'

@Entity('concrete_event', {})
@Index(['processed', 'feedSupplier'], {unique: true})
export class ConcreteEvent {
  @PrimaryGeneratedColumn({
    name: 'id',
    type: 'bigint',
  })
  id: number

  @Column({type: 'boolean', name: 'displayed'})
  displayed: boolean

  @Column({
    type: 'enum',
    enum: Status,
    enumName: 'status_enum',
    name: 'status',
  })
  status: Status

  @Column({type: 'text', name: 'url', nullable: true})
  url?: string

  // required so can have unique index [feed_supplier, processed_id]
  @Column({
    type: 'enum',
    enum: FeedSupplierName,
    enumName: 'feed_supplier_enum',
    name: 'feed_supplier',
  })
  feedSupplier: FeedSupplierName

  @ManyToOne(_type => Event, event => event.concretes, {nullable: false, cascade: false, onDelete: 'CASCADE'})
  @Index()
  @JoinColumn({name: 'processed_id'})
  processed: Event

  @OneToMany(_type => ConcreteMarket, concrete => concrete.concreteEvent, {cascade: false})
  concreteMarkets: ConcreteMarket[]

  @OneToOne(_type => MetaConcreteEvent, meta => meta.mesa, {cascade: false})
  meta: MetaConcreteEvent
}

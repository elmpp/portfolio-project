import {Column, Entity, Index, PrimaryGeneratedColumn, OneToOne, JoinColumn, ManyToOne, OneToMany} from 'typeorm'
import {MetaEvent} from './MetaEvent'
import {Category3} from './Category3'
import {EventType} from '../__types__'
import {ConcreteEvent} from './ConcreteEvent'

@Entity('event', {})
export class Event {
  @PrimaryGeneratedColumn({
    name: 'id',
    type: 'bigint',
  })
  id: number

  @Column({type: 'text', name: 'name'})
  name: string

  @Column({type: 'text', name: 'canonicalised_name'})
  @Index()
  canonicalisedName: string

  @Column({type: 'text', name: 'canonicalised_name_unique'})
  @Index({unique: true})
  canonicalisedNameUnique: string

  @Column({type: 'integer', name: 'display_order'})
  displayOrder: number

  @Column({type: 'timestamp with time zone', name: 'event_date'}) // (ISO 8601) - https://goo.gl/FbtGAE
  eventDate: Date

  @Column({
    type: 'enum',
    enum: EventType,
    name: 'type',
  })
  type: EventType

  @OneToMany(_type => ConcreteEvent, concrete => concrete.processed, {cascade: false})
  concretes: ConcreteEvent[]

  @ManyToOne(_type => Category3, category3 => category3.events, {cascade: false, onDelete: 'CASCADE', nullable: false})
  @Index()
  @JoinColumn({name: 'category3_id'})
  category3: Category3

  // @OneToMany(_type => Market, market => market.event, {cascade: false})
  // markets: Market[]

  @OneToOne(_type => MetaEvent, meta => meta.mesa, {cascade: false})
  meta: MetaEvent
}

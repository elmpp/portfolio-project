import {Column, Entity, JoinColumn, Index, ManyToOne, PrimaryGeneratedColumn, OneToOne, OneToMany} from 'typeorm'
import {Market} from './Market'
import {MetaConcreteMarket} from './MetaConcreteMarket'
import {ConcreteEvent} from './ConcreteEvent'
import {ConcreteOutcome} from './ConcreteOutcome'
import {FeedSupplierName} from 'partridge-config'
import {EventBettingStatus, Status} from '../__types__'

@Entity('concrete_market', {})
@Index(['processed', 'feedSupplier'], {unique: true})
export class ConcreteMarket {
  @PrimaryGeneratedColumn({
    name: 'id',
    type: 'bigint',
  })
  id: number

  @Column({type: 'boolean', name: 'bet_in_play'})
  betInPlay: boolean

  @Column({type: 'timestamp with time zone', name: 'bet_till', nullable: true})
  betTill?: Date

  @Column({
    type: 'enum',
    enum: EventBettingStatus,
    enumName: 'betting_status_enum',
    name: 'betting_status',
  })
  bettingStatus: EventBettingStatus

  @Column({type: 'boolean', name: 'cashout_available'})
  cashoutAvailable: boolean

  @Column({type: 'boolean', name: 'eachway_available'})
  eachwayAvailable: boolean

  @Column({type: 'boolean', name: 'first_four_available'})
  firstFourAvailable: boolean

  @Column({type: 'boolean', name: 'forecast_available'})
  forecastAvailable: boolean

  @Column({type: 'boolean', name: 'guaranteed_price_available'})
  guaranteedPriceAvailable: boolean

  @Column({type: 'boolean', name: 'place_available'})
  placeAvailable: boolean

  @Column({type: 'boolean', name: 'quinella_available'})
  quinellaAvailable: boolean

  @Column({type: 'boolean', name: 'tricast_available'})
  tricastAvailable: boolean

  @Column({
    type: 'enum',
    enum: Status,
    enumName: 'status_enum',
    name: 'status',
  })
  status: Status

  @Column({type: 'text', name: 'url', nullable: true})
  url?: string

  @Column({type: 'integer', name: 'display_order'})
  displayOrder: number

  @Column({type: 'boolean', name: 'is_default'}) // whether the market is default for an event
  isDefault: boolean

  @Column({
    type: 'enum',
    enum: FeedSupplierName,
    enumName: 'feed_supplier_enum',
    name: 'feed_supplier',
  })
  feedSupplier: FeedSupplierName

  @ManyToOne(_type => ConcreteEvent, concrete => concrete.concreteMarkets, {
    nullable: false,
    cascade: false,
    onDelete: 'CASCADE',
  })
  @Index()
  @JoinColumn({name: 'concrete_event_id'})
  concreteEvent: ConcreteEvent

  @OneToMany(_type => ConcreteOutcome, concrete => concrete.concreteMarket, {cascade: false})
  concreteOutcomes: ConcreteOutcome[]

  @ManyToOne(_type => Market, market => market.concretes, {nullable: false, cascade: false, onDelete: 'CASCADE'})
  @Index()
  @JoinColumn({name: 'processed_id'})
  processed: Market

  @OneToOne(_type => MetaConcreteMarket, meta => meta.mesa, {cascade: false})
  meta: MetaConcreteMarket
}

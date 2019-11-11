import {Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn, OneToOne, Index} from 'typeorm'
import {Outcome} from './Outcome'
import {MetaConcreteOutcome} from './MetaConcreteOutcome'
import {ConcreteMarket} from './ConcreteMarket'
import {FeedSupplierName} from 'partridge-config'
import {Status} from '../__types__'

@Entity('concrete_outcome', {})
@Index(['processed', 'feedSupplier'], {unique: true})
export class ConcreteOutcome {
  @PrimaryGeneratedColumn({
    name: 'id',
    type: 'bigint',
  })
  id: number

  @Column({type: 'text', name: 'odds', nullable: true})
  odds?: string

  @Column({type: 'real', name: 'odds_decimal', nullable: true})
  oddsDecimal?: number

  @Column({type: 'smallint', name: 'runner_number', nullable: true})
  runnerNumber?: number

  @Column({type: 'text', name: 'handicap', nullable: true})
  handicap?: string

  @Column({type: 'boolean', name: 'live_price_available'})
  livePriceAvailable: boolean

  @Column({type: 'boolean', name: 'starting_price_available'})
  startingPriceAvailable: boolean

  @Column({
    type: 'enum',
    enum: Status,
    enumName: 'status_enum',
    name: 'status',
  })
  status: Status

  @Column({type: 'integer', name: 'display_order'})
  displayOrder: number

  @Column({type: 'boolean', name: 'is_home'})
  isHome: boolean

  @Column({
    type: 'enum',
    enum: FeedSupplierName,
    enumName: 'feed_supplier_enum',
    name: 'feed_supplier',
  })
  feedSupplier: FeedSupplierName

  @ManyToOne(_type => ConcreteMarket, concrete => concrete.concreteOutcomes, {
    nullable: false,
    cascade: false,
    onDelete: 'CASCADE',
  })
  @Index()
  @JoinColumn({name: 'concrete_market_id'})
  concreteMarket: ConcreteMarket

  @ManyToOne(_type => Outcome, outcome => outcome.concretes, {nullable: false, cascade: false, onDelete: 'CASCADE'})
  @Index()
  @JoinColumn({name: 'processed_id'})
  processed: Outcome

  @OneToOne(_type => MetaConcreteOutcome, meta => meta.mesa, {cascade: false})
  meta: MetaConcreteOutcome
}

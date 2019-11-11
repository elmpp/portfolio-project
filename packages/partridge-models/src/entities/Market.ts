import {Column, Entity, Index, PrimaryGeneratedColumn, OneToOne, JoinColumn, ManyToOne, OneToMany} from 'typeorm'
import {MetaMarket} from './MetaMarket'
import {ConcreteMarket} from './ConcreteMarket'
import {MarketCollection} from './MarketCollection'

@Entity('market', {})
export class Market {
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

  marketCollections: MarketCollection[] // not making a column, keep as unidirectional

  @OneToMany(_type => ConcreteMarket, concrete => concrete.processed, {cascade: false})
  concretes: ConcreteMarket[]

  @OneToOne(_type => MetaMarket, meta => meta.mesa, {cascade: false})
  meta: MetaMarket
}

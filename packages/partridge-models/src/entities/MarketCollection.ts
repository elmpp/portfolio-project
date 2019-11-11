import {Column, Entity, Index, PrimaryGeneratedColumn, OneToOne, ManyToMany, JoinTable} from 'typeorm'
import {MetaMarketCollection} from './MetaMarketCollection'
import {Market} from './Market'

@Entity('market_collection', {})
export class MarketCollection {
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

  // ManyToMany - https://goo.gl/wtv2qP
  @ManyToMany(_type => Market, market => market.marketCollections)
  @JoinTable({
    name: 'market_collection_join_market',
    joinColumn: {name: 'market_collection_id', referencedColumnName: 'id'},
    inverseJoinColumn: {name: 'market_id', referencedColumnName: 'id'},
  })
  markets: Market[]

  @OneToOne(_type => MetaMarketCollection, meta => meta.mesa, {cascade: false})
  meta: MetaMarketCollection
}

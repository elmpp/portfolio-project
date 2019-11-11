import {Column, Entity, Index, PrimaryGeneratedColumn, OneToOne, JoinColumn, ManyToOne, OneToMany} from 'typeorm'
import {MetaOutcome} from './MetaOutcome'
import {ConcreteOutcome} from './ConcreteOutcome'

@Entity('outcome', {})
export class Outcome {
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

  // @Column({type: 'integer', name: 'display_order'})
  // displayOrder: number

  // @Column({type: 'boolean', name: 'is_home'})
  // isDefault: boolean

  @OneToMany(_type => ConcreteOutcome, concrete => concrete.processed, {cascade: false})
  concretes: ConcreteOutcome[]

  // @ManyToOne(_type => Event, event => event.outcomes, {cascade: false, onDelete: 'CASCADE', nullable: false})
  // @JoinColumn({name: 'event_id'})
  // event: Event

  @OneToOne(_type => MetaOutcome, meta => meta.mesa, {cascade: false})
  meta: MetaOutcome
}

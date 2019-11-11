import {Column, Entity, Index, PrimaryGeneratedColumn, OneToOne, JoinColumn, ManyToOne, OneToMany} from 'typeorm'
import {MetaCategory3} from './MetaCategory3'
import {Event} from './Event'
import {Category2} from './Category2'

@Entity('category3', {})
export class Category3 {
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

  @ManyToOne(_type => Category2, category2 => category2.category3s, {
    cascade: false,
    onDelete: 'CASCADE',
    nullable: false,
  })
  @Index()
  @JoinColumn({name: 'category2_id'})
  category2: Category2

  @OneToMany(_type => Event, event => event.category3, {cascade: false})
  events: Event[]

  @OneToOne(_type => MetaCategory3, meta => meta.mesa, {cascade: false})
  meta: MetaCategory3
}

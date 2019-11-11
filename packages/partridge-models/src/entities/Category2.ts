import {Column, Entity, Index, PrimaryGeneratedColumn, OneToOne, JoinColumn, ManyToOne, OneToMany} from 'typeorm'
import {MetaCategory2} from './MetaCategory2'
import {Category1} from './Category1'
import {Category3} from './Category3'

@Entity('category2', {})
export class Category2 {
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

  // manytoone relations = https://goo.gl/W7VbLf
  @ManyToOne(_type => Category1, category1 => category1.category2s, {
    cascade: false,
    onDelete: 'CASCADE',
    nullable: false,
  })
  @Index() // PLEASE NOTE FOREIGN KEYS IN POSTGRES AREN'T INDEXED!!! - https://tinyurl.com/y3rmv3e5
  @JoinColumn({name: 'category1_id'})
  category1: Category1

  @OneToMany(_type => Category3, category3 => category3.category2, {cascade: false})
  category3s: Category3[]

  @OneToOne(_type => MetaCategory2, meta => meta.mesa, {cascade: false})
  meta: MetaCategory2
}

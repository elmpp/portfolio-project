// typeorm entities - https://goo.gl/3gUoAn
// column options - https://goo.gl/YKhWpj
import {Column, Entity, Index, PrimaryGeneratedColumn, OneToOne, OneToMany} from 'typeorm'
import {MetaCategory1} from './MetaCategory1'
import {Category2} from './Category2'

@Entity('category1', {})
export class Category1 {
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

  // relation options - https://goo.gl/cKQUFv

  // oneToMany relations - https://goo.gl/W7VbLf
  @OneToMany(_type => Category2, category2 => category2.category1, {onDelete: 'CASCADE'})
  category2s: Category2[]

  @OneToOne(_type => MetaCategory1, meta => meta.mesa, {cascade: false})
  meta: MetaCategory1
}

import {Column, Entity, PrimaryGeneratedColumn, Index} from 'typeorm'
import {EntityName} from '../__types__'

@Entity('rename', {})
@Index(['entityName', 'regexSearch'], {unique: true})
export class Rename {
  @PrimaryGeneratedColumn({
    name: 'id',
    type: 'bigint',
  })
  id: number

  @Column({
    type: 'enum',
    enum: EntityName,
    enumName: 'entity_name_enum',
    name: 'entity_name',
  })
  entityName: EntityName

  @Column({type: 'text', name: 'regex_search'}) // e.g. '(.*\s)utd(\s|$.*)'
  regexSearch: string

  @Column({type: 'text', name: 'regex_replace'}) // e.g. '\1united\2'
  regexReplace: string

  @Column({type: 'integer', name: 'display_order'})
  displayOrder: number
}

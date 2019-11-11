import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1551616324362 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(
      `CREATE INDEX category1_canonicalised_name_unique_fulltext_idx ON category1 USING GIN (to_tsvector('english', replace(canonicalised_name_unique, '-', ' ')))`
    )
    await queryRunner.query(
      `CREATE INDEX category2_canonicalised_name_unique_fulltext_idx ON category2 USING GIN (to_tsvector('english', replace(canonicalised_name_unique, '-', ' ')))`
    )
    await queryRunner.query(
      `CREATE INDEX category3_canonicalised_name_unique_fulltext_idx ON category3 USING GIN (to_tsvector('english', replace(canonicalised_name_unique, '-', ' ')))`
    )
    await queryRunner.query(
      `CREATE INDEX event_canonicalised_name_unique_fulltext_idx ON event USING GIN (to_tsvector('english', replace(canonicalised_name_unique, '-', ' ')))`
    )
    await queryRunner.query(
      `CREATE INDEX market_canonicalised_name_unique_fulltext_idx ON market USING GIN (to_tsvector('english', replace(canonicalised_name_unique, '-', ' ')))`
    )
    await queryRunner.query(
      `CREATE INDEX outcome_canonicalised_name_unique_fulltext_idx ON outcome USING GIN (to_tsvector('english', replace(canonicalised_name_unique, '-', ' ')))`
    )
    await queryRunner.query(
      `CREATE INDEX market_collection_canonicalised_name_unique_fulltext_idx ON market_collection USING GIN (to_tsvector('english', replace(canonicalised_name_unique, '-', ' ')))`
    )
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`DROP INDEX category1_canonicalised_name_unique_fulltext_idx`)
    await queryRunner.query(`DROP INDEX category2_canonicalised_name_unique_fulltext_idx`)
    await queryRunner.query(`DROP INDEX category3_canonicalised_name_unique_fulltext_idx`)
    await queryRunner.query(`DROP INDEX event_canonicalised_name_unique_fulltext_idx`)
    await queryRunner.query(`DROP INDEX market_canonicalised_name_unique_fulltext_idx`)
    await queryRunner.query(`DROP INDEX outcome_canonicalised_name_unique_fulltext_idx`)
    await queryRunner.query(`DROP INDEX market_collection_canonicalised_name_unique_fulltext_idx`)
  }
}

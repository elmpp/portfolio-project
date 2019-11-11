import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1551178622964 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(
      `CREATE TYPE "entity_name_enum" AS ENUM('CATEGORY1', 'CATEGORY2', 'CATEGORY3', 'EVENT', 'MARKET', 'OUTCOME', 'MARKETCOLLECTION')`
    )
    await queryRunner.query(
      `CREATE TABLE "rename" ("id" BIGSERIAL NOT NULL, "entity_name" "entity_name_enum" NOT NULL, "regex_search" text NOT NULL, "regex_replace" text NOT NULL, "display_order" integer NOT NULL, CONSTRAINT "PK_1008a0a035e69c9aa1ab1ae166b" PRIMARY KEY ("id"))`
    )
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`DROP TABLE "rename"`)
    await queryRunner.query(`DROP TYPE "entity_name_enum"`)
  }
}

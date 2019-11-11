import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1550743312888 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    // await queryRunner.query(`CREATE TYPE "feed_supplier_enum" AS ENUM('coral', 'sky', 'boylesports')`);
    await queryRunner.query(
      `CREATE TYPE "feed_supplier_enum" AS ENUM('coral', 'sky', 'boylesports', 'test1', 'test2', 'test3', 'test4', 'test5', 'test6', 'test7', 'test8', 'test9', 'test10')`
    )
    await queryRunner.query(
      `CREATE TABLE "meta_category1" ("feed_id" bigint NOT NULL, "run_id" uuid NOT NULL, "feed_supplier" "feed_supplier_enum" NOT NULL, "url" text NOT NULL, "id" bigint NOT NULL, CONSTRAINT "REL_de38557430f231b762dd870213" UNIQUE ("id"), CONSTRAINT "PK_de38557430f231b762dd8702138" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_db11d34b319a64512a42e4321f" ON "meta_category1" ("feed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `CREATE TABLE "category1" ("id" BIGSERIAL NOT NULL, "name" text NOT NULL, "canonicalised_name" text NOT NULL, "canonicalised_name_unique" text NOT NULL, "display_order" integer NOT NULL, CONSTRAINT "PK_b579511db101fe822a42cb7e751" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(`CREATE INDEX "IDX_052ee88b76a44787ca511a46d4" ON "category1" ("canonicalised_name") `)
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_8a54cfa4b97f37115119848809" ON "category1" ("canonicalised_name_unique") `
    )
    await queryRunner.query(
      `ALTER TABLE "meta_category1" ADD CONSTRAINT "FK_de38557430f231b762dd8702138" FOREIGN KEY ("id") REFERENCES "category1"("id")`
    )
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "meta_category1" DROP CONSTRAINT "FK_de38557430f231b762dd8702138"`)
    await queryRunner.query(`DROP INDEX "IDX_8a54cfa4b97f37115119848809"`)
    await queryRunner.query(`DROP INDEX "IDX_052ee88b76a44787ca511a46d4"`)
    await queryRunner.query(`DROP TABLE "category1"`)
    await queryRunner.query(`DROP INDEX "IDX_db11d34b319a64512a42e4321f"`)
    await queryRunner.query(`DROP TABLE "meta_category1"`)
    await queryRunner.query(`DROP TYPE "feed_supplier_enum"`)
  }
}

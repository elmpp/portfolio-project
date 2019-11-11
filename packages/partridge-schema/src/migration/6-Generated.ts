import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1550954618318 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "meta_category1" DROP CONSTRAINT "FK_de38557430f231b762dd8702138"`)
    await queryRunner.query(`DROP INDEX "IDX_db11d34b319a64512a42e4321f"`)
    await queryRunner.query(`DROP INDEX "IDX_052ee88b76a44787ca511a46d4"`)
    await queryRunner.query(`DROP INDEX "IDX_8a54cfa4b97f37115119848809"`)
    await queryRunner.query(
      `CREATE TABLE "meta_category2" ("feed_id" bigint NOT NULL, "run_id" uuid NOT NULL, "feed_supplier" "feed_supplier_enum" NOT NULL, "url" text NOT NULL, "id" bigint NOT NULL, CONSTRAINT "REL_94a1dea4dd578314aeeaf1d545" UNIQUE ("id"), CONSTRAINT "PK_94a1dea4dd578314aeeaf1d5458" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_bb82a766cf17159cc2f1d67f94" ON "meta_category2" ("feed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `CREATE TABLE "meta_category3" ("feed_id" bigint NOT NULL, "run_id" uuid NOT NULL, "feed_supplier" "feed_supplier_enum" NOT NULL, "url" text NOT NULL, "id" bigint NOT NULL, CONSTRAINT "REL_75a99176e0dc845b9d065421bf" UNIQUE ("id"), CONSTRAINT "PK_75a99176e0dc845b9d065421bf4" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_180478bbe90e117abd26eeebcf" ON "meta_category3" ("feed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `CREATE TABLE "category3" ("id" BIGSERIAL NOT NULL, "name" text NOT NULL, "canonicalised_name" text NOT NULL, "canonicalised_name_unique" text NOT NULL, "display_order" integer NOT NULL, "category2_id" bigint NOT NULL, CONSTRAINT "PK_3e71700df0bd3b9ee766574de6d" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(`CREATE INDEX "IDX_243df3bfebed2c664442d5a79d" ON "category3" ("canonicalised_name") `)
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_e9240a4d27c2311e3b8adeedbf" ON "category3" ("canonicalised_name_unique") `
    )
    await queryRunner.query(
      `CREATE TABLE "category2" ("id" BIGSERIAL NOT NULL, "name" text NOT NULL, "canonicalised_name" text NOT NULL, "canonicalised_name_unique" text NOT NULL, "display_order" integer NOT NULL, "category1_id" bigint NOT NULL, CONSTRAINT "PK_312275d0d85be8b76edf441b608" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(`CREATE INDEX "IDX_a80e8f1094328fcbf1b839a371" ON "category2" ("canonicalised_name") `)
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_947d1e4744bdb65cb7fb3bcf3c" ON "category2" ("canonicalised_name_unique") `
    )
    await queryRunner.query(
      `ALTER TABLE "meta_category1" ADD CONSTRAINT "UQ_de38557430f231b762dd8702138" UNIQUE ("id")`
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_e48f08aff7777089c1a12ca72a" ON "meta_category1" ("feed_id", "feed_supplier") `
    )
    await queryRunner.query(`CREATE INDEX "IDX_db8eed3d7a33bf6ef31e8197f6" ON "category1" ("canonicalised_name") `)
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_b839cc912642e260473fa01055" ON "category1" ("canonicalised_name_unique") `
    )
    await queryRunner.query(
      `ALTER TABLE "meta_category1" ADD CONSTRAINT "FK_de38557430f231b762dd8702138" FOREIGN KEY ("id") REFERENCES "category1"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_category2" ADD CONSTRAINT "FK_94a1dea4dd578314aeeaf1d5458" FOREIGN KEY ("id") REFERENCES "category2"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_category3" ADD CONSTRAINT "FK_75a99176e0dc845b9d065421bf4" FOREIGN KEY ("id") REFERENCES "category3"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "category3" ADD CONSTRAINT "FK_999c1af3526389e391e6ff1792e" FOREIGN KEY ("category2_id") REFERENCES "category2"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "category2" ADD CONSTRAINT "FK_2ff3ca5dcc7c9f137154f77b61f" FOREIGN KEY ("category1_id") REFERENCES "category1"("id") ON DELETE CASCADE`
    )
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "category2" DROP CONSTRAINT "FK_2ff3ca5dcc7c9f137154f77b61f"`)
    await queryRunner.query(`ALTER TABLE "category3" DROP CONSTRAINT "FK_999c1af3526389e391e6ff1792e"`)
    await queryRunner.query(`ALTER TABLE "meta_category3" DROP CONSTRAINT "FK_75a99176e0dc845b9d065421bf4"`)
    await queryRunner.query(`ALTER TABLE "meta_category2" DROP CONSTRAINT "FK_94a1dea4dd578314aeeaf1d5458"`)
    await queryRunner.query(`ALTER TABLE "meta_category1" DROP CONSTRAINT "FK_de38557430f231b762dd8702138"`)
    await queryRunner.query(`DROP INDEX "IDX_b839cc912642e260473fa01055"`)
    await queryRunner.query(`DROP INDEX "IDX_db8eed3d7a33bf6ef31e8197f6"`)
    await queryRunner.query(`DROP INDEX "IDX_e48f08aff7777089c1a12ca72a"`)
    await queryRunner.query(`ALTER TABLE "meta_category1" DROP CONSTRAINT "UQ_de38557430f231b762dd8702138"`)
    await queryRunner.query(`DROP INDEX "IDX_947d1e4744bdb65cb7fb3bcf3c"`)
    await queryRunner.query(`DROP INDEX "IDX_a80e8f1094328fcbf1b839a371"`)
    await queryRunner.query(`DROP TABLE "category2"`)
    await queryRunner.query(`DROP INDEX "IDX_e9240a4d27c2311e3b8adeedbf"`)
    await queryRunner.query(`DROP INDEX "IDX_243df3bfebed2c664442d5a79d"`)
    await queryRunner.query(`DROP TABLE "category3"`)
    await queryRunner.query(`DROP INDEX "IDX_180478bbe90e117abd26eeebcf"`)
    await queryRunner.query(`DROP TABLE "meta_category3"`)
    await queryRunner.query(`DROP INDEX "IDX_bb82a766cf17159cc2f1d67f94"`)
    await queryRunner.query(`DROP TABLE "meta_category2"`)
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_8a54cfa4b97f37115119848809" ON "category1" ("canonicalised_name_unique") `
    )
    await queryRunner.query(`CREATE INDEX "IDX_052ee88b76a44787ca511a46d4" ON "category1" ("canonicalised_name") `)
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_db11d34b319a64512a42e4321f" ON "meta_category1" ("feed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `ALTER TABLE "meta_category1" ADD CONSTRAINT "FK_de38557430f231b762dd8702138" FOREIGN KEY ("id") REFERENCES "category1"("id") ON DELETE NO ACTION ON UPDATE NO ACTION`
    )
  }
}

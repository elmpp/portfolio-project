import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1551465252768 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "concrete_outcome" DROP CONSTRAINT "FK_0697e80ea8923b9252b9672d68f"`)
    await queryRunner.query(
      `CREATE TABLE "meta_market_collection" ("feed_id" bigint NOT NULL, "run_id" uuid NOT NULL, "feed_supplier" "feed_supplier_enum" NOT NULL, "url" text NOT NULL, "id" bigint NOT NULL, CONSTRAINT "REL_97cf16347050974511974ab2b5" UNIQUE ("id"), CONSTRAINT "PK_97cf16347050974511974ab2b5e" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_75816c532f40bd352c76b4a24a" ON "meta_market_collection" ("feed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `CREATE TABLE "market_collection" ("id" BIGSERIAL NOT NULL, "name" text NOT NULL, "canonicalised_name" text NOT NULL, "canonicalised_name_unique" text NOT NULL, CONSTRAINT "PK_24ffe9b71bb345d34f97dab7f2c" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(
      `CREATE INDEX "IDX_6559ac2353d2481b11382c9507" ON "market_collection" ("canonicalised_name") `
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_596c8e61bf2111cca5e228997e" ON "market_collection" ("canonicalised_name_unique") `
    )
    await queryRunner.query(
      `CREATE TABLE "market_collection_join_market" ("market_collection_id" bigint NOT NULL, "market_id" bigint NOT NULL, CONSTRAINT "PK_104e1c295d405e4c5edc853f601" PRIMARY KEY ("market_collection_id", "market_id"))`
    )
    await queryRunner.query(`ALTER TABLE "meta_outcome" DROP CONSTRAINT "FK_f6d7c5b7ef1efad7d624e53acfa"`)
    await queryRunner.query(`ALTER TABLE "meta_outcome" ADD CONSTRAINT "UQ_f6d7c5b7ef1efad7d624e53acfa" UNIQUE ("id")`)
    await queryRunner.query(`ALTER TABLE "meta_concrete_outcome" DROP CONSTRAINT "FK_df0c0c4a4720506884a9d9e02a9"`)
    await queryRunner.query(
      `ALTER TABLE "meta_concrete_outcome" ADD CONSTRAINT "UQ_df0c0c4a4720506884a9d9e02a9" UNIQUE ("id")`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_outcome" ADD CONSTRAINT "FK_f6d7c5b7ef1efad7d624e53acfa" FOREIGN KEY ("id") REFERENCES "outcome"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_concrete_outcome" ADD CONSTRAINT "FK_df0c0c4a4720506884a9d9e02a9" FOREIGN KEY ("id") REFERENCES "concrete_outcome"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_outcome" ADD CONSTRAINT "FK_798f3c00796550f865289b066a1" FOREIGN KEY ("concrete_market_id") REFERENCES "concrete_market"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_market_collection" ADD CONSTRAINT "FK_97cf16347050974511974ab2b5e" FOREIGN KEY ("id") REFERENCES "market_collection"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "market_collection_join_market" ADD CONSTRAINT "FK_ec15155a9d37b8b9c6bf0f5710c" FOREIGN KEY ("market_collection_id") REFERENCES "market_collection"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "market_collection_join_market" ADD CONSTRAINT "FK_a31e73a27f9f9a2a5192c671d2b" FOREIGN KEY ("market_id") REFERENCES "market"("id") ON DELETE CASCADE`
    )
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(
      `ALTER TABLE "market_collection_join_market" DROP CONSTRAINT "FK_a31e73a27f9f9a2a5192c671d2b"`
    )
    await queryRunner.query(
      `ALTER TABLE "market_collection_join_market" DROP CONSTRAINT "FK_ec15155a9d37b8b9c6bf0f5710c"`
    )
    await queryRunner.query(`ALTER TABLE "meta_market_collection" DROP CONSTRAINT "FK_97cf16347050974511974ab2b5e"`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" DROP CONSTRAINT "FK_798f3c00796550f865289b066a1"`)
    await queryRunner.query(`ALTER TABLE "meta_concrete_outcome" DROP CONSTRAINT "FK_df0c0c4a4720506884a9d9e02a9"`)
    await queryRunner.query(`ALTER TABLE "meta_outcome" DROP CONSTRAINT "FK_f6d7c5b7ef1efad7d624e53acfa"`)
    await queryRunner.query(`ALTER TABLE "meta_concrete_outcome" DROP CONSTRAINT "UQ_df0c0c4a4720506884a9d9e02a9"`)
    await queryRunner.query(
      `ALTER TABLE "meta_concrete_outcome" ADD CONSTRAINT "FK_df0c0c4a4720506884a9d9e02a9" FOREIGN KEY ("id") REFERENCES "concrete_outcome"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(`ALTER TABLE "meta_outcome" DROP CONSTRAINT "UQ_f6d7c5b7ef1efad7d624e53acfa"`)
    await queryRunner.query(
      `ALTER TABLE "meta_outcome" ADD CONSTRAINT "FK_f6d7c5b7ef1efad7d624e53acfa" FOREIGN KEY ("id") REFERENCES "outcome"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(`DROP TABLE "market_collection_join_market"`)
    await queryRunner.query(`DROP INDEX "IDX_596c8e61bf2111cca5e228997e"`)
    await queryRunner.query(`DROP INDEX "IDX_6559ac2353d2481b11382c9507"`)
    await queryRunner.query(`DROP TABLE "market_collection"`)
    await queryRunner.query(`DROP INDEX "IDX_75816c532f40bd352c76b4a24a"`)
    await queryRunner.query(`DROP TABLE "meta_market_collection"`)
    await queryRunner.query(
      `ALTER TABLE "concrete_outcome" ADD CONSTRAINT "FK_0697e80ea8923b9252b9672d68f" FOREIGN KEY ("concrete_market_id") REFERENCES "concrete_market"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
  }
}

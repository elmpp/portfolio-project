import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1551280774611 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(
      `CREATE TABLE "meta_outcome" ("feed_id" bigint NOT NULL, "run_id" uuid NOT NULL, "feed_supplier" "feed_supplier_enum" NOT NULL, "url" text NOT NULL, "id" bigint NOT NULL, CONSTRAINT "REL_f6d7c5b7ef1efad7d624e53acf" UNIQUE ("id"), CONSTRAINT "PK_f6d7c5b7ef1efad7d624e53acfa" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_1e096d912dd952a5b12c5f6f11" ON "meta_outcome" ("feed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `CREATE TABLE "outcome" ("id" BIGSERIAL NOT NULL, "name" text NOT NULL, "canonicalised_name" text NOT NULL, "canonicalised_name_unique" text NOT NULL, CONSTRAINT "PK_d721e56b4240f79aaa14cb54775" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(`CREATE INDEX "IDX_810caae00208990fe2854db7e6" ON "outcome" ("canonicalised_name") `)
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_756ef8be92ec3b813586c7deaa" ON "outcome" ("canonicalised_name_unique") `
    )
    await queryRunner.query(
      `CREATE TABLE "meta_concrete_outcome" ("feed_id" bigint NOT NULL, "run_id" uuid NOT NULL, "feed_supplier" "feed_supplier_enum" NOT NULL, "url" text NOT NULL, "id" bigint NOT NULL, CONSTRAINT "REL_df0c0c4a4720506884a9d9e02a" UNIQUE ("id"), CONSTRAINT "PK_df0c0c4a4720506884a9d9e02a9" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_4de495cfbf6c8632eb8990ed4c" ON "meta_concrete_outcome" ("feed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `CREATE TABLE "concrete_outcome" ("id" BIGSERIAL NOT NULL, "odds" text NOT NULL, "odds_decimal" real NOT NULL, "runner_number" SMALLINT, "handicap" text, "display_order" integer NOT NULL, "is_home" boolean NOT NULL, "concrete_market_id" bigint, "processed_id" bigint, CONSTRAINT "PK_308448b853d9add1708d147069c" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(`ALTER TABLE "concrete_event" ALTER COLUMN "bet_till" DROP NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_event" ALTER COLUMN "status" DROP NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_event" ALTER COLUMN "url" DROP NOT NULL`)
    await queryRunner.query(
      `ALTER TABLE "meta_outcome" ADD CONSTRAINT "FK_f6d7c5b7ef1efad7d624e53acfa" FOREIGN KEY ("id") REFERENCES "outcome"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_concrete_outcome" ADD CONSTRAINT "FK_df0c0c4a4720506884a9d9e02a9" FOREIGN KEY ("id") REFERENCES "concrete_outcome"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_outcome" ADD CONSTRAINT "FK_0697e80ea8923b9252b9672d68f" FOREIGN KEY ("concrete_market_id") REFERENCES "concrete_market"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_outcome" ADD CONSTRAINT "FK_725ac7123ef86c0d4ccf9317a40" FOREIGN KEY ("processed_id") REFERENCES "outcome"("id") ON DELETE CASCADE`
    )
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "concrete_outcome" DROP CONSTRAINT "FK_725ac7123ef86c0d4ccf9317a40"`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" DROP CONSTRAINT "FK_0697e80ea8923b9252b9672d68f"`)
    await queryRunner.query(`ALTER TABLE "meta_concrete_outcome" DROP CONSTRAINT "FK_df0c0c4a4720506884a9d9e02a9"`)
    await queryRunner.query(`ALTER TABLE "meta_outcome" DROP CONSTRAINT "FK_f6d7c5b7ef1efad7d624e53acfa"`)
    await queryRunner.query(`ALTER TABLE "concrete_event" ALTER COLUMN "url" SET NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_event" ALTER COLUMN "status" SET NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_event" ALTER COLUMN "bet_till" SET NOT NULL`)
    await queryRunner.query(`DROP TABLE "concrete_outcome"`)
    await queryRunner.query(`DROP INDEX "IDX_4de495cfbf6c8632eb8990ed4c"`)
    await queryRunner.query(`DROP TABLE "meta_concrete_outcome"`)
    await queryRunner.query(`DROP INDEX "IDX_756ef8be92ec3b813586c7deaa"`)
    await queryRunner.query(`DROP INDEX "IDX_810caae00208990fe2854db7e6"`)
    await queryRunner.query(`DROP TABLE "outcome"`)
    await queryRunner.query(`DROP INDEX "IDX_1e096d912dd952a5b12c5f6f11"`)
    await queryRunner.query(`DROP TABLE "meta_outcome"`)
  }
}

import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1551196836492 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(
      `CREATE TABLE "meta_market" ("feed_id" bigint NOT NULL, "run_id" uuid NOT NULL, "feed_supplier" "feed_supplier_enum" NOT NULL, "url" text NOT NULL, "id" bigint NOT NULL, CONSTRAINT "REL_d08c9e21cd1804f5036f60f0ca" UNIQUE ("id"), CONSTRAINT "PK_d08c9e21cd1804f5036f60f0cae" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_d2c94d9f6b9156dbec01d659ae" ON "meta_market" ("feed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `CREATE TABLE "market" ("id" BIGSERIAL NOT NULL, "name" text NOT NULL, "canonicalised_name" text NOT NULL, "canonicalised_name_unique" text NOT NULL, "display_order" integer NOT NULL, "is_default" boolean NOT NULL, CONSTRAINT "PK_1e9a2963edfd331d92018e3abac" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(`CREATE INDEX "IDX_461e504d6640941540540e2a94" ON "market" ("canonicalised_name") `)
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_0f786815a56eb1ae9ba85122cf" ON "market" ("canonicalised_name_unique") `
    )
    await queryRunner.query(
      `CREATE TABLE "meta_concrete_market" ("feed_id" bigint NOT NULL, "run_id" uuid NOT NULL, "feed_supplier" "feed_supplier_enum" NOT NULL, "url" text NOT NULL, "id" bigint NOT NULL, CONSTRAINT "REL_95b281309f1165e824ffbd5bbd" UNIQUE ("id"), CONSTRAINT "PK_95b281309f1165e824ffbd5bbde" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_9f81f96f7c2914b6129b5367e4" ON "meta_concrete_market" ("feed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `CREATE TABLE "concrete_market" ("id" BIGSERIAL NOT NULL, "cashout_available" boolean NOT NULL, "eachway_available" boolean NOT NULL, "first_four_available" boolean NOT NULL, "forecast_available" boolean NOT NULL, "guaranteed_price_available" boolean NOT NULL, "live_price_available" boolean NOT NULL, "place_available" boolean NOT NULL, "quinella_available" boolean NOT NULL, "starting_price_available" boolean NOT NULL, "tricast_available" boolean NOT NULL, "status" text NOT NULL, "url" text NOT NULL, "concrete_event_id" bigint, "processed_id" bigint, CONSTRAINT "PK_939c393d5883f06bb234bdde777" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_market" ADD CONSTRAINT "FK_d08c9e21cd1804f5036f60f0cae" FOREIGN KEY ("id") REFERENCES "market"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_concrete_market" ADD CONSTRAINT "FK_95b281309f1165e824ffbd5bbde" FOREIGN KEY ("id") REFERENCES "concrete_market"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_market" ADD CONSTRAINT "FK_e74044048679a0bfb4931950f60" FOREIGN KEY ("concrete_event_id") REFERENCES "concrete_event"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_market" ADD CONSTRAINT "FK_83c8ead00ff223e499fcb057be0" FOREIGN KEY ("processed_id") REFERENCES "market"("id") ON DELETE CASCADE`
    )
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP CONSTRAINT "FK_83c8ead00ff223e499fcb057be0"`)
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP CONSTRAINT "FK_e74044048679a0bfb4931950f60"`)
    await queryRunner.query(`ALTER TABLE "meta_concrete_market" DROP CONSTRAINT "FK_95b281309f1165e824ffbd5bbde"`)
    await queryRunner.query(`ALTER TABLE "meta_market" DROP CONSTRAINT "FK_d08c9e21cd1804f5036f60f0cae"`)
    await queryRunner.query(`DROP TABLE "concrete_market"`)
    await queryRunner.query(`DROP INDEX "IDX_9f81f96f7c2914b6129b5367e4"`)
    await queryRunner.query(`DROP TABLE "meta_concrete_market"`)
    await queryRunner.query(`DROP INDEX "IDX_0f786815a56eb1ae9ba85122cf"`)
    await queryRunner.query(`DROP INDEX "IDX_461e504d6640941540540e2a94"`)
    await queryRunner.query(`DROP TABLE "market"`)
    await queryRunner.query(`DROP INDEX "IDX_d2c94d9f6b9156dbec01d659ae"`)
    await queryRunner.query(`DROP TABLE "meta_market"`)
  }
}

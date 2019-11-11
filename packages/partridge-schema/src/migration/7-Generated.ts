import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1551086073533 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(
      `CREATE TABLE "meta_event" ("feed_id" bigint NOT NULL, "run_id" uuid NOT NULL, "feed_supplier" "feed_supplier_enum" NOT NULL, "url" text NOT NULL, "id" bigint NOT NULL, CONSTRAINT "REL_c62a3201fa57a5ba580acaeaf2" UNIQUE ("id"), CONSTRAINT "PK_c62a3201fa57a5ba580acaeaf26" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_0022117c7d2d7749f48a4503fd" ON "meta_event" ("feed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `CREATE TABLE "meta_concrete_event" ("feed_id" bigint NOT NULL, "run_id" uuid NOT NULL, "feed_supplier" "feed_supplier_enum" NOT NULL, "url" text NOT NULL, "id" bigint NOT NULL, CONSTRAINT "REL_72b08a994bfac760d0b538bb96" UNIQUE ("id"), CONSTRAINT "PK_72b08a994bfac760d0b538bb965" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_b42e6e4559493a451fbbaa210a" ON "meta_concrete_event" ("feed_id", "feed_supplier") `
    )
    await queryRunner.query(`CREATE TYPE "betting_status_enum" AS ENUM('PRICED')`)
    await queryRunner.query(
      `CREATE TABLE "concrete_event" ("id" BIGSERIAL NOT NULL, "bet_in_play" boolean NOT NULL, "bet_till" TIMESTAMP WITH TIME ZONE NOT NULL, "betting_status" "betting_status_enum" NOT NULL, "cashout_available" boolean NOT NULL, "displayed" boolean NOT NULL, "status" text NOT NULL, "url" text NOT NULL, "processed_id" bigint, CONSTRAINT "PK_b7dc3ebe768efcbae7f1d29f629" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(
      `CREATE TABLE "instance_event" ("id" BIGSERIAL NOT NULL, "display_order" integer NOT NULL, "processed_id" bigint, CONSTRAINT "PK_a1f7cc797297c790eb4f06b452a" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(`CREATE TYPE "event_type_enum" AS ENUM('MATCH_2_TEAMS', 'OUTRIGHT')`)
    await queryRunner.query(
      `CREATE TABLE "event" ("id" BIGSERIAL NOT NULL, "name" text NOT NULL, "canonicalised_name" text NOT NULL, "canonicalised_name_unique" text NOT NULL, "event_date" TIMESTAMP WITH TIME ZONE NOT NULL, "type" "event_type_enum" NOT NULL, "category3_id" bigint NOT NULL, CONSTRAINT "PK_30c2f3bbaf6d34a55f8ae6e4614" PRIMARY KEY ("id"))`
    )
    await queryRunner.query(`CREATE INDEX "IDX_1e95545c561bd1066b04469bbb" ON "event" ("canonicalised_name") `)
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_8bd9ee00255025d182fc008d29" ON "event" ("canonicalised_name_unique") `
    )
    await queryRunner.query(`ALTER TABLE "meta_category2" DROP CONSTRAINT "FK_94a1dea4dd578314aeeaf1d5458"`)
    await queryRunner.query(
      `ALTER TABLE "meta_category2" ADD CONSTRAINT "UQ_94a1dea4dd578314aeeaf1d5458" UNIQUE ("id")`
    )
    await queryRunner.query(`ALTER TABLE "meta_category3" DROP CONSTRAINT "FK_75a99176e0dc845b9d065421bf4"`)
    await queryRunner.query(
      `ALTER TABLE "meta_category3" ADD CONSTRAINT "UQ_75a99176e0dc845b9d065421bf4" UNIQUE ("id")`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_category2" ADD CONSTRAINT "FK_94a1dea4dd578314aeeaf1d5458" FOREIGN KEY ("id") REFERENCES "category2"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_category3" ADD CONSTRAINT "FK_75a99176e0dc845b9d065421bf4" FOREIGN KEY ("id") REFERENCES "category3"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_event" ADD CONSTRAINT "FK_c62a3201fa57a5ba580acaeaf26" FOREIGN KEY ("id") REFERENCES "event"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_concrete_event" ADD CONSTRAINT "FK_72b08a994bfac760d0b538bb965" FOREIGN KEY ("id") REFERENCES "concrete_event"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_event" ADD CONSTRAINT "FK_2617af9820d71903b7b31a51e82" FOREIGN KEY ("processed_id") REFERENCES "event"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "instance_event" ADD CONSTRAINT "FK_c1fe83058f1342d869d954fb1a9" FOREIGN KEY ("processed_id") REFERENCES "event"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "event" ADD CONSTRAINT "FK_0f5d1959d4baa297b64c3bdae43" FOREIGN KEY ("category3_id") REFERENCES "category3"("id") ON DELETE CASCADE`
    )
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "event" DROP CONSTRAINT "FK_0f5d1959d4baa297b64c3bdae43"`)
    await queryRunner.query(`ALTER TABLE "instance_event" DROP CONSTRAINT "FK_c1fe83058f1342d869d954fb1a9"`)
    await queryRunner.query(`ALTER TABLE "concrete_event" DROP CONSTRAINT "FK_2617af9820d71903b7b31a51e82"`)
    await queryRunner.query(`ALTER TABLE "meta_concrete_event" DROP CONSTRAINT "FK_72b08a994bfac760d0b538bb965"`)
    await queryRunner.query(`ALTER TABLE "meta_event" DROP CONSTRAINT "FK_c62a3201fa57a5ba580acaeaf26"`)
    await queryRunner.query(`ALTER TABLE "meta_category3" DROP CONSTRAINT "FK_75a99176e0dc845b9d065421bf4"`)
    await queryRunner.query(`ALTER TABLE "meta_category2" DROP CONSTRAINT "FK_94a1dea4dd578314aeeaf1d5458"`)
    await queryRunner.query(`ALTER TABLE "meta_category3" DROP CONSTRAINT "UQ_75a99176e0dc845b9d065421bf4"`)
    await queryRunner.query(
      `ALTER TABLE "meta_category3" ADD CONSTRAINT "FK_75a99176e0dc845b9d065421bf4" FOREIGN KEY ("id") REFERENCES "category3"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(`ALTER TABLE "meta_category2" DROP CONSTRAINT "UQ_94a1dea4dd578314aeeaf1d5458"`)
    await queryRunner.query(
      `ALTER TABLE "meta_category2" ADD CONSTRAINT "FK_94a1dea4dd578314aeeaf1d5458" FOREIGN KEY ("id") REFERENCES "category2"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(`DROP INDEX "IDX_8bd9ee00255025d182fc008d29"`)
    await queryRunner.query(`DROP INDEX "IDX_1e95545c561bd1066b04469bbb"`)
    await queryRunner.query(`DROP TABLE "event"`)
    await queryRunner.query(`DROP TYPE "event_type_enum"`)
    await queryRunner.query(`DROP TABLE "instance_event"`)
    await queryRunner.query(`DROP TABLE "concrete_event"`)
    await queryRunner.query(`DROP TYPE "betting_status_enum"`)
    await queryRunner.query(`DROP INDEX "IDX_b42e6e4559493a451fbbaa210a"`)
    await queryRunner.query(`DROP TABLE "meta_concrete_event"`)
    await queryRunner.query(`DROP INDEX "IDX_0022117c7d2d7749f48a4503fd"`)
    await queryRunner.query(`DROP TABLE "meta_event"`)
  }
}

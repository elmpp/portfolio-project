import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1558339947474 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "concrete_outcome" DROP CONSTRAINT "FK_798f3c00796550f865289b066a1"`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" DROP CONSTRAINT "FK_725ac7123ef86c0d4ccf9317a40"`)
    await queryRunner.query(`DROP INDEX "IDX_33a9c6e54a1b356cae19b1caf3"`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" ALTER COLUMN "odds" DROP NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" ALTER COLUMN "odds_decimal" DROP NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" ALTER COLUMN "concrete_market_id" SET NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" ALTER COLUMN "processed_id" SET NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP CONSTRAINT "FK_e74044048679a0bfb4931950f60"`)
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP CONSTRAINT "FK_83c8ead00ff223e499fcb057be0"`)
    await queryRunner.query(`DROP INDEX "IDX_d4da10574b20bb7b06d6437d4d"`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ALTER COLUMN "concrete_event_id" SET NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ALTER COLUMN "processed_id" SET NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_event" DROP CONSTRAINT "FK_2617af9820d71903b7b31a51e82"`)
    await queryRunner.query(`DROP INDEX "IDX_ca758abc9eae23f34073ca945d"`)
    await queryRunner.query(`ALTER TABLE "concrete_event" ALTER COLUMN "processed_id" SET NOT NULL`)
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_33a9c6e54a1b356cae19b1caf3" ON "concrete_outcome" ("processed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_d4da10574b20bb7b06d6437d4d" ON "concrete_market" ("processed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_ca758abc9eae23f34073ca945d" ON "concrete_event" ("processed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `CREATE INDEX "IDX_ec15155a9d37b8b9c6bf0f5710" ON "market_collection_join_market" ("market_collection_id") `
    )
    await queryRunner.query(
      `CREATE INDEX "IDX_a31e73a27f9f9a2a5192c671d2" ON "market_collection_join_market" ("market_id") `
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_outcome" ADD CONSTRAINT "FK_798f3c00796550f865289b066a1" FOREIGN KEY ("concrete_market_id") REFERENCES "concrete_market"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_outcome" ADD CONSTRAINT "FK_725ac7123ef86c0d4ccf9317a40" FOREIGN KEY ("processed_id") REFERENCES "outcome"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_market" ADD CONSTRAINT "FK_e74044048679a0bfb4931950f60" FOREIGN KEY ("concrete_event_id") REFERENCES "concrete_event"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_market" ADD CONSTRAINT "FK_83c8ead00ff223e499fcb057be0" FOREIGN KEY ("processed_id") REFERENCES "market"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_event" ADD CONSTRAINT "FK_2617af9820d71903b7b31a51e82" FOREIGN KEY ("processed_id") REFERENCES "event"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "concrete_event" DROP CONSTRAINT "FK_2617af9820d71903b7b31a51e82"`)
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP CONSTRAINT "FK_83c8ead00ff223e499fcb057be0"`)
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP CONSTRAINT "FK_e74044048679a0bfb4931950f60"`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" DROP CONSTRAINT "FK_725ac7123ef86c0d4ccf9317a40"`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" DROP CONSTRAINT "FK_798f3c00796550f865289b066a1"`)
    await queryRunner.query(`DROP INDEX "IDX_a31e73a27f9f9a2a5192c671d2"`)
    await queryRunner.query(`DROP INDEX "IDX_ec15155a9d37b8b9c6bf0f5710"`)
    await queryRunner.query(`DROP INDEX "IDX_ca758abc9eae23f34073ca945d"`)
    await queryRunner.query(`DROP INDEX "IDX_d4da10574b20bb7b06d6437d4d"`)
    await queryRunner.query(`DROP INDEX "IDX_33a9c6e54a1b356cae19b1caf3"`)
    await queryRunner.query(`ALTER TABLE "concrete_event" ALTER COLUMN "processed_id" DROP NOT NULL`)
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_ca758abc9eae23f34073ca945d" ON "concrete_event" ("processed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_event" ADD CONSTRAINT "FK_2617af9820d71903b7b31a51e82" FOREIGN KEY ("processed_id") REFERENCES "event"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(`ALTER TABLE "concrete_market" ALTER COLUMN "processed_id" DROP NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ALTER COLUMN "concrete_event_id" DROP NOT NULL`)
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_d4da10574b20bb7b06d6437d4d" ON "concrete_market" ("processed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_market" ADD CONSTRAINT "FK_83c8ead00ff223e499fcb057be0" FOREIGN KEY ("processed_id") REFERENCES "market"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_market" ADD CONSTRAINT "FK_e74044048679a0bfb4931950f60" FOREIGN KEY ("concrete_event_id") REFERENCES "concrete_event"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(`ALTER TABLE "concrete_outcome" ALTER COLUMN "processed_id" DROP NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" ALTER COLUMN "concrete_market_id" DROP NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" ALTER COLUMN "odds_decimal" SET NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" ALTER COLUMN "odds" SET NOT NULL`)
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_33a9c6e54a1b356cae19b1caf3" ON "concrete_outcome" ("processed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_outcome" ADD CONSTRAINT "FK_725ac7123ef86c0d4ccf9317a40" FOREIGN KEY ("processed_id") REFERENCES "outcome"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(
      `ALTER TABLE "concrete_outcome" ADD CONSTRAINT "FK_798f3c00796550f865289b066a1" FOREIGN KEY ("concrete_market_id") REFERENCES "concrete_market"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
  }
}

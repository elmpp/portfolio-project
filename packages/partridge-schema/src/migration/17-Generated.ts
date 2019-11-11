import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1551872675872 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "concrete_outcome" ADD "feed_supplier" "feed_supplier_enum" NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ADD "feed_supplier" "feed_supplier_enum" NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_event" ADD "feed_supplier" "feed_supplier_enum" NOT NULL`)
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_33a9c6e54a1b356cae19b1caf3" ON "concrete_outcome" ("processed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_d4da10574b20bb7b06d6437d4d" ON "concrete_market" ("processed_id", "feed_supplier") `
    )
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_ca758abc9eae23f34073ca945d" ON "concrete_event" ("processed_id", "feed_supplier") `
    )
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`DROP INDEX "IDX_ca758abc9eae23f34073ca945d"`)
    await queryRunner.query(`DROP INDEX "IDX_d4da10574b20bb7b06d6437d4d"`)
    await queryRunner.query(`DROP INDEX "IDX_33a9c6e54a1b356cae19b1caf3"`)
    await queryRunner.query(`ALTER TABLE "concrete_event" DROP COLUMN "feed_supplier"`)
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP COLUMN "feed_supplier"`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" DROP COLUMN "feed_supplier"`)
  }
}

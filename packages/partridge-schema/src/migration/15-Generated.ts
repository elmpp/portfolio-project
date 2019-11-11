import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1551467693541 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "market_collection" ADD "display_order" integer NOT NULL`)
    await queryRunner.query(`ALTER TABLE "meta_market_collection" DROP CONSTRAINT "FK_97cf16347050974511974ab2b5e"`)
    await queryRunner.query(
      `ALTER TABLE "meta_market_collection" ADD CONSTRAINT "UQ_97cf16347050974511974ab2b5e" UNIQUE ("id")`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_market_collection" ADD CONSTRAINT "FK_97cf16347050974511974ab2b5e" FOREIGN KEY ("id") REFERENCES "market_collection"("id") ON DELETE CASCADE`
    )
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "meta_market_collection" DROP CONSTRAINT "FK_97cf16347050974511974ab2b5e"`)
    await queryRunner.query(`ALTER TABLE "meta_market_collection" DROP CONSTRAINT "UQ_97cf16347050974511974ab2b5e"`)
    await queryRunner.query(
      `ALTER TABLE "meta_market_collection" ADD CONSTRAINT "FK_97cf16347050974511974ab2b5e" FOREIGN KEY ("id") REFERENCES "market_collection"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(`ALTER TABLE "market_collection" DROP COLUMN "display_order"`)
  }
}

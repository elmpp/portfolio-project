import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1551272604545 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "market" DROP COLUMN "display_order"`)
    await queryRunner.query(`ALTER TABLE "market" DROP COLUMN "is_default"`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ADD "display_order" integer NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ADD "is_default" boolean NOT NULL`)
    await queryRunner.query(`ALTER TABLE "meta_market" DROP CONSTRAINT "FK_d08c9e21cd1804f5036f60f0cae"`)
    await queryRunner.query(`ALTER TABLE "meta_market" ADD CONSTRAINT "UQ_d08c9e21cd1804f5036f60f0cae" UNIQUE ("id")`)
    await queryRunner.query(`ALTER TABLE "meta_concrete_market" DROP CONSTRAINT "FK_95b281309f1165e824ffbd5bbde"`)
    await queryRunner.query(
      `ALTER TABLE "meta_concrete_market" ADD CONSTRAINT "UQ_95b281309f1165e824ffbd5bbde" UNIQUE ("id")`
    )
    await queryRunner.query(`ALTER TABLE "concrete_market" ALTER COLUMN "status" DROP NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ALTER COLUMN "url" DROP NOT NULL`)
    await queryRunner.query(
      `ALTER TABLE "meta_market" ADD CONSTRAINT "FK_d08c9e21cd1804f5036f60f0cae" FOREIGN KEY ("id") REFERENCES "market"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_concrete_market" ADD CONSTRAINT "FK_95b281309f1165e824ffbd5bbde" FOREIGN KEY ("id") REFERENCES "concrete_market"("id") ON DELETE CASCADE`
    )
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "meta_concrete_market" DROP CONSTRAINT "FK_95b281309f1165e824ffbd5bbde"`)
    await queryRunner.query(`ALTER TABLE "meta_market" DROP CONSTRAINT "FK_d08c9e21cd1804f5036f60f0cae"`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ALTER COLUMN "url" SET NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ALTER COLUMN "status" SET NOT NULL`)
    await queryRunner.query(`ALTER TABLE "meta_concrete_market" DROP CONSTRAINT "UQ_95b281309f1165e824ffbd5bbde"`)
    await queryRunner.query(
      `ALTER TABLE "meta_concrete_market" ADD CONSTRAINT "FK_95b281309f1165e824ffbd5bbde" FOREIGN KEY ("id") REFERENCES "concrete_market"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(`ALTER TABLE "meta_market" DROP CONSTRAINT "UQ_d08c9e21cd1804f5036f60f0cae"`)
    await queryRunner.query(
      `ALTER TABLE "meta_market" ADD CONSTRAINT "FK_d08c9e21cd1804f5036f60f0cae" FOREIGN KEY ("id") REFERENCES "market"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP COLUMN "is_default"`)
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP COLUMN "display_order"`)
    await queryRunner.query(`ALTER TABLE "market" ADD "is_default" boolean NOT NULL`)
    await queryRunner.query(`ALTER TABLE "market" ADD "display_order" integer NOT NULL`)
  }
}

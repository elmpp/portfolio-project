import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1551095677378 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "event" ADD "display_order" integer NOT NULL`)
    await queryRunner.query(`ALTER TABLE "meta_event" DROP CONSTRAINT "FK_c62a3201fa57a5ba580acaeaf26"`)
    await queryRunner.query(`ALTER TABLE "meta_event" ADD CONSTRAINT "UQ_c62a3201fa57a5ba580acaeaf26" UNIQUE ("id")`)
    await queryRunner.query(`ALTER TABLE "meta_concrete_event" DROP CONSTRAINT "FK_72b08a994bfac760d0b538bb965"`)
    await queryRunner.query(
      `ALTER TABLE "meta_concrete_event" ADD CONSTRAINT "UQ_72b08a994bfac760d0b538bb965" UNIQUE ("id")`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_event" ADD CONSTRAINT "FK_c62a3201fa57a5ba580acaeaf26" FOREIGN KEY ("id") REFERENCES "event"("id") ON DELETE CASCADE`
    )
    await queryRunner.query(
      `ALTER TABLE "meta_concrete_event" ADD CONSTRAINT "FK_72b08a994bfac760d0b538bb965" FOREIGN KEY ("id") REFERENCES "concrete_event"("id") ON DELETE CASCADE`
    )

    // added by me
    await queryRunner.query(`DROP TABLE "instance_event"`)
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "meta_concrete_event" DROP CONSTRAINT "FK_72b08a994bfac760d0b538bb965"`)
    await queryRunner.query(`ALTER TABLE "meta_event" DROP CONSTRAINT "FK_c62a3201fa57a5ba580acaeaf26"`)
    await queryRunner.query(`ALTER TABLE "meta_concrete_event" DROP CONSTRAINT "UQ_72b08a994bfac760d0b538bb965"`)
    await queryRunner.query(
      `ALTER TABLE "meta_concrete_event" ADD CONSTRAINT "FK_72b08a994bfac760d0b538bb965" FOREIGN KEY ("id") REFERENCES "concrete_event"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(`ALTER TABLE "meta_event" DROP CONSTRAINT "UQ_c62a3201fa57a5ba580acaeaf26"`)
    await queryRunner.query(
      `ALTER TABLE "meta_event" ADD CONSTRAINT "FK_c62a3201fa57a5ba580acaeaf26" FOREIGN KEY ("id") REFERENCES "event"("id") ON DELETE CASCADE ON UPDATE NO ACTION`
    )
    await queryRunner.query(`ALTER TABLE "event" DROP COLUMN "display_order"`)
  }
}

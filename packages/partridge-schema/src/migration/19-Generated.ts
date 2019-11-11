import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1553880769102 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "concrete_outcome" ADD "status" "status_enum" NOT NULL`)
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "concrete_outcome" DROP COLUMN "status"`)
  }
}

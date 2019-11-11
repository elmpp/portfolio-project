import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1551191808652 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(
      `CREATE UNIQUE INDEX "IDX_7367ea0ef416f464e8a90d025f" ON "rename" ("entity_name", "regex_search") `
    )
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`DROP INDEX "IDX_7367ea0ef416f464e8a90d025f"`)
  }
}

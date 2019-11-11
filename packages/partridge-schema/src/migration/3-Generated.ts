import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1549272028788 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(
      `CREATE TABLE "public"."queue" ("id" BIGSERIAL NOT NULL, "data" jsonb NOT NULL, "created_at" TIMESTAMP NOT NULL DEFAULT now(), CONSTRAINT "PK_56965beedb953254f26aa0718db" PRIMARY KEY ("id"))`
    )

    // custom line here to add GIN index - https://goo.gl/edJQog
    await queryRunner.query(
      `CREATE INDEX queue_data_meta_fetch_runId_idx ON queue USING GIN ((data -> 'meta' -> 'fetch' -> 'run_id') jsonb_path_ops)`
    )
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`DROP TABLE "public"."queue"`)
  }
}

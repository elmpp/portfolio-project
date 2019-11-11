import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1558510494756 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(
      `CREATE INDEX "IDX_798f3c00796550f865289b066a" ON "concrete_outcome" ("concrete_market_id") `
    )
    await queryRunner.query(`CREATE INDEX "IDX_725ac7123ef86c0d4ccf9317a4" ON "concrete_outcome" ("processed_id") `)
    await queryRunner.query(`CREATE INDEX "IDX_e74044048679a0bfb4931950f6" ON "concrete_market" ("concrete_event_id") `)
    await queryRunner.query(`CREATE INDEX "IDX_83c8ead00ff223e499fcb057be" ON "concrete_market" ("processed_id") `)
    await queryRunner.query(`CREATE INDEX "IDX_2617af9820d71903b7b31a51e8" ON "concrete_event" ("processed_id") `)
    await queryRunner.query(`CREATE INDEX "IDX_0f5d1959d4baa297b64c3bdae4" ON "event" ("category3_id") `)
    await queryRunner.query(`CREATE INDEX "IDX_999c1af3526389e391e6ff1792" ON "category3" ("category2_id") `)
    await queryRunner.query(`CREATE INDEX "IDX_2ff3ca5dcc7c9f137154f77b61" ON "category2" ("category1_id") `)
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`DROP INDEX "IDX_2ff3ca5dcc7c9f137154f77b61"`)
    await queryRunner.query(`DROP INDEX "IDX_999c1af3526389e391e6ff1792"`)
    await queryRunner.query(`DROP INDEX "IDX_0f5d1959d4baa297b64c3bdae4"`)
    await queryRunner.query(`DROP INDEX "IDX_2617af9820d71903b7b31a51e8"`)
    await queryRunner.query(`DROP INDEX "IDX_83c8ead00ff223e499fcb057be"`)
    await queryRunner.query(`DROP INDEX "IDX_e74044048679a0bfb4931950f6"`)
    await queryRunner.query(`DROP INDEX "IDX_725ac7123ef86c0d4ccf9317a4"`)
    await queryRunner.query(`DROP INDEX "IDX_798f3c00796550f865289b066a"`)
  }
}

import {MigrationInterface, QueryRunner} from 'typeorm'

export class Generated1553877740584 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP COLUMN "live_price_available"`)
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP COLUMN "starting_price_available"`)
    await queryRunner.query(`ALTER TABLE "concrete_event" DROP COLUMN "bet_in_play"`)
    await queryRunner.query(`ALTER TABLE "concrete_event" DROP COLUMN "bet_till"`)
    await queryRunner.query(`ALTER TABLE "concrete_event" DROP COLUMN "betting_status"`)
    await queryRunner.query(`ALTER TABLE "concrete_event" DROP COLUMN "cashout_available"`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" ADD "live_price_available" boolean NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" ADD "starting_price_available" boolean NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ADD "bet_in_play" boolean NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ADD "bet_till" TIMESTAMP WITH TIME ZONE`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ADD "betting_status" "betting_status_enum" NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP COLUMN "status"`)
    await queryRunner.query(`CREATE TYPE "status_enum" AS ENUM('ACTIVE', 'SUSPENDED')`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ADD "status" "status_enum" NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_event" DROP COLUMN "status"`)
    await queryRunner.query(`ALTER TABLE "concrete_event" ADD "status" "status_enum" NOT NULL`)
  }

  public async down(queryRunner: QueryRunner): Promise<any> {
    await queryRunner.query(`ALTER TABLE "concrete_event" DROP COLUMN "status"`)
    await queryRunner.query(`DROP TYPE "status_enum"`)
    await queryRunner.query(`ALTER TABLE "concrete_event" ADD "status" text`)
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP COLUMN "status"`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ADD "status" text`)
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP COLUMN "betting_status"`)
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP COLUMN "bet_till"`)
    await queryRunner.query(`ALTER TABLE "concrete_market" DROP COLUMN "bet_in_play"`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" DROP COLUMN "starting_price_available"`)
    await queryRunner.query(`ALTER TABLE "concrete_outcome" DROP COLUMN "live_price_available"`)
    await queryRunner.query(`ALTER TABLE "concrete_event" ADD "cashout_available" boolean NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_event" ADD "betting_status" "betting_status_enum" NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_event" ADD "bet_till" TIMESTAMP WITH TIME ZONE`)
    await queryRunner.query(`ALTER TABLE "concrete_event" ADD "bet_in_play" boolean NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ADD "starting_price_available" boolean NOT NULL`)
    await queryRunner.query(`ALTER TABLE "concrete_market" ADD "live_price_available" boolean NOT NULL`)
  }
}

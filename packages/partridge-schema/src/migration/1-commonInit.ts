// typeorm migrations - https://goo.gl/DdMb4b / https://goo.gl/ZPG1yn

import {MigrationInterface, QueryRunner} from 'typeorm'

export class CommonInit1000000000001 implements MigrationInterface {
  public async up(_queryRunner: QueryRunner): Promise<any> {
    // placeholder to run bootstrap stuff before ddl/code
  }

  public async down(_queryRunner: QueryRunner): Promise<any> {}
}

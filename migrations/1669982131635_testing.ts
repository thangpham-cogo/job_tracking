/* eslint-disable @typescript-eslint/naming-convention */
import { MigrationBuilder, ColumnDefinitions } from "node-pg-migrate"

export const shorthands: ColumnDefinitions | undefined = undefined

export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createTable("job_progress", {
    id: "id",
    user_id: {
      type: "int",
      notNull: true,
    },
  })

  pgm.createTable(
    "job_stages",
    {
      id: "id",
      job_progress_id: {
        type: "int",
        notNull: true,
      },
    },
    {
      constraints: {
        foreignKeys: [
          {
            references: "job_progress",
            columns: ["id"],
          },
        ],
      },
    }
  )

  pgm.sql(`insert into job_progress (user_id) values (1)`)
  pgm.sql(`insert into job_stages (job_progress_id) values (1)`)
}

export async function down(pgm: MigrationBuilder): Promise<void> {
  pgm.dropTable("job_progress", {
    cascade: true,
    ifExists: true,
  })

  pgm.dropTable("job_stages", {
    ifExists: true,
  })
}

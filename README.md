### Local Development

```bash
# start the database
npm run db-create

# run/reverse all migrations
npm run migrate up/down

# redo last migration (down & then up)
npm run migrate redo

# create new migration
npm run migrate create <name>

# dry run to see the sql that will be executed in a transaction
npm run migrate-dry up/down

# display manual for node-pg-migrate
npx node-pg-migrate

# connect to db via psql (CLI)
psql -U postgres -h localhost # type `postgres` as password when prompted

psql>\c job_tracking # once loaded, connect to job_tracking database
psql>\q # quit

# destroy db
npm run db-destroy
```

[node-pg-migrate CLI reference](https://github.com/salsita/node-pg-migrate/blob/master/docs/cli.md)

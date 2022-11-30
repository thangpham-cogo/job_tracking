DATABASE_URL = "postgres://thang:password@localhost:5432/job_tracking?sslmode=disable&search_path=api"
N=

.PHONY: *

migrate-new:
	migrate create -ext sql -dir migrations -seq -digits 5 ${name}
migrate-drop:
	rm -f migrations/*_${name}.*.sql
migrate-force:
	migrate -database ${DATABASE_URL} -path ./migrations force ${N}
migrate-up:
	migrate -database ${DATABASE_URL} -path ./migrations up ${N}
migrate-down:
	migrate -database ${DATABASE_URL} -path ./migrations down ${N}
reload-schema:
	killall -SIGUSR1 postgrest
start-dev:
	postgrest ./postgrest.conf 

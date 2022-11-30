N=

include .env.*

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
# any overriden variable need to be explicitly set
	PGRST_DB_URI=${PGRST_DB_URI} postgrest ./postgrest.conf 

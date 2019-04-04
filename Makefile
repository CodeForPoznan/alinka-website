start:
	bash ./.makefile/start.sh

stop:
	docker-compose stop

clean:
	bash ./.makefile/clean.sh

local:
	docker-compose exec -T app npm start --host 0.0.0.0

bash:
	docker-compose exec app bash

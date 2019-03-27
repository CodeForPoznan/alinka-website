start:
	bash ./.makefile/start.sh

stop:
	docker-compose stop

clean:
	bash ./.makefile/clean.sh

logs:
	docker-compose logs -f

bash:
	docker-compose exec app bash

migrations:
	docker-compose exec app python manage.py makemigrations
	docker-compose exec app python manage.py migrate

PROFILE=
config:
	cat ~/.aws/credentials
	docker-compose exec app aws configure --profile $(PROFILE)

offline:
	docker-compose exec app npx serverless offline --preserveTrailingSlash

TARGET=dev
deploy:
	docker-compose exec -T app npx sls deploy -v --conceal --stage "$(TARGET)"
docker run --rm -d \
    --name=pgsql-dev \
    -e POSTGRES_PASSWORD=test1234 \
    -p 5432:5432 \
    -v ${PWD}/postgres-docker:/var/lib/postgresql/data \
    postgres:latest

# Connect to docker psql
docker exec -it pgsql-dev bash
# In Container
# psql -h localhost -U postgres

docker stop pgsql-dev
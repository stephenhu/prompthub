# prompthub

llm prompt management

## setup

1. `go install -tags 'sqlite' github.com/golang-migrate/migrate/v4/cmd/migrate@latest`
1. `mkdir data`
1. `migrate -path db/migrations -database "sqlite://data/prompthub.db" up`
1. `go build`
1. `prompthub`

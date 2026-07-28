run:
	@go run .

build:
	@go build -o bin/ .

test:
	@go test ./...

cover:
	@go test ./... -cover

lint:
	@golangci-lint run ./...

generate:
	@protoc -I=api/proto/ \
		--go_out=api/ --go_opt=paths=source_relative \
		--go-grpc_out=api/ --go-grpc_opt=paths=source_relative,require_unimplemented_servers=false \
		api/proto/*.proto
	@go mod tidy
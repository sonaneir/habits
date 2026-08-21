# habits

A gRPC service in Go for tracking habits. The API is defined with Protocol Buffers, the Go code is generated from the `.proto` contract, and the service is covered by tests using generated mocks.

## Overview

The service lets you manage habits and tick them off over time through a gRPC API. The contract — the methods, requests, and responses — is described in Protocol Buffers, which gives a strict, typed interface shared between client and server. The business logic lives in `internal`, cleanly separated from the transport and the generated code.

## Tech stack

- **Go**
- **gRPC** (`google.golang.org/grpc`) — the service transport
- **Protocol Buffers** (`google.golang.org/protobuf`) — the API contract, code generated from `.proto`
- **minimock** (`github.com/gojuno/minimock`) — generated mocks for unit tests
- **testify** — test assertions
- **google/uuid** — unique identifiers for habits
- **golang.org/x/sync** — concurrency primitives

## Project structure

```
habits/
├── api/                    # Protocol Buffers definitions and generated code
├── cmd/
│   └── habits-server/      # entry point: starts the gRPC server
└── internal/               # business logic, repository, service implementation
```

The API contract is kept in `api/`, the server entry point in `cmd/habits-server`, and the implementation in `internal` — so the generated gRPC code, the transport, and the business logic stay separated.

## Running

```bash
make run
# or
go run ./cmd/habits-server
```

## Testing

```bash
go test ./...
```

Unit tests use mocks generated with minimock, so the service logic is tested in isolation without needing a running server or real dependencies.

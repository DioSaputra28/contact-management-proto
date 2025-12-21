# Contact Management Proto

Protobuf definitions for Contact Management Microservices.

## 📦 Services

- **AuthService**: Authentication (Login, Register)
- **UserService**: User management (CRUD operations)
- **ContactService**: Contact and Address management

## 🚀 Quick Start

### Prerequisites

- [Protocol Buffers Compiler (protoc)](https://grpc.io/docs/protoc-installation/)
- Go 1.21+

### Install Tools

```bash
make install-tools
```

### Generate Code

```bash
make generate
```

### Clean Generated Files

```bash
make clean
```

### Verify Proto Files

```bash
make verify
```

## 📁 Structure

```
.
├── proto/                    # Proto definitions
│   ├── auth/
│   │   └── auth.proto
│   ├── user/
│   │   └── user.proto
│   └── contact/
│       └── contact.proto
├── protogen/                 # Generated code (auto-generated)
│   └── go/
│       ├── auth/
│       ├── user/
│       └── contact/
├── Makefile                  # Build automation
└── .github/workflows/        # CI/CD
    └── generate-proto.yml
```

## 🔧 Usage in Go Projects

Add to your `go.mod`:

```go
require github.com/DioSaputra28/contact-management-proto v1.0.0
```

Import in your code:

```go
import (
    authpb "github.com/DioSaputra28/contact-management-proto/protogen/go/auth"
    userpb "github.com/DioSaputra28/contact-management-proto/protogen/go/user"
    contactpb "github.com/DioSaputra28/contact-management-proto/protogen/go/contact"
)
```

## 🤖 GitHub Actions

The repository automatically generates Go code when proto files are modified and pushed to the main branch.

## 📝 License

MIT

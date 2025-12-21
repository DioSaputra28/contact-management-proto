# Makefile for contact-management-proto

# Variables
PROTO_DIR=proto
PROTOGEN_DIR=protogen/go
PROTO_FILES=$(shell find $(PROTO_DIR) -name '*.proto')

# Colors for output
GREEN=\033[0;32m
YELLOW=\033[0;33m
NC=\033[0m # No Color

.PHONY: all generate clean help install-tools

# Default target
all: generate

## help: Show this help message
help:
	@echo "Available targets:"
	@echo "  make generate      - Generate Go code from proto files"
	@echo "  make clean         - Remove generated files"
	@echo "  make install-tools - Install required protoc plugins"
	@echo "  make all           - Same as 'make generate'"

## install-tools: Install protoc plugins
install-tools:
	@echo "${YELLOW}📦 Installing protoc plugins...${NC}"
	@go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	@go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	@echo "${GREEN}✓ Plugins installed${NC}"

## generate: Generate Go code from all proto files
generate:
	@echo "${GREEN}🔨 Generating Go code from proto files...${NC}"
	@mkdir -p $(PROTOGEN_DIR)
	@protoc \
		--go_out=. \
		--go_opt=module=github.com/DioSaputra28/contact-management-proto \
		--go-grpc_out=. \
		--go-grpc_opt=module=github.com/DioSaputra28/contact-management-proto \
		--proto_path=. \
		$(PROTO_FILES)
	@echo "${GREEN}✓ Code generation complete${NC}"

## clean: Remove all generated files
clean:
	@echo "${YELLOW}🧹 Cleaning generated files...${NC}"
	@rm -rf $(PROTOGEN_DIR)
	@echo "${GREEN}✓ Clean complete${NC}"

## verify: Verify proto files syntax
verify:
	@echo "${GREEN}🔍 Verifying proto files...${NC}"
	@protoc \
		--proto_path=. \
		--descriptor_set_out=/dev/null \
		$(PROTO_FILES)
	@echo "${GREEN}✓ All proto files are valid${NC}"

## pipeline-init: Install tools for CI/CD pipeline
pipeline-init:
	@echo "${YELLOW}📦 Installing protoc plugins for pipeline...${NC}"
	@go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	@go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	@echo "${GREEN}✓ Pipeline tools installed${NC}"

## pipeline-build: Build for CI/CD pipeline
pipeline-build: pipeline-init clean generate

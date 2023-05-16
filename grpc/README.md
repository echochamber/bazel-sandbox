## Running GRPC Service

Using cargo

`Cargo run

## Calling GRPC Service

The GRPC Service.

### Using Web GUI:

Requires installing go. Follow go installation instructions [here](https://go.dev/doc/install) instead of using a package manager to install go.

[grpc_ui install instructions](https://github.com/fullstorydev/grpcui)

```sh
grpcui -plaintext '[::1]:50052'
```

### From CLI:

[grpc_cli install instructions](https://github.com/grpc/grpc/blob/master/doc/command_line_tool.md).

```sh
grpc_cli call localhost:50052 SayHello "name: 'gRPC CLI'"
```
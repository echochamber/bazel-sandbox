package main

import (
	"context"
	"flag"
	"log"
	"net/http"

	"github.com/golang/glog"
	"github.com/grpc-ecosystem/grpc-gateway/v2/runtime"
	"github.com/rs/cors"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"

	gw "github.com/echochamber/bazel-sandbox/rd/proto/echochamber/helloworld/v1/gateway"
)

// More intricate example here:
// https://github.com/rules-proto-grpc/rules_proto_grpc/blob/master/grpc-gateway/example/gateway/main.go
var (
	// command-line options:
	// gRPC server endpoint
	grpcServerEndpoint = flag.String("grpc-server-endpoint", "localhost:50051", "gRPC server endpoint")
	proxyPort          = flag.String("proxy-port", "8081", "gRPC server endpoint")
	openAPIDir         = flag.String("openapi_dir", "", "path to the directory which contains OpenAPI definitions")
)

func run() error {
	ctx := context.Background()
	ctx, cancel := context.WithCancel(ctx)
	defer cancel()

	// Register gRPC server endpoint
	// Note: Make sure the gRPC server is running properly and accessible
	mux := runtime.NewServeMux()
	opts := []grpc.DialOption{grpc.WithTransportCredentials(insecure.NewCredentials())}
	err := gw.RegisterGreeterServiceHandlerFromEndpoint(ctx, mux, *grpcServerEndpoint, opts)
	if err != nil {
		return err
	}
	log.Println("Hello world!")
	// TODO: figure out how to find a generated file at runtime.
	// log.Println(os.Getenv("OPENAPI_JSON_PATH"))
	withCors := cors.New(cors.Options{
		AllowOriginFunc:  func(origin string) bool { return true },
		AllowedMethods:   []string{"GET", "POST", "PATCH", "PUT", "DELETE", "OPTIONS"},
		AllowedHeaders:   []string{"ACCEPT", "Authorization", "Content-Type", "X-CSRF-Token"},
		ExposedHeaders:   []string{"Link"},
		AllowCredentials: true,
		MaxAge:           300,
	}).Handler(mux)
	s := &http.Server{
		Addr:    ":" + *proxyPort,
		Handler: withCors,
	}
	return s.ListenAndServe()
}

func main() {
	flag.Parse()
	defer glog.Flush()

	if err := run(); err != nil {
		glog.Fatal(err)
	}
}

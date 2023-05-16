# grpc-gateway

* Scripts in sh/stubs/ are used to generate the files in the gen/ directory.
* Scripts in sh/docker are used to generate the files in docker-gen/ directory.
    * gen/docker was generated using https://github.com/namely/docker-protoc
    * There are some manual changes that currently need to be made to the generated files for docker:
        * Replace swaggerfile copy line with `COPY --from=build /app/gen/helloworld.swagger.json /app/`
        * Change `EXPOSE 80` to  `EXPOSE 8081`